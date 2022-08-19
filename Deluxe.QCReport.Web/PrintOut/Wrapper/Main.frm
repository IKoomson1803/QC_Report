VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Begin VB.Form Form1 
   BackColor       =   &H00808080&
   Caption         =   "qc.deluxe142.co.uk"
   ClientHeight    =   8895
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10530
   Icon            =   "Main.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8895
   ScaleWidth      =   10530
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   5985
      Left            =   150
      TabIndex        =   0
      Top             =   870
      Width           =   8010
      ExtentX         =   14129
      ExtentY         =   10557
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
    Me.WebBrowser1.Navigate2("QC.DELUXE142.CO.UK")
Me.WebBrowser1.Silent = True
End Sub

Private Sub Form_Resize()
WebBrowser1.Left = 100
WebBrowser1.Top = 100
WebBrowser1.Width = Me.Width - 350
WebBrowser1.Height = Me.Height - 700
End Sub
