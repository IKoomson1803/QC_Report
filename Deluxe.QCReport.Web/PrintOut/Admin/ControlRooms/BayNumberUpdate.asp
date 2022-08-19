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

sql1 = "SELECT * FROM optQCRoom WHERE QCRoomID = " & cint(Request.QueryString("QCRoomID"))
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql1
%>
	<body bgcolor=#f5f5dc>
	<form method="post" name="frmBayNumberUpdate" action="procUpdateBayNum.asp">
	<input type="hidden" name="hdnQCRoomID" id=hdnQCRoomID value="<%=Request.QueryString("QCRoomID")%>">
	<table align="center">
		<tr>
			<td colspan=2>Bay Number:</td>
			<td colspan=2>				
				<input type="text" id="txtBayNumber" name="txtBayNumber" size="10" value="<%=rsFrm.Fields("BayNumber")%>">
			</td>
		</tr>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<input type=button name=btnDelete value="Delete" onclick="javascript:confirmdel('delBayNum.asp?QCRoomID=<%=Request.QueryString("QCRoomID")%>')">
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
	</body>
</html>

