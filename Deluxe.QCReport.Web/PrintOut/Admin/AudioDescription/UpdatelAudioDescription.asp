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
'' Isaac Koomson - 16/01/1012

dim rsFrm, sql1

set rsFrm = Server.CreateObject("ADODB.Recordset")

sql1 = "SELECT * FROM optAudio WHERE  AudioID= " & cint(Request.QueryString("nAudioID"))
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql1
%>
<body bgcolor=#f5f5dc>
	<table align="center">
	<form method="post" name="frmUpdateAudioDescription" action="procUpdatelAudioDescription.asp">
	<input type="hidden" name="hdnAudioID" id="hdnAudioID" value="<%=Request.QueryString("nAudioID")%>">
		<tr>
			<td colspan=2>
				Audio Description:
			</td>
			<td colspan=2>				
				<input type="text" id="txtAudioDesc" name="txtAudioDesc" size=50 value="<%=rsFrm.fields("AudioDesc")%>">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<input type=button name=btnDelete value="Delete" onclick="javascript:confirmdel('delAudioDescription.asp?AudioID=<%=Request.QueryString("nAudioID")%>')">
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

