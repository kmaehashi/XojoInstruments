#tag Class
Protected Class XIIterator
Implements XIObject,Xojo.Core.Iterator
	#tag Method, Flags = &h0
		Sub Constructor(arr As XIArray)
		  mArray = arr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoveNext() As Boolean
		  If mArray.Ubound() <= mCursor Then
		    Return False
		  End If
		  mCursor = mCursor + 1
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As Auto
		  Return mArray.RawItem(mCursor)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mArray As XIArray
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCursor As Integer = -1
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
