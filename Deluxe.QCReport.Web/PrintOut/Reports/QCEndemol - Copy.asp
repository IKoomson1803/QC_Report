<!-- Updated to ensure no blank channels are added to the report Isaac Koomson 04/01/2012 -->
<!--<link REL="stylesheet" TYPE="text/css" HREF="../css/qcs.css">-->
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak {break-after: always; page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; }
</style>

<%
Dim rsVidAud, sqlVidAud

set rsVidAud = Server.CreateObject("ADODB.Recordset")

sqlVidAud ="SELECT * FROM qcEndemolVideoAndAudio " & _
			" WHERE QCNum = " & clng(sQCNum) & " AND SubQCnum = " & cint(sRev)
			
rsVidAud.ActiveConnection = cnQCS
rsVidAud.Open sqlVidAud

%>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype2">RUNTIME QUALITY CONTROL WITH LOG FOR<br>
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
	<!--
    <td align="right">
		Page:&nbsp;1&nbsp;of&nbsp;1
    </td>
	-->
  </tr>
  <tr>
	<td colspan="3" align="center"><b><%=rsHeader.Fields("Address")%></b>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000" height="36">
  <tr>
  <td>
       <table width="100%" border="0" cellspacing="0" cellpadding="1" >
	       <tr>
             <td >Title:&nbsp; <b><%=rsHeader.Fields("Show")%></b></td>
             <td>Part#:&nbsp;<b>Part <%=rsHeader.Fields("This_part")%> of <%=rsHeader.Fields("tot_part")%></b></td>
             <td>QC#:&nbsp;<b><%=rsHeader.Fields("QCNum")%></b></td>
			</tr> 
			 <tr> 
                <td colspan="3">&nbsp;</td>
            </tr>
			<tr>
             <td >Series:&nbsp; <b><%=rsHeader.Fields("Epis_name")%></b></td>
             <td>Episode#:&nbsp;<b><%=rsHeader.Fields("Epis_no")%></b></td>
             <td>WO#:&nbsp;<b><%=rsHeader.Fields("wonum")%></b></td>
			</tr> 
			 <tr> 
                <td colspan="3">&nbsp;</td>
            </tr>
            </tr>
	
			<tr>
              <td >Description:&nbsp; <b><%=rsHeader.Fields("Version")%></b></td>
              <td>TRT:&nbsp;<b><%=rsHeader.Fields("TRT")%></b></b></td>
			  <td width="25%">Time Code:&nbsp; <b><%=rsHeader.Fields("Time_Code")%></b></td>
   			</tr> 
		
		 </table>
	</td>
  </tr>
 </table>
 
 

<table width="100%" class="left_right_bottom_border">
  <tr>
    <td>
	<% If sAssetType = "Tape" Then %>
		  <table width="100%" border="0" cellspacing="0" cellpadding="1">
		   <tr><td colspan="3">Tape #: <b><%=rsHeader.Fields("TapeNumber")%></b></td></tr>
		   <tr> 
                <td colspan="4">&nbsp;</td>
            </tr>
			<tr> 
			  <td width="25%">Format:&nbsp; <b><%=rsHeader.Fields("Format")%></b></td>
			  <td width="25%">Standard:&nbsp; <b><%=rsHeader.Fields("Standard")%></b></td>
			  <td width="25%">Aspect Ratio:&nbsp; <b><%=rsHeader.Fields("Aspect")%></b></td>
			  <td width="25%">&nbsp; </td>
			</tr>
		</table>
	<% Else %>
		  <table width="100%" border="0" cellspacing="0" cellpadding="1">
		   <tr><td colspan="3">Filename: <b><%=rsHeader.Fields("Filename")%></b></td></tr>
		   <tr> 
                <td colspan="4">&nbsp;</td>
            </tr>
			<tr> 
			  <td width="25%">Format:&nbsp; <b><%=rsHeader.Fields("Format")%></b></td>
			  <td width="25%">Standard:&nbsp; <b><%=rsHeader.Fields("Standard")%></b></td>
			  <td width="25%">Aspect Ratio:&nbsp; <b><%=rsHeader.Fields("Aspect")%></b></td>
			   <td width="25%">Frame Size:&nbsp; <b><%=rsHeader.Fields("Frame_Size")%></b></td>
			</tr>
			 <tr> 
                <td colspan="4">&nbsp;</td>
            </tr>
			<tr> 
			  <td width="25%">Video Codec:&nbsp; <b><%=rsHeader.Fields("Video_Codec")%></b></td>
			  <td width="25%">Audio Codec:&nbsp; <b><%=rsHeader.Fields("Audio_Codec")%></b></td>
			  <td width="25%">Audio Bit Depth:&nbsp; <b><%=rsHeader.Fields("Audio_Bit_Depth")%></b></td>
			  <td width="25%">Sample Rate:&nbsp; <b><%=rsHeader.Fields("Sample_Rate")%></b></td>
			</tr>
						
		</table>
	<% End If %>
    </td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="100%" class="left_right_top_border">
  <tr>
    <td>QC Start Date: &nbsp;<%=rsHeader.Fields("QC_Date")%></td>
	<td>QC End Date: &nbsp;<%=rsVidAud.Fields("QCResultDate")%></td>
	<td>QC Operator: &nbsp;<%=rsHeader.Fields("FullName")%></td>
	<td>QC VTR: &nbsp;<%=rsHeader.Fields("QC_VTR")%></td>
	<td>Control Room #: &nbsp;<%=rsHeader.Fields("Bay_num")%></td>
  </tr>
