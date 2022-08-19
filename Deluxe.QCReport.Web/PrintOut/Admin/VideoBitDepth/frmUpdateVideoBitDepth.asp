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
	    var inputValue = document.getElementById('txtVideoBitDepth').value;
        var isNumeric = ( (input - 0) == input && input.length > 0 );
       
		 if(!isUnsignedInteger)
		 {
		   alert('Video Bit Depth must be a positive integer') ;
		 }
		 else
		 {
		   frmUpdateVideoBitDepth.action = 'procUpdateVideoBitDepth.asp';
		   frmUpdateVideoBitDepth.submit();
		 }
	} 
	
	function IsUnsignedIntegerBeforeSubmit()
	{
	    var inputValue = document.getElementById('txtVideoBitDepth').value;
        var isUnsignedInteger = (inputValue.toString().search(/^[0-9]+$/) == 0);
	  		 
		 if(!isUnsignedInteger)
		 {
		   alert('Video Bit Depth must be a positive integer') ;
		 }
		 else
		 {
		   frmUpdateVideoBitDepth.action = 'procUpdateVideoBitDepth.asp';
		   frmUpdateVideoBitDepth.submit();
		 }
	
    }

	
</script>
<!--#include file="../../include/connect.asp"-->
<%
'' Isaac Koomson - 24/09/1012

dim rsFrm, sql, intVideoBitDepthID
intVideoBitDepthID = Request.QueryString("VideoBitDepthID")

set rsFrm = Server.CreateObject("ADODB.Recordset")

sql = "SELECT * FROM optVideoBitDepth WHERE  VideoBitDepthID= " & cint(intVideoBitDepthID)
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql


%>
<body bgcolor=#f5f5dc>
	<table align="center">
	<form method="post" name="frmUpdateVideoBitDepth" action="procUpdateVideoBitDepth.asp">
	<input type="hidden" name="hdnVideoBitDepthID" id="hdnVideoBitDepthID" value="<%=intVideoBitDepthID%>">
		<tr>
			<td colspan=2>
				Video Bit Depth:
			</td>
			<td colspan=2>				
				<input type="text" id="txtVideoBitDepth" name="txtVideoBitDepth" size="50" value="<%=rsFrm.fields("VideoBitDepth")%>">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<input type="button" name="btnDelete" value="Delete" onclick="javascript:confirmdel('procDeleteVideoBitDepth.asp?VideoBitDepthID=<%=intVideoBitDepthID%>')">
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

