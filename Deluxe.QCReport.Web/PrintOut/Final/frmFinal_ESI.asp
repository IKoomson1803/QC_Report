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
		//frmFinal.hdnStatus.value = frmFinal.cmbStatus.Text;
		document.frmFinal.hdnStatus.value = document.frmFinal.cmbStatus.options[document.frmFinal.cmbStatus.selectedIndex].value;
	}
	function ChangeRecommendationComments()
	{
	   /*
			if (document.frmFinal.cmbStatus.options[document.frmFinal.cmbStatus.selectedIndex].value == 'PASSED')
			{
				document.frmFinal.txtRecommendationComments.disabled = true; 
				document.frmFinal.txtRecommendationComments.className = 'Disabled';
				
				document.frmFinal.txtVideoComments.disabled = true; 
				document.frmFinal.txtVideoComments.className = 'Disabled';
				
			}	
			else	
			{
				document.frmFinal.txtRecommendationComments.disabled = false; 
				document.frmFinal.txtRecommendationComments.className = 'Enabled';
				
				document.frmFinal.txtVideoComments.disabled = false; 
				document.frmFinal.txtVideoComments.className = 'Enabled';
			}	
		
		*/
	}
	
	function ResetRadioButtons(id)
	{
		
	  /*
		for (var i=0; i < frmFinal.length; i++)
		{
         if(frmFinal[i].id == id)
          {
          frmFinal[i].checked = false; 
         }
        }
		*/
		
	}
	
</SCRIPT>
<style>
	textarea.Enabled
	{
		WIDTH: 455px; 
		HEIGHT: 140px;
		BORDER-BOTTOM: #7F9DB9 1px solid;
		BORDER-TOP: #7F9DB9 1px solid;
		BORDER-LEFT: #7F9DB9 1px solid;
		BORDER-RIGHT: #7F9DB9 1px solid;
		BACKGROUND-COLOR: #FFFFFF
	}
	textarea.Disabled
	{
		WIDTH: 455px; 
		HEIGHT: 140px;
		BORDER-BOTTOM: #7F9DB9 1px solid;
		BORDER-TOP: #7F9DB9 1px solid;
		BORDER-LEFT: #7F9DB9 1px solid;
		BORDER-RIGHT: #7F9DB9 1px solid;
		BACKGROUND-COLOR: #f5f5dc
	}
	</style>
<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->
<table ID="tblForm" border="0" CELLPADDING="0" CELLSPACING="0" width="100%">
	<tr>
<%
'********************
'Declarations
'********************
dim rsFrm,  rsClient, sClient
dim sJobNum, sQCNum, sRev, sFrm, sqlClient
dim sql
dim strQCType
dim rsESI, sqlESI
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
		sql="SELECT Eval_Stat, qc_type, Comments FROM qcHeader " & _
			"WHERE QCNum = " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
			
		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql
		
		''Get the QC Type. This will be used to hide the sections that are not required for Runtime QC
        strQCType = rsFrm.Fields("qc_type")
		
