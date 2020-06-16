#tag Module
Protected Module XojoInstruments
	#tag Method, Flags = &h1
		Protected Sub Start()
		  StartGUI()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StartGUI()
		  #if TargetDesktop
		    Static desktopGUI As XojoInstrumentsDesktopGUI
		    
		    If desktopGUI = Nil Then
		      If mLocalSession = Nil Then
		        mLocalSession = New InstrumentsLocalSession()
		      End If
		      
		      // Create a window.
		      desktopGUI = New XojoInstrumentsDesktopGUI(mLocalSession)
		    End If
		    
		    desktopGUI.Show()
		  #else
		    // Local mode is only supported for Desktop apps.
		    Raise New PlatformNotSupportedException()
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mLocalSession As InstrumentsLocalSession
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return Str(MajorVersion) + "." + Str(MinorVersion) + "." + Str(BugVersion)
			End Get
		#tag EndGetter
		Protected Version As String
	#tag EndComputedProperty


	#tag Constant, Name = BugVersion, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MajorVersion, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MinorVersion, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
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
