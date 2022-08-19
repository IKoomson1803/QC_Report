<%@ Language=VBScript %>
<HTML>
<HEAD>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<meta NAME="robots" CONTENT="noindex">
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>

<BODY class="bodyForm">
<SCRIPT language="javascript">
	self.focus();
</SCRIPT>
<script language="vbscript">
	function iretomv()
		if isnumeric(frmOverallSpecs.txtLum_Peak.value) Then
			mv = ((frmOverallSpecs.txtLum_Peak.value/140) * 1000)
			frmOverallSpecs.txtLum_Peak.value = round(mv,0)	
		end if
		if isnumeric(frmOverallSpecs.txtLum_Avg.value) Then
			mv = ((frmOverallSpecs.txtLum_Avg.value/140) * 1000)
			frmOverallSpecs.txtLum_Avg.value = round(mv,0)
		end if
		if isnumeric(frmOverallSpecs.txtChroma_Peak.value) Then
			mv = ((frmOverallSpecs.txtChroma_Peak.value/140) * 1000)
			frmOverallSpecs.txtChroma_Peak.value = round(mv,0)
		end if
		if isnumeric(frmOverallSpecs.txtChroma_Avg.value) Then
			mv = ((frmOverallSpecs.txtChroma_Avg.value/140) * 1000)
			frmOverallSpecs.txtChroma_Avg.value = round(mv,0)
		end if
		if isnumeric(frmOverallSpecs.txtBar_Vid.value) Then
			mv = ((frmOverallSpecs.txtBar_Vid.value/140) * 1000)
			frmOverallSpecs.txtBar_Vid.value = round(mv,0)
		end if
		if isnumeric(frmOverallSpecs.txtBar_Chr.value) Then
			mv = ((frmOverallSpecs.txtBar_Chr.value/140) * 1000)
			frmOverallSpecs.txtBar_Chr.value = round(mv,0)
		end if
		if isnumeric(frmOverallSpecs.txtBar_Set.value) Then
			mv = ((frmOverallSpecs.txtBar_Set.value/140) * 1000)
			frmOverallSpecs.txtBar_Set.value = round(Left(mv, i+1),0)
		end if
		if isnumeric(frmOverallSpecs.txtBlack.value) Then
			mv = ((frmOverallSpecs.txtBlack.value/140) * 1000)
			frmOverallSpecs.txtBlack.value = round(mv,0)
		end if
	end function

	function mvtoire()
		if isnumeric(frmOverallSpecs.txtLum_Peak.value) Then
		    ire = (frmOverallSpecs.txtLum_Peak.value * (140/1000))
			frmOverallSpecs.txtLum_Peak.value = round(ire,0)
		end if
		if isnumeric(frmOverallSpecs.txtLum_Avg.value) Then
		    ire = (frmOverallSpecs.txtLum_Avg.value * (140/1000))
			frmOverallSpecs.txtLum_Avg.value = round(ire,0)
		end if
		if isnumeric(frmOverallSpecs.txtChroma_Peak.value) Then
		    ire = (frmOverallSpecs.txtChroma_Peak.value * (140/1000))
			frmOverallSpecs.txtChroma_Peak.value = round(ire,0)
		end if		
		if isnumeric(frmOverallSpecs.txtChroma_Avg.value) Then
		    ire = (frmOverallSpecs.txtChroma_Avg.value * (140/1000))
			frmOverallSpecs.txtChroma_Avg.value = round(ire,0)
		end if
		if isnumeric(frmOverallSpecs.txtBar_Vid.value) Then
		    ire = (frmOverallSpecs.txtBar_Vid.value * (140/1000))
			frmOverallSpecs.txtBar_Vid.value = round(ire,0)
		end if
		if isnumeric(frmOverallSpecs.txtBar_Chr.value) Then
		    ire = (frmOverallSpecs.txtBar_Chr.value * (140/1000))
			frmOverallSpecs.txtBar_Chr.value = round(ire,0)
		end if
		if isnumeric(frmOverallSpecs.txtBar_Set.value) Then
		    ire = (frmOverallSpecs.txtBar_Set.value * (140/1000))
			frmOverallSpecs.txtBar_Set.value = round(ire,0)
		end if
		if isnumeric(frmOverallSpecs.txtBlack.value) Then
		    ire = (frmOverallSpecs.txtBlack.value * (140/1000))
			frmOverallSpecs.txtBlack.value = round(ire,0)
		end if
	end function
