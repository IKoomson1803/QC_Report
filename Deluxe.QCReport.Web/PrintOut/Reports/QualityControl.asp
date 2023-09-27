<%
Response.Buffer = True
Response.CacheControl = "no-cache"
Response.AddHeader "Pragma", "no-cache"
Response.Expires = -1

On Error Resume Next

Function ChecklistCompleted()

        ChecklistCompleted = False

       If Not rsChecklist.BOF = True And Not rsChecklist.EOF = True Then
           If Not IsNull(rsChecklist.Fields("ChecklistCompleted"))  And rsChecklist.Fields("ChecklistCompleted") = true Then  
                ChecklistCompleted  = true
		  End If 	
       End If
	   
      If Not rsChecklistLionsGate.BOF = True And Not rsChecklistLionsGate.EOF = True Then
           If Not IsNull(rsChecklistLionsGate.Fields("ChecklistCompleted"))  And rsChecklistLionsGate.Fields("ChecklistCompleted") = true Then  
                ChecklistCompleted  = true
		  End If 	
       End If
	   
      If Not rsChecklistWarner.BOF = True And Not rsChecklistWarner.EOF = True Then
           If Not IsNull(rsChecklistWarner.Fields("ChecklistCompleted"))  And rsChecklistWarner.Fields("ChecklistCompleted") = true Then  
                ChecklistCompleted  = true
		  End If 	
       End If
	   
     If Not rsChecklistWildBunch.BOF = True And Not rsChecklistWildBunch.EOF = True Then
           If Not IsNull(rsChecklistWildBunch.Fields("ChecklistCompleted"))  And rsChecklistWildBunch.Fields("ChecklistCompleted") = true Then  
                ChecklistCompleted  = true
		  End If 	
       End If

End Function

%>


<link REL="stylesheet" TYPE="text/css" HREF="../css/qcs.css?v=4.2.0.0">
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak { page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt;  }

.galimage[src=""] {
  display:none;
}


.section-header{
background-color:  gray;
border:3px solid #000;
font-size: 20px;
font-weight: bold;
text-align:center;
}

.section-detail, section-label{
background-color: gray;
font-size: 12px;
font-weight: bold;
padding-left: 3px;
padding-right: 3px;
}

.section-text{
color: #000000; 
font-family: Tahoma;
font-size: 8pt;
font-weight: bold;
padding-left: 3px;
padding-right: 3px;
}

.checklist-data{
width:100px

}

.checklist-label{


}
</style>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td width="180"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype_header" > QUALITY CONTROL REPORT FOR<br>
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
    <td align="right">
		Page:&nbsp;1&nbsp;of&nbsp;<span id="totalPage1"></span>
    </td>
  </tr>
  <tr>
	<td colspan="3" align="center"><b><%=rsHeader.Fields("Address")%></b>&nbsp;</td>
  </tr>
</table>






<!--#include file="Header.asp" -->
  
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!--
 <table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
-->
 
<!--#include file="Operations.asp" -->



  
<!--#include file="Measurements.asp" -->

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!--
 <table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
-->

 <!--#include file="SafeAreaCheck.asp" -->
 
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!--
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
-->

