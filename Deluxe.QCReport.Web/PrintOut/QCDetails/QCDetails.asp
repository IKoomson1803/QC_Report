<%@ Language=VBScript %>
<%option explicit%>
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
<script Language="javascript">
	function OpenNewRev(url)
	{
		window.open (url, "win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=230,height=40');
	}
    function ConfirmDel(url, QCNum)
	{
		if (confirm("Are you sure you want to delete QC " + QCNum + " and all Revisions therein?"))
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
'********************
'Declarations
'********************
dim rsFrm
dim sJobNum, sQCNum, sRev, sFrm
dim sql, sBGColor, tmpRev
'********************
sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("sFrm")

Set rsFrm = server.CreateObject("ADODB.Recordset")
rsFrm.ActiveConnection = cnQCS
'******************************************************************
'Select for QC Details
'******************************************************************
sql = "SELECT wonum, QCNum, subQCNum, revised_date, FullName, qcHeader.Deleted " & _
"FROM qcHeader " & _
"INNER JOIN qcUsers ON qcHeader.operator = qcUsers.qcUserID " & _
"GROUP BY wonum, revised_date, FullName, qcNum, subQCNum, qcHeader.Deleted " & _
"HAVING QCnum= " & clng(sQCNum) & " AND qcHeader.Deleted = 0 " & _
"ORDER BY subQCNum"
'******************************************************************
rsFrm.Open sql
%>
<font size="2"><b>QC <%=sQCNum%> Details</b></font>
		<table align=center ID="tblTapeFormat" border=0 width=90% cellpadding=0 cellspacing=0>
		<form method="post" name="frmJobDetails" action="procDelRev.asp">
					<tr bgcolor=#999900>
						<td>QC-Rev #</td>
						<td width=250>QC Operator</td>
						<td>Revised Date</td>
					</tr>
			<%sBGColor = "#cccc99"%>
			<%	if rsFrm.BOF = true and rsFrm.EOF = true then %>
					<tr bgcolor=<%=sBGColor%>>
						<td>No Records Found</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
			<%	else %>
			<%		do while not rsFrm.EOF 
					tmpRev = rsFrm.Fields("subQCNum") %>
						<tr bgcolor=<%=sBGColor%>>
							<td><a href="../RevDetails/RevDetails.asp?sFrm=RevDetails&sJobNum=<%=rsFrm.Fields("wonum")%>&sQCNum=<%=rsFrm.Fields("QCNum")%>&sRev=<%=rsFrm.Fields("subQCNum")%>"><%=rsFrm.Fields("QCNum")%> - <%=rsFrm.Fields("subQCNum")%></a></td>
							<td width=250><%=rsFrm.Fields("FullName")%></td>
							<td><%=rsFrm.Fields("revised_Date")%></td>
						</tr>
			<%			sRev = rsFrm.Fields("subQCNum")
						rsFrm.MoveNext
						If sBGColor = "#cccc99" Then
							sBGColor = "#ffffcc"
						Else
							sBGColor = "#cccc99"
						End If
					loop
				end if			
			%>
		</table>
		<table width=90%>
			<tr>
				<td align="right">
				<%if sLevel >= 1 then%>
				<input type=button name=subAdd value="New Rev" onclick="javascript:OpenNewRev('frmNewRev.asp?sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">&nbsp;&nbsp;&nbsp;
				<%end if%>
				<%if sLevel >= 2 then%>
				<input type=button name=subDelete Value=Delete onclick="javascript:ConfirmDel('procDelQC.asp?sQCNum=<%=sQCNum%>&sJobNum=<%=sJobNum%>', '<%=sQCNum%>')">
				<%end if%>
				<td>
			</tr>
		<input type=hidden id="hdnLastRev" name="hdnLastRev" value="<%=tmpRev%>">
		</form>
		</table>
</body>
</html>
<%
rsFrm.Close
Set rsFrm = Nothing
cnQCS.Close
set cnQCS = Nothing
%>
