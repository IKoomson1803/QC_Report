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
<BODY topmargin=0 leftmargin=0 rightmargin=0 bgcolor=#f5f5dc>
<b>Format Drop-Down Contents</b>
<br>
<center>
<iframe border=0 src="TapeDescDetails.asp" width=370 height=70%></iframe>
</center>
			<table align="center" id="tblForm" width="100%">
			<form method="post" name="frmFormat" action="procTapeDesc.asp">
				<tr>
					<td>&nbsp</td>
				</tr>
				<tr>
					<td align="right">
						Tape Description:</td>
					<td>				
						<input type="text" id="txtTapeDesc" name="txtTapeDesc" size="70">
					</td>
				</tr>
				<tr>
					<td align="Center" colspan="6">
						<input type=submit name=subUpdate value="Add Description"></td>
				</tr>
				</form>
			</table>

</BODY>
</HTML>