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

sql1 = "SELECT * FROM optLanguage WHERE LangID = " & cint(Request.QueryString("LangID"))
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql1
%>
<body class="bodyForm">
<b>Edit Language</b>
<br>
<br>
	<table id="tblTapeFormat" width="100%">
	<form method="post" name="frmUpdateLanguage" action="procUpdateLang.asp">
	<input type="hidden" name="hdnLangID" id="hdnLangID" value="<%=Request.QueryString("LangID")%>">
		<tr>
			<td colspan=2>
				Language:
			</td>
			<td colspan=2>				
				<input type="text" id="txtLanguage" name="txtLanguage" size=20 value="<%=rsFrm.fields("Language")%>">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td>
				<input type=button name=btnDelete value="Delete" onclick="javascript:confirmdel('delLang.asp?LangID=<%=Request.QueryString("LangID")%>')">
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

