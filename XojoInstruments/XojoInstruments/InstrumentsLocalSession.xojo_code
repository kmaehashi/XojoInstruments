#tag Class
Protected Class InstrumentsLocalSession
Inherits InstrumentsSession
Implements XojoInstruments.Framework.XIObject
	#tag Method, Flags = &h0
		Function Capture(createGraph As Boolean) As Snapshot
		  #pragma BackgroundTasks False
		  
		  mLastSnapshotID = mLastSnapshotID + 1
		  Dim snap As New Snapshot(mLastSnapshotID)
		  Dim snapTimestamp As New XIDate()
		  
		  Dim objectRefIDs As XIArrayInteger = snap.ObjectRefIDs
		  Dim objectRefGraph As XIDictionary = If(createGraph, New XIDictionary(), Nil)
		  
		  // Collect all objects.
		  // The loop block only exists to limit the scope of the iterator.
		  Do
		    Dim iter As Runtime.ObjectIterator = Runtime.IterateObjects()
		    While iter.MoveNext()
		      Dim obj As Object = iter.Current
		      If (obj IsA XIObject) Or (obj Is iter) Then Continue
		      
		      Dim oref As ObjectRef = Me.ObjectRefFor(obj)
		      If mSystemObjectRefIDs.HasKey(oref.ID) Then Continue
		      
		      objectRefIDs.Append(oref.ID)
		      If createGraph Then
		        objectRefGraph.Value(oref.ID) = GetReferringObjectRefs(oref)
		      End If
		    Wend
		  Loop Until True
		  objectRefIDs.Sort()
		  
		  // Collect all system objects created during the iteration
		  // (e.g., introspection cache in Xojo framework); they should be
		  // ignored when taking a next snapshot.
		  While True
		    Dim iter2 As Runtime.ObjectIterator = Runtime.IterateObjects()
		    Dim secondPass As New XIArrayInteger()
		    While iter2.MoveNext()
		      Dim obj As Object = iter2.Current
		      If (obj IsA XIObject) Or (obj Is iter2) Then Continue
		      
		      Dim oref As ObjectRef = Me.ObjectRefFor(obj)
		      If mSystemObjectRefIDs.HasKey(oref.ID) Then Continue
		      
		      secondPass.Append(oref.ID)
		    Wend
		    secondPass.Sort()
		    
		    // Compute delta
		    Dim addedObjectRefIDs As XIArrayInteger = Snapshot.ComputeDelta(objectRefIDs, secondPass).Added
		    For Each id As Integer In addedObjectRefIDs
		      mSystemObjectRefIDs.Value(id) = True
		    Next
		    If addedObjectRefIDs.Ubound() = -1 Then Exit
		  Wend
		  
		  // Remove WeakRefs no longer in use.
		  Me.GarbageCollect()
		  
		  // Set Snapshot
		  snap.ID = mSnapshots.Count
		  snap.Timestamp = snapTimestamp
		  snap.ObjectRefIDs = objectRefIDs
		  snap.ObjectRefGraph = objectRefGraph
		  mSnapshots.Value(snap.ID) = snap
		  
		  Return snap
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor()
		  
		  mSnapshots = New XIDictionary()
		  mObjectRefMap = New XIDictionary()
		  mSystemObjectRefIDs = New XIDictionary()
		  
		  // Take an initial snapshot.
		  Call Me.Capture(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GarbageCollect()
		  #pragma BackgroundTasks False
		  
		  For Each classAndDict As Xojo.Core.DictionaryEntry In Me.mObjectRefMap
		    Dim idToOref As XIDictionary = classAndDict.Value
		    For Each idAndOref As Xojo.Core.DictionaryEntry In idToOref
		      // Getting the value removes dead weakrefs.
		      Call ObjectRef(idAndOref.Value).Value()
		    Next
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GenerateHint(obj As Object) As String
		  // Generate hint string for the object.
		  
		  // Note: as hints will not be updated, we should avoid using mutable values
		  // as much as possible.
		  
		  #if TargetDesktop
		    Select Case obj
		    Case IsA Control
		      Dim ctrl As Control = Control(obj)
		      Return ctrl.Name + _
		      If(ctrl.Window <> Nil, " [" + Xojo.Introspection.GetType(ctrl.Window).Name + "]", " (no window)")
		      
		    Case IsA MenuItem
		      Return MenuItem(obj).Name
		      
		    End Select
		  #endif
		  
		  Select Case obj
		  Case IsA Picture
		    Return Str(Picture(obj).Width) + " x " + Str(Picture(obj).Height)
		    
		  Case IsA Graphics
		    Return Str(Graphics(obj).Width) + " x " + Str(Graphics(obj).Height)
		    
		  Case IsA Pair
		    Dim p As Pair = Pair(obj)
		    Dim leftType, rightType As Xojo.Introspection.TypeInfo
		    
		    leftType = Xojo.Introspection.GetType(p.Left)
		    rightType = Xojo.Introspection.GetType(p.Right)
		    
		    Return If(leftType = Nil, "Nil", leftType.FullName) + " : " + If(rightType = Nil, "Nil", rightType.FullName)
		    
		  Case IsA WeakRef
		    Dim target As Object = WeakRef(obj).Value
		    Return If(target <> Nil, Xojo.Introspection.GetType(target).FullName, "(unknown)")
		    
		  Case IsA Thread
		    Return Thread(obj).DebugIdentifier  // mutable value
		    
		    // TODO support more classes
		  End Select
		  
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetReferringObjectRefs(oref As ObjectRef) As XojoInstruments.Framework.XIDictionary
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
		Private Sub GetReferringObjectRefsRegister(v As Variant, key As String, dict As XIDictionary)
		  If v = Nil or v IsA XIObject Then Return
		  
		  Dim ti As Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(v)
		  
		  // `ti` will become Nil if the variant is an instance of
		  // the Xojo framework private class, e.g., `_Profile.Profile`.
		  If ti = Nil Or ti.IsValueType Then Return
		  
		  // Translate Array into Object.
		  If ti.IsArray() Then
		    v = v.ObjectValue
		  End If
		  
		  // Register.
		  dict.Value(key) = Me.ObjectRefFor(v).ID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InspectObject(id As Integer) As Boolean
		  // Returns True when successfully inspected (i.e., object is still alive).
		  // Returns False if the object has already been garbage collected.
		  // Raises UnsupportedOperationException when not in Debug Run.
		  
		  #if Not DebugBuild
		    Raise New UnsupportedOperationException()
		  #endif
		  
		  Dim oref As ObjectRef = ObjectRefByID(ID)
		  If oref = Nil Then
		    // No such ObjectRef. This should not happen.
		    Break
		    Return False
		  End If
		  
		  Dim obj As Object = oref.Value
		  If obj = Nil Then Return False  // Object has been garbage collected.
		  
		  If Xojo.Introspection.GetType(obj).FullName = "Delegate" Then
		    Inspect_Delegate_in_IDE(ID, obj)
		  Else
		    Inspect_Object_in_IDE(ID, obj)
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub Inspect_Delegate_in_IDE(ID As Integer, obj As Object)
		  //  **************************************************************************
		  //
		  //     `obj` in Variables is the Delegate(s) you have selected.
		  //
		  //     Click [ ▶︎ Resume ] to continue...
		  //
		  //  **************************************************************************
		  
		  #Pragma Unused ID
		  #Pragma Unused obj
		  Break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub Inspect_Object_in_IDE(ID As Integer, obj As Auto)
		  //  **************************************************************************
		  //
		  //     `obj` in Variables is the object(s) you have selected.
		  //
		  //     Click [ ▶︎ Resume ] to continue...
		  //
		  //  **************************************************************************
		  
		  #Pragma Unused ID
		  #Pragma Unused obj
		  Break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectRefByID(id As Integer) As ObjectRef
		  // Get ObjectRef of the given ID.
		  // Returns Nil when not found.
		  
		  #pragma BackgroundTasks False
		  
		  For Each classAndDict As Xojo.Core.DictionaryEntry In Me.mObjectRefMap
		    Dim idToOref As XIDictionary = classAndDict.Value
		    If idToOref.HasKey(id) Then
		      Return idToOref.Value(id)
		    End If
		  Next
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectRefFor(obj As Object) As ObjectRef
		  // Get ObjectRef for the given object.
		  // Assign a new one when the corresponding ObjectRef has never been created yet.
		  
		  #pragma BackgroundTasks False
		  
		  Dim className As String = Xojo.Introspection.GetType(obj).FullName
		  Dim idToOref As XIDictionary = Me.mObjectRefMap.Lookup(className, Nil)
		  If idToOref = Nil Then
		    idToOref = New XIDictionary()
		    Me.mObjectRefMap.Value(className) = idToOref
		  Else
		    // If the object already has a reference, return it.
		    For Each idAndOref As Xojo.Core.DictionaryEntry In idToOref
		      Dim oref As ObjectRef = idAndOref.Value
		      If oref.Value Is obj Then Return oref
		    Next
		  End If
		  
		  // Create a new object reference.
		  mLastObjectRefID = mLastObjectRefID + 1
		  Dim oref As New ObjectRef(mLastObjectRefID, New XIWeakRef(obj), className, GenerateHint(obj))
		  
		  // Register the object reference to the list.
		  idToOref.Value(oref.ID) = oref
		  
		  Return oref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterSystemObject(obj As Object)
		  mSystemObjectRefIDs.Value(Me.ObjectRefFor(obj).ID) = True
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mLastObjectRefID As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastSnapshotID As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			This map holds the mapping of a fully-qualified class name and a dictionary, which holds a mapping of an ID to the actual ObjectRef.
		#tag EndNote
		Private mObjectRefMap As XIDictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			This map holds the list of IDs of ObjectRefs that should be excluded from the snapshot.
		#tag EndNote
		Private mSystemObjectRefIDs As XIDictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
