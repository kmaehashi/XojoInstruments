#tag Class
Protected Class ObjectRef
Implements XojoInstruments.Framework.XIObject
	#tag Method, Flags = &h0
		Sub Constructor(id As Integer, wref As XIWeakRef, className As String, hint As String)
		  Me.ID = id
		  Me.Reference = wref
		  Me.ClassName = className
		  Me.Hint = hint
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As Object
		  // Note: this getter has a side-effect for performance boost.
		  
		  Dim v As Object = Nil
		  
		  If Me.Reference <> Nil Then
		    v = Me.Reference.Value()
		    If v = Nil Then Me.Reference = Nil
		  End If
		  
		  Return v
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ClassName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Hint As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ID As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		Reference As XIWeakRef
	#tag EndProperty


	#tag ViewBehavior
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
		#tag ViewProperty
			Name="ClassName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hint"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ID"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
