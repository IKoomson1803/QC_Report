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
'' Isaac Koomson - 24/09/1012

dim rsFrm, sql, intAudioCodecID
intAudioCodecID = Request.QueryString("AudioCodecID")

set rsFrm = Server.CreateObject("ADODB.Recordset")

sql = "SELECT * FROM optAudioCodec WHERE  AudioCodecID= " & cint(intAudioCodecID)
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql


%>
<body bgcolor=#f5f5dc>
	<table align="center">
	<form method="post" name="frmUpdateAudioCodec" action="procUpdateAudioCodec.asp">
	<input type="hidden" name="hdnAudioCodecID" id="hdnAudioCodecID" value="<%=intAudioCodecID%>">
		<tr>
			<td colspan=2>
				Audio Codec:
			</td>
			<td colspan=2>				
				<input type="text" id="txtAudioCodec" name="txtAudioCodec" size="50" value="<%=rsFrm.fields("AudioCodec")%>">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<input type="button" name="btnDelete" value="Delete" onclick="javascript:confirmdel('procDeleteAudioCodec.asp?AudioCodecID=<%=intAudioCodecID%>')">
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

