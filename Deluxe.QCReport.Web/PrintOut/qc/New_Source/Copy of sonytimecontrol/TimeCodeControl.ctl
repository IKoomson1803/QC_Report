VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.UserControl TimeCodeControl 
   ClientHeight    =   615
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3360
   ScaleHeight     =   615
   ScaleWidth      =   3360
   Begin VB.Timer tmrInventCode 
      Enabled         =   0   'False
      Interval        =   5
      Left            =   1200
      Top             =   0
   End
   Begin VB.Timer tmrCalc 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   720
      Top             =   0
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   735
      Top             =   -15
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   3
      DTREnable       =   -1  'True
      InBufferSize    =   0
      RTSEnable       =   -1  'True
      BaudRate        =   38400
      ParitySetting   =   1
      InputMode       =   1
   End
   Begin VB.Label lblTimeCode 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "00:00:00:00"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFC0&
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2655
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   2775
      Picture         =   "TimeCodeControl.ctx":0000
      Top             =   75
      Width           =   480
   End
End
Attribute VB_Name = "TimeCodeControl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Public Event TimeCode(sMsg As String)
Public asTimeCode As String
Private Value As Variant
Private nErrors As Integer
Private vSendRequest As Boolean

Public Enum ModeSet
    Manual
    Sense
    Auto
End Enum
Dim nModeCode As ModeSet
Public Enum BorderStyle
    None
    FixedBorder
End Enum
Dim bUpdateDisplay As Boolean
Public Property Let PortOpen(ByVal Value As Boolean)
    MSComm1.PortOpen = Value
End Property
Public Property Get TimeCode() As String
If lblTimeCode.Caption = "Device Missing" Then
    TimeCode = ""
Else
    TimeCode = lblTimeCode.Caption
End If
End Property

Private Sub MSComm1_OnComm()
   'On Error GoTo Err_Hand:
  '*****************************************
  'builds an array based on the input length
  '*****************************************
'   MSComm1.InputLen = 41  'Buffer length 41 bytes
   MSComm1.InputLen = 0
   'If buffer has data causing overflow
   If MSComm1.CommEvent = comEvReceive Then 'comEventRxOver Then
        Value = MSComm1.Input  'Value is picked up by tmrCalc
     
        tmrCalc.Enabled = True
   End If
End Sub
Private Sub UserControl_AmbientChanged(PropertyName As String)
    If PropertyName = "BackColor" Then
        UserControl.BackColor = Ambient.BackColor
    End If
    
End Sub
Private Sub UserControl_Initialize()
On Error GoTo Init_err
Dim Buffer As Variant
'MSComm1.InputLen = 1
'MSComm1.InBufferSize = 41
MSComm1.RThreshold = 41
If MSComm1.PortOpen = False Then
    MSComm1.PortOpen = True
End If
Buffer = MSComm1.Input

Exit Sub
'
Init_err:

'lblTimeCode.FontSize = 10
'lblTimeCode.Caption = "Port Not Available."
''    MsgBox "Error occured while loading Control:" & vbCrLf & _
''    vbCrLf & _
''    "Erro #: " & Err.Number & vbCrLf & _
''    "Description: " & Err.Description
''    lblTimeCode.Caption = Value
''
'Exit Sub
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    vBackColor = PropBag.ReadProperty("vBackColor", &H8000000F)
End Sub

Private Sub UserControl_Terminate()
On Error Resume Next
MSComm1.PortOpen = False
End Sub


Private Sub tmrCalc_Timer()
    Static Status As Integer
    Dim Count As Integer
    Dim Command As String
    Dim Sline As String
    Static Hrs#, Mins#, Secs#, Fra#
    Dim strFrames$, strSeconds$, strMins$, strHrs$
    Dim Time$
    Dim I As Integer
    Dim ChckSum As Integer
    Dim J As Integer
    tmrCalc.Enabled = False

    If Not MSComm1.PortOpen Then
        MSComm1.PortOpen = True
    Else
     
    End If

    For I = 0 To 30            'Message may be 10 bytes long
       If Value(I) = &H78 Or Value(I) = &H74 Then      'Is it a status reply?
           If Value(I + 1) = &H14 Or Value(I + 1) = 4 Or Value(I + 1) = 6 Then 'Is it either VITC or LTC?
               ChckSum = 0
               For J = 0 To (Value(I) And &HF) + 1
                   ChckSum = ChckSum + Value(I + J)    'Is message valid?
               Next
               If (ChckSum And &HFF) = Value(I + J) Then
                   'If Hrs <> (Value(I + 5) And &H3F) Or Mins <> Value(I + 4) Or Secs <> Value(I + 3) Or Fra <> Value(I + 2) Then
                   
                       Hrs = (Value(I + 5) And &H3F)
                       Mins = Value(I + 4) And &H7F
                       Secs = Value(I + 3) And &H7F
                       Fra = Value(I + 2) And 63
                       Time$ = Hex(Hrs) & ":" & _
                       Hex(Mins) & ":" & _
                       Hex(Secs) & ":" & _
                       Hex(Fra)
                       strFrames = Right("00" & Trim(Str(Hex(Fra))), 2)
                       strSeconds = Right("00" & Trim(Str(Hex(Secs))), 2)
                       strMins = Right("00" & Trim(Str(Hex(Mins))), 2)
                       strHrs = Right("00" & Trim(Str(Hex(Hrs))), 2)
                       ' If nModeCode = Sense Or (bUpdateDisplay = True) Then
                            
                        lblTimeCode.Caption = strHrs & ":" & strMins & ":" & _
                        strSeconds & ":" & strFrames
                       
                        asTimeCode = lblTimeCode
                       ' End If
                       
                   'End If
                   
                   I = 31                      'exit for loop
               End If
           End If
       End If
    Next
    
    tmrCalc.Interval = 5
    
    UserControl.tmrCalc.Enabled = nModeCode = Sense
   
    Exit Sub
    
'Err_Hand:
'    Exit Sub
    
End Sub
Private Sub NoTimeCode()
    
   ' Time$ = "No Time Code Loaded!"
    
    lblTimeCode.Caption = "  :  :  :  "
    
    asTimeCode = lblTimeCode

End Sub










