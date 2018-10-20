#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // -------------------------------------------------------------------- //
		  
		  // To install XojoInstruments to your project:
		  // 1. Copy `XojoInstruments` folder to your project using IDE.
		  // 2. Add the following line to `App.Open` event handler of your project.
		  
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
