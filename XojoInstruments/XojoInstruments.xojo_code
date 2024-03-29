#tag Module
Protected Module XojoInstruments
	#tag Method, Flags = &h1
		Protected Sub Start()
		  #if TargetDesktop
		    Static desktopGUI As XojoInstrumentsDesktopGUI
		    
		    If desktopGUI = Nil Then
		      // Take a snapshot to register Introspection-related things to system object list.
		      Dim snap As New Snapshot(True)
		      #Pragma Unused snap
		      
		      // Create a window.
		      desktopGUI = New XojoInstrumentsDesktopGUI()
		      
		      // Hide objects in the GUI from snapshot.
		      XojoInstruments.Snapshot.RegisterSystemObject(desktopGUI)
		      For i As Integer = desktopGUI.ControlCount - 1 DownTo 0
		        XojoInstruments.Snapshot.RegisterSystemObject(desktopGUI.Control(i))
		      Next
		    End If
		    
		    desktopGUI.Show()
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return Str(MajorVersion) + "." + Str(MinorVersion) + "." + Str(BugVersion)
			End Get
		#tag EndGetter
		Protected Version As String
	#tag EndComputedProperty


	#tag Constant, Name = BugVersion, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MajorVersion, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MinorVersion, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant


	#tag Using, Name = XojoInstruments.Framework
	#tag EndUsing


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
End Module
#tag EndModule
