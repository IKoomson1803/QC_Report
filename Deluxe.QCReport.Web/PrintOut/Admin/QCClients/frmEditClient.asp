<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<Title>Edit Client Information</title>
 <LINK rel="stylesheet" type="text/css" href="../../css/qcs.css">
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
dim nCustID
dim sql
'********************
nCustID = Request.QueryString("nCustID")

Set rsFrm = server.CreateObject("ADODB.Recordset")
'Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Editing Log Record
'*******************************************************************************************************
		sql="SELECT CustID, CustCode, CustName, CustAddress, CustPhone, GradingScale FROM qcClients " & _
		"WHERE CustID = " & cint(nCustID)
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>

 <font size=2><b>Edit QC Client Information</b></font>
 <br>
 <br>
		<table align=center ID="tblTapeFormat" border=0 width=99% cellpadding=0 cellspacing=0>
				<form method="post" name=frmTapeLayout id=frmTapeLayout action="procEditClient.asp">
				<input type=hidden name="hdnCustID" id="hdnCustID" value="<%=nCustID%>">
				<tr>
					<td>Customer Code:</td>
					<td>
					<input size=40 type=textbox name="txtCustCode" id=txtCustCode value="<%=rsFrm.Fields("CustCode")%>"></td>
				</tr>
				<tr>
					<td>Customer Name:</td>
					<td>
					<input size=40 type=textbox name="txtCustName" id=txtCustName value="<%=rsFrm.Fields("CustName")%>"></td>
				</tr>
				<tr>
					<td valign="top">Address:</td>
					<td><TEXTAREA cols=50 rows=4 name="txtAddress" id=txtAddress scrolltop=1><%=rsFrm.Fields("CustAddress")%></TEXTAREA></td>
				</tr>
				<tr>
					<td>Phone #:</td>
					<td>
					<input size=40 type=textbox name="txtPhone" id=txtPhone value="<%=rsFrm.Fields("CustPhone")%>"></td>
				</tr>
				<tr>
					<td>Grading Scale:</td>
					<td>
						<select id="GradingScale" name="GradingScale">
						<option><%=rsFrm.Fields("GradingScale")%></option>
						<option value="3">3 - Disney</option>
						<option value="4">4 - BVHE/CTISS</option>
						<option value="5">5 - 4MC</option></td>
				</tr>
		</table>
		<br>
		<table id=tblFrm size=60%>
				<tr>
					<td><input type=submit name=action id=action value="Save"></td>
					<td align="right">
						<input type=button name=action id=action value="Delete" onclick="Javascript:confirmdel('delClient.asp?nCustID=<%=nCustID%>')">
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