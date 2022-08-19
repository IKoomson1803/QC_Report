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
'' Isaac Koomson - 25/09/1012

dim rsFrm, sql, intColourEncodingID
intColourEncodingID = Request.QueryString("ColourEncodingID")

set rsFrm = Server.CreateObject("ADODB.Recordset")

sql = "SELECT * FROM optColourEncoding WHERE  ColourEncodingID= " & cint(intColourEncodingID)
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql


%>
<body bgcolor=#f5f5dc>
	<table align="center">
	<form method="post" name="frmUpdateColourEncoding" action="procUpdateColourEncoding.asp">
	<input type="hidden" name="hdnColourEncodingID" id="hdnColourEncodingID" value="<%=intColourEncodingID%>">
		<tr>
			<td colspan=2>
				Colour Encoding:
			</td>
			<td colspan=2>				
				<input type="text" id="txtColourEncoding" name="txtColourEncoding" size="50" value="<%=rsFrm.fields("ColourEncoding")%>">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<input type="button" name="btnDelete" value="Delete" onclick="javascript:confirmdel('procDeleteColourEncoding.asp?ColourEncodingID=<%=intColourEncodingID%>')">
			</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td align="Center">
				<input type="submit" name=subUpdate value="Save"  >
			</td>
			<td>
				<input type="button" name=btnCancel value="Cancel" onclick="CloseEdit();">
			</td>
		</tr>
	</form>
	</table>
	</body>
</html>

