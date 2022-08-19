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
'' Isaac Koomson - 18/01/1012

dim rsFrm, sql1

set rsFrm = Server.CreateObject("ADODB.Recordset")

sql1 = "SELECT * FROM optTCInteg WHERE TCIntegID = " & cint(Request.QueryString("nTCIntegrationID"))
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql1
%>
<body bgcolor=#f5f5dc>
	<table align="center">
	<form method="post" name="frmUpdateTCIntegration" action="procUpdateTCIntergation.asp">
	<input type="hidden" name="hdnIntergationTCID" id="hdnIntergationTCID" value="<%=Request.QueryString("nTCIntegrationID")%>">
		<tr>
			<td colspan=2>
				TC Integration:
			</td>
			<td colspan=2>				
				<input type="text" id="txtIntegrationTC" name="txtIntegrationTC" size=30 value="<%=rsFrm.fields("TCInteg")%>">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<input type=button name=btnDelete value="Delete" onclick="javascript:confirmdel('delTCIntegration.asp?TCIntegrationID=<%=Request.QueryString("nTCIntegrationID")%>')">
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

