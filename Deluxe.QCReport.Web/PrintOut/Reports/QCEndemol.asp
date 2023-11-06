
<%
Dim rsVidAud, sqlVidAud

set rsVidAud = Server.CreateObject("ADODB.Recordset")

sqlVidAud ="SELECT * FROM qcEndemolVideoAndAudio " & _
			" WHERE QCNum = " & clng(sQCNum) & " AND SubQCnum = " & cint(sRev)
			
rsVidAud.ActiveConnection = cnQCS
rsVidAud.Open sqlVidAud

Dim rsSpecifics, sqlSpecifics

set rsSpecifics = Server.CreateObject("ADODB.Recordset")

sqlSpecifics = " SELECT * FROM qcEndemolSpecifics " & _
			" WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
			
rsSpecifics.ActiveConnection = cnQCS
rsSpecifics.Open sqlSpecifics


Function SetChecklistText(response)

            If response = "True"   Then
			   Response.Write "<td class='section-text checklist-text yes' >Yes</td>"
			   
			ElseIf response = "False" Then
			    Response.Write "<td class='section-text checklist-text no'   >No</td>"
				
			Else
			   Response.Write "<td class='section-text checklist-text' >" & response & "</td>"    
			   
		   End If	
			  

End Function

Function SetChecklistAndSpanText(response)
    
		   
			If response = "No" Then
			    Response.Write "<td class='section-text checklist-text'   >No: " & rsChecklistBanijayRights.Fields("AllAssociatedWAVSNotPresentReason") & "</td>"
				
				
			Else
			   Response.Write "<td class='section-text checklist-text' >" & response & "</td>"    
			   
		   End If	
			  

End Function


Function SetChecklistText_3(response)

            If response = "True"   Then
			   Response.Write "<td class='section-text checklist-text yes' colspan='3' >Yes</td>"
			   
			ElseIf response = "False" Then
			    Response.Write "<td class='section-text checklist-text no'  colspan='3' >No</td>"
				
			Else
			   Response.Write "<td class='section-text checklist-text' colspan='3' >" & response & "</td>"    
			   
		   End If	
			  

End Function

Function SetChecklistText_2(response)

            If response = "True"   Then
			   Response.Write "<td class='section-text checklist-2-text yes' >Yes</td>"
			   
			ElseIf response = "False" Then
			    Response.Write "<td class='section-text checklist-2-text no' >No</td>"
				
			Else
			   Response.Write "<td class='section-text checklist-2-text'>" & response & "</td>"    
			   
		   End If	
			  

End Function


%>




<!-- Updated to ensure no blank channels are added to the report Isaac Koomson 04/01/2012 -->
<!--<link REL="stylesheet" TYPE="text/css" HREF="../css/qcs.css">-->
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak {break-after: always; page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; }


.section-table{
width:1000px;

}


.section-header, .section-sub-header{
background-color:  #d3d3d3; 
font-weight: bold;
text-align:center;
}

.section-header{
font-size: 20px;
border:3px solid #000;
}

.section-sub-header{
font-size: 14px;
}

.section-detail, .section-label{
background-color: #d3d3d3;
font-size: 12px;
font-weight: bold;
 padding: 3px 3px 3px 3px;
}

.section-text{
font-family: Tahoma;
font-size: 8pt;
font-weight: bold;
 padding: 3px 3px 3px 3px;
}

.section-text-blue {
/* color: blue;  */
}

.section-text-big-font{
font-size: 14px;
}

.section-empty-label{
background-color: #fff;
width: 200px;
}


.programme-details-label, .operations-label, .hdr-metadata-label{
width: 200px;
}

.programme-details-text{
width: 100px;
}

.programme-details-text-2{
width: 200px;
}

.measurements-label{
width: 125px;
}

.measurements-text{
width: 125px;
}

.checklist-label{
width: 280px;
}

.checklist-text{
width: 60px;
}

.checklist-2-label{
width: 450px;
}

.checklist-2-text{
width: 50px;
}

.checklist-empty-label{
background-color: #fff;
width: 220px;
}

.checklist-empty-text{
background-color: #fff;
width: 100px;
}

.checklist-2-empty-label{
background-color: #fff;
width: 450px;
}

.checklist-2-empty-text{
background-color: #fff;
width: 50px;
}





</style>



<div style="width:1000px; margin:auto" >


<!--#include file="Logo_ESI.asp" -->

<!--#include file="ProgrammeDetails_ESI.asp" -->


 
<!--#include file="QCDetails_ESI.asp" -->


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!--#include file="FileInformation_ESI.asp" -->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>



<!--#include file="ChecklistBanijayRightsMeasurements.asp" -->


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<!--#include file="ChecklistBanijayRightsSpecifics.asp" -->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!--#include file="ProgramFormat.asp" -->
	

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
          <td align="center" class="blackSquare" colspan="3" style="font-size:14px" > 
            <b>VIDEO & AUDIO</b>
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
  <tr style="line-height:20px;">
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
		     <td width="3%" align="center" class="left_right_top_border" ><b>Signed Off</b></td>
			
            
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
          <tr style="line-height:20px;">
		  <!--
		      <% If itemNumberCount >  0 Then %>
		         <td width="4%" align="center"  class="left_top_border">&nbsp;<%=rsBVMastLog.Fields("item_num")%>&nbsp;</td> 
			   <% End If %>
			-->
			
            <td  style="vertical-align:middle;" class="left_top_border">
			
			  &nbsp;<%=rsBVMastLog.Fields("Time_Code")%>&nbsp;&nbsp;
		
			</td>
            <td  style="vertical-align:middle;"  class="left_top_border">&nbsp;
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
            <td  style="vertical-align:middle;"  class="left_top_border">&nbsp;<%=rsBVMastLog.Fields("Note")%>&nbsp;</td>
            <td  style="vertical-align:middle;"  class="left_top_border">&nbsp;<%=rsBVMastLog.Fields("QC_Grade")%>&nbsp;</td>
			<td  style="vertical-align:middle;"  class="left_top_border" >&nbsp;<%=rsBVMastLog.Fields("item_duratn")%>&nbsp;</td>
            <td  style="vertical-align:middle;"  class="left_top_border">&nbsp;
			
			      <%
				  
				   If IsNull(rsBVMastLog.Fields("ActionsForDisplay").Value) Then
			           Response.write(rsBVMastLog.Fields("Action"))
				  Else
				    Response.write("<span style=white-space: pre;>" &  rsBVMastLog.Fields("ActionsForDisplay") &  "</span>")
			      End If
				  
				  
				  %>
			
			
			&nbsp;</td>
			
            <td  style="vertical-align:middle;"  class="left_right_top_border">&nbsp;
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
    <td style="text-align:center;font-size:14px;"> <b>OVERALL COMMENTS</b></td>
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


<!-- #include file="FaultImages_ESI.asp" -->

</div>

 
 