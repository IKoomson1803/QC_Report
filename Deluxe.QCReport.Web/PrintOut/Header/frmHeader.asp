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
<SCRIPT language="javascript">
	self.focus();
	function saveComboValues()
	{
	   	//frmHeader.selCustName.value = frmHeader.cmbCust.Text;
		//frmHeader.selVersion.value = frmHeader.ComboBox1.Text;
		//frmHeader.selTapeDesc.value = frmHeader.cmbTapeDesc.Text;
	}
	function itemChange()
	{
		frmHeader.hdnChange.value = "1";
	}
	function window_onunload()
	{
	/*	if (confirm("Are you sure you want leave without saving?"))
			{
			
			}
		else
			{ 
			  return false
			}*/
	}
</SCRIPT>
<BODY onclick="javascript:frmHeader.Action.focus;" class="bodyForm" topmargin=0 leftmargin=0 rightmargin=0 onunload="javascript:return window_onunload();">

<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->
<table ID="tblForm" border="0" CELLPADDING="0" CELLSPACING="0" width="100%">
	<tr>
		<td>
<%
'********************
'Declarations
'********************
dim rsFrm, rsCombo
dim sJobNum, sQCNum, sRev, sFrm
dim sql, sqlCombo, sAssetType
'********************

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<td><font size=2><b>" & sQCNum & " - " & sRev & ":  " & sFrm & "</b></font></td>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Header Screen
'*******************************************************************************************************
		sql="SELECT Pono, This_part, Tot_Part, QC_date, " & _
				"Aspect, CustName, Show, Epis_no, Epis_Name, " & _
				"Version, TapeDesc1, Format, Standard, TRT, TapeNumber, " & _
				"Subtitle, HLanguage, Status, HeadLogo, TailLogo, AssetType, Filename, CatalogueID " & _
			"FROM qcHeader " & _
			"INNER JOIN qcClients ON qcHeader.CustId = qcClients.CustID " & _
			"GROUP BY Pono, This_part, Tot_Part, Epis_no, " & _
				"QC_date, Aspect, CustName, Show, Epis_Name, " & _
				"Version, TapeDesc1, Format, Standard, TRT, TapeNumber, " & _
				"Subtitle, HLanguage, Status, HeadLogo, TailLogo, Qcnum, subQcnum, AssetType, Filename, CatalogueID " & _
			"HAVING Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql
			
		sAssetType = rsFrm.Fields("AssetType")
		
		If IsNull(sAssetType) or sAssetType = ""  Then
	        sAssetType = "Tape"
        End If 

 %>
		<TD width=40% align=right>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" target="main" tabindex="10">Reports&nbsp;</a>
		</TD>
		<td>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" target="main" tabindex="10">			
 			<IMG HSPACE="1" HEIGHT="19" WIDTH="18" BORDER="0" SRC="../images/reports_off.gif" ALT="Reports"></a>
		</TD>
	</tr>
