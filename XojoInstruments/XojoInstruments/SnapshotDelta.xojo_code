#tag Class
Protected Class SnapshotDelta
Implements XojoInstruments.Framework.XIObject
	#tag Method, Flags = &h0
		Sub Constructor(added As XIArrayInteger, removed As XIArrayInteger, unchanged As XIArrayInteger)
		  mAdded = added
		  mRemoved = removed
		  mUnchanged = unchanged
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAdded
			End Get
		#tag EndGetter
		Added As XIArrayInteger
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAdded As XIArrayInteger
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRemoved As XIArrayInteger
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUnchanged As XIArrayInteger
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mRemoved
			End Get
		#tag EndGetter
		Removed As XIArrayInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUnchanged
			End Get
		#tag EndGetter
		Unchanged As XIArrayInteger
	#tag EndComputedProperty


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
