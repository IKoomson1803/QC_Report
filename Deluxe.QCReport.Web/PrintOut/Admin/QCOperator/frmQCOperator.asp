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
dim sQCUserID, sFullName, sUserName, sLocation, sPhone, sSecurityLevel
dim sql, SecurityLevel
dim sBGColor, intItem_num
'********************

sQCUserID = Request.QueryString("sQCUserID")
sFullName = Request.QueryString("sFullName")
sUserName = Request.QueryString("sUserName")
sLocation = Request.QueryString("sLocation")
sPhone = Request.QueryString("sPhone")
sSecurityLevel = Request.QueryString("sSecurityLevel")

Response.Write "<font size=2><b>" & sQCUserID & "</b></font>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Tape Format Screen
'*******************************************************************************************************
		sql="SELECT qcUserID, qcLocation.Location AS LocationName, UserName, FullName, Phone, SecurityLevel " & _
		"FROM qcUsers " & _
		"INNER JOIN qcLocation ON qcUsers.Location = qcLocation.pkey " & _
		" WHERE (Deleted IS NULL OR Deleted = 0) GROUP BY qcUserID, qcLocation.Location, UserName, FullName, Phone, SecurityLevel " & _
		"ORDER BY UserName"
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>

<b>QC Operators</b>
<br>
<br>
		<table align=center ID="tblTapeFormat" border=0 width=95% cellpadding=0 cellspacing=0>
					<tr bgcolor=#999900>
						<td>Full Name</td>
						<td>User Name</td>
						<td>Location</td>
						<td>Phone #</td>
						<td>Security Level</td>
					</tr>
			<%sBGColor = "trBeige"%>
			<%	if rsFrm.EOF = true then %>
					<tr class=<%=sBGColor%>>
						<td colspan="6" align="center"><b>No Customers to be listed</b></td>
					</tr>
			<%	else %>
			<%		do while not rsFrm.EOF %>
						<tr class=<%=sBGColor%> onmouseover="this.className='trWhite'" onmouseout="this.className='<%=sBGColor%>'" onclick="self.navigate('frmEditOperator.asp?sQCUserID=<%=rsFrm.Fields("qcUserID")%>');">
							<td><%=rsFrm.Fields("FullName")%></td>
							<td><%=rsFrm.Fields("UserName")%></td>
							<td><%=rsFrm.Fields("LocationName")%></td>
							<td><%=rsFrm.Fields("Phone")%></td>
							<%select case rsFrm.Fields("SecurityLevel")
								case 0
									SecurityLevel = "Read Only"
								case 1
									SecurityLevel = "Operator"
								case 2
									SecurityLevel = "Supervisor"
								case 3
									SecurityLevel = "Administrator"
							end select %>
							<td><%=SecurityLevel%></td>
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
	<br>
	<table width="95%">
			<form method="post" name="frmQCOperator" action="AddNewUser.asp">
				<tr>
					<td align="right">
						<input type=submit name=subUpdate value="Add User">
					</td>
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