</table>

<!-- Start Specifics -->

<%
Dim rsSpecifics, sqlSpecifics

set rsSpecifics = Server.CreateObject("ADODB.Recordset")

sqlSpecifics = " SELECT * FROM qcEndemolSpecifics " & _
			" WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
			
rsSpecifics.ActiveConnection = cnQCS
rsSpecifics.Open sqlSpecifics

%>

<table width="100%" class="blackSquare" >
 
   <tr> 
      <td >&nbsp;ESI End Credit / Logo: <b>&nbsp;<%=rsSpecifics.Fields("ESIEndCreditOrLogo")%></b></td>
      <td >&nbsp;Seamless Or Parted: <b>&nbsp;<%=rsSpecifics.Fields("SeamlessOrParted")%></b></td>
      <td >&nbsp;Is Textless Present: <b>&nbsp;<%=rsSpecifics.Fields("IsTextlessPresent")%></b></td>
   </tr>
   <tr ><td colspan="3">&nbsp;</td></tr>
   <tr> 
      <td >&nbsp;Content Censored - Bleeped Or Blurred: <b>&nbsp;<%=rsSpecifics.Fields("ContentCensoredBleepedOrBlurred")%></b></td>
      <td >&nbsp;Flashing Lights / Epilepsy Warning Present: <b>&nbsp;<%=rsSpecifics.Fields("FlashingLightsOrEpilepsyWarningPresent")%></b></td>
      <td >&nbsp;Time Specific Text Or Audio Present: <b>&nbsp;<%=rsSpecifics.Fields("TimeSpecificTextOrAudioPresent")%></b></td>
   </tr>
    <tr ><td colspan="3">&nbsp;</td></tr>
   <tr> 
      <td >&nbsp;Extreme Language Present: <b>&nbsp;<%=rsSpecifics.Fields("ExtremeLanguagePresent")%></b></td>
      <td >&nbsp;Nudity Present: <b>&nbsp;<%=rsSpecifics.Fields("NudityPresent")%></b></td>
      <td >&nbsp;Is M & E Complete: <b>&nbsp;<%=rsSpecifics.Fields("IsMandEComplete")%></b></td>
   </tr>
 
</table>

<%
Set rsSpecifics = Nothing

%>

