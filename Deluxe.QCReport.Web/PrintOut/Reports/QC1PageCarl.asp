<html>

<head>
<meta http-equiv="Content-Language" content="en-gb">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
</head>

<body style="text-align: center">
<% 
Dim Std_625, Std_PAL, Std_525, Std_NTSC
Dim Fmt_D2, Fmt_D3, Fmt_1IN, Fmt_DBC, Fmt_BSP
Dim Stereo, TextlessTC, VITC, LTC, DropFrame
Dim PT1, PT2, PT3, PT4, PT5, PT6
Dim PT1Dur, PT2Dur, PT3Dur, PT4Dur, PT5Dur, PT6Dur
Dim GrdAudio1, GrdAudio2, GrdAudio3, GrdAudio4
Fmt_DBC=" "
Fmt_D2=" "
Fmt_D3=" "
Fmt_1IN=" "
Fmt_BSP=" "
Std_625=" "
Std_525=" "
Std_PAL=" "
Std_NTSC=" "

If rsHeader.Fields("VITC")<>"" Then
	VITC="Y"
End If

Select Case rsHeader.Fields("Time_Code")
	Case "None"
		LTC=" "
		DropFrame=" "
	Case "Drop Frame"
		LTC="Y"
		DropFrame="Y"
	Case Else
		LTC="Y"
		DropFrame=" "
End Select

Stereo="N"
If (InStr(rsHeader.Fields("Ch1_Desc"),"Stereo")>0 and InStr(rsHeader.Fields("Ch2_Desc"),"Stereo")>0) Then
	Stereo="Y"
End If
If (InStr(rsHeader.Fields("Ch3_Desc"),"Stereo")>0 and InStr(rsHeader.Fields("Ch4_Desc"),"Stereo")>0) Then
	Stereo="Y"
End If

Select Case rsHeader.Fields("Standard")
	Case "525"
		Std_525="Y"
	Case "625"
		Std_625="Y"
	Case "NTSC"
		Std_NTSC="Y"
	Case "PAL"
		Std_PAL="Y"

End Select

Select Case rsHeader.Fields("Format")
	Case "Digital Betacam"
		Fmt_DBC="Y"
	Case "Betacam SP"
		Fmt_BSP="Y"
	Case "D1"
		Fmt_D1="Y"
	Case "1IN"
		Fmt_1IN="Y"
	Case "D2"
		Fmt_D2="Y"
	Case "D3"
		Fmt_D3="Y"
		
End Select

rsTapeFormat.MoveFirst
PT1=rsTapeFormat.Fields("Time_Code")
PT1Dur=rsTapeFormat.Fields("Length")
rsTapeFormat.MoveNext
PT2=rsTapeFormat.Fields("Time_Code")
PT2Dur=rsTapeFormat.Fields("Length")
rsTapeFormat.MoveNext
PT3=rsTapeFormat.Fields("Time_Code")
PT3Dur=rsTapeFormat.Fields("Length")
rsTapeFormat.MoveNext
PT4=rsTapeFormat.Fields("Time_Code")
PT4Dur=rsTapeFormat.Fields("Length")
rsTapeFormat.MoveNext
PT5Dur=rsTapeFormat.Fields("Length")
PT5=rsTapeFormat.Fields("Time_Code")
rsTapeFormat.MoveNext
PT6Dur=rsTapeFormat.Fields("Length")
PT6=rsTapeFormat.Fields("Time_Code")

while not rsTapeFormat.EOF
	If rsTapeFormat.Fields("description")="Textless" Then
		TextlessTC = rsTapeFormat.Fields("Time_Code")
	End If
	rsTapeFormat.MoveNext
wend

If rsFullSpot.Fields("FullQC_Ch1") = -1 Then
	GrdAudio1=rsHeader.Fields("grdAudio")
End If
If rsFullSpot.Fields("FullQC_Ch2") = -1 Then
	GrdAudio2=rsHeader.Fields("grdAudio")
End If
If rsFullSpot.Fields("FullQC_Ch3") = -1 Then
	GrdAudio3=rsHeader.Fields("grdAudio")
End If
If rsFullSpot.Fields("FullQC_Ch4") = -1 Then
	GrdAudio4=rsHeader.Fields("grdAudio")
End If