</script>
<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->
<table ID="tblForm" border="0" CELLPADDING="0" CELLSPACING="0" width="100%">
	<tr>
		<td>
<%
'********************
'Declarations
'********************
dim rsFrm, rsCombo
dim sJobNum, sQCNum, sRev, sFrm, sAssetType
dim sql, sqlCombo
'********************

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<td><font size=2><b>" & sQCNum & " - " & sRev & ":  " & sFrm & "</b></font></td>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Overall Specs Screen
'*******************************************************************************************************
		sql="SELECT Lum_Peak, Chroma_Peak, Bar_Vid, Lum_Avg, " & _
			"Chroma_Avg, Bar_Chr, Black, IRE_MV, Bar_Set, " & _
			"Video_Codec,Video_Bit_Rate,Video_Bit_Depth,Bit_Rate_Mode, " & _
			"Audio_Codec,Audio_Bit_Rate,Audio_Bit_Depth,Sample_Rate, " & _
			"GOP_Structure,Gamut,Colour_Encoding,File_Size,Active_Picture,AssetType,Frame_Size " & _
			"FROM qcHeader " & _
			"WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql
		
		sAssetType = rsFrm.Fields("AssetType")
		
		If IsNull(sAssetType) or sAssetType = ""  Then
	        sAssetType = "Tape"
        End If 

 %>
 		<TD width=40% align=right>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" tabindex="10" target="main">Reports&nbsp;</a>
		</TD>
		<td>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" tabindex="10" target="main">			
 			<IMG HSPACE="1" HEIGHT="19" WIDTH="18" BORDER="0" SRC="../images/reports_off.gif" ALT="Reports"></a>
		</TD>
	</tr>
</table>
<!--#include file="../include/frmToolBar.asp"-->
<br>	
<table ID="tblForm" width=100% cellpadding=1 cellspacing=0 border=0>
	<tr>
		<td align="center" class="left_top_border"><b>Bars in Demod/Unity</b></td>
		<td align="center" class="left_right_top_border"><b>Program Overall Technical Specifications</b></td>
	</tr>
	<tr>
		<td class="left_top_bottom_border">
		<table ID="tblForm" width=100%>
		<form method="post" name="frmOverallSpecs" action="procOverall.asp">
		<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
		<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
		<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">
			<tr>
				<td align="right">Video Gain:</td><td><INPUT size=10 type="text" id=txtBar_Vid name=txtBar_Vid value="<%=rsFrm.Fields("Bar_Vid")%>" ></td>
			</tr>
			<tr>
				<td align="right">Chroma Gain:</td><td><INPUT size=10 type="text" id=txtBar_Chr name=txtBar_Chr value="<%=rsFrm.Fields("Bar_Chr")%>" ></td>
			</tr>
			<tr>
				<td align="right">Set up:</td><td><INPUT size=10 type="text" id=txtBar_Set name=txtBar_Set value="<%=rsFrm.Fields("Bar_Set")%>" ></td>
			</tr>
		</table>
		</td>
		<td class="blacksquare">	
		<table ID="tblForm" width=100%>
			<tr>
				<td align="right">Luminance Peak:</td><td><INPUT size=10 type="text" id=txtLum_Peak name=txtLum_Peak value="<%=rsFrm.Fields("Lum_Peak")%>"></td>
				<td align="right">Chroma Peak:</td><td><INPUT size=10 type="text" id=txtChroma_Peak name=txtChroma_Peak value="<%=rsFrm.Fields("Chroma_Peak")%>"></td>
			</tr>
			<tr>
				<td align="right">Luminance Avg:</td><td><INPUT size=10 type="text" id=txtLum_Avg name=txtLum_Avg value="<%=rsFrm.Fields("Lum_Avg")%>"></td>
				<td align="right">Chroma Avg:</td><td><INPUT size=10 type="text" id=txtChroma_Avg name=txtChroma_Avg value="<%=rsFrm.Fields("chroma_Avg")%>"></td>
			</tr>
			<tr>
				<td align="right">Black Level:</td><td><INPUT size=10 type="text" id=txtBlack name=txtBlack value="<%=rsFrm.Fields("Black")%>"></td>
				<td colspan=2>&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>

