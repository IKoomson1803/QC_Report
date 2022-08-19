<%@ Language=VBScript %>
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
</SCRIPT>
<script language="vbscript">
	
</script>
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
dim sql
'********************

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<td><font size=2><b>" & sQCNum & " - " & sRev & ":  " & sFrm & "</b></font></td>"

Set rsFrm = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Overall Specs Screen
'*******************************************************************************************************
		sql=" SELECT * FROM qcEndemolSpecifics " & _
			" WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
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
<br>	

<form method="post" name="frmSpecifics" action="procSpecifics.asp">
		<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
		<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
		<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">


<table ID="tblForm"  width="100%" cellpadding="1" cellspacing="0" border="0">
         <tr>
		      <td align="right" valign="top">ESI End Credit / Logo:</td>
		      <td>
			    <select id="cboESIEndCreditOrLogo" name="cboESIEndCreditOrLogo">
				  <option value=""></option>
				  <option value="Y" <%If rsFrm.Fields("ESIEndCreditOrLogo") = "Y" Then%>selected<%End If%>>YES</option>
				  <option value="N" <%If rsFrm.Fields("ESIEndCreditOrLogo") = "N" Then%>selected<%End If%>>NO</option>
				</select>
			  </td>
			   <td align="right" valign="top">Seamless Or Parted:</td>
		      <td>
			   <select id="cboSeamlessOrParted" name="cboSeamlessOrParted">
				  <option value=""></option>
				  <option value="Seamless" <%If rsFrm.Fields("SeamlessOrParted") = "Seamless" Then%>selected<%End If%>>Seamless</option>
				  <option value="Parted" <%If rsFrm.Fields("SeamlessOrParted") = "Parted" Then%>selected<%End If%>>Parted</option>
				</select>
			  </td>
			  <td align="right" valign="top">Is Textless Present:</td>
		      <td>
			   <select id="cboIsTextlessPresent" name="cboIsTextlessPresent">
				  <option value=""></option>
				  <option value="Y" <%If rsFrm.Fields("IsTextlessPresent") = "Y" Then%>selected<%End If%>>YES</option>
				  <option value="N" <%If rsFrm.Fields("IsTextlessPresent") = "N" Then%>selected<%End If%>>NO</option>
				</select>
			  </td>
	     </tr>
		 
		 <tr>
		      <td align="right" valign="top">Content Censored - Bleeped Or Blurred:</td>
		      <td>
			    <select id="cboContentCensoredBleepedOrBlurred" name="cboContentCensoredBleepedOrBlurred">
				  <option value=""></option>
				  <option value="Y" <%If rsFrm.Fields("ContentCensoredBleepedOrBlurred") = "Y" Then%>selected<%End If%>>YES</option>
				  <option value="N" <%If rsFrm.Fields("ContentCensoredBleepedOrBlurred") = "N" Then%>selected<%End If%>>NO</option>
				</select>
			  </td>
			   <td align="right" valign="top">Flashing Lights / Epilepsy Warning Present:</td>
		      <td>
			   <select id="cboFlashingLightsOrEpilepsyWarningPresent" name="cboFlashingLightsOrEpilepsyWarningPresent">
				  <option value=""></option>
				  <option value="Y" <%If rsFrm.Fields("FlashingLightsOrEpilepsyWarningPresent") = "Y" Then%>selected<%End If%>>YES</option>
				  <option value="N" <%If rsFrm.Fields("FlashingLightsOrEpilepsyWarningPresent") = "N" Then%>selected<%End If%>>NO</option>
				</select>
			  </td>
			  <td align="right" valign="top">Time Specific Text Or Audio Present:</td>
		      <td>
			   <select id="cboTimeSpecificTextOrAudioPresent" name="cboTimeSpecificTextOrAudioPresent">
				  <option value=""></option>
				  <option value="Y" <%If rsFrm.Fields("TimeSpecificTextOrAudioPresent") = "Y" Then%>selected<%End If%>>YES</option>
				  <option value="N" <%If rsFrm.Fields("TimeSpecificTextOrAudioPresent") = "N" Then%>selected<%End If%>>NO</option>
				</select>
			  </td>
	     </tr>
		 
		  <tr>
		      <td align="right" valign="top">Extreme Language Present:</td>
		      <td>
			    <select id="cboExtremeLanguagePresent" name="cboExtremeLanguagePresent">
				  <option value=""></option>
				  <option value="Y" <%If rsFrm.Fields("ExtremeLanguagePresent") = "Y" Then%>selected<%End If%>>YES</option>
				  <option value="N" <%If rsFrm.Fields("ExtremeLanguagePresent") = "N" Then%>selected<%End If%>>NO</option>
				</select>
			  </td>
			   <td align="right" valign="top">Nudity Present:</td>
		      <td>
			   <select id="cboNudityPresent" name="cboNudityPresent">
				  <option value=""></option>
				  <option value="Y" <%If rsFrm.Fields("NudityPresent") = "Y" Then%>selected<%End If%>>YES</option>
				  <option value="N" <%If rsFrm.Fields("NudityPresent") = "N" Then%>selected<%End If%>>NO</option>
				</select>
			  </td>
			  <td align="right" valign="top">Is M & E Complete:</td>
		      <td>
			   <select id="cboIsMandEComplete" name="cboIsMandEComplete">
				  <option value=""></option>
				  <option value="Y" <%If rsFrm.Fields("IsMandEComplete") = "Y" Then%>selected<%End If%>>YES</option>
				  <option value="N" <%If rsFrm.Fields("IsMandEComplete") = "N" Then%>selected<%End If%>>NO</option>
				  <option value="N/A" <%If rsFrm.Fields("IsMandEComplete") = "N/A" Then%>selected<%End If%>>N/A</option>
				</select>
			  </td>
	     </tr>
 
	
</table>
<br>


<br>
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
cnQCS.Close
set cnQCS = Nothing
%>



</BODY>
</HTML>
