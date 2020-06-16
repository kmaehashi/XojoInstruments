#tag Class
Protected Class SnapshotDelta
Implements XojoInstruments.Framework.XIObject
	#tag Method, Flags = &h0
		Sub Constructor(added As XIArrayInteger, removed As XIArrayInteger, unchanged As XIArrayInteger)
		  Me.Added = added
		  Me.Removed = removed
		  Me.Unchanged = unchanged
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Added As XIArrayInteger
	#tag EndProperty

	#tag Property, Flags = &h0
		Removed As XIArrayInteger
	#tag EndProperty

	#tag Property, Flags = &h0
		Unchanged As XIArrayInteger
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
	#tag EndViewBehavior
End Class
#tag EndClass
