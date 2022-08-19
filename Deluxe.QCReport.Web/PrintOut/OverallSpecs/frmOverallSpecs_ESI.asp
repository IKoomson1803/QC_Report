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

<form method="post" name="frmOverallSpecs" action="procOverall_ESI.asp">
		<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
		<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
		<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">


<% If sAssetType = "File" Then  %>
<!-- <div id="divFileMeasurements" style="display:none;" > --> 
<table ID="tblForm"  width=100% cellpadding=1 cellspacing=0 border=0>
	<tr>
		<td align="right" >Video Codec:</td>
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
		<td align="right">Sample Rate:</td>
		<td >
		<INPUT size=10 type="text" id="txtSampleRate" name="txtSampleRate" value="<%=rsFrm.Fields("Sample_Rate")%>" >
		</td>
	</tr>
	
	<tr>
		<td align="right" >Audio Codec:</td>
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
		
	</tr>
	
		<tr>
		<td align="right">&nbsp; Frame Size:</td>
		<td ><INPUT size=10 type="text" id="txtFrameSize" name="txtFrameSize" value="<%=rsFrm.Fields("Frame_Size")%>" ></td>	
			
	</tr>
</table>
<br>
<!-- </div> -->
<% End If %>


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



</BODY>
</HTML>
