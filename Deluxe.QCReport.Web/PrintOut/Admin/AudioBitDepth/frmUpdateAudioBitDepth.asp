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
	
	function IsNumericBeforeSubmit()
	{ 
	    var inputValue = document.getElementById('txtAudioBitDepth').value;
        var isNumeric = ( (input - 0) == input && input.length > 0 );
       
		 if(!isUnsignedInteger)
		 {
		   alert('Audio Bit Depth must be a positive integer') ;
		 }
		 else
		 {
		   frmUpdateAudioBitDepth.action = 'procUpdateAudioBitDepth.asp';
		   frmUpdateAudioBitDepth.submit();
		 }
	} 
	
	function IsUnsignedIntegerBeforeSubmit()
	{
	    var inputValue = document.getElementById('txtAudioBitDepth').value;
        var isUnsignedInteger = (inputValue.toString().search(/^[0-9]+$/) == 0);
	  		 
		 if(!isUnsignedInteger)
		 {
		   alert('Audio Bit Depth must be a positive integer') ;
		 }
		 else
		 {
		   frmUpdateAudioBitDepth.action = 'procUpdateAudioBitDepth.asp';
		   frmUpdateAudioBitDepth.submit();
		 }
	
    }

	
</script>
<!--#include file="../../include/connect.asp"-->
<%
'' Isaac Koomson - 24/09/1012

dim rsFrm, sql, intAudioBitDepthID
intAudioBitDepthID = Request.QueryString("AudioBitDepthID")

set rsFrm = Server.CreateObject("ADODB.Recordset")

sql = "SELECT * FROM optAudioBitDepth WHERE  AudioBitDepthID= " & cint(intAudioBitDepthID)
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql


%>
<body bgcolor=#f5f5dc>
	<table align="center">
	<form method="post" name="frmUpdateAudioBitDepth" action="procUpdateAudioBitDepth.asp">
	<input type="hidden" name="hdnAudioBitDepthID" id="hdnAudioBitDepthID" value="<%=intAudioBitDepthID%>">
		<tr>
			<td colspan=2>
				Audio Bit Depth:
			</td>
			<td colspan=2>				
				<input type="text" id="txtAudioBitDepth" name="txtAudioBitDepth" size="50" value="<%=rsFrm.fields("AudioBitDepth")%>">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<input type="button" name="btnDelete" value="Delete" onclick="javascript:confirmdel('procDeleteAudioBitDepth.asp?AudioBitDepthID=<%=intAudioBitDepthID%>')">
			</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td align="Center">
				<input type="button" name=subUpdate value="Save" onclick="javascript:IsUnsignedIntegerBeforeSubmit();" >
			</td>
			<td>
				<input type="button" name=btnCancel value="Cancel" onclick="CloseEdit();">
			</td>
		</tr>
	</form>
	</table>
	</body>
</html>

