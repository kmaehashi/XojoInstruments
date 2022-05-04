#tag Class
Protected Class XojoInstrumentsTestController
Inherits TestController
	#tag Event
		Sub AllTestsFinished()
		  System.DebugLog("Passed: " + Str(Self.PassedCount))
		  System.DebugLog("Failed: " + Str(Self.FailedCount))
		  
		  Dim exitStatus As Integer = If(Self.FailedCount = 0, 0, 1)
		  
		  #if TargetConsole
		    Quit(exitStatus)
		  #else
		    Soft Declare Sub ProcessExit Lib CRuntimeLibrary Alias "exit" (status As Integer)
		    ProcessExit(exitStatus)
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub InitializeTestGroups()
		  // Instantiate TestGroup subclasses here so that they can be run
		  
		  Var group As TestGroup
		  
		  group = New FrameworkTest(Self, "XI Framework Tests")
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Sub Run()
		  mInstance = New XojoInstrumentsTestController()
		  mInstance.LoadTestGroups()
		  mInstance.Start()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mInstance As XojoInstrumentsTestController
	#tag EndProperty


	#tag Constant, Name = CRuntimeLibrary, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"libc"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"/usr/lib/libSystem.dylib"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Duration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GroupCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotImplementedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunGroupCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
End Class
#tag EndClass
