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
		<form method="post" name="frmHistory" action="procHistory.asp">
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
			<% If Not IsNull(sAssetType) And sAssetType = "Tape"   Then %>
			<tr>
				<td align="right">Stock Mfg:</td><td>
                <INPUT type="text" id=txtStockMfg name=txtStockMfg value="<%=rsFrm.Fields("Stock_Mfg")%>" size="20"></td>
				<td align="right">Stock Batch #:</td><td>
                <INPUT type="text" id=txtStockBatch name=txtStockBatch value="<%=rsFrm.Fields("Stock_Batch")%>" size="20"></td>
			</tr>
			<% End If %>
			<tr>
				<td align="right">Rec. Date:</td><td>
                <INPUT type="text" id=txtRecDate name=txtRecDate value="<%if isnull(rsFrm.Fields("Rec_Date")) then
																												  Response.Write(rsFrm.Fields("Rec_Date"))
																											   else
																												  Response.Write(replace(rsFrm.Fields("Rec_Date"), "01/01/1900", ""))
																											   end if%>" size="20"></td>
				<td align="right">Rec. VTR:</td><td><INPUT size=5 type="text" id=txtRecVTR name=txtRecVTR value="<%=rsFrm.Fields("Rec_VTR")%>">
				Rec. Facility:&nbsp<INPUT size=5 type="text" id=txtRecFac name=txtRecFac value="<%=rsFrm.Fields("Rec_Fac")%>"></td>
			</tr>
			<tr>	
				<td align="right">Source Format:</td>
				<td>
				<select id=selSourceFormat name=selSourceFormat>
					<option><%=rsFrm.Fields("Src_Format")%></option>
					<%	
						sqlCombo = "SELECT Format FROM optFormat ORDER BY Format"
						rsCombo.ActiveConnection = cnQCS
						rsCombo.Open sqlCombo
							do while not rsCombo.EOF %>
								<option><%=rsCombo.Fields("Format")%></option>
					    <% 
							rsCombo.MoveNext
							loop
							rsCombo.Close 
						%>
				</select>
				</td>
				</td>
				<td align="right">Source Standard:</td>
				<td>
					<select id=selSrcStandard name=selSrcStandard>
						<option><%=rsFrm.Fields("Src_Standard")%></option>
						<option>Not Known</option>
						<option>NTSC</option>
						<option>PAL</option>
						<option>525</option>
						<option>625</option>
						<option>1080/59.94i</option>
					    <option>1080/50i</option>
                        <option>1080/29.97Psf</option>
                        <option>1080/25Psf</option>
                        <option>1080/24Psf</option>
                        <option>1080/23.98Psf</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">QC VTR:</td><td>
                <INPUT type="text" id=txtQCVTR name=txtQCVTR value="<%=rsFrm.Fields("QC_VTR")%>" size="20">
			</tr>
		</table>
		<table id="tblForm" width=100%>
			<tr>
				<td colspan=2>&nbsp;</td>
			</tr>
			<tr>
				<td align="right">Source Description:</td>
				<td>
				<select id=selSrcDesc name=selSrcDesc>
					<option><%=rsFrm.Fields("Src_Desc")%></option>
					<%	
						sqlCombo = "SELECT TapeDesc FROM optTapeDesc ORDER BY TapeDesc"
						rsCombo.ActiveConnection = cnQCS
						rsCombo.Open sqlCombo
							do while not rsCombo.EOF %>
								<option><%=rsCombo.Fields("TapeDesc")%></option>
					    <% 
							rsCombo.MoveNext
							loop
							rsCombo.Close 
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td align="right">Additional Info:</td>
				<td><INPUT size=62 type="text" id=txtAddInfo name=txtAddInfo value="<%= rsFrm.Fields("AddInfo") %>"></td>
			</tr>
			<tr>
				<td align="right">Textless @ Tail?:</td>
				<%
					if rsFrm.Fields("textless") = "Y" Then
						sCheck_Y = "CHECKED"
					else
						sCheck_Y = ""
					end if
					if rsFrm.Fields("textless") = "N" Then
						sCheck_N = "CHECKED"
					else
						sCheck_N = ""
					end if
				%>
				<td><INPUT type="radio" id=radTextless name=radTextless value="Y" <%=sCheck_Y%>>&nbsp;Yes&nbsp;&nbsp;&nbsp;<INPUT type="radio" id=radTextless name=radTextless value="N" <%=sCheck_N%>>&nbsp;No</td>
			</tr>
			<tr>
				<td align="right">Text Duration:</td>
				<td>
                <input type="text" name="txtDuration" id="txtDuration" value="<%=server.HTMLEncode(rsFrm.Fields("Duration"))%>" size="20"></td>
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