VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmTiming 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Timing"
   ClientHeight    =   1800
   ClientLeft      =   2985
   ClientTop       =   1890
   ClientWidth     =   4920
   ClipControls    =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1800
   ScaleWidth      =   4920
   Visible         =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "Stop"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Index           =   1
      Left            =   3360
      TabIndex        =   5
      Top             =   960
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Start"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Index           =   0
      Left            =   3360
      TabIndex        =   4
      Top             =   120
      Width           =   1455
   End
   Begin VB.Timer tmrInventCode 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   2760
      Top             =   960
   End
   Begin VB.Timer tmrCalc 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   2760
      Top             =   240
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   0
      Top             =   360
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   3
      DTREnable       =   0   'False
      InBufferSize    =   0
      BaudRate        =   38400
      ParitySetting   =   1
      InputMode       =   1
   End
   Begin VB.ComboBox cmbSelection 
      Height          =   315
      ItemData        =   "frmtimecode.frx":0000
      Left            =   600
      List            =   "frmtimecode.frx":0010
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   1320
      Width           =   2655
   End
   Begin VB.Label lblTimeCode 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "01:23:45:67"
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   15
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFF00&
      Height          =   375
      Left            =   360
      TabIndex        =   3
      Top             =   480
      Width           =   2535
   End
   Begin VB.Label Label2 
      Caption         =   "Selection Method:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   1080
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Current Time Code:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   360
      TabIndex        =   0
      Top             =   120
      Width           =   1815
   End
End
Attribute VB_Name = "frmTiming"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public asTimeCode As String
Private Value As Variant
Private vSendRequest As Boolean
Public Property Get PortOpen() As Boolean
'PortOpen = MSComm1.EOFEnable
End Property
Public Property Let PortOpen(ByVal Value As Boolean)
    MSComm1.PortOpen = Value
End Property
Public Property Get SendRequest() As Boolean
    SendRequest = vSendRequest
End Property
Public Property Let SendRequest(ByVal Request As Boolean)
    vSendRequest = Request
    'if Request =true, tmrReadPort should be false (i.e.
    ' the other Timer should enable it later...
'    tmrReadPort.Enabled = False
    'me.tmrGetTimeCode.Enabled = Request
'    Stop
    On Error Resume Next
    If Not (Request) Then
        MSComm1.InputLen = 1
    Else
        MSComm1.InputLen = 0
    End If
End Property
Public Property Get TimeCode() As String
If Me.lblTimeCode.Caption = "Device Missing" Then
    TimeCode = ""
Else
    TimeCode = Me.lblTimeCode.Caption
End If
End Property
Private Sub Timer2_Timer()

End Sub


Private Sub Command1_Click(Index As Integer)
    If Index = 0 Then
        tmrCalc.Enabled = True
    Else
        tmrCalc.Enabled = False
    End If
End Sub

Private Sub Form_Load()
Dim Buffer As Variant
On Error Resume Next
MSComm1.InputLen = 1
MSComm1.InBufferSize = 41
MSComm1.PortOpen = True
Buffer = MSComm1.Input
'Me.Width = Me.lblTimeCode.Width
SendRequest = False
Me.Show
End Sub


Private Sub MSComm1_OnComm()
On Error GoTo Err_Hand
        MSComm1.InputLen = 41     'Buffer length 41 bytes
        Value = MSComm1.Input
        tmrCalc.Enabled = True
    Exit Sub
Err_Hand:
    Exit Sub
End Sub

Private Sub tmrGetTimeCode_Timer()
'Dim bytArray(3) As Byte
'    If SendRequest Then
'        If tmrReadPort.Enabled = False Then
'            bytArray(0) = &H61
'            bytArray(1) = &HC
'            If optLTC.Value Then
'                bytArray(2) = &H1
'                lblTimeCode.ForeColor = QBColor(10)
'            Else
'                bytArray(2) = &H2
'                lblTimeCode.ForeColor = QBColor(11)
'            End If
'            bytArray(3) = bytArray(0) + _
'                        bytArray(1) + _
'                        bytArray(2)
'            SendCommand bytArray
'            tmrReadPort.Enabled = True
'        End If
'    Else
''        Stop
'    End If
End Sub
Private Sub SendCommand(ByVal Command As Variant)
    MSComm1.Output = Command
End Sub

