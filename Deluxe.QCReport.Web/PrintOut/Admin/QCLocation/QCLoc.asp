<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<meta NAME="robots" CONTENT="noindex">
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK rel="stylesheet" type="text/css" href="../../css/qcs.css">
</HEAD>

<script Language="javascript">
	function OpenEditFrm(url)  //opens forms for editing
	{
		window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=0,width=630,height=170');
	}
	
</SCRIPT>

<BODY class="bodyForm" topmargin=0 leftmargin=0 rightmargin=0 bgcolor=#f5f5dc>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim rsFrm, rsCombo
dim sLocation, sPhone
dim sql, SecurityLevel
dim sBGColor, intItem_num
'********************

sLocation = Request.QueryString("sLocation")
sPhone = Request.QueryString("sPhone")

Response.Write "<font size=2><b></b></font>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Tape Format Screen
'*******************************************************************************************************
		sql="SELECT pkey, Location, Address FROM qcLocation " & _
		"ORDER BY Location"
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>
<b>QC Location</b>
<br>
<br>
		<table align=center ID="tblTapeFormat" border=0 width=95% cellpadding=0 cellspacing=0>
					<tr bgcolor=#999900>
						<td width=90>Location</td>
						<td>Address</td>
					</tr>
			<%sBGColor = "trBeige"%>
			<%	if rsFrm.EOF = true then %>
					<tr class=<%=sBGColor%>>
						<td colspan="6" align="center"><b>No Locations to be listed</b></td>
					</tr>
			<%	else %>
			<%		do while not rsFrm.EOF %>
						<tr class=<%=sBGColor%> onmouseover="this.className='trWhite'" onmouseout="this.className='<%=sBGColor%>'" onclick="self.navigate('frmEditLoc.asp?nLocID=<%=rsFrm.Fields("pkey")%>');">
							<td><%=rsFrm.Fields("Location")%></td>
							<td><%=rsFrm.Fields("Address")%></td>
						</tr>
			<%			rsFrm.MoveNext
						If sBGColor = "trBeige" Then
							sBGColor = "trBrown"
						Else
							sBGColor = "trBeige"
						End If
					loop
				end if			
			%>
	</table>
	<table width=95%>
			<form method="post" name="frmQCOperator" action="frmQCLoc.asp">
				<tr>
					<td align="right">
						<input type=submit name=subUpdate value=" Add "></td>
				</tr>
			</form>
	</table>	

<%
rsFrm.Close
Set rsFrm = Nothing
Set rsCombo = Nothing
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>