<!-- End Specifics -->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td align="center" class="blackSquare" colspan="3" > 
            <font class="txt_italic" size="3"><b>PROGRAM FORMAT</b></font>
          </td>
        </tr>
        <tr>
            <td width="42%" class="txt_boldtype2 left_bottom_border" >&nbsp;Description</td>
           <td width="36%" class="txt_boldtype2 left_bottom_border">&nbsp;Time Code</td>
           <td width="22%" class="txt_boldtype2 left_right_bottom_border">&nbsp;Length</td>
        </tr>
        <%while not rsTapeFormat.EOF%>
              <tr>
                <td width="42%" class="left_bottom_border" >&nbsp;<%=rsTapeFormat.Fields("description")%></td>
                <td width="36%" class="left_bottom_border">&nbsp;<%=rsTapeFormat.Fields("Time_Code")%></td>
                <td width="22%" class="left_right_bottom_border">&nbsp;<%=rsTapeFormat.Fields("Length")%></td>
              </tr>
            <%rsTapeFormat.MoveNext
       wend%>
  </table>
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
	  
	<table width="100%" border="0" cellspacing="0" cellpadding="1" >
	   <tr>
          <td align="center" colspan="9" class="blackSquare" > 
            <font class="txt_italic" size="3"><b>AUDIO SPECIFICATIONS</b></font>
          </td>
        </tr>
			<tr>
				<td height="17px" width="6%" class="txt_boldtype2 left_bottom_border">&nbsp;</td>
				<td height="17px" width="12%" class="txt_boldtype2 left_bottom_border"><b>Track</b></td>
				<td height="17px" width="12%" class="txt_boldtype2 left_bottom_border"><b>Lang</b></td>
				<td height="17px" width="12%" class="txt_boldtype2 left_bottom_border"><b>LUFS</b></td>
				<td height="17px" width="12%" class="txt_boldtype2 left_bottom_border">Tone</td>
				<td height="17px" width="12%" class="txt_boldtype2 left_bottom_border">Avg db</td>
				<td height="17px" width="12%" class="txt_boldtype2 left_bottom_border">Peak</td>
				<td height="17px" width="12%" class="txt_boldtype2 left_bottom_border">True</td>
				<td height="17px" width="12%" class="txt_boldtype2 left_right_bottom_border">F/S</td>
			</tr>
			<!--#include file="AudioSpecifications_1_12_ESI.asp" -->
			<!--#include file="AudioSpecifications_13_24_ESI.asp" -->
	</table>  
	
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table> 


<!-- Start Video And Audio -->



<table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td align="center" class="blackSquare" colspan="3" > 
            <font class="txt_italic" size="3"><b>VIDEO & AUDIO</b></font>
          </td>
        </tr>
        <tr>
            <td width="42%" class="txt_boldtype2 left_bottom_border" >&nbsp;Item</td>
           <td width="36%" class="txt_boldtype2 left_bottom_border">&nbsp;Rating</td>
           <td width="22%" class="txt_boldtype2 left_right_bottom_border">&nbsp;Description</td>
        </tr>
       
		  <tr>
			<td width="42%" class="left_bottom_border" >&nbsp;LuminanceLevels:</td>
			<td width="36%" class="left_bottom_border">&nbsp;<%=rsVidAud.Fields("LuminanceLevelsRating")%></td>
			<td width="22%" class="left_right_bottom_border">&nbsp;<%=rsVidAud.Fields("LuminanceLevelsDetails")%></td>
		  </tr>
		  
		  <tr>
			<td width="42%" class="left_bottom_border" >&nbsp;BlackLevels:</td>
			<td width="36%" class="left_bottom_border">&nbsp;<%=rsVidAud.Fields("BlackLevelsRating")%></td>
			<td width="22%" class="left_right_bottom_border">&nbsp;<%=rsVidAud.Fields("BlackLevelsDetails")%></td>
		  </tr>
		  
		   <tr>
			<td width="42%" class="left_bottom_border" >&nbsp;ChrominanceLevels:</td>
			<td width="36%" class="left_bottom_border">&nbsp;<%=rsVidAud.Fields("ChrominanceLevelsRating")%></td>
			<td width="22%" class="left_right_bottom_border">&nbsp;<%=rsVidAud.Fields("ChrominanceLevelsDetails")%></td>
		  </tr>
		  
		   <tr>
			<td width="42%" class="left_bottom_border" >&nbsp;AudioPeaksAndLoudness:</td>
			<td width="36%" class="left_bottom_border">&nbsp;<%=rsVidAud.Fields("AudioPeaksAndLoudnessRating")%></td>
			<td width="22%" class="left_right_bottom_border">&nbsp;<%=rsVidAud.Fields("AudioPeaksAndLoudnessDetails")%></td>
		  </tr>
		  
		   <tr>
			<td width="42%" class="left_bottom_border" >&nbsp;TitleSafe:</td>
			<td width="36%" class="left_bottom_border">&nbsp;<%=rsVidAud.Fields("TitleSafeRating")%></td>
			<td width="22%" class="left_right_bottom_border">&nbsp;<%=rsVidAud.Fields("TitleSafeDetails")%></td>
		  </tr>
		  
		   
		   <tr style="font-weight:bold; font-size:1.8em;height:30px;text-align:center;">
			<td width="78%" colspan="2" class="left_bottom_border" >&nbsp;QC Result:</td>
			<td width="22%" class="left_right_bottom_border">&nbsp;<%=rsVidAud.Fields("QCResult")%></td>
		  </tr>
          
  </table>

