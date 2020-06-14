#tag Window
Begin Window XojoInstrumentsDesktopGUI
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   300
   MinimizeButton  =   True
   MinWidth        =   800
   Placement       =   0
   Resizeable      =   True
   Title           =   "Xojo Instruments"
   Visible         =   True
   Width           =   800
   Begin GroupBox CaptureControlGroup
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      Height          =   100
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   490
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
      Begin CheckBox CaptureBuildRefGraphCheck
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Build Reference Graph"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Reference graph can be constructed when capturing the snapshot.\nThis is needed to detect circular reference or generate DOT graph.\nNote that this increases the captuing time."
         Index           =   -2147483648
         InitialParent   =   "CaptureControlGroup"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         State           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   565
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   180
      End
      Begin PushButton DoCaptureButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Capture"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "CaptureControlGroup"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   505
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   180
      End
      Begin PushButton DoCaptureCompareButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Capture && Compare"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "CaptureControlGroup"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   535
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   180
      End
   End
   Begin TabPanel ResultTabPanel
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   580
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   220
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   2
      SmallTabs       =   True
      TabDefinition   =   "Snapshot\rComparison\rBackreference\rVisualization\rAbout"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Value           =   2
      Visible         =   True
      Width           =   570
      Begin Label LabelSnapshot
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   230
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "No snapshot selected"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   40
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   550
      End
      Begin Listbox SnapshotObjectList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   2
         ColumnsResizable=   True
         ColumnWidths    =   "*,10%"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   490
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         InitialValue    =   "Object	Count"
         Italic          =   False
         Left            =   230
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   2
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   70
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   550
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Label LabelComparison
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   230
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "No snapshots compared"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   40
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   550
      End
      Begin Listbox ComparisonList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   4
         ColumnsResizable=   True
         ColumnWidths    =   "*,10%,5%,5%"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   490
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         InitialValue    =   "Object	Count	+	-"
         Italic          =   False
         Left            =   230
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   2
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   70
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   550
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin PushButton DoInspectCompareButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Inspect in IDE"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   230
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   2
         TabIndex        =   5
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   565
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   90
      End
      Begin Label LabelGraph
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   230
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         Text            =   "No snapshot selected"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   40
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   550
      End
      Begin CheckBox GraphExcludeNodesWithoutEdgeCheck
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Exclude nodes without edge"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   230
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         State           =   1
         TabIndex        =   1
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   70
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   170
      End
      Begin HTMLViewer GraphHTMLViewer
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   480
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Left            =   230
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Renderer        =   0
         Scope           =   2
         TabIndex        =   5
         TabPanelIndex   =   4
         TabStop         =   True
         Top             =   100
         Visible         =   True
         Width           =   550
      End
      Begin PushButton DoGraphRenderButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Render"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   700
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   4
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   70
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton DoInspectSnapshotButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Inspect in IDE"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   230
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   565
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   90
      End
      Begin ComboBox GraphDotCommand
         AutoComplete    =   False
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         InitialValue    =   ""
         Italic          =   False
         Left            =   490
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   70
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   200
      End
      Begin Label LabelBackref
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   230
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "No snapshot selected"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   40
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   550
      End
      Begin Label LabelBackrefObjectID
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   230
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "Object ID:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   70
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   60
      End
      Begin TextField BackrefInput
         AcceptTabs      =   False
         Alignment       =   3
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   288
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "################"
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "0"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   70
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   100
      End
      Begin PushButton DoBackrefShowButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Show Backreference"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   400
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   70
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   140
      End
      Begin Listbox BackrefList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   1
         ColumnsResizable=   True
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   480
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         InitialValue    =   "Object"
         Italic          =   False
         Left            =   230
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   2
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   4
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   100
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   550
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Label LabelAboutTitle
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   240
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Xojo Instruments"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   18.0
         TextUnit        =   0
         Top             =   50
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   530
      End
      Begin Label LabelAboutCopyright
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   40
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   240
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   2
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Copyright ©︎ Kenichi Maehashi, 2017-2018.\nDistributed under MIT License."
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   95
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   530
      End
      Begin Label LabelAboutVersion
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   240
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Version x.y.z"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   75
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   530
      End
      Begin Label LabelAboutLink
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   15
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   240
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "https://github.com/kmaehashi/XojoInstruments"
         TextAlign       =   0
         TextColor       =   &c0000FF00
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   135
         Transparent     =   True
         Underline       =   True
         Visible         =   True
         Width           =   530
      End
      Begin PushButton DoTrackBackrefSnapshotButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Track Backreference"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   330
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   565
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   120
      End
      Begin PushButton DoTrackBackrefCompareButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Track Backreference"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultTabPanel"
         Italic          =   False
         Left            =   330
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   2
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   565
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   120
      End
   End
   Begin Listbox SnapshotList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   True
      ColumnWidths    =   "10%,*,20%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   440
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "#	Time	Count"
      Italic          =   False
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   1
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   10
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton DoCompareTwoButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Compare Selected"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   460
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // Hide objects in the window from snapshot.
		  XojoInstruments.Snapshot.RegisterSystemObject(Me)
		  For i As Integer = Me.ControlCount - 1 DownTo 0
		    XojoInstruments.Snapshot.RegisterSystemObject(Me.Control(i))
		  Next
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function DoCapture(createGraph As Boolean) As XojoInstruments.Snapshot
		  Dim snap As New XojoInstruments.Snapshot(createGraph)
		  
		  SnapshotList.AddRow( _
		  Str(snap.ID), _
		  Xojo.Core.Date.Now().ToText(), _
		  Str(snap.Count()))
		  SnapshotList.RowTag(SnapshotList.LastIndex) = snap
		  SnapshotList.ListIndex = SnapshotList.LastIndex
		  
		  Return snap
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoCompare(s1 As XojoInstruments.Snapshot, s2 As XojoInstruments.Snapshot)
		  Dim delta As XojoInstruments.SnapshotDelta = s2.DifferenceFrom(s1)
		  
		  Dim added As XIDictionary = GroupByClassName(delta.Added)
		  Dim removed As XIDictionary = GroupByClassName(delta.Removed)
		  Dim unchanged As XIDictionary = GroupByClassName(delta.Unchanged)
		  
		  // List all class names.
		  Dim allClassNames As New XIDictionary()
		  For Each ent As Xojo.Core.DictionaryEntry In added
		    allClassNames.Value(ent.Key) = True
		  Next
		  For Each ent As Xojo.Core.DictionaryEntry In removed
		    allClassNames.Value(ent.Key) = True
		  Next
		  For Each ent As Xojo.Core.DictionaryEntry In unchanged
		    allClassNames.Value(ent.Key) = True
		  Next
		  
		  // Render the table.
		  ComparisonList.DeleteAllRows()
		  For Each ent As Xojo.Core.DictionaryEntry In allClassNames
		    Dim className As String = ent.Key
		    Dim addedForClass As New XIArrayInteger()
		    Dim removedForClass As New XIArrayInteger()
		    Dim unchangedForClass As New XIArrayInteger()
		    
		    addedForClass = added.LookUp(className, addedForClass)
		    removedForClass = removed.Lookup(className, removedForClass)
		    unchangedForClass = unchanged.Lookup(className, unchangedForClass)
		    
		    Dim addedCount As Integer = addedForClass.Ubound() + 1
		    Dim removedCount As Integer = removedForClass.Ubound() + 1
		    Dim unchangedCount As Integer = unchangedForClass.Ubound() + 1
		    
		    ComparisonList.AddFolder("")
		    ComparisonList.Cell(ComparisonList.LastIndex, 0) = className
		    ComparisonList.Cell(ComparisonList.LastIndex, 1) = Str(unchangedCount + addedCount)
		    ComparisonList.Cell(ComparisonList.LastIndex, 2) = If(addedCount <> 0, Str(addedCount), "")
		    ComparisonList.Cell(ComparisonList.LastIndex, 3) = If(removedCount <> 0, Str(removedCount), "")
		    
		    Dim record As New XIDictionary()
		    record.Value(0) = addedForClass
		    record.Value(1) = removedForClass
		    record.Value(2) = unchangedForClass
		    ComparisonList.RowTag(ComparisonList.LastIndex) = record
		  Next
		  
		  ResultTabPanel.Value = 1  // Comparison View
		  LabelComparison.Text = _
		  "Snapshot Comparison from #" + Str(s1.ID) + " to #" + Str(s2.ID) + _
		  " (" + Str(s2.ObjectRefIDs.Count()) + " objects, " + _
		  Str(delta.Added.Count()) + " added, " + Str(delta.Removed.Count()) + " removed, " + Str(delta.Unchanged.Count()) + " unchanged)"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DoGenerateDot(snap As XojoInstruments.Snapshot,  excludeNodesWithoutEdge As Boolean, renderHints As Boolean) As String
		  Dim nodes(), edges() As String
		  Dim seen As New XojoInstruments.Framework.XIDictionary()
		  
		  For Each id As Integer In snap.ObjectRefIDs
		    Dim dict As Xojo.Core.Dictionary = snap.ObjectRefGraph.Value(id)
		    For Each ent As Xojo.Core.DictionaryEntry In dict
		      Dim refKey As String = ent.Key
		      Dim refID As Integer = ent.Value
		      edges.Append( _
		      "  " + Str(id) + " -> " + Str(refID) + _
		      " [label=""" + refKey + """];")
		      seen.Value(id) = True
		      seen.Value(refID) = True
		    Next
		  Next
		  
		  
		  For Each id As Integer In snap.ObjectRefIDs
		    Dim oref As XojoInstruments.ObjectRef = _
		    XojoInstruments.ObjectRef.ReferenceByID(id)
		    If Not excludeNodesWithoutEdge Or seen.HasKey(id) Then
		      If renderHints Then
		        // TODO html escape needed
		        nodes.Append( _
		        "  " + Str(id) + _
		        " [label=<" + oref.ClassName + _
		        If(oref.Hint <> "", "<BR /><FONT POINT-SIZE=""10"">" + oref.Hint + "</FONT>", "") + ">" + _
		        ", URL=""xojo-instruments://snapshot=" + Str(0) + "&amp;object=" + Str(id) + """" + _
		        ", id=""object-" + Str(id) + """" + _
		        "];")
		      Else
		        nodes.Append( _
		        "  " + Str(id) + _
		        " [label=""" + oref.ClassName + """" + _
		        ", URL=""xojo-instruments://snapshot=" + Str(0) + "&amp;object=" + Str(id) + """" + _
		        ", id=""object-" + Str(id) + """" + _
		        "];")
		      End If
		    End If
		  Next
		  
		  // Avoid using EndOfLine as it generate cache.
		  Return _
		  "digraph {" + EOL + _
		  Join(nodes, EOL) + EOL + _
		  Join(edges, EOL) + EOL + _
		  "}"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoShowSnapshot(snap As XojoInstruments.Snapshot, excludeNodesWithoutEdge As Boolean)
		  mSnapshot = snap
		  
		  Dim summary As XIDictionary = GroupByClassName(snap.ObjectRefIDs)
		  
		  SnapshotObjectList.DeleteAllRows()
		  For Each entry As Xojo.Core.DictionaryEntry In summary
		    Dim className As String = entry.Key
		    Dim idListForClass As XIArrayInteger = entry.Value
		    
		    SnapshotObjectList.AddFolder("")
		    SnapshotObjectList.Cell(SnapshotObjectList.LastIndex, 0) = className
		    SnapshotObjectList.Cell(SnapshotObjectList.LastIndex, 1) = Str(idListForClass.Ubound() + 1)
		    SnapshotObjectList.RowTag(SnapshotObjectList.LastIndex) = idListForClass
		  Next
		  
		  LabelSnapshot.Text = "Snapshot #" + Str(snap.ID) + " (" + Str(snap.ObjectRefIDs.Count()) + " objects)"
		  LabelGraph.Text = LabelSnapshot.Text
		  LabelBackref.Text = LabelSnapshot.Text
		  
		  // Backreference
		  BackrefList.DeleteAllRows()
		  
		  // Visualization
		  If snap.ObjectRefGraph <> Nil Then
		    mGraphData = DoGenerateDot(snap, excludeNodesWithoutEdge, False)
		  Else
		    mGraphData = ""
		  End If
		  GraphHTMLViewer.LoadURL("about:blank")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindBackreference(snap As XojoInstruments.Snapshot, objID As Integer) As Pair()
		  Dim result() As Pair
		  
		  For Each ent As Xojo.Core.DictionaryEntry In snap.ObjectRefGraph
		    Dim parentID As Integer = ent.Key
		    For Each ent2 As Xojo.Core.DictionaryEntry In XojoInstruments.Framework.XIDictionary(ent.Value)
		      Dim refKey As String = ent2.Key
		      Dim refID As Integer = ent2.Value
		      If refID = objID Then
		        result.Append(parentID : refKey)
		      End If
		    Next
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetSelectedSnapshots() As Pair
		  Dim lhs, rhs As XojoInstruments.Snapshot
		  
		  For i As Integer = SnapshotList.ListCount - 1 DownTo 0
		    If SnapshotList.Selected(i) Then
		      If rhs = Nil Then
		        rhs = SnapshotList.RowTag(i)
		      ElseIf lhs = Nil Then
		        lhs = SnapshotList.RowTag(i)
		      Else
		        SnapshotList.Selected(i) = False
		      End If
		    End If
		  Next
		  
		  Return lhs : rhs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GroupByClassName(ObjectRefIDs As XojoInstruments.Framework.XIArrayInteger) As XIDictionary
		  Dim d As New XIDictionary()
		  
		  For Each id As Integer In ObjectRefIDs
		    Dim className As String = XojoInstruments.ObjectRef.ReferenceByID(id).ClassName
		    Dim idListForClass As New XIArrayInteger()
		    If d.HasKey(className) Then
		      idListForClass = d.Value(className)
		    Else
		      d.Value(className) = idListForClass
		    End If
		    idListForClass.Append(id)
		  Next
		  
		  Return d
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mGraphData As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSnapshot As XojoInstruments.Snapshot
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSnapshotDelta As XojoInstruments.SnapshotDelta
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTempGraphHTMLFile As XojoInstruments.Framework.XINamedTemporaryFile
	#tag EndProperty


	#tag Constant, Name = EOL, Type = String, Dynamic = False, Default = \"\n", Scope = Private
	#tag EndConstant


	#tag Using, Name = XojoInstruments.Framework
	#tag EndUsing


#tag EndWindowCode

#tag Events DoCaptureButton
	#tag Event
		Sub Action()
		  Call DoCapture(CaptureBuildRefGraphCheck.Value)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DoCaptureCompareButton
	#tag Event
		Sub Action()
		  Dim oldSnap As XojoInstruments.Snapshot = mSnapshot
		  If oldSnap = Nil Then
		    MsgBox("Please select a snapshot to compare with.")
		    Return
		  End If
		  
		  DoCompare(oldSnap, DoCapture(CaptureBuildRefGraphCheck.Value))
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SnapshotObjectList
	#tag Event
		Sub DoubleClick()
		  Me.Expanded(Me.ListIndex) = Not Me.Expanded(Me.ListIndex)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim ids As XojoInstruments.Framework.XIArrayInteger = Me.RowTag(row)
		  For Each id As Integer In ids
		    Dim oref As XojoInstruments.ObjectRef = XojoInstruments.ObjectRef.ReferenceByID(id)
		    Me.AddRow(Str(id) + If(oref.Hint <> "", " − " + oref.Hint, ""))
		    Me.RowTag(Me.LastIndex) = id
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ComparisonList
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim d As XojoInstruments.Framework.XIDictionary = Me.RowTag(row)
		  Dim added, removed, unchanged As XojoInstruments.Framework.XIArrayInteger
		  
		  added = d.Value(0)
		  removed = d.Value(1)
		  unchanged = d.Value(2)
		  
		  For Each id As Integer In added
		    Dim oref As XojoInstruments.ObjectRef = XojoInstruments.ObjectRef.ReferenceByID(id)
		    Me.AddRow(Str(id) + If(oref.Hint <> "", " − " + oref.Hint, ""), "", "✓", "")
		    Me.RowTag(Me.LastIndex) = id
		  Next
		  
		  For Each id As Integer In removed
		    Dim oref As XojoInstruments.ObjectRef = XojoInstruments.ObjectRef.ReferenceByID(id)
		    Me.AddRow(Str(id) + If(oref.Hint <> "", " − " + oref.Hint, ""), "", "", "✓")
		    Me.RowTag(Me.LastIndex) = id
		  Next
		  
		  For Each id As Integer In unchanged
		    Dim oref As XojoInstruments.ObjectRef = XojoInstruments.ObjectRef.ReferenceByID(id)
		    Me.AddRow(Str(id) + If(oref.Hint <> "", " − " + oref.Hint, ""), "", "", "")
		    Me.RowTag(Me.LastIndex) = id
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Me.Expanded(Me.ListIndex) = Not Me.Expanded(Me.ListIndex)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DoInspectCompareButton
	#tag Event
		Sub Action()
		  #if DebugBuild
		    If _
		      ComparisonList.ListIndex < 0 Or _
		      ComparisonList.ListCount <= ComparisonList.ListIndex Then
		      MsgBox("Please select an object ID to inspect.")
		      Return 
		    End If
		    
		    If ComparisonList.RowIsFolder(ComparisonList.ListIndex) Then
		      // All objects for the class.
		      Dim d As XojoInstruments.Framework.XIDictionary = ComparisonList.RowTag(ComparisonList.ListIndex)
		      Dim added, unchanged As XojoInstruments.Framework.XIArrayInteger
		      
		      added = d.Value(0)
		      unchanged = d.Value(2)
		      
		      Dim viewObjects As New XojoInstruments.Framework.XIDictionary()
		      
		      For Each id As Integer In added
		        viewObjects.Value(id) = XojoInstruments.ObjectRef.ReferenceByID(id).Value()
		      Next
		      
		      For Each id As Integer In unchanged
		        viewObjects.Value(id) = XojoInstruments.ObjectRef.ReferenceByID(id).Value()
		      Next
		      
		      XojoInstruments.ObjectRef.InspectInIDE(-1, viewObjects)
		      
		    Else
		      // Single object.
		      Dim objId As Integer = ComparisonList.RowTag(ComparisonList.ListIndex)
		      Dim oref As XojoInstruments.ObjectRef = XojoInstruments.ObjectRef.ReferenceByID(objId)
		      Dim obj As Object = oref.Value()
		      If obj <> Nil Then
		        XojoInstruments.ObjectRef.InspectInIDE(objId, obj)
		      Else
		        MsgBox("The object has already been garbage collected.")
		      End If
		    End If
		  #else
		    MsgBox("Sorry, this feature is only available in Debug Run.")
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GraphExcludeNodesWithoutEdgeCheck
	#tag Event
		Sub Action()
		  If mSnapshot.ObjectRefGraph <> Nil Then
		    mGraphData = DoGenerateDot(mSnapshot, Me.Value, False)
		  Else
		    mGraphData = ""
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GraphHTMLViewer
	#tag Event
		Function CancelLoad(URL as String) As Boolean
		  If URL.InStr("xojo-instruments") <> 0 Then
		    Dim s2 As String = URL.Mid(URL.InStr("object=") + 7)
		    
		    Dim s As Integer = Val(s2)
		    Dim oref As XojoInstruments.ObjectRef = XojoInstruments.ObjectRef.ReferenceByID(s)
		    Dim obj As Object = oref.Value()
		    
		    If obj <> Nil Then
		      XojoInstruments.ObjectRef.InspectInIDE(s, obj)
		    Else
		      MsgBox("The object has already been garbage collected.")
		    End If
		    
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events DoGraphRenderButton
	#tag Event
		Sub Action()
		  If mGraphData = "" Then
		    MsgBox("The snapshot does not contain reference graph.")
		    Return
		  End If
		  
		  Dim tos As Xojo.IO.TextOutputStream
		  
		  Dim tempDotFile As New XINamedTemporaryFile()
		  tos = Xojo.IO.TextOutputStream.Create(tempDotFile.GetFolderItem(), Xojo.Core.TextEncoding.UTF8)
		  tos.Write(mGraphData.ToText())
		  tos.Close()
		  
		  Dim sh As New Shell()
		  sh.Mode = 0
		  sh.Execute(GraphDotCommand.Text, "-Tsvg " + tempDotFile.GetFolderItem().Path)
		  
		  Dim content As String = sh.ReadAll()
		  
		  #if TargetWin32
		    // HTMLViewer.LoadPage with Native (Internet Explorer) renderer leaks
		    // FolderItem instance on Windows (see <feedback://showreport?report_id=52832>).
		    // To workaround the problem, manually manage the temporary file.
		    
		    // To display SVG using Navive (Internet Explorer) renderer.
		    content = "<html><meta http-equiv=""X-UA-Compatible"" content=""IE=edge""/>" + content + "</html>"
		    
		    mTempGraphHTMLFile = New XINamedTemporaryFile()
		    tos = Xojo.IO.TextOutputStream.Create(mTempGraphHTMLFile.GetFolderItem(), Xojo.Core.TextEncoding.UTF8)
		    tos.Write(content.ToText())
		    tos.Close()
		    GraphHTMLViewer.LoadURL(mTempGraphHTMLFile.GetFolderItem().URLPath)
		  #else
		    // Note: Using HTMLViewer.LoadURL with temporary file cause the horizontal scorll
		    // behave incorrectly on Mac.
		    GraphHTMLViewer.LoadPage(content, Nil)
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DoInspectSnapshotButton
	#tag Event
		Sub Action()
		  #if DebugBuild
		    If _
		      SnapshotObjectList.ListIndex < 0 Or _
		      SnapshotObjectList.ListCount <= SnapshotObjectList.ListIndex Then
		      MsgBox("Please select an object ID to inspect.")
		      Return 
		    End If
		    
		    If SnapshotObjectList.RowIsFolder(SnapshotObjectList.ListIndex) Then
		      // All objects for the class.
		      Dim objectIDs As XojoInstruments.Framework.XIArrayInteger = SnapshotObjectList.RowTag(SnapshotObjectList.ListIndex)
		      Dim viewObjects As New XojoInstruments.Framework.XIDictionary()
		      
		      For Each id As Integer In objectIDs
		        viewObjects.Value(id) = XojoInstruments.ObjectRef.ReferenceByID(id).Value()
		      Next
		      
		      XojoInstruments.ObjectRef.InspectInIDE(-1, viewObjects)
		    Else
		      // Single object.
		      
		      Dim objId As Integer = SnapshotObjectList.RowTag(SnapshotObjectList.ListIndex)
		      Dim oref As XojoInstruments.ObjectRef = XojoInstruments.ObjectRef.ReferenceByID(objId)
		      Dim obj As Object = oref.Value()
		      If obj <> Nil Then
		        XojoInstruments.ObjectRef.InspectInIDE(objId, obj)
		      Else
		        MsgBox("The object has already been garbage collected.")
		      End If
		    End If
		  #else
		    MsgBox("Sorry, this feature is only available in Debug Run.")
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GraphDotCommand
	#tag Event
		Sub Open()
		  #if TargetMacOS Or TargetLinux
		    For Each cand As String In Array("/usr/local/bin/dot", "/usr/bin/dot", "/opt/homebrew/bin/dot")
		      Dim f As FolderItem = GetFolderItem(cand, FolderItem.PathTypeNative)
		      If f <> Nil And f.Exists Then
		        Me.AddRow(cand)
		      End If
		    Next
		  #endif
		  
		  Me.AddRow("dot")
		  Me.ListIndex = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DoBackrefShowButton
	#tag Event
		Sub Action()
		  Dim snap As XojoInstruments.Snapshot = mSnapshot
		  If snap = Nil Then
		    MsgBox("Please select a snapshot to track backreference.")
		    Return
		  ElseIf snap.ObjectRefGraph = Nil Then
		    MsgBox("The snapshot does not contain reference graph.")
		    Return
		  End If
		  
		  Dim objID As Integer = Val(BackrefInput.Text)
		  Dim objRef As XojoInstruments.ObjectRef = XojoInstruments.ObjectRef.ReferenceByID(objID)
		  
		  If objRef = Nil Then
		    MsgBox("No such object.")
		    Return
		  ElseIf Not snap.ObjectRefGraph.HasKey(objID) Then
		    MsgBox("The object does not exist in the snapshot.")
		    Return
		  End If
		  
		  BackrefInput.Text = Str(objID)
		  BackrefList.DeleteAllRows()
		  BackrefList.AddFolder(Str(objID) + " − " + objRef.ClassName + If(objRef.Hint <> "", " − " + objRef.Hint, ""))
		  BackrefList.RowTag(BackrefList.LastIndex) = objID
		  BackrefList.Expanded(BackrefList.LastIndex) = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BackrefList
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim snap As XojoInstruments.Snapshot = mSnapshot
		  
		  Dim objID As Integer = Me.RowTag(row)
		  Dim backrefs() As Pair = FindBackreference(snap, objID)
		  
		  For Each p As Pair In backrefs
		    Dim refID As Integer = p.Left
		    Dim refKey As String = p.Right
		    Dim oref As XojoInstruments.ObjectRef = XojoInstruments.ObjectRef.ReferenceByID(refID)
		    
		    Me.AddFolder( _
		    Str(refID) + " − " + _
		    oref.ClassName + _
		    If(oref.Hint <> "", " − " + oref.Hint, "") + _
		    If(refKey <> "", " − " + refKey, ""))
		    Me.RowTag(BackrefList.LastIndex) = refID
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Me.Expanded(Me.ListIndex) = Not Me.Expanded(Me.ListIndex)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LabelAboutVersion
	#tag Event
		Sub Open()
		  Me.Text = "Version " + XojoInstruments.Version
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LabelAboutLink
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  ShowURL(Me.Text)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events DoTrackBackrefSnapshotButton
	#tag Event
		Sub Action()
		  If _
		    SnapshotObjectList.ListIndex < 0 Or _
		    SnapshotObjectList.ListCount <= SnapshotObjectList.ListIndex Or _
		    SnapshotObjectList.RowIsFolder(SnapshotObjectList.ListIndex) Then
		    MsgBox("Please select a single object ID to track backreference.")
		    Return
		  End If
		  
		  Dim objId As Integer = SnapshotObjectList.RowTag(SnapshotObjectList.ListIndex)
		  BackrefInput.Text = Str(objId)
		  DoBackrefShowButton.Push()
		  ResultTabPanel.Value = 2
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DoTrackBackrefCompareButton
	#tag Event
		Sub Action()
		  If _
		    ComparisonList.ListIndex < 0 Or _
		    ComparisonList.ListCount <= ComparisonList.ListIndex Or _
		    ComparisonList.RowIsFolder(ComparisonList.ListIndex) Then
		    MsgBox("Please select a single object ID to track backreference.")
		    Return
		  End If
		  
		  Dim objId As Integer = ComparisonList.RowTag(ComparisonList.ListIndex)
		  BackrefInput.Text = Str(objId)
		  DoBackrefShowButton.Push()
		  ResultTabPanel.Value = 2
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SnapshotList
	#tag Event
		Sub Change()
		  Dim p As Pair = GetSelectedSnapshots()
		  If p.Right <> Nil Then
		    DoShowSnapshot(p.Right, GraphExcludeNodesWithoutEdgeCheck.Value)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DoCompareTwoButton
	#tag Event
		Sub Action()
		  Dim snaps As Pair = GetSelectedSnapshots()
		  
		  If snaps.Left <> Nil And snaps.Right <> Nil Then
		    DoCompare(snaps.Left, snaps.Right)
		  Else
		    MsgBox("Please select two snapshots to compare.")
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
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
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