<% If sAssetType = "File" Then  %>
<!-- <div id="divFileMeasurements" style="display:none;" > --> 
<table ID="tblForm"  width=100% cellpadding=1 cellspacing=0 border=0>
	<tr>
		<td colspan="8" align="center" class="blacksquare"><b>File Measurements</b></td>
	</tr>
	<tr>
		<td align="right" class="left_border">Video Codec:</td>
		<td>
		   <select id="selVideoCodec" name="selVideoCodec">
				<option><%=rsFrm.Fields("Video_Codec")%></option>
				   <%	
					sqlCombo = "SELECT VideoCodec FROM optVideoCodec ORDER BY VideoCodec"
					rsCombo.ActiveConnection = cnQCS
					rsCombo.Open sqlCombo
						do while not rsCombo.EOF %>
							<option><%=rsCombo.Fields("VideoCodec")%></option>
					<% 
						rsCombo.MoveNext
						loop
						rsCombo.Close 
					%>
			</select>
		</td>	
		<td align="right" >Video Bit Rate:</td><td><INPUT size=10 type="text" id="txtVideoBitRate" name="txtVideoBitRate" value="<%=rsFrm.Fields("Video_Bit_Rate")%>" ></td>	
		<td align="right" >Video Bit Depth:</td>
		<td>
			<select id="selVideoBitDepth" name="selVideoBitDepth">
				<option><%=rsFrm.Fields("Video_Bit_Depth")%></option>
				   <%	
					sqlCombo = "SELECT VideoBitDepth FROM optVideoBitDepth ORDER BY VideoBitDepth"
					rsCombo.ActiveConnection = cnQCS
					rsCombo.Open sqlCombo
						do while not rsCombo.EOF %>
							<option><%=rsCombo.Fields("VideoBitDepth")%></option>
					<% 
						rsCombo.MoveNext
						loop
						rsCombo.Close 
					%>
			</select>
		</td>	
		<td align="right" >Bit Rate Mode:</td>
		<td class="right_border">
			 <select id="selBitRateMode" name="selBitRateMode">
				<option><%=rsFrm.Fields("Bit_Rate_Mode")%></option>
				   <%	
					sqlCombo = "SELECT BitRateMode FROM optBitRateMode ORDER BY BitRateMode"
					rsCombo.ActiveConnection = cnQCS
					rsCombo.Open sqlCombo
						do while not rsCombo.EOF %>
							<option><%=rsCombo.Fields("BitRateMode")%></option>
					<% 
						rsCombo.MoveNext
						loop
						rsCombo.Close 
					%>
			</select>
		</td>	
	</tr>
		<tr>
		<td align="right" class="left_border">Audio Codec:</td>
		<td>
		  <select id="selAudioCodec" name="selAudioCodec">
				<option><%=rsFrm.Fields("Audio_Codec")%></option>
				   <%	
					sqlCombo = "SELECT AudioCodec FROM optAudioCodec ORDER BY AudioCodec"
					rsCombo.ActiveConnection = cnQCS
					rsCombo.Open sqlCombo
						do while not rsCombo.EOF %>
							<option><%=rsCombo.Fields("AudioCodec")%></option>
					<% 
						rsCombo.MoveNext
						loop
						rsCombo.Close 
					%>
			</select>
		</td>	
		<td align="right">Audio Bit Rate:</td>
		<td><INPUT size=10 type="text" id="txtAudioBitRate" name="txtAudioBitRate" value="<%=rsFrm.Fields("Audio_Bit_Rate")%>" ></td>	
		<td align="right">Audio Bit Depth:</td>
		<td >
			<select id="selAudioBitDepth" name="selAudioBitDepth">
				<option><%=rsFrm.Fields("Audio_Bit_Depth")%></option>
				   <%	
					sqlCombo = "SELECT AudioBitDepth FROM optAudioBitDepth ORDER BY AudioBitDepth"
					rsCombo.ActiveConnection = cnQCS
					rsCombo.Open sqlCombo
						do while not rsCombo.EOF %>
							<option><%=rsCombo.Fields("AudioBitDepth")%></option>
					<% 
						rsCombo.MoveNext
						loop
						rsCombo.Close 
					%>
			</select>
		</td>	
		<td align="right">Sample Rate:</td><td class="right_border">
		<INPUT size=10 type="text" id="txtSampleRate" name="txtSampleRate" value="<%=rsFrm.Fields("Sample_Rate")%>" ></td>	
	</tr>
	</tr>
		<tr>
		<td align="right" class="left_bottom_border" >GOP Structure:</td>
		<td class="bottom_border">
			 <select id="selGOPStructure" name="selGOPStructure">
				<option><%=rsFrm.Fields("GOP_Structure")%></option>
				   <%	
					sqlCombo = "SELECT GOPStructure FROM optGOPStructure ORDER BY GOPStructure"
					rsCombo.ActiveConnection = cnQCS
					rsCombo.Open sqlCombo
						do while not rsCombo.EOF %>
							<option><%=rsCombo.Fields("GOPStructure")%></option>
					<% 
						rsCombo.MoveNext
						loop
						rsCombo.Close 
					%>
			</select>
		</td>	
		<td align="right" class="bottom_border" >Gamut:</td>
		<td class="bottom_border">
		   <select id="selGamut" name="selGamut">
				<option><%=rsFrm.Fields("Gamut")%></option>
				   <%	
					sqlCombo = "SELECT Gamut FROM optGamut ORDER BY Gamut"
					rsCombo.ActiveConnection = cnQCS
					rsCombo.Open sqlCombo
						do while not rsCombo.EOF %>
							<option><%=rsCombo.Fields("Gamut")%></option>
					<% 
						rsCombo.MoveNext
						loop
						rsCombo.Close 
					%>
			</select>
		</td>	
		<td align="right" class="bottom_border">Colour Encoding:</td>
		<td class="bottom_border">
		  <select id="selColourEncoding" name="selColourEncoding">
				<option><%=rsFrm.Fields("Colour_Encoding")%></option>
				   <%	
					sqlCombo = "SELECT ColourEncoding FROM optColourEncoding ORDER BY ColourEncoding"
					rsCombo.ActiveConnection = cnQCS
					rsCombo.Open sqlCombo
						do while not rsCombo.EOF %>
							<option><%=rsCombo.Fields("ColourEncoding")%></option>
					<% 
						rsCombo.MoveNext
						loop
						rsCombo.Close 
					%>
			</select>
		</td>	
		<td align="right" class="bottom_border">File Size:</td><td class="bottom_border right_border"><INPUT size=10 type="text" id="txtFileSize" name="txtFileSize" value="<%=rsFrm.Fields("File_Size")%>" ></td>	
	</tr>
