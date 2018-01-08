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
		  Dim addedObjectRefIDs As XIArrayInteger
		  Do
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
		    addedObjectRefIDs = ComputeDelta(mObjectRefIDs, secondPass).Added
		    For Each id As Integer In addedObjectRefIDs
		      SystemObjectsRefIDs.Value(id) = True
		    Next
		  Loop Until addedObjectRefIDs.Ubound() = -1
		  
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

	#tag Method, Flags = &h21
		Private Shared Function GetObjectRefForVariant(v As Variant) As ObjectRef
		  // Returns ObjectRef for the given Variant.
		  // If the variant points to Nil or value type, return Nil.
		  
		  If v <> Nil Then
		    Dim ti As Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(v)
		    If Not ti.IsValueType Then
		      // Translate Array into Object.
		      If ti.IsArray() Then v = v.ObjectValue
		      Return ObjectRef.ReferenceFor(v)
		    End If
		  End If
		  
		  Return Nil
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
		    
		    // Handle special classes. Note that Select Case cannot be used
		    // as it may be a Ptr or Delegate.
		    If obj IsA Window Then
		      Dim win As Window = obj
		      // Note: non-control window items cannot be reached.
		      For i As Integer = win.ControlCount - 1 DownTo 0
		        Dim ctrl As Control = win.Control(i)
		        GetReferringObjectRefsRegister(ctrl, ctrl.Name, refs)
		      Next
		      
		    ElseIf obj IsA MenuItem Then
		      Dim m As MenuItem = obj
		      For i As Integer = m.Count() - 1 DownTo 0
		        Dim child As MenuItem = m.Item(i)
		        GetReferringObjectRefsRegister(child, "[" + Str(i) + "]", refs)
		      Next
		      
		    ElseIf obj IsA Dictionary Then
		      Dim dict As Dictionary = Dictionary(obj)
		      For i As Integer = dict.Count() - 1 DownTo 0
		        Dim key As Variant = dict.Key(i)
		        GetReferringObjectRefsRegister(key, "Key[" + Str(i) + "]", refs)
		        GetReferringObjectRefsRegister(dict.Value(key), "Value[" + Str(i) + "]", refs)
		      Next
		      
		    ElseIf obj IsA Xojo.Core.Dictionary Then
		      Dim dict As Xojo.Core.Dictionary = Xojo.Core.Dictionary(obj)
		      Dim i As Integer = 0
		      For Each ent As Xojo.Core.DictionaryEntry In dict
		        GetReferringObjectRefsRegister(ent.Key, "Key[" + Str(i) + "]", refs)
		        GetReferringObjectRefsRegister(ent.Value, "Value[" + Str(i) + "]", refs)
		        i = i + 1
		      Next
		      
		      // TODO support more classes like Collection
		      
		    End If
		  End If
		  
		  Return refs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub GetReferringObjectRefsRegister(v As Variant, key As String, dict As XIDictionary)
		  Dim oref As ObjectRef = GetObjectRefForVariant(v)
		  If oref <> Nil Then dict.Value(key) = oref.ID
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mID
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mID = value
			End Set
		#tag EndSetter
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
