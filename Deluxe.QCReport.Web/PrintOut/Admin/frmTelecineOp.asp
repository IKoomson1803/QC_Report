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

<script Language="javascript">
	function OpenEditFrm(url)  //opens forms for editing
	{
		window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=0,width=630,height=170');
	}
	
</SCRIPT>

<BODY topmargin=0 leftmargin=0 rightmargin=0 bgcolor=#f5f5dc>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim rsFrm, rsCombo
dim sTeleOpID, sTOFullName, sPhone
dim sql
dim sBGColor, intItem_num
'********************

sTeleOpID = Request.QueryString("sTeleOpID")
sTOFullName = Request.QueryString("sTOFullName")
sPhone = Request.QueryString("sPhone")

Response.Write "<font size=2><b>" & sTeleOpID & "</b></font>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Tape Format Screen
'*******************************************************************************************************
		sql="SELECT TeleOpID, TOFullName, Phone FROM optTelecineOp " & _
		"ORDER BY TeleOpID"
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>
<CENTER>
<BR>
		<table align=center ID="AspectData" border=0 width=200 cellpadding=0 cellspacing=0>
					<tr bgcolor=#999900>
						<td align="center" colspan="2">Telecine</td>
					</tr>
			<%sBGColor = "#cccc99"%>
			<%	if rsFrm.EOF = true then %>
					<tr bgcolor=<%=sBGColor%>>
						<td colspan="6" align="center"><b>No Data to be listed</b></td>
					</tr>
			<%	else %>
			<%		do while not rsFrm.EOF %>
						<tr bgcolor=<%=sBGColor%>>
							<td align="center"><%=rsFrm.Fields("TOFullName")%></td>
							<td align="center"><%=rsFrm.Fields("Phone")%></td>
						</tr>
			<%			rsFrm.MoveNext
						If sBGColor = "#cccc99" Then
							sBGColor = "#ffffcc"
						Else
							sBGColor = "#cccc99"
						End If
					loop
				end if			
			%>
	</table>
	<table>
			<form method="post" name="frmTelecineOp" action="OptTelecineOp.asp">
				<tr>
					<td align="left">
						<input type=submit name=subUpdate value="Add"></td>
				</tr>
			</form>
	</table	
</CENTER>
<%
rsFrm.Close
Set rsFrm = Nothing
Set rsCombo = Nothing
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>