</table>
<br>
<!-- </div> -->
<% End If %>


<table ID="tblForm" align="center" cellpadding=1 cellspacing=0 border=0>
	<tr>
		<td class="left_top_bottom_border">&nbsp; Active Picture:</td>
		<td class="right_top_bottom_border"><INPUT size=10 type="text" id="txtActivePicture" name="txtActivePicture" value="<%=rsFrm.Fields("Active_Picture")%>" ></td>	
		<% If sAssetType = "Tape" Then %>
		<td >&nbsp;</td>
		<td >&nbsp;</td>	
		<%Else%>
		<td class="top_bottom_border">&nbsp; Frame Size:</td>
		<td class="right_top_bottom_border"><INPUT size=10 type="text" id="txtFrameSize" name="txtFrameSize" value="<%=rsFrm.Fields("Frame_Size")%>" ></td>	
		<%End If %>
		
	</tr>
		
</table>
<br>



<table ID="tblForm" width=100%>
	<tr>
		<td align="center">
		<table ID="tblForm" width=100 cellpadding=1 cellspacing=0 border=1 bordercolor="#000000">
			<tr>
				<%
					if rsFrm.Fields("IRE_MV") = "I" Then
						sCheck_I = "CHECKED"
					else
						sCheck_I = ""
					end if
					if rsFrm.Fields("IRE_MV") = "M" Then
						sCheck_M = "CHECKED"
					else
						sCheck_M = ""
					end if
				%>
				<td align="center" class="blacksquare"><INPUT type="radio" id=radIre_MV name=radIre_MV value="I" <%=sCheck_I%> onclick="vbscript:mvtoire()">&nbsp;ire&nbsp;&nbsp;&nbsp;<INPUT type="radio" id=radIre_MV name=radIre_MV value="M" <%=sCheck_M%> onclick="vbscript:iretomv()">&nbsp;mv</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>


<br>
<%if sLevel >= 1 then%>
<table width=100%>
	<tr>
		<td align="right"><INPUT type="submit" id="Action" name="Action" value="Save">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>
<%end if%>
</form>
<%
rsFrm.Close
Set rsFrm = Nothing
Set rsCombo = Nothing
cnQCS.Close
set cnQCS = Nothing
%>

<SCRIPT language="javascript">
	var assetType = "<%= sAssetType %>"
	
	/*
	var divFileMeasurement = document.getElementById("divFileMeasurements")
	
	if(assetType == "File")
	 divFileMeasurement.style.display = "block";
	 
	 */
	
</SCRIPT>

</BODY>
</HTML>
