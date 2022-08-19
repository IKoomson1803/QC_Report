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

sql1 = "SELECT * FROM optFormat WHERE FormatID = " & cint(Request.QueryString("FormatID"))
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql1
%>
	<body bgcolor=#f5f5dc>
	<table align="center">
	<form method="post" name="frmOptFormat" action="procUpdateFormat.asp">
	<input type="hidden" name="hdnFormatID" id="hdnFormatID" value="<%=Request.QueryString("FormatID")%>">
		<tr>
			<td align="center" colspan=2>Format:</td>
			<td colspan=2>				
				<input type="text" id="txtFormat" name="txtFormat" size="30" value='<%=rsFrm.Fields("Format")%>'>
			</td>
		</tr>
		<tr>
			<td colspan=4>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<input type=button name=btnDelete value="Delete" onclick="javascript:confirmdel('delFormat.asp?FormatID=<%=Request.QueryString("FormatID")%>');">
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

