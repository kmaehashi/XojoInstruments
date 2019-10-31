#tag Class
Protected Class Snapshot
Implements XojoInstruments.Framework.XIObject
	#tag Method, Flags = &h0
		Shared Function ComputeDelta(lhs As XIArrayInteger, rhs As XIArrayInteger) As SnapshotDelta
		  // Compare two ObjectRefIDs arrays.
		  // Two arrays must be sorted.
		  
		  Dim aAdded As New XIArrayInteger()
		  Dim aRemoved As New XIArrayInteger()
		  Dim aUnchanged As New XIArrayInteger()
		  
		  Dim indexLhs, indexRhs As Integer
		  
		  While True
		    If lhs.Ubound() < indexLhs Then
		      For i As Integer = indexRhs To rhs.UBound()
		        aAdded.Append(rhs.Item(i))
		      Next
		      Exit
		    ElseIf lhs.Ubound() < indexRhs Then
		      For i As Integer = indexLhs To lhs.UBound()
		        aRemoved.Append(lhs.Item(i))
		      Next
		      Exit
		    End If
		    
		    Dim idLhs, idRhs As Integer
		    idLhs = lhs.Item(indexLhs)
		    idRhs = rhs.Item(indexRhs)
		    
		    If idLhs = idRhs Then
		      aUnchanged.Append(idLhs)
		      indexLhs = indexLhs + 1
		      indexRhs = indexRhs + 1
		    ElseIf idLhs < idRhs Then
		      aRemoved.Append(idLhs)
		      indexLhs = indexLhs + 1
		    ElseIf idLhs > idRhs Then
		      aAdded.Append(idRhs)
		      indexRhs = indexRhs + 1
		    End If
		  Wend
		  
		  Return New SnapshotDelta(aAdded, aRemoved, aUnchanged)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(id As Integer)
		  Me.ID = id
		  Me.ObjectRefIDs = New XIArrayInteger()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DifferenceFrom(other As Snapshot) As SnapshotDelta
		  Return ComputeDelta(other.ObjectRefIDs, Me.ObjectRefIDs)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ID As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			A map of an ID of the ObjectRef and a dictionary, which holds a list of referring objects (objects referred from the object)
			as a mapping of a key string (the relationship from the object) and an ID of its ObjectRef.
		#tag EndNote
		ObjectRefGraph As XIDictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			A list of IDs of ObjectRefs.
		#tag EndNote
		ObjectRefIDs As XIArrayInteger
	#tag EndProperty

	#tag Property, Flags = &h0
		Timestamp As XIDate
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
