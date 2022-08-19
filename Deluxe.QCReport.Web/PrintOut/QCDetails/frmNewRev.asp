<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK rel="stylesheet" type="text/css" href="../css/cssForms.css">
<Title>Add New Revision</Title>
</HEAD>
<script language="javascript">
  function CloseNewQC()
  { close(); }
  
</script>
<!--#include file="../include/connect.asp"-->
<%
dim rsCombo
dim sQCNum, sRev, sNewRev, sJobNum
dim sqlCombo

sJobNum = Request.QueryString("sJobNum")
sQCnum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sNewRev = cint(sRev)+1

%>
<BODY topmargin=3 bgcolor=#f5f5dc>
Add revision <b><%=sNewRev%></b> to QC# <b><%=sQCNum%></b>?
<br><br><br>
<table id="tblTapeFormat" width=100%>
<form action="procNewRev.asp" method=post name="frmSelect">
<input type=hidden id="hdnQCNum" name="hdnQCNum" value=<%=sQCNum%>>
<input type=hidden id="hdnNewRev" name="hdnNewRev" value=<%=sNewRev%>>
<input type=hidden id="hdnRev" name="hdnRev" value=<%=sRev%>>
	<tr>
		<td align=right>
			<INPUT type="submit" value="Yes" id=btnSelect name=btnSelect>
			<INPUT type="button" value=" No " id=btnCancel name=btnCancel onclick="javascript:CloseNewQC()">
		</td>
	</tr>
</form>
</table>
</BODY>
</HTML>