%>
<p align="center"><!--<img border="0" src="4mc.gif">--><img SRC="../images/Logos/Deluxe142Logo100x80.jpg" border="0"></p>
<table width="100%" cellpadding=1 cellspacing=1 border=0 height="860">
<tr><td align=center height="19">
<b><font size="4">TECHNICAL ASSESSMENT FORM</font></b><font size="4"> </font>
</td></tr>
<tr><td height="81">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="79">
  <tr>
    <td width="20%" height="19"><font size="2"><b>&nbsp;PROGRAMME</b></font></td>
    <td width="50%" height="19"><%=rsHeader.Fields("Show")%></td>
    <td width="14%" height="19" align="center"><font size="2"><b>DATE&nbsp;&nbsp;
    </b></font></td>
    <td width="16%" height="19"><%=rsHeader.Fields("QC_Date")%></td>
  </tr>
  <tr>
    <td width="20%" height="19"><font size="2"><b>&nbsp;EPISODE/SUB-TITLE</b></font></td>
    <td width="50%" height="19"><%=rsHeader.Fields("Epis_name")%></td>
    <td width="14%" height="19" align="center"><font size="2"><b>XYTECH #&nbsp;&nbsp;
    </b></font></td>
    <td width="16%" height="19"><%=rsHeader.Fields("wonum")%></td>
  </tr>
  <tr>
    <td width="20%" height="20"><font size="2"><b>VERSION</b></font></td>
    <td width="50%" height="20">&nbsp;</td>
    <td width="14%" height="20" align="center"><b><font size="2">REPLAY VTR&nbsp;&nbsp;
    </font></b></td>
    <td width="16%" height="20"><%=rsHeader.Fields("VITC")%></td>
  </tr>
  </table>
</td></tr>
<tr><td height="37">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2" height="30">
  <tr>
    <td width="7%" height="19" align="center"><font size="2"><b>&nbsp;625</b></font></td>
    <td width="7%" height="19" align="center"><%=Std_625%>&nbsp;</td>
    <td width="7%" height="19" align="center"><font size="2"><b>PAL</b></font></td>
    <td width="7%" height="19" align="center"><%=Std_PAL%>&nbsp;</td>
    <td width="7%" height="19" align="center"><font size="2"><b>SECAM</b></font></td>
    <td width="7%" height="19" align="center"></td>
    <td width="7%" height="19" align="center"><font size="2"><b>D2</b></font></td>
    <td width="7%" height="19" align="center"><%=Fmt_D2%></td>
    <td width="7%" height="19" align="center"><font size="2"><b>D3</b></font></td>
    <td width="7%" height="19" align="center"><%=Fmt_D3%></td>
    <td width="7%" height="19" align="center"><font size="2"><b>1&quot;C</b></font></td>
    <td width="7%" height="19" align="center"></td>
    <td width="8%" height="19" align="center"><font size="2"><b>16MM</b></font></td>
    <td width="8%" height="19" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="7%" height="10" align="center"><font size="2"><b>&nbsp;525</b></font></td>
    <td width="7%" height="10" align="center"><%=Std_525%></td>
    <td width="7%" height="10" align="center"><font size="2"><b>&nbsp;NTSC</b></font></td>
    <td width="7%" height="10" align="center"><%=Std_NTSC%></td>
    <td width="7%" height="10" align="center"><font size="2"><b>&nbsp;DigiBeta</b></font></td>
    <td width="7%" height="10" align="center"><%=Fmt_DBC%></td>
    <td width="7%" height="10" align="center"><font size="2"><b>&nbsp;Beta SP</b></font></td>
    <td width="7%" height="10" align="center"><%=Fmt_BSP%></td>
    <td width="7%" height="10" align="center"></td>
    <td width="7%" height="10" align="center"></td>
    <td width="7%" height="10" align="center"></td>
    <td width="7%" height="10" align="center"></td>
    <td width="8%" height="10" align="center"><font size="2"><b>&nbsp;35MM</b></font></td>
    <td width="8%" height="10" align="center">&nbsp;</td>
  </tr>
</table>
</td></tr>
<tr><td height="19">
<p align="center">
<font size="2"><b>AUDIO TRACKS</b></font>
</td></tr>
<tr><td height="97">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber3">
  <tr>
    <td width="14%" align="center"><font size="2"><b>TRACK</b></font></td>
    <td width="14%" align="center"><font size="2"><b>NOISE REDUCTION</b></font></td>
    <td width="56%" align="center"><font size="2"><b>CONTENT</b></font></td>
    <td width="16%" align="center"><font size="2"><b>STEREO</b></font></td>
  </tr>
  <tr>
    <td width="14%" align="center"><b><font size="2">1</font></b></td>
    <td width="14%"><%=rsHeader.Fields("NR")%>&nbsp;</td>
    <td width="56%"><%=rsHeader.Fields("Ch1_Desc")%>&nbsp;</td>
    <td width="16%" rowspan="2"><%=Stereo%>&nbsp;</td>
  </tr>
  <tr>
    <td width="14%" align="center"><b><font size="2">2</font></b></td>
    <td width="14%"><%=rsHeader.Fields("NR")%>&nbsp;</td>
    <td width="56%"><%=rsHeader.Fields("Ch2_Desc")%>&nbsp;</td>
  </tr>
  <tr>
    <td width="14%" align="center"><b><font size="2">3</font></td>
    <td width="14%"><%=rsHeader.Fields("NR")%>&nbsp;</td>
    <td width="56%"><%=rsHeader.Fields("Ch3_Desc")%>&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%" align="center"><b><font size="2">4</font></b></td>
    <td width="14%"><%=rsHeader.Fields("NR")%>&nbsp;</td>
    <td width="56%"><%=rsHeader.Fields("Ch4_Desc")%>&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