'*******************************************************************************************************		
	Set rsESI = server.CreateObject("ADODB.Recordset") 	 
	sqlESI ="SELECT * FROM qcEndemolVideoAndAudio " & _
			"WHERE QCNum = " & clng(sQCNum) & " AND SubQCnum = " & cint(sRev)
			
		rsESI.ActiveConnection = cnQCS
		rsESI.Open sqlESI
	 
	
	
	''Response.write "LuminanceLevelsRating: " & rsESI.Fields("LuminanceLevelsRating")
	''Response.End	
		
	    		
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
		<form method="post" id=frmFinal name="frmFinal" action="procFinal_ESI.asp">
		<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
		<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
		<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">
		<input type="hidden" id=hdnStatus name=hdnStatus value="<%=rsFrm.Fields("Eval_Stat")%>">
			<tr>
				<td align="right">QC Status:</td>
				<td>
					<select name="cmbStatus" >
							<option value="">(Please Select)</option>
							<option value="PASSED" <%If rsFrm.Fields("Eval_Stat") = "PASSED" Then%>selected<%End If%>>PASSED</option>
							<option value="FAILED" <%If rsFrm.Fields("Eval_Stat") = "FAILED" Then%>selected<%End If%>>FAILED</option>
							<option value="HOLD" <%If rsFrm.Fields("Eval_Stat") = "HOLD" Then%>selected<%End If%>>HOLD</option>
						</select>	
				</td>
			</tr>
	
		 <tr>
		      <td align="right" valign="top">Luminance Levels Rating:</td>
		      <td>
			    <select id="cboLuminanceLevelsRating" name="cboLuminanceLevelsRating">
				  <option value=""></option>
				  <option value="Pass" <%If rsESI.Fields("LuminanceLevelsRating") = "Pass" Then%>selected<%End If%>>PASS</option>
				  <option value="Fail" <%If  rsESI.Fields("LuminanceLevelsRating") = "Fail" Then%>selected<%End If%>>FAIL</option>
				</select>
			  </td>
			   <td align="right" valign="top">Luminance Levels Details:</td>
		      <td>
			   <input type="textbox" id="txtLuminanceLevelsDetails" name="txtLuminanceLevelsDetails" size="120" value="<%=rsESI.Fields("LuminanceLevelsDetails")%>" /> 
			  </td>
	     </tr>
		 
		  <tr>
		      <td align="right" valign="top">Black Levels Rating:</td>
		      <td>
			    <select id="cboBlackLevelsRating" name="cboBlackLevelsRating">
				  <option value=""></option>
				  <option value="Pass" <%If rsESI.Fields("BlackLevelsRating") = "Pass" Then%>selected<%End If%>>PASS</option>
				  <option value="Fail" <%If  rsESI.Fields("BlackLevelsRating") = "Fail" Then%>selected<%End If%>>FAIL</option>
				</select>
			  </td>
			   <td align="right" valign="top">Black Levels Details:</td>
		      <td>
			   <input type="textbox" id="txtBlackLevelsDetails" name="txtBlackLevelsDetails" size="120" value="<%=rsESI.Fields("BlackLevelsDetails")%>" /> 
			  </td>
	     </tr>
		 		 
		  <tr>
		      <td align="right" valign="top">Chrominance Levels Rating:</td>
		      <td>
			 
			    <select id="cboChrominanceLevelsRating" name="cboChrominanceLevelsRating">
				  <option value=""></option>
				  <option value="Pass" <%If rsESI.Fields("ChrominanceLevelsRating") = "Pass" Then%>selected<%End If%>>PASS</option>
				  <option value="Fail" <%If  rsESI.Fields("ChrominanceLevelsRating") = "Fail" Then%>selected<%End If%>>FAIL</option>
				</select>
				
				 <!--
				  <input type="textbox" id="cboChrominanceLevelsRating" name="cboChrominanceLevelsRating" size="6" value="<%=rsESI.Fields("ChrominanceLevelsRating")%>"/> 
			    -->
			  </td>
			   <td align="right" valign="top">Chrominance Levels Details:</td>
		      <td>
			   <input type="textbox" id="txtChrominanceLevelsDetails" name="txtChrominanceLevelsDetails" size="120" value="<%=rsESI.Fields("ChrominanceLevelsDetails")%>"/> 
			  </td>
	     </tr>
		 
		  <tr>
		      <td align="right" valign="top">Audio Peaks And Loudness Rating:</td>
		      <td>
			    <select id="cboAudioPeaksAndLoudnessRating" name="cboAudioPeaksAndLoudnessRating">
				  <option value=""></option>
				  <option value="Pass" <%If rsESI.Fields("AudioPeaksAndLoudnessRating") = "Pass" Then%>selected<%End If%>>PASS</option>
				  <option value="Fail" <%If  rsESI.Fields("AudioPeaksAndLoudnessRating") = "Fail" Then%>selected<%End If%>>FAIL</option>
				</select>
			  </td>
			   <td align="right" valign="top">Audio Peaks And Loudness Details:</td>
		      <td>
			   <input type="textbox" id="txtAudioPeaksAndLoudnessDetails" name="txtAudioPeaksAndLoudnessDetails" size="120"  value="<%=rsESI.Fields("AudioPeaksAndLoudnessDetails")%>"/> 
			  </td>
	     </tr>
		 
		 <tr>
		      <td align="right" valign="top">Title Safe Rating:</td>
		      <td>
			    <select id="cboTitleSafeRating" name="cboTitleSafeRating">
				  <option value=""></option>
				  <option value="Pass" <%If rsESI.Fields("TitleSafeRating") = "Pass" Then%>selected<%End If%>>PASS</option>
				  <option value="Fail" <%If  rsESI.Fields("TitleSafeRating") = "Fail" Then%>selected<%End If%>>FAIL</option>
				</select>
			  </td>
			   <td align="right" valign="top">Title Safe Details:</td>
		      <td>
			   <input type="textbox" id="txtTitleSafeDetails" name="txtTitleSafeDetails" size="120"  value="<%=rsESI.Fields("TitleSafeDetails")%>"/> 
			  </td>
	     </tr>
		
		 <tr>
		      <td align="right" valign="top">Overall Comments:</td>
		      <td><textarea WRAP id="txtComments" name="txtComments" style="WIDTH: 455px; HEIGHT: 140px" scroll><%=rsFrm.Fields("Comments")%></textarea></td>
	     </tr>
		 
</table>


<table width="100%">
	<tr>
		<td align="right">
		<br>
		<% if sLevel >= 1 then%>
		<INPUT type="submit" id="Action" name="Action" value="Save" onclick="javascript:saveComboValues();">&nbsp;&nbsp;&nbsp;&nbsp;
		<% end if%>
		</td>
	</tr>
</form>
</table>

<%
Set rsFrm = Nothing
Set rsESI = Nothing
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>
