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
      <h2 class="txt_boldtype_header">QUALITY CONTROL REPORT FOR<br>
       Banijay Rights</h2>
    </td>
	<!--
    <td align="right">
		Page:&nbsp;1&nbsp;of&nbsp;1
    </td>
	-->
  </tr>
  
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000" height="36">
  <tr>
  <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="1" >
	     <tr>
             <td >Title:&nbsp; <b><%=rsHeader.Fields("Show")%></b></td>
             <td>Part Number:&nbsp;<b>Part <%=rsHeader.Fields("This_part")%> of <%=rsHeader.Fields("tot_part")%></b></td>
             <td>QC Number:&nbsp;<b><%=rsHeader.Fields("QCNum")%></b></td>
		 </tr> 
		 <tr> 
                <td colspan="3">&nbsp;</td>
         </tr>
		<tr>
             <td >Series:&nbsp; <b><%=rsHeader.Fields("Epis_name")%></b></td>
             <td>Episode Number:&nbsp;<b><%=rsHeader.Fields("Epis_no")%></b></td>
             <td>WO Number:&nbsp;<b><%=rsHeader.Fields("wonum")%></b></td>
		</tr> 
		<tr> 
                <td colspan="3">&nbsp;</td>
         </tr>
         
	
	     <tr>
              <td >Description:&nbsp; <b><%=rsHeader.Fields("TapeDesc1")%></b></td>
              <td>TRT:&nbsp;<b><%=rsHeader.Fields("TRT")%></b></b></td>
			  <td width="25%">Time Code:&nbsp; <b>
			  <% If Not IsNull(rsHeader.Fields("Timecode")) Then 
			       Response.Write rsHeader.Fields("Timecode")
			     Else
			      Response.Write rsHeader.Fields("Time_Code")
			     End If
			  %>
			  
			  
			  </b>
			  
			  
			  </td>
   		</tr> 
		<tr>
			  <tr> 
                <td colspan="3">&nbsp;</td>
         </tr>
		 <tr>
              <td >Version:&nbsp; <b><%=rsHeader.Fields("Version")%></b></td>
              
			  
   		</tr> 
		
		 <tr>
			  <tr> 
                <td colspan="3">&nbsp;</td>
         </tr>
		 <tr>
			 <td >Subtitles:&nbsp; <b>

			  <%
			   If Not IsNull(rsHeader.Fields("Subtitle")) Then
			      Response.Write  rsHeader.Fields("Subtitle")
               Else 
				 Response.Write rsHeader.Fields("Subtitle_QC")
			   End If
			  %>
			  
			  
			  
			  
			  </b>
			  
			  
			  </td>
			 <td >&nbsp;</td>
			 <td >&nbsp;</td>
		
			 </tr>
		 </table>
	</td>
  </tr>
 </table>



<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


 
<table width="100%" class="blackSquare">
<%  If Not IsNull(rsHeader.Fields("FullName")) Then  %>
  <tr>
     <td>QC Date: &nbsp;<b><%=rsHeader.Fields("QC_Date")%></b></td>
     <td>QC Operator: &nbsp;<b><%=rsHeader.Fields("FullName")%></b></td> 
	 <td>QC OF: &nbsp;<b><%=rsHeader.Fields("Operator_Activity")%></b></td> 
	 <td>Revised By: &nbsp;<b><%=rsHeader.Fields("Revised_By")%></b></td>
    <td>Revised Date: &nbsp;<b><%=rsHeader.Fields("revised_date")%></b></td>
  </tr>
   
   <tr>
  
    <td>QC Player&nbsp;<b><%=rsHeader.Fields("QC_VTR")%></b></td>
	<td>MFR / QC Room: &nbsp;<b><%=rsHeader.Fields("Bay_num")%></b></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
  <% End If %>
  
  <%  If Not IsNull(rsHeader.Fields("FullName2")) Then  %>
  
    
  <tr>
  
     <td>QC Date: &nbsp;<b><%=rsHeader.Fields("QC_Date_2")%></b></td>
     <td>QC Operator: &nbsp;<b><%=rsHeader.Fields("FullName2")%></b></td> 
	 <td>QC OF: &nbsp;<b><%=rsHeader.Fields("Operator_2_Activity")%></b></td> 
	 <td>Revised By: &nbsp;<b><%=rsHeader.Fields("Revised_By_2")%></b></td>
    <td>Revised Date: &nbsp;<b><%=rsHeader.Fields("Revised_Date_2")%></b></td>
	
  </tr>
  
  
  <tr>
  
    <td>QC Player:&nbsp;<b><%=rsHeader.Fields("QC_VTR_2")%></b></td>
	<td>MFR / QC Room: &nbsp;<b><%=rsHeader.Fields("Bay_num_2")%></b></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
  
  <% End If %>
  
  </table>
  



