<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<meta NAME="robots" CONTENT="noindex">
<META NAME="GENERATOR" Content="Microsoft FrontPage 5.0">
</HEAD>

<BODY class="bodyForm">
<SCRIPT language="javascript">
	self.focus();
</SCRIPT>
<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->
<table ID="tblForm" border="0" CELLPADDING="0" CELLSPACING="0" width="100%">
	<tr>
		<td>
<%
'********************
'Declarations
'********************
dim rsFrm, rsCombo, rsHeader
dim sJobNum, sQCNum, sRev, sFrm
dim sql, sqlCombo
dim sCheck_Y, sCheck_N
dim sAssetType

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<td><font size=2><b>" & sQCNum & " - " & sRev & ":  " & sFrm & "</b></font></td>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")
Set rsHeader = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Header Screen
'*******************************************************************************************************
		sql="SELECT Revised_By, Revised_Date, FullName, Bay_Num, " & _
				"QC_VTR, Stock_Mfg, Stock_Batch, Rec_Date, Rec_VTR, " & _
				"Rec_Fac, Src_Format, Src_Standard, Src_Desc, AddInfo, textless, isnull(Duration, '') as Duration " & _
			"FROM qcHeader " & _
			"INNER JOIN qcUsers ON qcHeader.Operator = qcUsers.qcUserID " & _
			"GROUP BY Revised_By, Revised_Date, FullName, Bay_Num, " & _
				"QC_VTR, Stock_Mfg, Stock_Batch, Rec_Date, Rec_VTR, " & _
				"Rec_Fac, Src_Format, Src_Standard, Src_Desc, AddInfo, textless, isnull(Duration, ''), " & _
				"QCNum, subQcnum " & _
			"HAVING QCNum = " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
			
		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql
		
'******************************************************************************************************

		sql="SELECT  AssetType  FROM qcHeader  WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
		rsHeader.ActiveConnection = cnQCS
		rsHeader.Open sql	
		
		sAssetType = rsHeader.Fields("AssetType") 
		
		If IsNull(sAssetType) or sAssetType = ""  Then
	        sAssetType = "Tape"
        End If 

 %>
 		<TD width=40% align=right>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" tabindex="10" target="main">Reports&nbsp;</a>
		</TD>
		<td>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" tabindex="10" target="main">			
 			<IMG HSPACE="1" HEIGHT="19" WIDTH="18" BORDER="0" SRC="../images/reports_off.gif" ALT="Reports"></a>
		</TD>
	</tr>
</table>
<!--#include file="../include/frmToolBar.asp"-->
		<form method="post" name="frmHistory" action="procHistory_ESI.asp">
		<table ID="tblForm" width=100%>
		<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
		<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
		<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">
			<tr>
				<td align="right">Revised By:</td><td>
                <INPUT type="text" id=txtRevBy name=txtRevBy value="<%=rsFrm.Fields("Revised_By")%>" size="20"></td>
				<td align="right">Revised Date:</td>
				<td><%= rsFrm.Fields("Revised_Date")%></td>
			</tr>
			<tr>
				<td align="right">QC Operator:</td>
				<td>
				<select id=selOperator name=selOperator>
					<option><%=rsFrm.Fields("FullName")%></option>
					<%	
						sqlCombo = "SELECT FullName FROM qcUsers ORDER BY FullName"
						rsCombo.ActiveConnection = cnQCS
						rsCombo.Open sqlCombo
							do while not rsCombo.EOF %>
								<option><%=rsCombo.Fields("FullName")%></option>
					    <% 
							rsCombo.MoveNext
							loop
							rsCombo.Close 
						%>
				</select>
				</td>
				<td align="right">Control Room #:</td>
				<td>
				<select id=selBayNum name=selBayNum>
					<option><%=rsFrm.Fields("Bay_Num")%></option>
					<%	
						sqlCombo = "SELECT BayNumber FROM optQCRoom ORDER BY QCRoomID"
						rsCombo.ActiveConnection = cnQCS
						rsCombo.Open sqlCombo
							do while not rsCombo.EOF %>
								<option><%=rsCombo.Fields("BayNumber")%></option>
					    <% 
							rsCombo.MoveNext
							loop
							rsCombo.Close 
						%>
				</select>
				</td>
			</tr>
			
			
			
			<tr>
				<td align="right">QC VTR:</td><td>
                <INPUT type="text" id=txtQCVTR name=txtQCVTR value="<%=rsFrm.Fields("QC_VTR")%>" size="20">
			</tr>
		</table>
		
		<%if sLevel >= 1 then%>
		<table width=100%>
			<tr>
				<td align="right"><INPUT type="submit" id="Action" name="Action" value="Save">&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</table>
		<%end if%>
		</form>
<%
rsFrm.Close
Set rsFrm = Nothing
Set rsCombo = Nothing
rsHeader.Close
Set rsHeader = Nothing
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>