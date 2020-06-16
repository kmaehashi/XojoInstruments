#tag Class
Protected Class InstrumentsSession
Implements XojoInstruments.Framework.XIObject
	#tag Method, Flags = &h0
		Function Capture(createGraph As Boolean) As Snapshot
		  #Pragma Unused createGraph
		  
		  Raise New RuntimeException()  // subclass must override
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InspectClass(className As String)
		  #Pragma Unused className
		  
		  Raise New RuntimeException()  // subclass must override
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InspectObject(id As Integer) As Boolean
		  #Pragma Unused id
		  
		  Raise New RuntimeException()  // subclass must override
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectRefByID(id As Integer) As ObjectRef
		  #Pragma Unused id
		  
		  Raise New RuntimeException()  // subclass must override
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectRefFor(obj As Object) As ObjectRef
		  #Pragma Unused obj
		  
		  Raise New RuntimeException()  // subclass must override
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterSystemObject(obj As Object)
		  #Pragma Unused obj
		  
		  Raise New RuntimeException()  // subclass must override
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mSnapshots As XIDictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
