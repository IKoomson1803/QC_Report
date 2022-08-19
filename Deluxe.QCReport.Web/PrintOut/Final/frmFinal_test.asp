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

<BODY class="bodyForm">
<SCRIPT language="javascript">
	self.focus();
	function saveComboValues()
	{
		frmFinal.hdnStatus.value = frmFinal.cmbStatus.Text;
	}
	function ChangeRecommendationComments()
	{
		if (document.frmFinal.cmbStatus.options[document.frmFinal.cmbStatus.selectedIndex] != 'FAILED' )
			document.frmFinal.txtRecommendationComments.disabled = true; 
		else	
			document.frmFinal.txtRecommendationComments.disabled = false; 
	}
</SCRIPT>
<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->
<table ID="tblForm" border="0" CELLPADDING="0" CELLSPACING="0" width="100%">
	<tr>
<%
'********************
'Declarations
'********************
dim rsFrm, rsCombo, rsScale, rsClient, sClient
dim sJobNum, sQCNum, sRev, sFrm, sqlScale, nGradeScale, i, sqlClient
dim sql, sqlCombo, sOTPer80, sOTPer90, sOTVer2, sOTVer1
dim sCTPer80, sCTPer90, sCTVer2, sCTVer1, sCapPer80, sCapPer90
dim sCapVer2, sCapVer1, sComments, sOTVer, sOTPer, sCTVer, sCTPer, sCapVer, sCapPer
dim sGrdVidSel, sGrdAudioSel, sGrdOASel, txtRecommendationComments
'********************

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<td><font size=2><b>" & sQCNum & " - " & sRev & ":  " & sFrm & "</b></font></td>"

Set rsClient = server.CreateObject("ADODB.Recordset")
sqlClient = "Select CustID From qcHeader WHERE qcnum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev)
rsClient.ActiveConnection = cnQCS
rsClient.Open sqlClient
sClient = rsClient.Fields(0)
rsClient.Close
set rsClient = nothing
		
Set rsFrm = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Header Screen
'*******************************************************************************************************
		sql="SELECT Eval_Stat, Comments, OTPercent, OTVer, CTPercent, CTVer, CapPercent, CapVer, grdVideo, grdAudio, grdOverall, RecommendationComments " & _
			"FROM qcHeader " & _
			"WHERE QCNum = " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
'*******************************************************************************************************
		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql
		
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

