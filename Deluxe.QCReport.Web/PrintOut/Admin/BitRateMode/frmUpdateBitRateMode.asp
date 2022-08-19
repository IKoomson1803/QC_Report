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

dim rsFrm, sql, intBitRateModeID
intBitRateModeID = Request.QueryString("BitRateModeID")

set rsFrm = Server.CreateObject("ADODB.Recordset")

sql = "SELECT * FROM optBitRateMode WHERE  BitRateModeID= " & cint(intBitRateModeID)
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql


%>
<body bgcolor=#f5f5dc>
	<table align="center">
	<form method="post" name="frmUpdateBitRateMode" action="procUpdateBitRateMode.asp">
	<input type="hidden" name="hdnBitRateModeID" id="hdnBitRateModeID" value="<%=intBitRateModeID%>">
		<tr>
			<td colspan=2>
				Bit Rate Mode:
			</td>
			<td colspan=2>				
				<input type="text" id="txtBitRateMode" name="txtBitRateMode" size="50" value="<%=rsFrm.fields("BitRateMode")%>">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<input type="button" name="btnDelete" value="Delete" onclick="javascript:confirmdel('procDeleteBitRateMode.asp?BitRateModeID=<%=intBitRateModeID%>')">
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