<%
   
      
  IsChecklistCompleted = ChecklistCompleted()
  
  ''response.write "IsChecklistCompleted:" & IsChecklistCompleted
      

 If IsChecklistCompleted = true Then


 %>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	         <% 
       
	           positionDisney = InStr(1, UCase(rsHeader.Fields("CustName")), "DISNEY")
			   
	           positionLionsGate = InStr(1, UCase(rsHeader.Fields("CustName")), "LIONSGATE")
			   
			   If positionLionsGate <= 0  Then
			     positionLionsGate = InStr(1, UCase(rsHeader.Fields("CustName")), "LIONS GATE")
			   End If
			   
	           positionWarner = InStr(1, UCase(rsHeader.Fields("CustName")), "WARNER")
			   
	           positionWildBunch  = InStr(1, UCase(rsHeader.Fields("CustName")), "WILD BUNCH")
			   
			   If positionWildBunch <=0 Then
			       positionWildBunch  = InStr(1, UCase(rsHeader.Fields("CustName")), "VERSATILE")
			   End If
			   
			    If positionWildBunch <=0 Then
			       positionWildBunch  = InStr(1, UCase(rsHeader.Fields("CustName")), "ELLE DRIVER")
			   End If
			   
			   
			   '''''''' Response.Write "positionDisney: " &  positionDisney & "<br/>"
			   '' Response.Write "positionLionsGate: " &  positionLionsGate & "<br/>"
				'' Response.Write "Customer Name: " &  rsHeader.Fields("CustName") & "<br/>"
			 	
			  If positionDisney > 0  Then
			  %>			     			  
			      <!--#include file="ChecklistDisney.asp" -->
			 <% ElseIf  positionLionsGate > 0 Then %>
		         <!--#include file="ChecklistLionsGate.asp" -->
		     <% ElseIf  positionWarner > 0 Then %>
		         <!--#include file="ChecklistWarner.asp" -->
				 <% ElseIf  positionWildBunch > 0 Then %>
		         <!--#include file="ChecklistWildBunch.asp" -->
			  <% Else %> 
				 
			  <% End If %>			  
			  
	</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!--
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
-->

<% End If %>	



     
<!--#include file="FileAudioSpecifications.asp" -->
	
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

<!--
 <table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
-->

<div class="div-frame-border">
    
<table width="100%" border="1" cellspacing="0" cellpadding="0"  >
  <tr>
    <td   class="section-detail" <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%> colspan="5"<%End If%>>
	  &nbsp;Overall Comments
    </td>
    <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%>
	<!--
    <td align="center" width="5" >
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
	-->
	
    <td  class="section-detail" >
      &nbsp;Audio Comments / Corrective Actions
    </td>
	
	<!--
	<td align="center" width="5">
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
	-->
	
	 <td  class="section-detail" >
      &nbsp;Video Comments / Corrective Actions
    </td>
	
    <%End If%>
  </tr>
  <tr>
    <td height="200px" <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%> colspan="5"<%Else%> width="33%"<%End If%>>
		  <table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="1" >
			<tr>
			  <td style="padding:5px;"  valign="top"><%=rsFullSpot.Fields("Comments")%> 
			  <p>&nbsp;</p>
			  <p>&nbsp;</p>
			  </td>
			</tr>
		  </table>
	   </td>
    <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%>
	
	<!--
    <td align="center" width="5">
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>-->
	
    <td width="33%"  height="200px">
	 	  <table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="1" >
			<tr>
			  <td  valign="top" style="padding:5px;" ><%=rsFullSpot.Fields("RecommendationComments")%>
			   <p>&nbsp;</p>
			  <p>&nbsp;</p>
			  </td>
			</tr>
		  </table>
	  </td>
	  
	  <!--
	<td align="center" width="5">
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
	-->
	
	<td width="33%"  height="200px">
		  <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="1" >
			<tr>
			  <td  valign="top" style="padding:5px;" ><%=rsFullSpot.Fields("VideoComments")%>&nbsp;
			  <p>&nbsp;</p>
			  <p>&nbsp;</p>
			  </td>
			</tr>
		  </table>
	   </td>
    <%End If%>
  </tr>
</table>



</div>


<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!--
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
-->

<%
j=0
thisPage = 2
rsBVMastLog.Open sqlBVIMastLog
if rsBVMastLog.BOF = true and rsBVMastLog.EOF =true then j=1
do while not rsBVMastLog.EOF or j=1
%> 
<!-- ******************************************************* -->
<div class="PageBreak"><!-- Pages >= 2 -->
<!-- ******************************************************* -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype_header">QUALITY CONTROL REPORT FOR<br>
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
    <td>
		Page:&nbsp;<%=thisPage%>&nbsp;of&nbsp;<span id="totalPage<%=thisPage%>"></span>
    </td>
  </tr>
  <tr>
	<td colspan="3" align="center"><b><%=rsHeader.Fields("Address")%></b>&nbsp;</td>
  </tr>