<table id="tblForm" width="100%">
		<form method="post" id=frmFinal name="frmFinal" action="procFinal.asp">
		<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
		<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
		<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">
		<input type="hidden" id=hdnStatus name=hdnStatus value="<%=rsFrm.Fields("Eval_Stat")%>">
			<tr>
				<td align="right">Status:</td>
				<td>
	<OBJECT classid="clsid:8BD21D30-EC42-11CE-9E0D-00AA006002F3" 
	height=23 
	id="cmbStatus" 
	style="HEIGHT: 23px; LEFT: 0px; TOP: 0px; WIDTH: 100px" 
	width=100 VIEWASTEXT>
	<PARAM NAME="VariousPropertyBits" VALUE="679495707">
	<PARAM NAME="BackColor" VALUE="2147483653">
	<PARAM NAME="ForeColor" VALUE="2147483656">
	<PARAM NAME="MaxLength" VALUE="0">
	<PARAM NAME="BorderStyle" VALUE="0">
	<PARAM NAME="ScrollBars" VALUE="0">
	<PARAM NAME="DisplayStyle" VALUE="3">
	<PARAM NAME="MousePointer" VALUE="0">
	<PARAM NAME="Size" VALUE="3969;714">
	<PARAM NAME="PasswordChar" VALUE="0">
	<PARAM NAME="ListWidth" VALUE="0">
	<PARAM NAME="BoundColumn" VALUE="1">
	<PARAM NAME="TextColumn" VALUE="65535">
	<PARAM NAME="ColumnCount" VALUE="1">
	<PARAM NAME="ListRows" VALUE="8">
	<PARAM NAME="cColumnInfo" VALUE="0">
	<PARAM NAME="MatchEntry" VALUE="1">
	<PARAM NAME="ListStyle" VALUE="0">
	<PARAM NAME="ShowDropButtonWhen" VALUE="2">
	<PARAM NAME="ShowListWhen" VALUE="1">
	<PARAM NAME="DropButtonStyle" VALUE="1">
	<PARAM NAME="MultiSelect" VALUE="0">
	<PARAM NAME="Value" VALUE="">
	<PARAM NAME="Caption" VALUE="">
	<PARAM NAME="PicturePosition" VALUE="458753">
	<PARAM NAME="BorderColor" VALUE="2147483654">
	<PARAM NAME="SpecialEffect" VALUE="2">
	<PARAM NAME="Accelerator" VALUE="0">
	<PARAM NAME="GroupName" VALUE="">
	<PARAM NAME="FontName" VALUE="">
	<PARAM NAME="FontEffects" VALUE="1073741824">
	<PARAM NAME="FontHeight" VALUE="210">
	<PARAM NAME="FontOffset" VALUE="0">
	<PARAM NAME="FontCharSet" VALUE="0">
	<PARAM NAME="FontPitchAndFamily" VALUE="2">
	<PARAM NAME="ParagraphAlign" VALUE="1">
	<PARAM NAME="FontWeight" VALUE="400"></OBJECT>
					<%	

							Response.Write ("<script Language='javascript'>")
	
								Response.Write ("frmFinal.cmbStatus.AddItem('PASSED');")
								Response.Write ("frmFinal.cmbStatus.AddItem('FAILED');")
								Response.Write ("frmFinal.cmbStatus.Text = frmFinal.hdnStatus.value;")
								Response.Write ("frmFinal.cmbStatus.onChange = ChangeRecommendationComments();")
							Response.Write ("</script>")	
						%>
				</td>
			<%
				Set rsScale = server.CreateObject("ADODB.Recordset")
				sqlScale = "SELECT GradingScale FROM qcClients WHERE CustID = " & sClient
				rsScale.ActiveConnection = cnQCS
				rsScale.Open sqlScale
				nGradeScale = rsScale.Fields("GradingScale")
				rsScale.Close
				set rsScale = nothing
				
				sComments = rsFrm.Fields("Comments")
				txtRecommendationComments = rsFrm.Fields("RecommendationComments")
				sOTPer = rsFrm.Fields("OTPercent")
				sOTVer = rsFrm.Fields("OTVer")
				sCTPer = rsFrm.Fields("CTPercent")
				sCTVer = rsFrm.Fields("CTVer")
				sCapPer = rsFrm.Fields("CapPercent")
				sCapVer = rsFrm.Fields("CapVer")
			%>
			<td align="right">Grade</td>
			<td class="blackSquare">
				<table id="tblForm" width="100%">
					<tr>
						<td>Video:
						<select id="sGrdVideo" name="sGrdVideo">
							<option value=0>&nbsp;</option>
							<%for i = 1 to nGradeScale
								if rsFrm.Fields("grdVideo") = i then
									sGrdVidSel = "selected"
								else
									sGrdVidSel = ""
								end if%>
								<option value="<%=i%>" <%=sGrdVidSel%>><%=i%></option>
							<%next%>
						</select>
						</td>
						<td>Audio:
						<select id="sGrdAudio" name="sGrdAudio">
							<option value=0>&nbsp</option>
							<%for i = 1 to nGradeScale
								if rsFrm.Fields("grdAudio") = i then
									sGrdAudioSel = "selected"
								else
									sGrdAudioSel = ""
								end if%>
								<option value="<%=i%>" <%=sGrdAudioSel%>><%=i%></option>
							<%next%>
						</select>				
						</td>
						<td>Overall:
						<select id="sGrdOverall" name="sGrdOverall">
							<option value=0>&nbsp</option>
							<%for i = 1 to nGradeScale
								if rsFrm.Fields("grdOverall") = i then
									sGrdOASel = "selected"
								else
									sGrdOASel = ""
								end if%>
								<option value="<%=i%>" <%=sGrdOASel%>><%=i%></option>
							<%next%>
						</select>				
						</td>
					</tr>
				</table>
				</td>
			</tr>
</table>
<table id="tblForm" width="100%">
	<tr>
		<td align="right" valign="top">Comments:</td>
		<td><textarea WRAP id="txtComments" name="txtComments" style="WIDTH: 455px; HEIGHT: 140px" scroll><%=sComments%></textarea></td>
	</tr>
	<!--Added by Matt Feltham 15/06/2005 - Requested by Chris Watson  -->
	<tr>
		<td align="right" valign="top">Recommendations for Corrective Action:</td>
		<td><textarea WRAP id="txtRecommendationComments" name="txtRecommendationComments" style="WIDTH: 455px; HEIGHT: 140px" scroll><%=txtRecommendationComments%></textarea></td>
	</tr>
	<!-- End Change -->
