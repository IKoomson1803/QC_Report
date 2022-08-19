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
<LINK rel="stylesheet" type="text/css" href="../../css/qcs.css">
<script language="javascript">
  function CloseEdit()
  { close(); }
  
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
<!--#include file="../../include/connect.asp"-->
<%
dim rsFrm, sql1

set rsFrm = Server.CreateObject("ADODB.Recordset")

sql1 = "SELECT * FROM optTapeDesc WHERE TapeDescID = " & cint(Request.QueryString("TapeDescID"))
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql1
%>
<BODY class="bodyForm">
<b>Edit Tape Description</b>
<br>
<br>
	<table id="tblTapeFormat" width=100%>
	<form method="post" name="frmTapeDesc" id="frmTapeDesc" action="procUpdateTapeDesc.asp">
	<input type="hidden" id="hdnTapeDescID" name="hdnTapeDescID" size="70" value="<%=rsFrm.Fields("TapeDescID")%>"></td>
		<tr>
			<td>
				Tape Description:</td>
			<td>				
				<input type="text" id="txtTapeDesc" name="txtTapeDesc" size="70" value="<%=rsFrm.Fields("TapeDesc")%>"></td>
		</tr>
		<tr>
			<td colspan=2>&nbsp;</td>
		</tr>
	</table>
	<table width=100%>
		<tr>
			<td>
				<input type=button name=btnDelete value="Delete" onclick="javascript:confirmdel('delTapeDesc.asp?TapeDescID=<%=Request.QueryString("TapeDescID")%>')">
			</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td align="Center">
				<input type=submit name=subUpdate value="Save">
			</td>
			<td>
				<input type=button name=btnCancel value="Cancel" onclick="CloseEdit();">
			</td>
		</tr>
	</form>
	</table>

</BODY>
</HTML>
