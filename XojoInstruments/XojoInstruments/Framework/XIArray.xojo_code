#tag Class
Protected Class XIArray
Implements XIObject,Xojo.Core.Iterable
	#tag Method, Flags = &h0
		Sub Append(value As Auto)
		  mBackend.Value(mBackend.Count) = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  mBackend.RemoveAll()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mBackend = New XIDictionary()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return mBackend.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIterator() As Xojo.Core.Iterator
		  Return New XIIterator(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawItem(index As Integer) As Auto
		  Return mBackend.Value(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RawItem(index As Integer, Assigns value As Auto)
		  mBackend.Value(index) = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Ubound() As Integer
		  Return mBackend.Count - 1
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBackend As XIDictionary
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
