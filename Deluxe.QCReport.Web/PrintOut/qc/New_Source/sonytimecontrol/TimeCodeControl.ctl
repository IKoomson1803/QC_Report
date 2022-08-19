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
    
'    Stop
    On Error Resume Next
    If Not (Request) Then
        MSComm1.InputLen = 1
    Else
        MSComm1.InputLen = 0
    End If
End Property
Public Property Get TimeCode() As String
If lblTimeCode.Caption = "Device Missing" Then
    TimeCode = ""
Else
    TimeCode = lblTimeCode.Caption
End If
End Property

Private Sub cmbSelection_Click()
    RaiseEvent TimeCode("Click!!!")
End Sub

Private Sub MSComm1_OnComm()
   'On Error GoTo Err_Hand:
  '*****************************************
  'builds an array based on the input length
  '*****************************************
'   MSComm1.InputLen = 41  'Buffer length 41 bytes
   MSComm1.InputLen = 41
   'If buffer has data causing overflow
   If MSComm1.CommEvent = comEvReceive Then 'comEventRxOver Then
        Value = MSComm1.Input  'Value is picked up by tmrCalc
   'If Len(Value) > 19 Then
        tmrCalc.Enabled = True
    'End If
   
   
   End If
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

''UserControl.Width = UserControl.lblTimeCode.Width

SendRequest = False
nModeCode = Manual    ' Only update when Refresh method is invoked
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

    On Error GoTo errexit

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
errexit:

End Sub
Private Sub NoTimeCode()
    
   ' Time$ = "No Time Code Loaded!"
    
    lblTimeCode.Caption = "  :  :  :  "
    
    asTimeCode = lblTimeCode

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
    
    asTimeCode = Left("00", 2 - Len(CStr(Hrs))) & CStr(Hrs) & ":" & _
                Left("00", 2 - Len(CStr(Mins))) & CStr(Mins) & ":" & _
                Left("00", 2 - Len(CStr(Secs))) & CStr(Secs) & ":" & _
                Left("00", 2 - Len(CStr(Frames))) & CStr(Frames)
    
    lblTimeCode = asTimeCode
  
End Sub

Public Property Get Mode() As ModeSet
    Mode = nModeCode
    
End Property

Public Property Let Mode(nMode As ModeSet)
    
    nModeCode = nMode
    If Mode = Auto Then ' Testing mode
        tmrCalc.Enabled = False
        tmrInventCode.Enabled = True
        
    Else
        tmrInventCode.Enabled = False
        Call Refresh
        
        tmrCalc.Enabled = True
        
    End If
    
    PropertyChanged "Mode"
    
End Property

Public Sub Refresh()
    bUpdateDisplay = True
    tmrCalc.Interval = 1
    Call MSComm1_OnComm
    
    bUpdateDisplay = False
End Sub

Public Property Get vBorderStyle() As BorderStyle
    vBorderStyle = UserControl.BorderStyle
End Property
Public Property Let vBorderStyle(ByVal vNewValue As BorderStyle)
    UserControl.BorderStyle = vNewValue
    PropertyChanged "vBorderStyle"
    
End Property

Public Property Get vBackColor() As OLE_COLOR
    vBackColor = UserControl.BackColor
    
End Property

Public Property Let vBackColor(ByVal vNewValue As OLE_COLOR)
    UserControl.BackColor = vNewValue
    PropertyChanged "vBackColor"
    
End Property

Public Property Get vFont() As String
    vFont = lblTimeCode.Font
    
End Property

Public Property Let vFont(ByVal vNewValue As String)
    lblTimeCode.Font = vNewValue
    PropertyChanged "vFont"
    
End Property

Public Property Get vFontSize() As Integer
    vFontSize = lblTimeCode.Font.Size
    
    
End Property

Public Property Let vFontSize(ByVal vNewValue As Integer)
    lblTimeCode.Font.Size = vNewValue
    PropertyChanged "vFontSize"
    
End Property

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    PropBag.WriteProperty "vBackColor", vBackColor, &H8000000F
End Sub


Public Property Get PortNumber() As Byte
    PortNumber = MSComm1.CommPort
End Property

Public Property Let PortNumber(ByVal vNewValue As Byte)
    On Error GoTo Err_Hand
    
    Dim bOpen As Boolean
    bOpen = MSComm1.PortOpen
    If MSComm1.PortOpen Then
        MSComm1.PortOpen = False
    End If
    MSComm1.CommPort = vNewValue
    MSComm1.PortOpen = bOpen
    
    PropertyChanged "PortNumber"
    Exit Property
    
Err_Hand:
    MsgBox "Error in setting Comport! " & Chr(13) & _
    "force to set MSComm1.CommPort to 1"
    MSComm1.CommPort = 1
    
    MSComm1.PortOpen = True
    
End Property

Public Property Get vTimeForeColor() As OLE_COLOR
    vTimeForeColor = lblTimeCode.ForeColor
End Property

Public Property Let vTimeForeColor(ByVal vNewValue As OLE_COLOR)
    lblTimeCode.ForeColor = vNewValue
    PropertyChanged "vForeColor"
End Property
Public Property Get vTimeBackColor() As OLE_COLOR
    vTimeBackColor = lblTimeCode.BackColor
End Property

Public Property Let vTimeBackColor(ByVal vNewValue As OLE_COLOR)
    lblTimeCode.BackColor = vNewValue
    PropertyChanged "vBackColor"
End Property


Public Property Get PortSetings() As String
    PortSetings = MSComm1.Settings
    
End Property

Public Property Let PortSetings(ByVal vNewValue As String)
    Dim X As String
    On Error GoTo Err_Hand
    X = MSComm1.Settings
    MSComm1.Settings = vNewValue
    PropertyChanged "PortSetings"
    Exit Property
    
Err_Hand:
    MSComm1.Settings = X
    
End Property

Public Property Get sBaudRate() As Variant
    sBaudRate = Left(MSComm1.Settings, InStr(1, MSComm1.Settings, ",") - 1)
    
End Property

Public Property Get sParity() As String
    sParity = Mid(MSComm1.Settings, InStr(1, MSComm1.Settings, ",") + 1)
    sParity = Left(sParity, InStr(1, sParity, ",") - 1)
End Property

Public Property Get sDataBits() As String
    sDataBits = Mid(MSComm1.Settings, InStr(1, MSComm1.Settings, ",") + 1)
    sDataBits = Mid(sDataBits, InStr(1, sDataBits, ",") + 1)
    sDataBits = Left(sDataBits, InStr(1, sDataBits, ",") - 1)
End Property
Public Property Get sStopBits() As String
    sStopBits = Mid(MSComm1.Settings, InStr(1, MSComm1.Settings, ",") + 1)
    sStopBits = Mid(sStopBits, InStr(1, sStopBits, ",") + 1)
    sStopBits = Mid(sStopBits, InStr(1, sStopBits, ",") + 1)
End Property



