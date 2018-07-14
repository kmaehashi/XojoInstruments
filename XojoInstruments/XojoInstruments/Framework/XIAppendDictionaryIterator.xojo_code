#tag Class
Private Class XIAppendDictionaryIterator
Inherits XIIterator
	#tag Method, Flags = &h0
		Sub Constructor(dict As XIAppendDictionary, keys As XIArray)
		  Super.Constructor(keys)
		  mDict = dict
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As Auto
		  Dim v As Auto = Super.Value()
		  Return mDict.Value(v)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mDict As XIAppendDictionary
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
		#tag ViewProperty
			Name="mDict"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
