<%@ Language=VBScript %>
<html>
<head>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<meta NAME="robots" CONTENT="noindex">
<title></title>
<LINK rel="stylesheet" type="text/css" href="../css/qcs.css">
</head>
<script Language="javascript">
    function ConfirmDel(url, Rev, QCNum)
	{
		if (confirm("Are you sure you want to delete QC " + QCNum + " Revision " + Rev + "?"))
			{
				self.navigate(url)
			}
		else
			{ }
	}
</script>
<body class="bodyForm">
<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->
<%
dim sJobNum
dim sQCNum
dim sRev
dim sFrm
dim rsFrm
dim sql

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("sFrm")

Set rsFrm = server.CreateObject("ADODB.Recordset")
rsFrm.ActiveConnection = cnQCS
'******************************************************************
'Select for QC Revision Details
'******************************************************************
sql = "SELECT revised_date, revised_by, FullName, eval_stat " & _
"FROM qcHeader " & _
"INNER JOIN qcUsers ON qcHeader.operator = qcUsers.qcUserID " & _
"GROUP BY revised_date, revised_by, FullName, eval_stat, " & _
"qcNum, subQCNum " & _
"HAVING Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
'******************************************************************
rsFrm.Open sql
%>
<table ID="tblForm" border="0" CELLPADDING="0" CELLSPACING="0" width="100%">
	<tr>
		<td>
			<font size="2"><b><%=sQCNum%> Details for Revision <%=sRev%></b></font>
		</td>
		<TD width=40% align=right>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" target="main">Reports&nbsp;</a>
		</TD>
		<td>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" target="main">
			<IMG HSPACE="1" HEIGHT="19" WIDTH="18" BORDER="0" SRC="../images/reports_off.gif" ALT="Reports"></a>
		</TD>
	</tr>
</table>
<!--#include file="../include/frmToolBar.asp"-->
<br>
<Table id=tblForm width=100%>
	<tr>
		<td align="right"><b>Revision Date: </b></td>
		<td><%=rsFrm.fields("revised_date")%></td>
		<td align="right"><b>Revised By: </b></td>
		<td><%=rsFrm.fields("Revised_By")%></td>
	</tr>
	<tr>
		<td align="right"><b>QC Operator: </b></td>
		<td><%=rsFrm.Fields("FullName")%></td>
		<td align="right"><b>Status: </b></td>
		<td><%=rsFrm.Fields("eval_stat")%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%if sLevel >= 2 then%>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>
			<input type=button name=subDelete Value=Delete onclick="javascript:ConfirmDel('procDelRev.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>', '<%=sRev%>', '<%=sQCNum%>')">
		</td>
	</tr>
	<%end if%>
</table>
</body>
</html>
<%
rsFrm.Close
Set rsFrm = Nothing
cnQCS.Close
set cnQCS = Nothing%>