<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<!--
<table width="100%" class="blackSquare" style="border-bottom: none;">
  <tr>
    <td>
	<% If sAssetType = "Tape" Then %>
		  <table width="100%" border="0" cellspacing="0" cellpadding="1">
		   <tr><td colspan="3">Tape Number: <b><%=rsHeader.Fields("TapeNumber")%></b></td></tr>
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
			    <td width="25%">Video Codec:&nbsp; <b><%=rsHeader.Fields("Video_Codec")%></b></td>
				<td width="25%">Sample Rate:&nbsp; <b><%=rsHeader.Fields("Sample_Rate")%></b></td>
			   <td width="25%">Frame Size:&nbsp; <b><%=rsHeader.Fields("Frame_Size")%></b></td> 
			  
			  <td width="25%">Audio Codec:&nbsp; <b><%=rsHeader.Fields("Audio_Codec")%></b></td>
			 
			</tr>
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
	<% End If %>
    </td>
  </tr>
  <tr>
      <td>
	     
	  </td>
  </tr>
</table>

-->

<!--#include file="ChecklistBanijayRightsMeasurements.asp" -->


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>




<!-- Start Specifics -->
<!--
<%
Dim rsSpecifics, sqlSpecifics

set rsSpecifics = Server.CreateObject("ADODB.Recordset")

sqlSpecifics = " SELECT * FROM qcEndemolSpecifics " & _
			" WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
			
rsSpecifics.ActiveConnection = cnQCS
rsSpecifics.Open sqlSpecifics

%>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>



<table width="100%" class="blackSquare" style="border-bottom: none;>
 
   <tr> 
      <td style="padding-left:2px">Banijay Rights / ESI End Credit / Logo: <b>&nbsp;<%=rsSpecifics.Fields("ESIEndCreditOrLogo")%></b></td>
   	  <td style="padding-left:2px">Seamless Or Parted: <b><%=rsSpecifics.Fields("SeamlessOrParted")%></b></td>
      <td style="padding-left:2px">Is Textless Present: <b<%=rsSpecifics.Fields("IsTextlessPresent")%></b></td>
   </tr>
   <tr ><td colspan="3">&nbsp;</td></tr>
   <tr> 
      <td style="padding-left:2px">Content Censored - Bleeped Or Blurred: <b>&nbsp;<%=rsSpecifics.Fields("ContentCensoredBleepedOrBlurred")%></b></td>
      <td style="padding-left:2px">Flashing Lights / Epilepsy Warning Present: <b>&nbsp;<%=rsSpecifics.Fields("FlashingLightsOrEpilepsyWarningPresent")%></b></td>
      <td style="padding-left:2px">Time Specific Text Or Audio Present: <b>&nbsp;<%=rsSpecifics.Fields("TimeSpecificTextOrAudioPresent")%></b></td>
   </tr>
    <tr ><td colspan="3">&nbsp;</td></tr>
   <tr> 
      <td style="padding-left:2px">Extreme Language Present: <b>&nbsp;<%=rsSpecifics.Fields("ExtremeLanguagePresent")%></b></td>
      <td style="padding-left:2px">Nudity Present: <b>&nbsp;<%=rsSpecifics.Fields("NudityPresent")%></b></td>
      <td style="padding-left:2px">Is M&E Present and Complete: <b>&nbsp;<%=rsSpecifics.Fields("IsMandEComplete")%></b></td>
	   <td style="padding-left:2px">Is Mix Minus Narration Present and Complete: <b>&nbsp;<%=rsSpecifics.Fields("IsMixMinusNarrationPresentandComplete")%></b></td>
   </tr>
 
</table>

<%
Set rsSpecifics = Nothing

%>
-->

<!--#include file="ChecklistBanijayRightsSpecifics.asp" -->

<!-- End Specifics -->


<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td align="center" class="blackSquare" colspan="4" > 
            <font class="txt_italic" size="3"><b>PROGRAM FORMAT</b></font>
          </td>
        </tr>
        <tr>
		     
		     <!-- <td width="4%" class="txt_boldtype2 left_bottom_border" >Item No.</td> -->
		    <td width="40%" class="txt_boldtype2 left_bottom_border" >&nbsp;Description</td>
           <td width="34%" class="txt_boldtype2 left_bottom_border">&nbsp;Time Code</td>
           <td width="22%" class="txt_boldtype2 left_right_bottom_border">&nbsp;Length</td>
        </tr>
        <%while not rsTapeFormat.EOF%>
              <tr>
			      
			   <!--<td width="4%" class="left_bottom_border">&nbsp;<%=rsTapeFormat.Fields("item_num")%></td> -->
               <td width="40%" class="left_bottom_border" >&nbsp;<%=rsTapeFormat.Fields("description")%></td>
                <td width="34%" class="left_bottom_border">&nbsp;<%=rsTapeFormat.Fields("Time_Code")%></td>
                <td width="22%" class="left_right_bottom_border">&nbsp;<%=rsTapeFormat.Fields("Length")%></td>
              </tr>
            <%rsTapeFormat.MoveNext
       wend%>
  </table>
  

	  
