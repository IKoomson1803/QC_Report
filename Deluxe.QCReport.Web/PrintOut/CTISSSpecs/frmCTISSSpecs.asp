<%@ Language=VBScript %>
<%option explicit%>
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
dim sJobNum, sQCNum, sRev, sFrm
dim sql, sqlCombo
dim sCheck_Y, sCheck_N

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<td><font size=2><b>" & sQCNum & " - " & sRev & ":  " & sFrm & "</b></font></td>"

Set rsFrm = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Header Screen
'*******************************************************************************************************
		sql="SELECT * FROM qcCTISS " & _
			"WHERE QCNum = " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

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
<table id="tblTapeFormat" topmargin=0 cellpadding=0 cellspacing=0 border=1 bordercolor=#000000 width=100%>
<form method="post" name="frmCTISS" id="frmCTISS" action="procCTISS.asp">
<input type="hidden" name="hdnQCNum" id="hdnQCNum" value="<%=sQCNum%>">
<input type="hidden" name="hdnRev" id="hdnRev" value="<%=sRev%>">
<input type="hidden" name="hdnJobNum" id="hdnJobNum" value="<%=sJobNum%>">
	<tr bgcolor=#999900>
		<td align="center">TV</td>
		<td align="center">Audio</td>
	</tr>
	<tr>
		<tr>
			<td align=center>
				<table id="tblTapeFormat">
					<tr>
						<td align=right>Audio +8dB:</td>
						<td>
							<select id="selAudio8dB" name="selAudio8dB">
								<option><%=rsFrm.Fields("Audio8dB")%></option>
								<option>PASS</option>
								<option>FAIL</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align=right>Video 102%:</td>
						<td>
							<select id="selVideo102" name="selVideo102">
								<option><%=rsFrm.Fields("Video102")%></option>
								<option>PASS</option>
								<option>FAIL</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align=right>Sub Blanking 0%:</td>
						<td>
							<select id="selSubBlank0" name="selSubBlank0">
								<option><%=rsFrm.Fields("SubBlanking0")%></option>
								<option>PASS</option>
								<option>FAIL</option>
							</select>
						</td>
					</tr>
				</table>
			</td>
			<td align=center>
				<table id="tblTapeFormat">
					<tr>
						<td align=right>Audio +16dB:</td>
						<td>
							<select id="selAudio16dB" name="selAudio16dB">
								<option><%=rsFrm.Fields("Audio16dB")%></option>
								<option>PASS</option>
								<option>FAIL</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align=right>Video 105%:</td>
						<td>
							<select id="selVideo105" name="selVideo105">
								<option><%=rsFrm.Fields("Video105")%></option>
								<option>PASS</option>
								<option>FAIL</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align=right>Sub Blanking 4%:</td>
						<td>
							<select id="selSubBlank4" name="selSubBlank4">
								<option><%=rsFrm.Fields("SubBlanking4")%></option>
								<option>PASS</option>
								<option>FAIL</option>
							</select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
</table>
<table id="tblTapeFormat" width=100%>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="right">
			<% if sLevel >= 1 then%>
				<input type=submit id=subSave name=subSave value="Save">
			<%end if%>
			</td>
		<tr>
		</form>
</table>
</BODY>
</HTML>
