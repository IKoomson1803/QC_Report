<%@ Language=VBScript %>
<html>
<head>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<meta NAME="robots" CONTENT="noindex">
<LINK rel="stylesheet" type="text/css" href="../css/qcs.css">
<title></title>
</head>
<script language="javascript">
function OpenNewQCFrm(url)
	{
		window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=1,width=350,height=120');
	}
function ConfirmDel(url, JobNum)
{
	if (confirm("Are you sure you want to delete Job " + JobNum + " and all QC numbers and revisions therein?"))
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
sql = "SELECT QCNum, QC_date, FullName, qcHeader.Deleted " & _
"FROM qcHeader " & _
"INNER JOIN qcUsers ON qcHeader.operator = qcUsers.qcUserID " & _
"GROUP BY QC_date, FullName, qcNum, wonum, qcHeader.Deleted " & _
"HAVING wonum= '" & sJobNum & "' AND qcHeader.Deleted = 0"
'******************************************************************
rsFrm.Open sql
%>
<font size="2"><b>Job <%=sJobNum%> Details</b></font>
		<table align=center ID="tblTapeFormat" border=0 width=90% cellpadding=0 cellspacing=0>
		<form method="post" name="frmJobDetails" action="../mainProcess.asp">
					<tr bgcolor=#999900>
						<td>&nbsp;</td>
						<td>QC Number</td>
						<td>QC Operator</td>
						<td>QC Date</td>
					</tr>
			<%sBGColor = "trBeige"%>
			<%	if rsFrm.BOF = true and rsFrm.EOF = true then %>
					<tr class="<%=sBGColor%>">
						<td>&nbsp;</td>
						<td>No Records Found</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
			<%	else %>
			<%		do while not rsFrm.EOF %>
						<tr class="<%=sBGColor%>" onmouseover="this.className='trWhite'" onmouseout="this.className='<%=sBGColor%>'" onclick="self.navigate('../QCDetails/QCDetails.asp?sJob=<%=sJobNum%>&sQCnum=<%=rsFrm.Fields("QCNum")%>')">
							<td>&nbsp;</td>
							<td><%=rsFrm.Fields("QCNum")%></td>
							<td width=250><%=rsFrm.Fields("FullName")%></td>
							<td><%=rsFrm.Fields("QC_Date")%></td>
						</tr>
			<%
						rsFrm.MoveNext
						If sBGColor = "trBeige" Then
							sBGColor = "trBrown"
						Else
							sBGColor = "trBeige"
						End If
					loop
				end if			
			%>
		</table>
		<table width=90%>
			<tr>
				<td align="right">
				<%if sLevel >= 1 then%>
				<INPUT type="button" value="New QC" id=btnNewQC name=btnNewQC onclick="javascript:OpenNewQCFrm('../NewQC/frmNewQC.asp')">&nbsp;&nbsp;&nbsp;
				<%end if%>
				<%if sLevel >= 2 then%>
				<input type="button" name=subDelete Value=Delete onclick="javascript:ConfirmDel('procDelJobNum.asp?sJobNum=<%=sJobNum%>', '<%=sJobNum%>')"><td>
				<%end if%>
			</tr>
		</form>
		</table>
</body>
</html>
<%
rsFrm.Close
Set rsFrm = Nothing
cnQCS.Close
set cnQCS = Nothing%>