Private Sub tmrReadPort_Timer()
'Dim Data As Variant
'Dim Frames As Byte, Seconds As Byte, Mins As Byte, Hrs As Byte, HalfFrame As Byte
'Dim strFrames$, strSeconds$, strMins$, strHrs$, strHalfFrame$
'Dim Index%
'Exit Sub
'    Frames = 0
'    Seconds = 0
'    Mins = 0
'    Hrs = 0
'    tmrReadPort.Enabled = False
''    Stop
'    Data = MSComm1.Input
''    Stop
'    If UBound(Data) > 0 Then
'        Dim Count As Integer
'        Count = UBound(Data)
'        Index = 0
'        If Not (SendRequest) Then ' find the timecode info...
'            For Index = 0 To UBound(Data)
'                If Data(Index) = &H78 Then
''                    If Data(Index + 1) = &H6 Then
''                        Stop
'                        Exit For
''                    End If
'                End If
'            Next
'        End If
'        If Index < UBound(Data) Then
'            If Data(Index) = &H78 Then
'    '            If Data(1) = &H6 Or Data(1) = &H14 Then
'                    Frames = Data(Index + 2) And &H3F
'                    Seconds = Data(Index + 3) And 127
'                    Mins = Data(Index + 4) And 127
'                    Hrs = Data(Index + 5) And &H3F
'    '            End If
'           On Error GoTo 0
'    '        Stop
'                'On Error Resume Next
'                strFrames = Right("00" & Trim(Str(Hex(Frames))), 2)
'                strSeconds = Right("00" & Trim(Str(Hex(Seconds))), 2)
'                strMins = Right("00" & Trim(Str(Hex(Mins))), 2)
'                strHrs = Right("00" & Trim(Str(Hex(Hrs))), 2)
'    '       Stop
'
'                lblTimeCode.Caption = strHrs & ":" & strMins & ":" & _
'                                    strSeconds & ":" & strFrames
'
'            Else
'
'            End If
'        Else
'            lblTimeCode.Caption = "Waiting..."
'        End If
'    Else
'        lblTimeCode.Caption = "Device Missing"
'    End If
'
End Sub

Private Sub Timer1_Timer()

On Error Resume Next
MSComm1.PortOpen = True
End Sub

Private Sub UserControl_Initialize()
Dim Buffer As Variant
'On Error Resume Next
MSComm1.InputLen = 1
MSComm1.InBufferSize = 41
MSComm1.PortOpen = True
Buffer = MSComm1.Input
Me.Width = Me.lblTimeCode.Width
SendRequest = False
End Sub

Private Sub UserControl_Terminate()
On Error Resume Next
MSComm1.PortOpen = False
End Sub


Private Sub tmrCalc_Timer()
Static Status As Integer
Dim Count As Integer
Dim Command As String
Static Hrs#, Mins#, Secs#, Fra#
Dim strFrames$, strSeconds$, strMins$, strHrs$
Dim Time$
Dim I As Integer
Dim ChckSum As Integer
Dim J As Integer
Dim sLine As String

         Me.tmrCalc.Enabled = False
          '  On Error GoTo Err_Hand

         For I = 0 To 30            'Message may be 10 bytes long
            If Value(I) = &H78 Or Value(I) = &H74 Then      'Is it a status reply?
                sLine = "1002"
                If Value(I + 1) = &H14 Or Value(I + 1) = 4 Or Value(I + 1) = 6 Then 'Is it either VITC or LTC?
                    ChckSum = 0
                    sLine = "1003"
                    For J = 0 To (Value(I) And &HF) + 1
                        sLine = "1004"
                        ChckSum = ChckSum + Value(I + J)    'Is message valid?
                    Next
                    sLine = "1005"
                    If (ChckSum And &HFF) = Value(I + J) Then
                        sLine = "1006"
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
                            lblTimeCode.Caption = strHrs & ":" & strMins & ":" & _
                            strSeconds & ":" & strFrames
                            Me.asTimeCode = lblTimeCode
                        'End If
                        
                        I = 31                      'exit for loop
                    End If
                End If
            End If
         Next
                    
    Exit Sub
    
Err_Hand:

    Exit Sub
    
End Sub

Private Sub tmrInventCode_Timer()
Static Frames&, Secs&, Mins&, Hrs&
    Frames = Frames + 1
    If Frames = 24 Then
        Frames = 0
        Secs = Secs + 1
        If Secs = 60 Then
            Secs = 0
            Mins = Mins + 1
            If Mins = 60 Then
                Mins = 0
                Hrs = Hrs + 1
                If Hrs = 23 Then
                    Hrs = 0
                End If
            End If
        End If
    End If
    Me.asTimeCode = Left("00", 2 - Len(CStr(Hrs))) & CStr(Hrs) & ":" & _
                Left("00", 2 - Len(CStr(Mins))) & CStr(Mins) & ":" & _
                Left("00", 2 - Len(CStr(Secs))) & CStr(Secs) & ":" & _
                Left("00", 2 - Len(CStr(Frames))) & CStr(Frames)
    
    Me.lblTimeCode = Me.asTimeCode
    
    
    
End Sub
