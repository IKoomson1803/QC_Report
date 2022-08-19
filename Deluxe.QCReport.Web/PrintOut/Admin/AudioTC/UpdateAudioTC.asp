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
'' Isaac Koomson - 17/01/1012

dim rsFrm, sql1

set rsFrm = Server.CreateObject("ADODB.Recordset")

sql1 = "SELECT * FROM optAudioTC WHERE AudTCID = " & cint(Request.QueryString("nAudioTCID"))
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql1
%>
<body bgcolor=#f5f5dc>
	<table align="center">
	<form method="post" name="frmUpdateAudioTC" action="procUpdateAudioTC.asp">
	<input type="hidden" name="hdnAudioTCID" id="hdnAudioTCID" value="<%=Request.QueryString("nAudioTCID")%>">
		<tr>
			<td colspan=2>
				Audio TC:
			</td>
			<td colspan=2>				
				<input type="text" id="txtAudioTC" name="txtAudioTC" size=30 value="<%=rsFrm.fields("AudioTC")%>">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<input type=button name=btnDelete value="Delete" onclick="javascript:confirmdel('delAudioTC.asp?AudioTCID=<%=Request.QueryString("nAudioTCID")%>')">
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