</table>
</td></tr>
<tr><td height="41">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber4">
  <tr>
    <td width="9%" rowspan="2"><font size="2"><b>TIME CODE</b></font></td>
    <td width="9%" align="center"><font size="2"><b>LTC</b></font></td>
    <td width="9%" align="center"><font size="2"><b>VITC</b></font></td>
    <td width="9%" align="center"><font size="2"><b>D/F</b></font></td>
    <td width="9%" align="center"><font size="2"><b>PT1</b></font></td>
    <td width="9%" align="center"><font size="2"><b>PT2</b></font></td>
    <td width="9%" align="center"><font size="2"><b>PT3</b></font></td>
    <td width="9%" align="center"><font size="2"><b>PT4</b></font></td>
    <td width="9%" align="center">&nbsp;</td>
    <td width="9%" align="center">&nbsp;</td>
    <td width="10%" align="center"><font size="2"><b>TTB'S</b></font></td>
  </tr>
  <tr>
    <td width="9%">&nbsp;</td>
    <td width="9%">hello</td>
    <td width="9%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
  </tr>
</table>
</td></tr>
<tr><td height="19">
<p align="center">
<b><font size="2">COMMENTS</font></b>
</td></tr>
<tr><td height="78">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber5" height="76">
  <tr>
    <td width="20%" height="76" valign="top">
    <p align="left"><font size="2"><b>SOURCE VIDEO:</b></font></td>
    <td width="80%" height="76">&nbsp;</td>
  </tr>
</table>
</td></tr>
<tr><td height="21">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber6">
  <tr>
    <td width="20%" valign="top"><font size="2"><b>SOURCE AUDIO:</b></font></td>
    <td width="80%">&nbsp;</td>
  </tr>
</table>
</td></tr>
<tr><td height="78">

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber5" height="76">
  <tr>
    <td width="20%" height="76" valign="top"><font size="2"><b>RECORD VIDEO:</b></font></td>
    <td width="80%" height="76">&nbsp;</td>
  </tr>
</table>
</td></tr>
<tr><td height="21">

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber6">
  <tr>
    <td width="20%" valign="top"><font size="2"><b>RECORD AUDIO:</b></font></td>
    <td width="80%">&nbsp;</td>
  </tr>
</table>
</td></tr>
<tr><td align="center" height="19">
<font size="2"><b>GRADES</b></font>
</td></tr>
<tr><td height="174">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber7">
  <tr>
    <td width="10%"><font size="2"><b>VIDEO</b></font></td>
    <td width="64%">&nbsp;</td>
    <td width="10%">
    <p align="center"><font size="2"><b>PART</b></font></td>
    <td width="20%">
    <p align="center"><font size="2"><b>&nbsp;DURATION</b></font></td>
  </tr>
  <tr>
    <td width="10%"><font size="2"><b>AUDIO</b></font></td>
    <td width="64%">&nbsp;</td>
    <td width="10%" align="center">
    <p align="center"><font size="2"><b>1</b></font></td>
    <td width="17%">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%"><font size="2"><b>TRACK 1</b></font></td>
    <td width="64%">&nbsp;</td>
    <td width="10%" align="center"><font size="2"><b>2</b></font></td>
    <td width="17%">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%"><font size="2"><b>TRACK 2</b></font></td>
    <td width="64%">&nbsp;</td>
    <td width="10%" align="center"><font size="2"><b>3</b></font></td>
    <td width="17%">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%"><font size="2"><b>TRACK 3</b></font></td>
    <td width="64%">&nbsp;</td>
    <td width="10%" align="center"><font size="2"><b>4</b></font></td>
    <td width="17%">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%"><font size="2"><b>TRACK 4</b></font></td>
    <td width="64%">&nbsp;</td>
    <td width="10%" align="center">&nbsp;</td>
    <td width="17%">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%"><font size="2"><b>SCALE</b></font></td>
    <td width="64%">
    <p align="center">&nbsp; <font size="2"><b>1 </b>&nbsp;-&nbsp; BAD&nbsp;&nbsp;&nbsp;&nbsp;
    <b>2 </b>&nbsp;-&nbsp; POOR&nbsp;&nbsp;&nbsp;&nbsp; <b>3 </b>&nbsp;-&nbsp; 
    FAIR&nbsp;&nbsp;&nbsp;&nbsp; <b>4 </b>&nbsp;-&nbsp; GOOD&nbsp;&nbsp;&nbsp;&nbsp;
    <b>5 </b>&nbsp;-&nbsp; EXCELLENT</font></td>
    <td width="10%" align="center">&nbsp;</td>
    <td width="17%">&nbsp;</td>
  </tr>
</table>

<tr><td>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber8">
  <tr>
    <td width="19%"><font size="2"><b>COMMENTS:</b></font></td>
    <td width="81%" rowspan="2" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="19%">&nbsp;</td>
  </tr>
   <tr>
    <td width="19%"><font size="2"><b>SIGNED:</b></font></td>
    <td width="81%">&nbsp;</td>
  </tr>
</table>
</td></tr>





</td></tr></table

</body>

</html>