</table>
<!--#include file="../include/frmToolBar.asp"-->
		<form method="post" name="frmHeader" action="procHeader.asp">
		<table ID="tblForm" width=100%>
		<input type="hidden" id=hdnChange name=hdnChange value="">
		<input type="hidden" id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
		<input type="hidden" id=hdnRev name=hdnRev value="<%=sRev%>">
		<input type="hidden" id="selVersion" name="selVersion" value="<%=rsFrm.Fields("Version")%>">
		<input type="hidden" id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">
		<input type="hidden" id="selTapeDesc" name="selTapeDesc" value="<%=rsFrm.Fields("TapeDesc1")%>">
		<input type="hidden" id="selCustName" name="selCustName" value="<%=rsFrm.Fields("CustName")%>">
			<tr>
				<td align="right">Client P/O #:</td><td>
                <INPUT type="text" id=txtPONum name=txtPONum value="<%=rsFrm.Fields("pono")%>" onkeypress="javascript:itemChange();" size="20"></td>
				<td align="right">UID No./Production ID:</td><td>
                <INPUT type="text" id="txtCatalogueID" name="txtCatalogueID" value="<%=rsFrm.Fields("CatalogueID")%>" size="20" ></td>
				
				<!--
				<td align="right">Part:</td><td><INPUT size=5 type="text" id=txtThis_Part name=txtThis_Part value="<%=rsFrm.Fields("This_Part")%>" > of <INPUT size=5 type="text" id=txtTot_Part name=txtTot_Part value=<%=rsFrm.Fields("Tot_Part")%>></td>
			    --->
			</tr>
			<tr>
				<td align="right">QC Date:</td><td>
                <INPUT type="text" id=txtQCDate name=txtQCDate value="<%=rsFrm.Fields("QC_Date")%>" size="20" ></td>
				<td align="right">Aspect Ratio:</td>
				<td>
				<select id=selAspectRatio name=selAspectRatio>
					<option><%=rsFrm.Fields("Aspect")%></option>
					<%	
						sqlCombo = "SELECT AspectRatio FROM optAspectRatio ORDER BY AspectRatio"
						rsCombo.ActiveConnection = cnQCS
						rsCombo.Open sqlCombo
							do while not rsCombo.EOF %>
								<option><%=rsCombo.Fields("AspectRatio")%></option>
					    <% 
							rsCombo.MoveNext
							loop
							rsCombo.Close 
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td align="right">Client Name:</td>
						<td>
		
	           <select id="cmbCust" name="cmbCust">
					<option><%=rsFrm.Fields("CustName")%></option>
	
					<%	
						sqlCombo = "SELECT CustName FROM qcClients ORDER BY CustName"
						rsCombo.ActiveConnection = cnQCS
						rsCombo.Open sqlCombo
						do while not rsCombo.EOF
						%>
							<option><%=rsCombo.Fields("CustName")%></option>
					    <% 
							rsCombo.MoveNext
							loop
							rsCombo.Close 
						%>
		        </select>
				</td>
			   <!--
				<td><%=rsFrm.Fields("CustName")%>
				<input type="hidden" id="hdnCustName" name="hdnCustName" value="<%=rsFrm.Fields("CustName")%>">
				</td>
			    -->
				
				<td align="right">Title:</td><td>
                <INPUT type="text" id=txtShow name=txtShow value="<%=rsFrm.Fields("Show")%>" size="40">
			</tr>
			<tr>
				<td align="right">Episode #:</td><td>
                <INPUT type="text" id=txtEpNum name=txtEpNum value="<%=rsFrm.Fields("Epis_no")%>" size="20"></td>
				<td align="right">Episode Name:</td><td>
                <INPUT type="text" id=txtEpName name=txtEpName value="<%=rsFrm.Fields("Epis_Name")%>" size="40"></td>
			</tr>
			<tr>
				<td align="right">Version:</td>
				<td>
				 <select id="cmbVersion" name="cmbVersion">
					<option><%=rsFrm.Fields("Version")%></option>
	
					<%	
						sqlCombo = "SELECT Version FROM optVersion ORDER BY Version"
						rsCombo.ActiveConnection = cnQCS
						rsCombo.Open sqlCombo
						do while not rsCombo.EOF
						%>
							<option><%=rsCombo.Fields("Version")%></option>
					    <% 
							rsCombo.MoveNext
							loop
							rsCombo.Close 
						%>
		        </select>
			</td>
				<td align="right">Format:</td>
				<td>
				<select id=selFormat name=selFormat>
					<option><%=rsFrm.Fields("Format")%></option>
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
			</tr>
			<tr>

				<td align="right">Standard:</td>
				<td>
					<select id=selStandard name=selStandard>
						<option><%=rsFrm.Fields("Standard")%></option>
						
						<%	
						sqlCombo = "SELECT Standard FROM optStandard ORDER BY Standard"
						rsCombo.ActiveConnection = cnQCS
						rsCombo.Open sqlCombo
							do while not rsCombo.EOF %>
								<option><%=rsCombo.Fields("Standard")%></option>
					    <% 
							rsCombo.MoveNext
							loop
							rsCombo.Close 
						%>
				
					</select>&nbsp;&nbsp;
				</td>
				<td align="right">T.R.T:</td>
				<td><INPUT size=10 type="text" id=txtTRT name=txtTRT value="<%=rsFrm.Fields("TRT")%>"></td>
			</tr>
			<tr>
				<td align="right">Subtitle:</td>
				<td><input type="text" name="txtSubtitle" id="txtSubtitle" value="<%=rsFrm.Fields("Subtitle")%>" size="20"></td>
				
				<% 
				  If Not IsNull(sAssetType) And sAssetType = "File"   Then
				     Response.Write "<td align='right'>File Name:</td>"
				     Response.Write "<td><input type='text' name='txtFilename' id='txtFilename' value='" & rsFrm.Fields("Filename") & "' size='100'></td>" 	
				 Else   
                    Response.Write "<td align='right'>Tape Number:</td>"
				    Response.Write "<td><input type='text' name='txtTapeNum' id='txtTapeNum' value='" & rsFrm.Fields("TapeNumber") & "' size='20'></td>" 
				End If 
				%>
				
			</tr>
			<tr>
				<td align="right">Language:</td>
				<td><input type="text" name="txtHLanguage" id="txtHLanguage" value="<%=rsFrm.Fields("HLanguage")%>" size="20"></td>
				<td align="right">Head Logo:</td>
				<td><input type="text" id="txtHeadLogo" name="txtHeadLogo" value="<%=rsFrm.Fields("HeadLogo")%>" size="20"></td>		
			</tr>
			<tr>
				<td align="right">Description:</td>
				<td>
				<select id="cmbTapeDesc" name="cmbTapeDesc">
					<option><%=rsFrm.Fields("TapeDesc1")%></option>
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
				<td align="right">Tail Logo:</td>
				<td>
                <input type="text" id="txtHeadLogo" name="txtTailLogo" value="<%=rsFrm.Fields("TailLogo")%>" size="20">

			</tr>
		</table>
		<%if sLevel >= 1 then%>
		<table width=100%>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="right">
				<INPUT type="submit" id="Action" name="Action" value="Save" onclick="javascript:saveComboValues();">&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
		<%end if%>
		</form>
<%
rsFrm.Close
Set rsFrm = Nothing
Set rsCombo = Nothing
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>