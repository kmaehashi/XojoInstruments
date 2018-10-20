#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  XojoInstruments.Start()
		  Dim w As New Example()
		  w.Show()
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
