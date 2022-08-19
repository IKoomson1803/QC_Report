<%@ Language=VBScript %>
<!--#include file="../include/connect.asp"-->
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 5.0">
<LINK rel="stylesheet" type="text/css" href="../css/qcs.css">
</HEAD>
<BODY bgcolor=#f5f5dc>

<%
Dim strQCType
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sql = "SELECT qc_type FROM qcHeader WHERE qcheader.Qcnum= " & clng(sQCNum) & " AND qcheader.subQcnum = " & cint(sRev)
Set rsQC = server.CreateObject ("ADODB.Recordset")

rsQC.ActiveConnection = cnQCS
rsQC.Open sql

''Get the QC Type. This will be used to hide the sections that are not required for Runtime QC
strQCType = rsQC.Fields("qc_type")

''response.write "QC Type: " & strQCType
''response.end
	
rsQC.Close
Set rsQC = Nothing
cnQCS.Close
Set cnQCS = Nothing

%>
<table id=tblForm>
	<tr>
		<td><b>Reports for QC #: <%=sQCNum%> - <%=sRev%></b></td>
	</tr>
</table>
<br>
<center>
<table id="tblForm" cellpadding=0 cellspacing=0 border=0 width="100%">
	<form method="post" action="startprinting.asp">
	<input type="hidden" id="txtQCNum" Name="txtQCNum" value="<%=sQCNum%>">
	<input type="hidden" id="txtQCRev" Name="txtQCRev" value="<%=sRev%>">
	<tr bgcolor=#999966>
		<td>&nbsp;</td>
		<td valign="bottom"><b>Report</b></td>
		<td valign="bottom"><b>Description</b></td>
	</tr>
	<!--<tr>
		<td><input type=checkbox name=chkBVMaster id=chkBVMaster value="1"></td>
		<td>Mastering QC Report&nbsp;&nbsp;</td>
		<td>Buena Vista International Television Mastering QC Report</td>
	</tr>
	<tr bgcolor=#cccc99>
		<td><input type=checkbox name=chkBVTech1 id=chkBVTech1 value="1"></td>
		<td>Technical Report 1&nbsp;&nbsp;</td>
		<td>Buena Vista Home Entertainment Technical Report 1 Page Version</td>
	</tr>
	<tr>
		<td><input type=checkbox name=chkBVTech2 id=chkBVTech2 value="1"></td>
		<td>Technical Report 2&nbsp;&nbsp;</td>
		<td>Buena Vista Home Entertainment Technical Report 2 Page Version</td>
	</tr>
	<tr bgcolor=#cccc99>
		<td><input type=checkbox name=chkBVTech4 id=chkBVTech4 value="1"></td>
		<td>Technical Report 4&nbsp;&nbsp;</td>
		<td>Buena Vista Home Entertainment Technical Report 4 Page Version</td>
	</tr>
	<tr>
		<td><input type=checkbox name=chkCTISS id=chkCTISS value="1"></td>
		<td>CTISS&nbsp;&nbsp;</td>
		<td>Technical Evaluation Report</td>
	</tr>-->
	<!--
	<tr>
		<td><input type=checkbox name=chkQCR id="Checkbox1" value="1"></td>
		<td width="100">Restoration QC&nbsp;&nbsp;</td>
		<td>Full Restoration Despot List - Deluxe 142 Full Quality Control Report</td>
	</tr>
	-->
	
	<%If strQCType <> "E"  Then %>
	
				<%If strQCType <> "A" And strQCType <> "L" And strQCType <> "T" Then   %>
				<tr >
					<td><input type="checkbox" name="chkQCR" id="chkQCR" value="1"></td>
					<td>Broadcast QC&nbsp;&nbsp;</td>
					<td>Broadcast Quality Control Report - Deluxe 142 Full Quality Control Report</td>
				</tr>
				<tr bgcolor=#cccc99>
					<td><input type="checkbox" name="chkMQCR" id="chkMQCR" value="1"></td>
					<td>Master QC&nbsp;&nbsp;</td>
					<td>Master Quality Control Report - Deluxe 142 Full Quality Control Report</td>
				</tr>
				<% End If   %>
				<!--<tr>
					<td><input type=checkbox name=chkQCR100 id=chkQCR100 value="1"></td>
					<td>100% Quality Control Report&nbsp;&nbsp;</td>
					<td>CARLTON 100% Quality Control Report Includes the Log&nbsp;&nbsp; </td>
				</tr>-->
				
				<%If strQCType <> "L"  And strQCType <> "T" Then %>
				<tr>
					<td><input type="checkbox" name="chkQCR1Pg" id="chkQCR1Pg" value="1"></td>
					<td>Runtime QC&nbsp;&nbsp;</td>
					<td>Runtime Quality Control Report - Deluxe 142 Runtime Quality Control Report 1st Page Only</td>
				</tr>
				<% End If   %>
				
				<%If strQCType <> "A" And strQCType <> "T" Then   %>
				<tr>
					<td><input type="checkbox" name="chkQCWLR1Pg" id="chkQCWLR1Pg" value="1"></td>
					<td>Runtime QC With Log&nbsp;&nbsp;</td>
					<td>Runtime Quality Control Report With Log - Deluxe 142 Runtime Quality Control With Log Report</td>
				</tr>
				<% End If   %>
				
				<%If strQCType <> "A" And strQCType <> "L" Then   %>
				<tr>
					<td><input type="checkbox" name="chkQCWTR1Pg" id="chkQCWTR1Pg" value="1"></td>
					<td>Runtime QC With Text Info&nbsp;&nbsp;</td>
					<td>Runtime Quality Control Report With Text Info - Deluxe 142 Runtime Quality Control With Text Info Report</td>
				</tr>
				
				
				<% End If   %>
	
	<% Else   %>
	          <tr>
					<td><input type="checkbox" name="chkQCWLER" id="chkQCWLER" value="1"></td>
					<td>Runtime QC With Log For ESI&nbsp;&nbsp;</td>
					<td>Runtime Quality Control Report With Log For ESI - Deluxe 142 Runtime Quality Control With Log For ESI Report</td>
				</tr>
  
	<% End If   %>
	
	
	<!--
	<tr bgcolor=#cccc99>
		<td><input type=checkbox name=chkWBQCR id=chkWBQCR value="1"></td>
		<td>Warner Bros QC&nbsp;&nbsp;</td>
		<td>Warner's QC Report - Warner Bros Full Quality Control Report</td>
	</tr>
	-->
</table>
<table width=100%>
	<tr>
		<td align=right><input type=submit name="action" value="  Print  ">
		<input type=submit name="action" value="Preview">
		<!--&nbsp;&nbsp;<input type=submit value="Download" id=submit1 name=submit1>--></td>
	</tr>
	</form>
</center>
</BODY>
</HTML>