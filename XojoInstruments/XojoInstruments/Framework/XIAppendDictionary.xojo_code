#tag Class
Protected Class XIAppendDictionary
Implements XIObject
	#tag Method, Flags = &h0
		Sub Constructor()
		  mBackend = New XIDictionary()
		  mKeys = New XIArray()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(key As Auto) As Boolean
		  Return mBackend.HasKey(key)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Keys() As Xojo.Core.Iterable
		  Return New XIIterable(mKeys.GetIterator())
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(key As Auto, defaultValue As Auto) As Auto
		  Return mBackend.Lookup(key, defaultValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAll()
		  mBackend.RemoveAll()
		  mKeys.Clear()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key As Auto) As Auto
		  Return mBackend.Value(key)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key As Auto, Assigns value As Auto)
		  If Not mBackend.HasKey(key) Then
		    mKeys.Append(key)
		  End If
		  mBackend.Value(key) = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Values() As Xojo.Core.Iterable
		  Return New XIIterable(New XIAppendDictionaryIterator(Me, mKeys))
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBackend As XojoInstruments.Framework.XIDictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mKeys As XojoInstruments.Framework.XIArray
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
