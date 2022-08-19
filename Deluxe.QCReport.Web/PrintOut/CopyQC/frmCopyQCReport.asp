<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK rel="stylesheet" type="text/css" href="../css/cssForms.css">
<Title>Copy QC</Title>
</HEAD>
<script language="javascript">
  function CloseNewQC()
  { close(); }
  
</script>
<!--#include file="../include/connect.asp"-->
<%

''*****************************************************************************************************
''Author: Isaac Koomson
''Created Date: 12/01/2012
''Description: Creates a new QC Report with new QC number and new Job Number by copying existing QC Report 
''*****************************************************************************************************

Dim sJobNum,sQCNum,sRev 

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")

''Response.write "sJobNum: " & sJobNum & "<br>"
''Response.write "sQCNum: " & sQCNum & "<br>"
''Response.write "sRev: " &  sRev & "<br>"

%>

<BODY topmargin=3 bgcolor=#f5f5dc>
<table id="tblTapeFormat">
<form action="../tree.asp" target="tree" method=post name="frmSelect">
	<tr>
		<td align="right">*Job #: </td>
		<td>
			<input type=textbox id="txtJobNum" name="txtJobNum" value=<%=sJobNum%> >
			<input type=hidden id="txtQCNum" name="txtQCNum" value=<%=sQCNum%> >
			<input type=hidden id="txtRev" name="txtRev" value=<%=sRev%>   >
			
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align=right>
			<INPUT type="submit" value="Copy QC" id=btnSelect name=btnSelect onclick="javascript:CloseNewQC()">
			<INPUT type="button" value="Cancel" id=btnCancel name=btnCancel onclick="javascript:CloseNewQC()">
		</td>
	</tr>
</form>
</table>
</BODY>
</HTML>
