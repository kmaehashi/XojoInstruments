#tag Class
Protected Class XINamedTemporaryFile
Implements XIObject
	#tag Method, Flags = &h0
		Sub Constructor()
		  mNativePath = GetTemporaryFolderItem().NativePath.ToText()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  Dim f As Xojo.IO.FolderItem = Me.GetFolderItem()
		  If f.Exists() Then
		    f.Delete()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFolderItem() As Xojo.IO.FolderItem
		  Return New Xojo.IO.FolderItem(mNativePath)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mNativePath As Text
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