</table>



<!--#include file="Header.asp" -->

<!--
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
-->

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
    <td>&nbsp;</td>
  </tr>
</table>


 <table width="100%" border="0" cellspacing="0" cellpadding="1">
   <%if rsHeader.Fields("GradingScale") = 3 then %>
    <tr> 
      <td class="section-header">
	  <span>Severity Grades:&nbsp;&nbsp;</span>
	  <span>1=Pass&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	  <span>2=Referral&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	  <span>3=Fail&nbsp;&nbsp;</span>
	  </td>
     </tr>
    <%end if%>
    <%If rsHeader.Fields("GradingScale") = 4 then %>
    <tr> 
	  <tdclass="section-header">
	  <span>Severity Grades:&nbsp;&nbsp;</span>
	  <span>1=Standard/Non Detectable&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	  <span>2=Acceptable&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	  <span>3=Marginal/Intrusive&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	  <span>4=Unacceptable&nbsp;&nbsp;</span>
	  </td>
    </tr>
    <%end if%>
    <%If rsHeader.Fields("GradingScale") = 5 then %>
    <tr> 
	  <td class="section-header">
	  <span>Severity Grades:&nbsp;&nbsp;</span>
	  <span>1=Severe Fail &nbsp;&nbsp;|&nbsp;&nbsp;</span>
	  <span>2=Fail / Refer &nbsp;&nbsp;|&nbsp;&nbsp;</span>
	  <span>3=Slightly Annoying &nbsp;&nbsp;|&nbsp;&nbsp;</span>
	  <span>4=Perceptible &nbsp;&nbsp;|&nbsp;&nbsp;</span>
	  <span>5=Imperceptible &nbsp;&nbsp;|&nbsp;&nbsp;</span>
	  </td>
     </tr>
    <%end if%>
</table>

<p></p>

 <table width="100%" border="0" cellspacing="0" cellpadding="1">
	  <tr>
		<td class="section-header">Fault Log</td>
	  </tr>
  </table>

<p></p>
     
 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
      <td>
        <table width="100%" border="1" cellspacing="0" cellpadding="1">
		  
          <tr> 
		  <!--
		    <% If itemNumberCount >  0 Then %>
	           <td width="4%" align="center" class="section-detail"><b>Item No.</b></td>
		   <% End If %>
		   -->
			
             <td width="9%" align="center" class="section-detail"><b>Time Code</b></td>
            <td width="6%" align="center" class="section-detail"><b>Type</b></td>
            <td width="64%" align="center" class="section-detail"><b>Fault Description</b></td>
            <td width="3%" align="center" class="section-detail"><b>Grade</b></td>
			<td width="8%" align="center" class="section-detail"><b>Item Duration</b></td>
			<td width="7%" align="center" class="section-detail"><b>Sector</b></td>
		     <td width="3%" align="center" class="section-detail" ><b>Signed Off</b></td>
			
          </tr>
          <% nTotalLines = 0
             do while nTotalLines < 210
              nLines = 0
				if rsBVMastLog.EOF = false then 
					nLines = GetLines(rsBVMastLog.Fields("Note"))
					nTotalLines = nTotalLines + nLines
				else 
				nTotalLines = nTotalLines + 13	 
				end if
				
				if nTotalLines > 210 Then
					exit do           
				
				else
			
		  %>
          <tr>
		    <!--
		     <% If itemNumberCount >  0 Then %>
		  	    <td width="4%" align="center" ><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("item_num"))%>&nbsp;</td>
			<% End If %>
			-->
			
            <td  align="center" >&nbsp;<%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Time_Code"))%>&nbsp;</td>
			
			
            <td  align="center" >&nbsp;
			<%
					   			   
			   If rsBVMastLog.EOF = False Then

			      If IsNull(rsBVMastLog.Fields("QC_Codename").Value) Then
				  
				        If rsBVMastLog.Fields("QC_Code").Value = "A" Then
						   Response.write("Audio")
						ElseIf rsBVMastLog.Fields("QC_Code").Value = "F" Then
						   Response.write("Film")    
						ElseIf rsBVMastLog.Fields("QC_Code").Value = "V" Then
						   Response.write("Video")  
				    	End If
				  Else
				    Response.write("&nbsp;" & rsBVMastLog.Fields("QC_Codename"))
			      End If
			 End If
			
			
			%>&nbsp;
			</td>
			
			
			
            <td  align="left" >&nbsp;<%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Note"))%>&nbsp;</td>
            <td  align="center" >&nbsp;<%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("QC_Grade"))%>&nbsp;</td>
			<td  align="center" >&nbsp;<%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("item_duratn"))%>&nbsp;</td>
            <td  align="center" >&nbsp;
			<%
			   If rsBVMastLog.EOF = False Then

			      If IsNull(rsBVMastLog.Fields("ActionsForDisplay").Value)Then
			           Response.write(rsBVMastLog.Fields("Action"))
				  Else
				    Response.write("<span style=white-space: pre;>" &  rsBVMastLog.Fields("ActionsForDisplay") &  "</span>")
			      End If
			 End If
			%>&nbsp;
			
			
			</td>
			
			<td  align="center" >&nbsp;
		     <%if rsBVMastLog.EOF = false then 
				if rsBVMastLog.Fields("in_master") = -1 then
					Response.write("Yes")
				else
					Response.Write("")
				end if
			 end if
			 %>
			 &nbsp;</td>
            
          </tr>
          <%	end if
             if rsBVMastLog.EOF = false then rsBVMastLog.MoveNext 
             loop%>
          
		  
		  
		  
		  
        </table>
      </td>
    </tr>
  </table>

  
  
