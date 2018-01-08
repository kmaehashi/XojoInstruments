#tag Class
Protected Class ObjectRef
Implements XojoInstruments.Framework.XIObject
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub GarbageCollect()
		  // Remove dead WeakRefs.
		  
		  #pragma BackgroundTasks False
		  
		  If ObjectRefMap = Nil Then
		    ObjectRefMap = New XIDictionary()
		  End If
		  
		  For Each ent As Xojo.Core.DictionaryEntry In ObjectRefMap
		    Dim oref As ObjectRef = ent.Value
		    If oref.Value Is Nil Then
		      oref.mReference = Nil
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GenerateHint(obj As Object) As String
		  // Generate hint string for the object.
		  
		  // Note: as hints will not be updated, we should avoid using mutable values
		  // as much as possible.
		  
		  Select Case obj
		  Case IsA Control
		    Dim ctrl As Control = Control(obj)
		    Return ctrl.Name + _
		    If(ctrl.Window <> Nil, " [" + Xojo.Introspection.GetType(ctrl.Window).Name + "]", " (no window)")
		    
		  Case IsA MenuItem
		    Return MenuItem(obj).Name
		    
		  Case IsA Picture
		    Return Str(Picture(obj).Width) + " x " + Str(Picture(obj).Height)
		    
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

	#tag Method, Flags = &h0
		Shared Function ReferenceByID(id As Integer) As ObjectRef
		  // Get ObjectRef of the given ID.
		  
		  #pragma BackgroundTasks False
		  
		  If ObjectRefMap = Nil Then
		    ObjectRefMap = New XIDictionary()
		    Return Nil
		  End If
		  
		  Return ObjectRefMap.Lookup(id, Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ReferenceFor(obj As Object) As ObjectRef
		  // Get ObjectRef for the given object.
		  
		  #pragma BackgroundTasks False
		  
		  If ObjectRefMap = Nil Then
		    ObjectRefMap = New XIDictionary()
		  End If
		  
		  // If the object already has a reference, return it.
		  For Each ent As Xojo.Core.DictionaryEntry In ObjectRefMap
		    If ObjectRef(ent.Value).Value Is obj Then Return ent.Value
		  Next
		  
		  // Create a new object reference.
		  Dim oref As New ObjectRef()
		  oref.mID = ObjectRefMap.Count
		  oref.mReference = New XIWeakRef(obj)
		  oref.mClassName = Xojo.Introspection.GetType(obj).FullName
		  oref.mHint = GenerateHint(obj)
		  
		  // Register the object reference to the list.
		  ObjectRefMap.Value(oref.ID) = oref
		  
		  Return oref
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mClassName
			End Get
		#tag EndGetter
		ClassName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mHint
			End Get
		#tag EndGetter
		Hint As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mID
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  
			End Set
		#tag EndSetter
		ID As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mClassName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHint As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReference As XIWeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared ObjectRefMap As XIDictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return If(mReference <> Nil, mReference.Value(), Nil)
			End Get
		#tag EndGetter
		Value As Object
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Value
			End Get
		#tag EndGetter
		ValueAsAuto As Auto
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ClassName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hint"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
