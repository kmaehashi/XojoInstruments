#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // -------------------------------------------------------------------- //
		  
		  // To install XojoInstruments to your project:
		  // 1. Copy `XojoInstruments` folder to your project using the IDE.
		  // 2. Insert the following line to the top of `App.Open` (or `App.Opening`) event handler of your project.
		  
		  XojoInstruments.Start()
		  
		  // -------------------------------------------------------------------- //
		  
		  
		  // Launch an example application to demonstrate memory leak.
		  Dim w As New Example()
		  w.Show()
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