</div>
<% j=0
   
	Response.Write("<SCRIPT>")
	for i = 1 to thisPage
	Response.Write("totalPage" & i & ".innerText = '" & thisPage & "';")
	next
	Response.Write("</SCRIPT>")
	
	thisPage = thisPage + 1 
	loop
	rsBVMastLog.Close
	set rsBVMastLog = Nothing
%>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<%
j=0
'thisPage = thisPage + 1
if rsTextInfo.BOF = true and rsTextInfo.EOF =true then j=1
do while not rsTextInfo.EOF or j=1
%> 
<!-- ******************************************************* -->
<div class="PageBreak"><!-- Pages > Log Pages -->
<!-- ******************************************************* -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype_header">QUALITY CONTROL REPORT FOR<br>
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
    <td>
		Page:&nbsp;<%=thisPage%>&nbsp;of&nbsp;<span id="totalPage<%=thisPage%>"></span>
    </td>
  </tr>
  <tr>
	<td colspan="3" align="center"><b><%=rsHeader.Fields("Address")%></b>&nbsp;</td>
  </tr>
</table>


<!--#include file="Header.asp" -->

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!--
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>&nbsp;</td>
    </tr>
  </table>
 -->
 
 <table width="100%" border="0" cellspacing="0" cellpadding="1">
			  <tr>
				<td class="section-header">Text Log</td>
			  </tr>
</table>

<p></p>
 

      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>
        <table width="100%" border="1" cellspacing="0" cellpadding="0">
		   
		
          <tr height=30> 
			<td width="64%" align="center" class="section-detail"><b>Text</b></td>
            <td width="13%" align="center" class="section-detail"><b>Time Code In</b></td>
            <td width="13%" align="center" class="section-detail"><b>Time Code Out</b></td>

          </tr>
          <% nTotalLines = 0
             do while nTotalLines < 210
              nLines = 0
				if rsTextInfo.EOF = false then 
					nLines = GetLines(rsTextInfo.Fields("TextInfo"))
					nTotalLines = nTotalLines + nLines
				else 
				nTotalLines = nTotalLines + 13	 
				end if
				
				if nTotalLines > 210 Then
					exit do           
				
				else
			
		  %>
          <tr>
			<td width="4%" align="center" ><%if rsTextInfo.EOF = false then Response.Write(rsTextInfo.Fields("TextInfo"))%>&nbsp</td>
            <td width="11%" align="center" ><%if rsTextInfo.EOF = false then Response.write(rsTextInfo.Fields("TimecodeIn"))%>&nbsp;</td>
            <td width="5%" align="center" ><%if rsTextInfo.EOF = false then Response.write(rsTextInfo.Fields("TimecodeOut"))%>&nbsp;</td>
          </tr>
          <%	end if
             if rsTextInfo.EOF = false then rsTextInfo.MoveNext 
             loop%>
			 
			 
         
		  
        </table>
      </td>
    </tr>
  </table>
    
  
