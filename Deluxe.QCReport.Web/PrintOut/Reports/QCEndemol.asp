
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




Function SetStatus(status)

	If status = "PASS"   Then
	   Response.Write "<td class='status-text-passed'>" & status & "</td>"
	   
	ElseIf status = "FAIL"   Then
	   Response.Write "<td class='status-text-failed'>" & status & "</td>"
	   
	ElseIf status = "REFERRAL"   Then
	   Response.Write "<td class='status-text-referral'>" & status & "</td>"   
	   
	 ElseIf status = "HOLD"   Then
	   Response.Write "<td class='status-text-hold'>" & status & "</td>"    
	   
	 Else
	   Response.Write "<td class='status-text'>&nbsp;</td>"  
   End If	

  	
End Function


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

Function SetLogGrade(grade)
   
   
	
	       If grade = 1   Then
	             Response.Write "<td align = 'center' class='grade-text-failed'>" & grade & "</td>"
			   
			ElseIf grade = 3   Then
			   Response.Write "<td align = 'center' class='grade-text-referral'>" & grade & "</td>"
			   
			ElseIf grade = 5   Then
			   Response.Write "<td align = 'center' class='grade-text-passed'>" & grade & "</td>"   
			   
			Else
			   Response.Write "<td class='grade-text'>&nbsp;</td>"   
			   
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

.grade-label{
font-weight:bold;
font-size:16px;
padding: 3px 3px 3px 3px;
}

.status-text, .status-text-passed, .status-text-failed, .status-text-referral, .status-text-hold {
font-weight:bold;
font-size:20px;
padding: 3px 3px 3px 3px;
width: 100px;
text-align: center;
}


.status-text-passed, .grade-text-passed{
/* background-color: green 
   background-color: #0BDA51 ;
   background-color: #0FFF50;
 */
background-color: #4CBB17 ;
color : #fff;
}

.status-text-failed, .grade-text-failed{
background-color: red;
color : #fff;

}

.yes, .no{
background-color: #fff;
}

.status-text-referral, .grade-text-referral{
background-color: yellow;
color: #000;
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

.operations-text, .hdr-metadata-text{
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


<!-- #include file="ChecklistBanijayVideoAndAudio.asp" -->



 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table> 




<!-- START  LOG  -->

<div class="PageBreak"></div>

<!--#include file="Logo_ESI.asp" -->

<!--#include file="ProgrammeDetails_ESI.asp" -->


<%

rsBVMastLog.Open sqlBVIMastLog,,3,3

%> 




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
  
  
   <table width="100%" border="0" cellspacing="0" cellpadding="1">
	  <tr>
		<td class="section-header">Fault Log</td>
	  </tr>
  </table>

<p></p>

  
<table width="100%" border="1" cellspacing="0" cellpadding="0" >
  <tr >
   	<td class="section-label" align="center">
	<span>Severity Grades:&nbsp;&nbsp;</span>
	<span>1 = Fail</span>
     |&nbsp;&nbsp;
	<span>3 = Referral</span>
	 |&nbsp;&nbsp;
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
        <table width="100%" border="1" cellspacing="0" cellpadding="1">
          <tr> 
		  <!--
		     <% If itemNumberCount >  0 Then %>
		        <td width="4%" align="center" class="left_top_border"><b>Item No.</b></td>
			  <% End If %>
			  -->
			  
			
            <td width="9%" align="center" class="section-label">Time Code</td>
            <td width="6%" align="center" class="section-label">Type</td>
            <td width="64%" align="center" class="section-label">Fault Description</td>
            <td width="3%" align="center" class="section-label">Grade</td>
			<td width="8%" align="center" class="section-label" >Item Duration</td>
            <td width="7%" align="center" class="section-label">Sector</td>
		     <td width="3%" align="center" class="section-label" >Signed Off</td>
			
            
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
			
            <td  style="vertical-align:middle;" class="section-text">
			
			 <%=rsBVMastLog.Fields("Time_Code")%>
		
			</td>
            <td  align="center"  class="section-text">
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
            <td  align="center" class="section-text"><%=rsBVMastLog.Fields("Note")%></td>
			<% SetLogGrade( rsBVMastLog.Fields("QC_Grade"))		%>	 
			<td  align="center"  class="section-text" ><%=rsBVMastLog.Fields("item_duratn")%></td>
            <td  align="center"  class="section-text">
			
			      <%
				  
				   If IsNull(rsBVMastLog.Fields("ActionsForDisplay").Value) Then
			           Response.write(rsBVMastLog.Fields("Action"))
				  Else
				    Response.write("<span style=white-space: pre;>" &  rsBVMastLog.Fields("ActionsForDisplay") &  "</span>")
			      End If
				  
				  
				  %>
			
			
			&nbsp;</td>
			
            <td  align="center"  class="section-text">
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
			   <td colspan=7 class="section-text">&nbsp;</td>
			 
			  <!--
			   <% If itemNumberCount >  0 Then %>
					<td colspan=8 class="section-text">&nbsp;</td>
				 <% Else %>
					<td colspan=7 class="section-text">&nbsp;</td>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="100%" class="section-header" >
   <tr>
    <td style="text-align:center;font-size:14px;"> <b>OVERALL COMMENTS</b></td>
  </tr>
 </table>
 <p></p>
 
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

 
 