</table>
<center>
<table id="tblForm" width="100%" cellspacing=0 cellpadding=0 border=1 bordercolor="#000000">
	<tr>
		<td align="center" colspan=3>Safe Area Check</td>
	<tr>
	<tr bgcolor="#999900">
		<td>
			<table id="tblForm">
				<tr>
					<td>&nbsp</td>
				</tr>
			</table>
		</td>
		<td align="center">
			<table id="tblForm">
				<tr>
					<td align="center">All Display Formats</td>
				</tr>
			</table>
		</td>
		<td align="center">
			<table id="tblForm">
				<tr>
					<td align="center">16:9 (when aspect ratio converted to 4:3)</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table id="tblForm">
				<tr>
					<td>Opening Titles</td>
				</tr>
			</table>
		</td>
		<td align="center">
			<table id="tblForm">
				<%if isnull(sOTPer) or sOTPer = "" then
					sOTPer80 = ""
					sOTPer90 = ""	
				  else
					if sOTPer = "80%" then
						sOTPer80 = "Checked"
					else
						sOTPer90 = "Checked"
					end if
				  end if
				%>
				<tr>
					<td align="center"><input type="radio" name="radOTPercent" value="80%" <%=sOTPer80%>> 80% Safe</td>
					<td>&nbsp</td>
					<td align="center"><input type="radio" name="radOTPercent" value="90%" <%=sOTPer90%>> 90% Safe</td>
				</tr>
			</table>
		</td>
		<td align="center">
			<table id="tblForm">
				<%if isnull(sOTVer) or sOTVer = "" then
					sOTVer2 = ""
					sOTVer1 = ""	
				  else
					if sOTVer = "4x3 FF" then
						sOTVer2 = "Checked"
					else
						sOTVer1 = "Checked"
					end if
				  end if
				%>						
				<tr>
					<td align="center"><input type="radio" name="radOTVer" value="4x3 L/B 1.55:1" <%=sOTVer1%>> Safe for: 4x3 L/B 1.55:1</td>
					<td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td>
					<td align="center"><input type="radio" name="radOTVer" value="4x3 FF" <%=sOTVer2%>> Safe for: 4x3 FF</td>	
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table id="tblForm">
				<tr>
					<td>Closing Titles</td>
				</tr>
			</table>
		</td>
		<td align="center">
			<table id="tblForm">
				<%if isnull(sCTPer) or sCTPer = "" then
					sCTPer80 = ""
					sCTPer90 = ""	
				  else
					if sCTPer = "80%" then
						sCTPer80 = "Checked"
					else
						sCTPer90 = "Checked"
					end if
				  end if
				%>
				<tr>
					<td align="center"><input type="radio" name="radCTPercent" value="80%" <%=sCTPer80%>> 80% Safe</td>
					<td>&nbsp</td>
					<td align="center"><input type="radio" name="radCTPercent" value="90%" <%=sCTPer90%>> 90% Safe</td>
				</tr>					
			</table>
		</td>
		<td align="center">
			<table id="tblForm">
				<%if isnull(sCTVer) or sOTVer = "" then
					sCTVer2 = ""
					sCTVer1 = ""	
				  else
					if sCTVer = "4x3 FF" then
						sCTVer2 = "Checked"
					else
						sCTVer1 = "Checked"
					end if
				  end if
				%>	
				<tr>
					<td align="center"><input type="radio" name="radCTVer" value="4x3 L/B 1.55:1" <%=sCTVer1%>> Safe for: 4x3 L/B 1.55:1</td>
					<td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td>
					<td align="center"><input type="radio" name="radCTVer" value="4x3 FF" <%=sCTVer2%>> Safe for: 4x3 FF</td>	
				</tr>					
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table id="tblForm">
				<tr>
					<td>Captions</td>
				</tr>
			</table>
		</td>
		<td align="center">
			<table id="tblForm">
				<%if isnull(sCapPer) or sCapPer = "" then
					sCapPer80 = ""
					sCapPer90 = ""	
				  else
					if sCapPer = "80%" then
						sCapPer80 = "Checked"
					else
						sCapPer90 = "Checked"
					end if
				  end if
				%>
				<tr>
					<td align="center"><input type="radio" name="radCapPercent" value="80%" <%=sCapPer80%>> 80% Safe</td>
					<td>&nbsp</td>
					<td align="center"><input type="radio" name="radCapPercent" value="90%" <%=sCapPer90%>> 90% Safe</td>
				</tr>
			</table>
		</td>
		<td align="center">
			<table id="tblForm">
				<%if isnull(sCapVer) or sCapVer = "" then
					sCapVer2 = ""
					sCapVer1 = ""	
				  else
					if sCapVer = "4x3 FF" then
						sCapVer2 = "Checked"
					else
						sCapVer1 = "Checked"
					end if
				  end if
				%>	
				<tr>
					<td align="center"><input type="radio" name="radCapVer" value="4x3 L/B 1.55:1" <%=sCapVer1%>> Safe for: 4x3 L/B 1.55:1</td>
					<td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td>
					<td align="center"><input type="radio" name="radCapVer" value="4x3 FF" <%=sCapVer2%>> Safe for: 4x3 FF</td>	
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>
</center>
<table width="100%">
	<tr>
		<td align="right">
		<% if sLevel >= 1 then%>
		<INPUT type="submit" id="Action" name="Action" value="Save" onclick="javascript:saveComboValues();">&nbsp;&nbsp;&nbsp;&nbsp;
		<% end if%>
		</td>
	</tr>
</form>
</table>

<%
Set rsFrm = Nothing
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>
