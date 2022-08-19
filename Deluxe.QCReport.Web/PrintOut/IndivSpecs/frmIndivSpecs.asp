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

<BODY class="bodyForm" topmargin=0 leftmargin=0 rightmargin=0>
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
dim sAssetType
'********************

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
		sql="SELECT HBlank, CloseCap, Src_Barcode, " & _
				"VBlank, Sync_Levl, RF, Burst_Levl, Serrations, " & _
				"Front_Por, Channel_Cond, Slate_QC, VITS, Tracking_QC, " & _
				"Labels_QC, VIRS, ctl_Track, Shipper_QC, VITC, " & _
				"Tape_Wrap_QC, SubTitle_QC " & _
			"FROM qcElement " & _
			"WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql
		
	'**************************************************************************************************	
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
<br>
		<table ID="tblForm" width=100%>
		<form method="post" name="frmIndivSpecs" action="procIndiv.asp">
		<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
		<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
		<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">
			<tr>
	
				<td align="right">H. Blanking:</td><td><INPUT size=5 type="text" id=txtHBlank name=txtHBlank value="<%=rsFrm.Fields("HBlank")%>"></td>
				<td align="right">Closed Caps:</td>
				<td>
					<select id=selCloseCap name=selCloseCap>
						<option><%=rsFrm.Fields("CloseCap")%></option>
						<option>No</option>
						<option>Yes</option>
						<option>Yes - NG</option>
						<option>Yes - OK</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">Source Tape #:</td><td><INPUT size=15 type="text" id=txtSrcBarcode name=txtSrcBarcode value="<%=rsFrm.Fields("Src_Barcode")%>"></td>
				<td align="right">V. Blanking:</td><td><INPUT size=5 type="text" id=txtVBlank name=txtVBlank value="<%=rsFrm.Fields("VBlank")%>"></td>
				
			</tr>
			
			<% If Not IsNull(sAssetType) And sAssetType = "Tape"   Then %>
			<tr>
				<td align="right">Video RF:</td>
				<td>
					<select id=selRF name=selRF>
						<option><%=rsFrm.Fields("RF")%></option>
						<option>NA</option>
						<option>OK</option>
						<option>Marginal</option>
						<option>NG</option>
					</select>
				</td>
				<td align="right">Burst Level:</td><td><INPUT size=10 type="text" id=txtBurst_Level name=txtBurst_Level value="<%=rsFrm.Fields("Burst_Levl")%>"></td>
				<td align="right">Sync Level:</td><td><INPUT size=10 type="text" id=txtSyncLevel name=txtSyncLevel value="<%=rsFrm.Fields("Sync_levl")%>" ></td>
			</tr>
			<tr>
				<td align="right">Front Porch:</td><td><INPUT size=5 type="text" id=txtFrontPor name=txtFrontPor value="<%=rsFrm.Fields("Front_Por")%>"></td>
				<td align="right">Channel Conditions:</td><td><INPUT size=10 type="text" id=txtChannelCond name=txtChannelCond value="<%=rsFrm.Fields("Channel_Cond")%>"></td>
				<td align="right">Slate:</td><td><INPUT size=10 type="text" id=txtSlate name=txtSlate value="<%=rsFrm.Fields("Slate_QC")%>" ></td>
			</tr>
			<tr>
				<td align="right">VITS:</td><td><INPUT size=5 type="text" id=txtVITS name=txtVITS value="<%=rsFrm.Fields("VITS")%>"></td>
				<td align="right">Tracking:</td><td><INPUT size=10 type="text" id=txtTracking name=txtTracking value="<%=rsFrm.Fields("Tracking_QC")%>"></td>
				<td align="right">Label:</td><td><INPUT size=10 type="text" id=txtLabel name=txtLabel value="<%=rsFrm.Fields("Labels_QC")%>" ></td>
			</tr>
			<tr>
				<td align="right">VIRS:</td><td><INPUT size=5 type="text" id=txtVIRS name=txtVIRS value="<%=rsFrm.Fields("VIRS")%>"></td>
				<td align="right">Control Track:</td><td><INPUT size=10 type="text" id=txtCtl_Track name=txtCtl_Track value="<%=rsFrm.Fields("ctl_track")%>"></td>
				<td align="right">Shipper:</td><td><INPUT size=10 type="text" id=txtShipper name=txtShipper value="<%=rsFrm.Fields("Shipper_QC")%>" ></td>
			</tr>
			<tr>
				<td align="right">VITC:</td><td><INPUT size=10 type="text" id=txtVITC name=txtVITC value="<%=rsFrm.Fields("VITC")%>"></td>
				<td align="right">Tape Wrap:</td><td><INPUT size=10 type="text" id=txtTape_Wrap name=txtTape_Wrap value="<%=rsFrm.Fields("Tape_Wrap_QC")%>"></td>
				<td align="right">Subtitles:</td><td><INPUT size=10 type="text" id=txtSubTitles name=txtSubTitles value="<%=rsFrm.Fields("SubTitle_QC")%>" ></td>
			</tr>
			
			<% End If %>
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
