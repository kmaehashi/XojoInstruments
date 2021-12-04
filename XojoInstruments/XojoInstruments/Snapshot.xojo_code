#tag Class
Protected Class Snapshot
Implements XojoInstruments.Framework.XIObject
	#tag Method, Flags = &h21
		Private Shared Function ComputeDelta(lhs As XIArrayInteger, rhs As XIArrayInteger) As SnapshotDelta
		  // Compare two ObjectRefIDs arrays.
		  // Two arrays must be sorted.
		  
		  Dim aAdded As New XIArrayInteger()
		  Dim aRemoved As New XIArrayInteger()
		  Dim aUnchanged As New XIArrayInteger()
		  
		  Dim indexLhs, indexRhs As Integer
		  
		  While True
		    If lhs.Ubound() < indexLhs Then
		      For i As Integer = indexRhs To rhs.UBound()
		        aAdded.Append(rhs.Item(i))
		      Next
		      Exit
		    ElseIf lhs.Ubound() < indexRhs Then
		      For i As Integer = indexLhs To lhs.UBound()
		        aRemoved.Append(lhs.Item(i))
		      Next
		      Exit
		    End If
		    
		    Dim idLhs, idRhs As Integer
		    idLhs = lhs.Item(indexLhs)
		    idRhs = rhs.Item(indexRhs)
		    
		    If idLhs = idRhs Then
		      aUnchanged.Append(idLhs)
		      indexLhs = indexLhs + 1
		      indexRhs = indexRhs + 1
		    ElseIf idLhs < idRhs Then
		      aRemoved.Append(idLhs)
		      indexLhs = indexLhs + 1
		    ElseIf idLhs > idRhs Then
		      aAdded.Append(idRhs)
		      indexRhs = indexRhs + 1
		    End If
		  Wend
		  
		  Return New SnapshotDelta(aAdded, aRemoved, aUnchanged)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(createGraph As Boolean)
		  #pragma BackgroundTasks False
		  
		  If SystemObjectsRefIDs = Nil Then
		    SystemObjectsRefIDs = New XIDictionary()
		  End If
		  
		  LastID = LastID + 1
		  mID = LastID
		  
		  mObjectRefIDs = New XIArrayInteger()
		  If createGraph Then
		    mObjectRefGraph = New XIDictionary()
		  End If
		  
		  // Collect all non-managd objects.
		  // The loop block only exists to limit the scope of the iterator.
		  Do
		    Dim iter As Runtime.ObjectIterator = Runtime.IterateObjects()
		    While iter.MoveNext()
		      Dim obj As Object = iter.Current
		      If (obj IsA XIObject) Or (obj Is iter) Then Continue
		      
		      Dim oref As ObjectRef = ObjectRef.ReferenceFor(obj)
		      If SystemObjectsRefIDs.HasKey(oref.ID) Then Continue
		      
		      mObjectRefIDs.Append(oref.ID)
		      If createGraph Then
		        mObjectRefGraph.Value(oref.ID) = GetReferringObjectRefs(oref)
		      End If
		    Wend
		  Loop Until True
		  mObjectRefIDs.Sort()
		  
		  // Collect all system objects created during the iteration
		  // (e.g., introspection cache in Xojo framework); they should be
		  // ignored when taking a next snapshot.
		  While True
		    Dim iter2 As Runtime.ObjectIterator = Runtime.IterateObjects()
		    Dim secondPass As New XIArrayInteger()
		    While iter2.MoveNext()
		      Dim obj As Object = iter2.Current
		      If (obj IsA XIObject) Or (obj Is iter2) Then Continue
		      
		      Dim oref As ObjectRef = ObjectRef.ReferenceFor(obj)
		      If SystemObjectsRefIDs.HasKey(oref.ID) Then Continue
		      
		      secondPass.Append(oref.ID)
		    Wend
		    secondPass.Sort()
		    
		    // Compute delta
		    Dim addedObjectRefIDs As XIArrayInteger = ComputeDelta(mObjectRefIDs, secondPass).Added
		    For Each id As Integer In addedObjectRefIDs
		      SystemObjectsRefIDs.Value(id) = True
		    Next
		    If addedObjectRefIDs.Ubound() = -1 Then Exit
		  Wend
		  
		  // Remove WeakRefs no longer in use.
		  ObjectRef.GarbageCollect()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return mObjectRefIDs.Count()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DifferenceFrom(other As Snapshot) As SnapshotDelta
		  Return ComputeDelta(other.mObjectRefIDs, Me.mObjectRefIDs)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindCircularReferences() As XIDictionary
		  If mObjectRefGraph Is Nil Then
		    Return Nil
		  End If
		  
		  Dim inDegree As New XIDictionary()  // Maps from object ID (Integer) to number of incoming edges (i.e., refcount)
		  For Each ent1 As Xojo.Core.DictionaryEntry In mObjectRefGraph
		    // ent1.Key (Integer): object ID
		    // ent1.Value (XIDictionary): Maps from edge description (String) to object ID (Integer)
		    For Each ent2 As Xojo.Core.DictionaryEntry In XIDictionary(ent1.Value)
		      // ent2.Key (String): edge description
		      // ent2.Value (Integer): object ID
		      inDegree.Value(ent2.Value) = If(inDegree.HasKey(ent2.Value), inDegree.Value(ent2.Value), 0) + 1
		    Next
		  Next
		  
		  Dim queue() As Integer
		  For Each ent1 As Xojo.Core.DictionaryEntry In mObjectRefGraph
		    If Not inDegree.HasKey(ent1.Key) Then
		      // The node has no incoming edges.
		      queue.Append(ent1.Key)
		    End If
		  Next
		  
		  While queue.Ubound() <> -1
		    Dim currentNode As Integer = queue(0)
		    queue.Remove(0)
		    
		    For Each ent2 As Xojo.Core.DictionaryEntry In XIDictionary(mObjectRefGraph.Value(currentNode))
		      Dim destNode As Integer = ent2.Value
		      Dim newDegree As Integer = inDegree.Value(destNode) - 1
		      If newDegree = 0 Then
		        inDegree.Remove(destNode)
		        queue.Append(destNode)
		      Else
		        inDegree.Value(destNode) = newDegree
		      End If
		    Next
		  Wend
		  
		  // Remove nodes without outgoing edges.
		  While True
		    Dim stabilized As Boolean = True
		    
		    For Each ent1 As Xojo.Core.DictionaryEntry In inDegree.EagerlyEvaluateIterable()
		      Dim currentNode As Integer = ent1.Key
		      Dim outgoingEdges As XIDictionary = mObjectRefGraph.Value(currentNode)
		      Dim hasOutgoingEdges As Boolean = False
		      For Each ent2 As Xojo.Core.DictionaryEntry In outgoingEdges
		        If inDegree.HasKey(ent2.Value) Then
		          hasOutgoingEdges = True
		          Exit
		        End If
		      Next
		      If Not hasOutgoingEdges Then
		        inDegree.Remove(currentNode)
		        stabilized = False
		      End If
		    Next
		    
		    If stabilized Then Exit
		  Wend
		  
		  Return inDegree
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetReferringObjectRefs(oref As ObjectRef) As XojoInstruments.Framework.XIDictionary
		  // Finds all objects directly referenced by the specified oref, as possible as we can.
		  
		  #pragma BackgroundTasks False
		  
		  Using Xojo.Introspection
		  
		  Dim refs As New XIDictionary()
		  Dim obj As Variant = oref.Value()
		  
		  If obj = Nil Then Return refs
		  
		  If obj.IsArray() Then
		    Select Case obj.ArrayElementType
		    Case Variant.TypeDate, Variant.TypeObject
		      // Currently only 1-D array is supported.
		      Dim arr() As Variant = obj
		      For i As Integer = arr.Ubound() DownTo 0
		        GetReferringObjectRefsRegister(arr(i), "[" + Str(i) + "]", refs)
		      Next
		      
		    Case Else
		      // Array of Array is not allowed in Xojo.
		      'Case Variant.TypeArray
		      
		      // Not interested in value types.
		      'Case Variant.TypeBoolean
		      'Case Variant.TypeCFStringRef
		      'Case Variant.TypeColor
		      'Case Variant.TypeCString
		      'Case Variant.TypeCurrency
		      'Case Variant.TypeDouble
		      'Case Variant.TypeInt32
		      'Case Variant.TypeInt64
		      'Case Variant.TypeNil
		      'Case Variant.TypeOSType
		      'Case Variant.TypePString
		      'Case Variant.TypeSingle
		      'Case Variant.TypeString
		      'Case Variant.TypeStructure
		      'Case Variant.TypeText
		      'Case Variant.TypeWindowPtr
		      'Case Variant.TypeWString
		      
		    End Select
		    
		  Else
		    Dim ti As TypeInfo = GetType(obj)
		    
		    // Collect properties. This includes shared properties, but 
		    // excludes computed properties.
		    For Each prop As PropertyInfo In ti.Properties()
		      If Not prop.IsComputed() Then
		        Dim name As String = If(prop.IsShared(), "(shared) ", "") + prop.Name
		        GetReferringObjectRefsRegister(prop.Value(obj), name, refs)
		      End If
		    Next
		    
		    // Handle special classes.
		    
		    #if TargetDesktop
		      Select Case obj
		      Case IsA Window
		        Dim win As Window = obj
		        // Note: non-control window items cannot be reached.
		        For i As Integer = win.ControlCount - 1 DownTo 0
		          Dim ctrl As Control = win.Control(i)
		          GetReferringObjectRefsRegister(ctrl, ctrl.Name, refs)
		        Next
		        
		      Case IsA MenuItem
		        Dim m As MenuItem = obj
		        For i As Integer = m.Count() - 1 DownTo 0
		          Dim child As MenuItem = m.Item(i)
		          GetReferringObjectRefsRegister(child, "[" + Str(i) + "]", refs)
		        Next
		        
		      Case IsA SegmentedControl
		        Dim sc As SegmentedControl = obj
		        For i As Integer = sc.Items.UBound() DownTo 0
		          GetReferringObjectRefsRegister(sc.Items(i), "Item[" + Str(i) + "]", refs)
		        Next
		        
		      End Select
		    #endif
		    
		    Select Case obj
		    Case IsA Dictionary
		      Dim dict As Dictionary = Dictionary(obj)
		      For i As Integer = dict.Count() - 1 DownTo 0
		        Dim key As Variant = dict.Key(i)
		        GetReferringObjectRefsRegister(key, "Key[" + Str(i) + "]", refs)
		        GetReferringObjectRefsRegister(dict.Value(key), "Value[" + Str(i) + "]", refs)
		      Next
		      
		    Case IsA Xojo.Core.Dictionary
		      Dim dict As Xojo.Core.Dictionary = Xojo.Core.Dictionary(obj)
		      Dim i As Integer = 0
		      For Each ent As Xojo.Core.DictionaryEntry In dict
		        GetReferringObjectRefsRegister(ent.Key, "Key[" + Str(i) + "]", refs)
		        GetReferringObjectRefsRegister(ent.Value, "Value[" + Str(i) + "]", refs)
		        i = i + 1
		      Next
		      
		    End Select
		  End If
		  
		  // TODO support more classes like Collection
		  
		  Return refs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub GetReferringObjectRefsRegister(v As Variant, key As String, dict As XIDictionary)
		  If v = Nil Or v IsA XIObject Then Return
		  
		  Dim ti As Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(v)
		  
		  // `ti` will become Nil if the variant is an instance of
		  // the Xojo framework private class, e.g., `_Profile.Profile`.
		  If ti = Nil Or ti.IsValueType Then Return
		  
		  // Translate Array into Object.
		  If ti.IsArray() Then
		    v = v.ObjectValue
		  End If
		  
		  // Register.
		  dict.Value(key) = ObjectRef.ReferenceFor(v).ID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub RegisterSystemObject(obj As Object)
		  SystemObjectsRefIDs.Value(ObjectRef.ReferenceFor(obj).ID) = True
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mID
			End Get
		#tag EndGetter
		ID As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared LastID As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mObjectRefGraph As XIDictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mObjectRefIDs As XIArrayInteger
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mObjectRefGraph
			End Get
		#tag EndGetter
		ObjectRefGraph As XIDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mObjectRefIDs
			End Get
		#tag EndGetter
		ObjectRefIDs As XIArrayInteger
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared SystemObjectsRefIDs As XIDictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
