<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<Title>Edit Tape Layout Entries</title>
</HEAD>
<LINK rel="stylesheet" type="text/css" href="../../css/qcs.css">
<script language="javascript">
  function CloseEdit()
  { self.history.go(-1); }
  
  function confirmdel(url)
	{
		if (confirm("Are you sure you want to delete this record?"))
			{
				self.navigate(url)
			}
		else
			{ }
	}
</script>
<BODY class="bodyForm">
<!--#include file="../../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim rsFrm
dim sQCUserID, SecurityLevel
dim sql
'********************
sQCUserID = Request.QueryString("sQCUserID")

Response.Write "<font size=2><b>Edit QC Operator Information</b></font>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
'Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Editing Log Record
'*******************************************************************************************************
		sql="SELECT qcUserID, qcLocation.Location AS LocationName, UserName, FullName, Phone, SecurityLevel " & _
		"FROM qcUsers " & _
		"INNER JOIN qcLocation ON qcUsers.Location = qcLocation.pkey " & _
		"GROUP BY qcUserID, qcLocation.Location, UserName, FullName, Phone, SecurityLevel " & _
		"HAVING qcUsers.qcUserID = '" & sQCUserID & "'"
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>
 <LINK rel="stylesheet" type="text/css" href="../../css/cssForms.css">
		<table align=center ID="tblTapeFormat" border=0 width=99% cellpadding=0 cellspacing=0>
				<form method="post" name=frmTapeLayout id=frmTapeLayout action="procEditOp.asp">
				<tr>
					<td>Full Name:</td>
					<td>
					<input size=40 type=textbox name="txtFullName" id=txtFullName value="<%=rsFrm.Fields("FullName")%>"></td>
				</tr>
				<tr>
					<td>User Name:</td>
					<td><input size=30 type=textbox name="txtUserName" id=txtUserName value="<%=rsFrm.Fields("UserName")%>"></td>
				</tr>
				<tr>
					<td>Location:</td>
					<td>
						<%dim rsLoc, sqlLoc
	
						set rsLoc = server.CreateObject("ADODB.Recordset")
						sqlLoc = "SELECT pkey, Location FROM qcLocation ORDER BY Location"
						rsLoc.ActiveConnection = cnQCS
						rsLoc.Open sqlLoc
						%>
						<SELECT id="txtLocation" name="txtLocation">
						<option><%=rsFrm.Fields("LocationName")%></option>
						<%do while not rsLoc.EOF %>
						  <OPTION><%=rsLoc.Fields("Location")%></OPTION>
						<%rsLoc.MoveNext
						  loop
						  rsLoc.Close
						  set rsLoc = nothing
						%>
						</SELECT>
					</td>
				</tr>
				<tr>
					<td>Phone #:</td>
					<td><input size=40 type=textbox id=txtPhone name=txtPhone value="<%=rsFrm.Fields("Phone")%>"></td>
				</tr>
				<tr>
					<td>Security Level:</td>
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
					<td>			
						<select id="txtSecLevel" name="txtSecLevel">
							<option><%=SecurityLevel%></option>
							<option>Read Only</option>
							<option>Operator</option>
							<option>Supervisor</option>
							<option>Administrator</option>
						</select>
					</td>
				</tr>
		</table>
		<br>
		<table id=tblFrm size=60%>
				<tr>
					<td><input type=submit name=action id=action value="Save"></td>
					<td align="right">
						<input type=button name=action id=action value="Delete" onclick="Javascript:confirmdel('delOperator.asp?sQCUserID=<%=sQCUserID%>')">
					<td>
		</form>
				<td width=500 align=right>
				<input type=button name=btnCancel id=btnCancel value="Cancel" onclick="Javascript:CloseEdit()">
				</td>

			</tr>
		</table>
<%
rsFrm.Close
set rsFrm = Nothing
cnQCS.Close
set cnQCS = Nothing
%>

</BODY>
</HTML>