<!-- ESI Audio Here -->
	

 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table> 

<!-- #include file="FileAudioSpecifications_ESI.asp" -->

 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table> 


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
			<td width="42%" class="left_bottom_border" >&nbsp;Luminance Levels:</td>
			<td width="36%" class="left_bottom_border">&nbsp;<%=rsVidAud.Fields("LuminanceLevelsRating")%></td>
			<td width="22%" class="left_right_bottom_border">&nbsp;<%=rsVidAud.Fields("LuminanceLevelsDetails")%></td>
		  </tr>
		  
		  <tr>
			<td width="42%" class="left_bottom_border" >&nbsp;Black Levels:</td>
			<td width="36%" class="left_bottom_border">&nbsp;<%=rsVidAud.Fields("BlackLevelsRating")%></td>
			<td width="22%" class="left_right_bottom_border">&nbsp;<%=rsVidAud.Fields("BlackLevelsDetails")%></td>
		  </tr>
		  
		   <tr>
			<td width="42%" class="left_bottom_border" >&nbsp;Chrominance Levels:</td>
			<td width="36%" class="left_bottom_border">&nbsp;<%=rsVidAud.Fields("ChrominanceLevelsRating")%></td>
			<td width="22%" class="left_right_bottom_border">&nbsp;<%=rsVidAud.Fields("ChrominanceLevelsDetails")%></td>
		  </tr>
		  
		   <tr>
			<td width="42%" class="left_bottom_border" >&nbsp;Audio Peaks and Loudness:</td>
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

<!-- End Video And Audio -->

 
 
<!-- START  LOG  -->

<div class="PageBreak"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype_header">QUALITY CONTROL REPORT FOR<br>
       Banijay Rights</h2>
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


<%