<%
Set rsVidAud = Nothing

%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<!-- End Video And Audio -->

 
<!-- START  LOG  -->

<div class="PageBreak"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype2">RUNTIME QUALITY CONTROL WITH LOG FOR<br>
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
	<!--
    <td align="right">
		Page:&nbsp;1&nbsp;of&nbsp;2
    </td>
	-->
  </tr>
  <tr>
	<td colspan="3" align="center"><b><%=rsHeader.Fields("Address")%></b>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<%

rsBVMastLog.Open sqlBVIMastLog,,3,3

%> 

<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
   	<td class="left_top_bottom_border" style="font-weight:bold;text-align:center;">
	1 = Very Annoying
	</td>
	<td class="left_top_bottom_border" style="font-weight:bold;text-align:center;">
	2 = Annoying
	</td>
	<td class="left_top_bottom_border" style="font-weight:bold;text-align:center;">
	3 = Slightly Annoying
	</td>
	<td class="left_top_bottom_border" style="font-weight:bold;text-align:center;">
	4 = Perceptible but not Annoying
	</td>
	<td class="blackSquare" style="font-weight:bold;text-align:center;">
	5 = ImPerceptible
	</td>
	
  </tr>
  
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


  
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="1">
          <tr> 
		    <td width="10%" align="center" class="left_top_border"><b>Time Code</b></td>
            <td width="5%" align="center" class="left_top_border"><b>Type</b></td>
            <td width="54%" align="center" class="left_top_border"><b>Fault Description</b></td>
            <td width="5%" align="center" class="left_top_border"><b>GRD</b></td>
            <td width="7%" align="center" class="left_top_border"><b>Sector</b></td>
            <td width="9%" align="center" class="left_top_border"><b>Same As Master</b></td>
            <td width="8%" align="center" class="left_right_top_border"><b>Item Duration</b></td>
          </tr>
          <% nTotalLines = 0
		    			 
             do while nTotalLines < 420
              nLines = 0
				if rsBVMastLog.EOF = false then 
					nLines = GetLines(rsBVMastLog.Fields("Note"))
					nTotalLines = nTotalLines + nLines
				else 
				nTotalLines = nTotalLines + 13	 
				end if
				
				if nTotalLines > 420
					exit do           
				
				else
			
		  %>
          <tr>
		    <td width="10%" align="center" class="left_top_border">&nbsp;<%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Time_Code"))%>&nbsp;</td>
            <td width="5%" align="center" class="left_top_border">&nbsp;<%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("QC_Code"))%>&nbsp;</td>
            <td width="54%" align="left" class="left_top_border">&nbsp;<%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Note"))%>&nbsp;</td>
            <td width="5%" align="center" class="left_top_border">&nbsp;<%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("QC_Grade"))%>&nbsp;</td>
            <td width="7%" align="center" class="left_top_border">&nbsp;<%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Action"))%>&nbsp;</td>
            <td width="9%" align="center" class="left_top_border">&nbsp;<%if rsBVMastLog.EOF = false then 
													if rsBVMastLog.Fields("in_master") = -1 then
														Response.write("Yes")
													else
														Response.Write("")
													end if
												 end if%>&nbsp;</td>
            <td width="8%" align="center" class="left_right_top_border">&nbsp;<%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("item_duratn"))%>&nbsp;</td>
          </tr>
          <%	end if
                 if rsBVMastLog.EOF = false then rsBVMastLog.MoveNext 
             loop%>
          <tr>
			<td colspan="8" class="top_border">&nbsp;</td>
		  </tr>
        </table>
      </td>
    </tr>
  </table>

<!-- END  LOG  -->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<%
Dim rsComments, sqlComments

set rsComments = Server.CreateObject("ADODB.Recordset")

sqlComments ="SELECT Comments FROM qcHeader " & _
			"WHERE QCNum = " & clng(sQCNum) & " AND SubQCnum = " & cint(sRev)
			
rsComments.ActiveConnection = cnQCS
rsComments.Open sqlComments

%>


<table width="100%" class="left_right_top_border" >
   <tr>
    <td style="text-align:center;"> <font class="txt_italic" size="2"><b>OVERALL COMMENTS</b></font</td>
  </tr>
 </table>
<table width="100%" class="blacksquare" >
   <tr>
    <td> &nbsp;<%=rsComments.Fields("Comments")%></td>
  </tr>
 </table>
 
<%
Set rsComments = Nothing

%>


 
 