#tag Class
Private Class XIDictionaryIterable
Implements XIObject, Xojo.Core.Iterable
	#tag Method, Flags = &h0
		Sub Constructor(iter As Xojo.Core.Iterator, values As Boolean = False)
		  mIter = iter
		  mValues = values
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIterator() As Xojo.Core.Iterator
		  Return New XIDictionaryIterator(mIter, mValues)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mIter As Xojo.Core.Iterator
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mValues As Boolean = False
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