</div>
<% j=0
   
	Response.Write("<SCRIPT>")
	for i = 1 to thisPage
	Response.Write("totalPage" & i & ".innerText = '" & thisPage & "';")
	next
	Response.Write("</SCRIPT>")
	
	thisPage = thisPage + 1 
	loop   

%>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<%
 If rsFaultImage.RecordCount  > 0 Then

j=0
'thisPage = thisPage + 1
if rsFaultImage.BOF = true and rsFaultImage.EOF =true then j=1

do while not rsFaultImage.EOF or j=1
%> 


<div class="PageBreak"><!-- Pages >= 2 -->
<!-- ******************************************************* -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype_header">QUALITY CONTROL REPORT FOR<br>
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
   <td>
		Page:&nbsp;<%=thisPage%>&nbsp;of&nbsp;<span id="totalPage<%=thisPage%>"></span>
    </td> 
  </tr>
  <tr>
	<td colspan="3" align="center"><b><%=rsHeader.Fields("Address")%></b>&nbsp;</td>
  </tr>
</table>

<!--#include file="Header.asp" -->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
			  <tr>
				<td class="section-header">Reference Images</td>
			  </tr>
		  </table>

			<p></p>


<table width="100%" border="1" cellspacing="0" cellpadding="0">

			 
<%
         nTotalImages = 0
             do while nTotalImages < 2
              nFaultImages = 0
				if rsFaultImage.EOF = false then 
					nFaultImages = 1 ''GetLines(rsFaultImage.Fields("Description"))
					nTotalImages = nTotalImages + nFaultImages
				else 
				''nTotalLines = nTotalLines + 13	 
				end if
				
				if nFaultImages > 520 Then
					exit do           
				
				elseIf Not IsNull(rsFaultImage.Fields("Description")) And Not IsNull(rsFaultImage.Fields("ImagePath"))  Then
				
	              
%>
      	   <tr class="hideRow">
					<td  align="center"   >
						<table width="100%" border="0" cellspacing="0" cellpadding="1">
						  <tr>
							<td align="center" class="section-detail"> 
							  <%=rsFaultImage.Fields("Description")%>
							</td>
						  </tr>
						   <tr>
							<td align="center">
								<img  width="50%" src="<%=rsFaultImage.Fields("ImagePath")%>" class="galimage" onerror="hideRow()"  /> 					
							</td>
						  </tr>
						  
						</table>
				  </td>
			  </tr>
  
 <%	
            End If
			 
         If rsFaultImage.EOF=false Then
		    rsFaultImage.MoveNext 
		 else
		    Exit Do
		 End if
       loop
%>
 
 </table>



 

<% j=0
   
		Response.Write("<SCRIPT>")
		for i = 1 to thisPage
		Response.Write("totalPage" & i & ".innerText = '" & thisPage & "';")
		next
		Response.Write("</SCRIPT>")
		
		thisPage = thisPage + 1 
		
		If rsFaultImage.EOF=True  Then
	       Exit do
	  End If 
	loop   

End if

rsFaultImage.Close
set rsFaultImage = Nothing
%>

<script>
 function hideRow(){
 
    var images = document.getElementsByClassName('galimage');
	for (var i=0;i<images.length;i+=1){
	
	//alert(images[i].src)

	if(!images[i].src.includes('UploadedImages')){
	   // alert('found: ' + i )
	    document.getElementsByClassName("hideRow")[i].style.display = "none";
	  }
	
	}
 
 }

</script>








