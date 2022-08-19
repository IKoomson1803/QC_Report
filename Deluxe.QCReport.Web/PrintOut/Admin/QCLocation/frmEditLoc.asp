<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<Title>Edit Tape Layout Entries</title>
</HEAD>
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
dim nLoc
dim sql
'********************
nLoc = Request.QueryString("nLocID")

Response.Write "<font size=2><b>Edit QC Location Information</b></font>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
'Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Editing Log Record
'*******************************************************************************************************
		sql="SELECT Location, Address FROM qcLocation " & _
		"WHERE pkey = " & cint(nLoc)
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>
 <LINK rel="stylesheet" type="text/css" href="../../css/cssForms.css">
		<table align=center ID="tblTapeFormat" border=0 width=99% cellpadding=0 cellspacing=0>
				<form method="post" name=frmTapeLayout id=frmTapeLayout action="procEditLoc.asp">
				<input type=hidden name="hdnLocID" id="hdnLocID" value="<%=nLoc%>">
				<tr>
					<td>Location:</td>
					<td>
					<input size=40 type=textbox name="txtLoc" id=txtLoc value="<%=rsFrm.Fields("Location")%>"></td>
				</tr>
				<tr>
					<td valign="top">Address:</td>
					<td><TEXTAREA cols=50 rows=4 name="txtAddress" id=txtAddress><%=rsFrm.Fields("Address")%></TEXTAREA></td>
				</tr>
		</table>
		<br>
		<table id=tblFrm size=60%>
				<tr>
					<td><input type=submit name=action id=action value="Save"></td>
					<td align="right">
						<input type=button name=action id=action value="Delete" onclick="Javascript:confirmdel('delLoc.asp?nLocID=<%=nLoc%>')">
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