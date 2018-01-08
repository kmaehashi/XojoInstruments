#tag Class
Protected Class XIArrayInteger
Inherits XojoInstruments.Framework.XIArray
Implements XIObject
	#tag Method, Flags = &h0
		Sub Append(item As Integer)
		  Super.Append(item)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(index As Integer) As Integer
		  Return RawItem(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Item(index As Integer, Assigns value As Integer)
		  RawItem(index) = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sort()
		  Dim arr() As Integer = Me.ToArray()
		  
		  arr.Sort()
		  
		  Dim lastIndex As Integer = Me.Ubound()
		  For i As Integer = 0 To lastIndex
		    Me.Item(i) = arr(i)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToArray() As Integer()
		  Dim lastIndex As Integer = Me.Ubound()
		  Dim arr() As Integer
		  ReDim arr(lastIndex)
		  
		  For i As Integer = 0 To lastIndex
		    arr(i) = Me.Item(i)
		  Next
		  
		  Return arr
		End Function
	#tag EndMethod


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