rsBVMastLog.Open sqlBVIMastLog,,3,3

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

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:-13px; display:none;">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
	 <td  align="right"  >
			<table cellspacing=0 border="0" width="80" style="margin-right:100px">
			    <tr>
					<td colspan="3" align="center" valign="middle" style="font-size:6pt;font-weight:bold;" class="left_right_top_border">Sector Key</td>
      			</tr>
				<tr>
					<td width=30 align="center" valign="middle" style="font-size:6pt;font-weight:bold;" class="left_top_border">U-L</td>
					<td width=30 align="center" valign="middle" style="font-size:6pt;font-weight:bold;" class="left_top_border">U-C</td>
					<td width=30 align="center" valign="middle" style="font-size:6pt;font-weight:bold;" class="left_right_top_border">U-R</td>
				</tr>
				<tr>
					<td width=30 align="center" valign="middle" style="font-size:6pt;font-weight:bold;" class="left_top_border">M-L</td>
					<td width=30 align="center" valign="middle" style="font-size:6pt;font-weight:bold;" class="left_top_border">M-C</td>
					<td width=30 align="center" valign="middle" style="font-size:6pt;font-weight:bold;" class="left_right_top_border" >M-R</td>
				</tr>
				<tr>
					<td width=30 align="center" valign="middle" style="font-size:6pt;font-weight:bold;" class="left_top_border">L-L</td> 
					<td width=30 align="center" valign="middle"  style="font-size:6pt;font-weight:bold;" class="left_top_border">L-C</td>
					<td width=30 align="center" valign="middle" style="font-size:6pt;font-weight:bold;" class="left_right_top_border">L-R</td>
				</tr>
				<tr>
		  	    <td colspan=3 class="top_border">&nbsp;</td>
	         </tr>
		</table>	
      </td>
    </tr>
  </table>
  
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
   	<td class="blackSquare" style="font-weight:bold;text-align:center;">
	<span>Severity Grades:&nbsp;&nbsp;</span>
	<span>1 = Fail</span>
     &nbsp;&nbsp;
	<span>3 = Referral</span>
	 &nbsp;&nbsp;
	<span>5 = Pass</span>
	 &nbsp;&nbsp;
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
		  <!--
		     <% If itemNumberCount >  0 Then %>
		        <td width="4%" align="center" class="left_top_border"><b>Item No.</b></td>
			  <% End If %>
			  -->
			  
			
            <td width="9%" align="center" class="left_top_border"><b>Time Code</b></td>
            <td width="6%" align="center" class="left_top_border"><b>Type</b></td>
            <td width="64%" align="center" class="left_top_border"><b>Fault Description</b></td>
            <td width="3%" align="center" class="left_top_border"><b>Grade</b></td>
			<td width="8%" align="center" class="left_top_border" ><b>Item Duration</b></td>
            <td width="7%" align="center" class="left_top_border"><b>Sector</b></td>
		     <td width="3%" align="center" class="left_right_top_border" ><b>Approved</b></td>
			
            
          </tr>
          <% nTotalLines = 0
		     Dim faultsCount,itemNo
			 faultsCount = (rsBVMastLog.RecordCount * 13) + 420
             itemNo = 1
			 
             do while nTotalLines < faultsCount '' Changed increased magic number 420  by Isaac Koomson 13/02/2002
              nLines = 0
			  
				if rsBVMastLog.EOF = false then 
					nLines = GetLines(rsBVMastLog.Fields("Note"))
					nTotalLines = nTotalLines + nLines
				else 
				     nTotalLines = nTotalLines + 13	 
				end if
				
				if nTotalLines > faultsCount Then '' Changed increased magic number 420 by Isaac Koomson 13/02/2002
					exit do           
			    elseif rsBVMastLog.EOF = false then 
			    
		  %>
          <tr>
		  <!--
		      <% If itemNumberCount >  0 Then %>
		         <td width="4%" align="center"  class="left_top_border">&nbsp;<%=rsBVMastLog.Fields("item_num")%>&nbsp;</td> 
			   <% End If %>
			-->
			
            <td  align="center" class="left_top_border">&nbsp;<%=rsBVMastLog.Fields("Time Code_Code")%>&nbsp;&nbsp;</td>
            <td  align="center"  class="left_top_border">&nbsp;
			<%
			
			      If IsNull(rsBVMastLog.Fields("QC_Codename").Value) Then
				  
				        If rsBVMastLog.Fields("QC_Code").Value = "A" Then
						   Response.write("Audio")
						ElseIf rsBVMastLog.Fields("QC_Code").Value = "F" Then
						   Response.write("Film")    
						ElseIf rsBVMastLog.Fields("QC_Code").Value = "V" Then
						   Response.write("Video")  
				    	End If
				  Else
				    Response.write(rsBVMastLog.Fields("QC_Codename"))
			      End If
			
			%>
			
			&nbsp;&nbsp;</td>
            <td  align="left"  class="left_top_border">&nbsp;<%=rsBVMastLog.Fields("Note")%>&nbsp;</td>
            <td  align="center"  class="left_top_border">&nbsp;<%=rsBVMastLog.Fields("QC_Grade")%>&nbsp;</td>
			<td  align="center"  class="left_top_border" >&nbsp;<%=rsBVMastLog.Fields("item_duratn")%>&nbsp;</td>
            <td  align="center"  class="left_top_border">&nbsp;
			
			      <%
				  
				   If IsNull(rsBVMastLog.Fields("ActionsForDisplay").Value) Then
			           Response.write(rsBVMastLog.Fields("Action"))
				  Else
				    Response.write("<span style=white-space: pre;>" &  rsBVMastLog.Fields("ActionsForDisplay") &  "</span>")
			      End If
				  
				  
				  %>
			
			
			&nbsp;</td>
			
            <td  align="center"  class="left_right_top_border">&nbsp;
			                                        <%
													if rsBVMastLog.Fields("in_master") = -1 then
														Response.write("Yes")
													else
														Response.Write("")
													end if
												    %>&nbsp;
		</td>
            
          </tr>
          <%	
		            itemNo = itemNo + 1  
		            rsBVMastLog.MoveNext 
		         end if
				 
                 ''if rsBVMastLog.EOF = false then rsBVMastLog.MoveNext 
				 
             loop%>
			 
			<tr> 
			   <td colspan=7 class="top_border">&nbsp;</td>
			 
			  <!--
			   <% If itemNumberCount >  0 Then %>
					<td colspan=8 class="top_border">&nbsp;</td>
				 <% Else %>
					<td colspan=7 class="top_border">&nbsp;</td>
				<% End If %>
			 -->
		  </tr>
        </table>
      </td>
    </tr>
  </table>

<!-- END  LOG  -->


 
<%
Dim rsComments, sqlComments

set rsComments = Server.CreateObject("ADODB.Recordset")

sqlComments ="SELECT REPLACE(CONVERT(VARCHAR(8000), Comments) , CHAR(13), '<br/>') Comments FROM qcHeader " & _
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
    <td style="padding:5px;" valign="top"><%=rsComments.Fields("Comments")%></td>
  </tr>
 </table>
 
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

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
 
<%
Set rsComments = Nothing

%>


<!-- #include file="FaultImages.asp" -->

 
 