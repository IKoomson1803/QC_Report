<!-- Updated to include channels 9-16 Isaac Koomson 04/01/2012 -->



<link REL="stylesheet" TYPE="text/css" HREF="../css/qcs.css">
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak { page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt;  }
</style>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td width="180"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype2">MASTER QUALITY CONTROL REPORT FOR<br>
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


<!--#include file="Operations.asp" -->


<!--#include file="Measurements.asp" -->


<br/>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<% 
       
	           positionDisney = InStr(1, rsHeader.Fields("CustName"), "Disney")
			 	
			  If positionDisney > 0 Then
			  %>
			   <!--#include file="DisneyChecklist.asp" -->
			 <% Else %>
		   
			  <% End If %>
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
    <td>&nbsp;</td>
  </tr>
</table>


<% If sAssetType = "Tape" Then %>
     <!--#include file="TapeAudioSpecifications.asp" -->
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
     </table>
	 <!--#include file="VideoSpecifications.asp" --> 
<% Else %>
    <!--#include file="FileAudioSpecifications.asp" -->
	
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
							<td width="100%">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="blackSquare" align="center"><b><i>SAFE AREA CHECK</i></b></td>
									</tr>
								</table>
							</td>
     					</tr>
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="left_right_bottom_border">&nbsp;</td>
										<td class="bottom_border"><b>&nbsp;All Display Formats</b></td>
										<td class="left_right_bottom_border"><b>&nbsp;16:9 (when aspect ratio converted to 4:3)</b>
									</tr>
									<tr>
										<td class="left_right_bottom_border"><b>&nbsp;Opening Titles:&nbsp;</b></td>
										<td class="bottom_border">&nbsp;<%=rsHeader.Fields("OTPercent")%> Safe:&nbsp;</td>
										<td class="left_right_bottom_border">&nbsp;Safe for:&nbsp; <%=rsHeader.Fields("OTVer")%></td>
									</tr>
									<tr>
										<td class="left_right_bottom_border"><b>&nbsp;Closing Titles:&nbsp;</b></td>
										<td class="bottom_border">&nbsp;<%=rsHeader.Fields("CTPercent")%> Safe:&nbsp;</td>
										<td class="left_right_bottom_border">&nbsp;Safe for:&nbsp; <%=rsHeader.Fields("CTVer")%></td>
									</tr>
									<tr>
										<td class="left_right_bottom_border"><b>&nbsp;Captions:&nbsp;</b></td>
										<td class="bottom_border">&nbsp;<%=rsHeader.Fields("CapPercent")%> Safe:&nbsp;</td>
										<td class="left_right_bottom_border">&nbsp;Safe for:&nbsp; <%=rsHeader.Fields("CapVer")%>&nbsp;</td>
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
					
		
		
		   
				<table width="100%" border="0" cellspacing="0" cellpadding="0" >
				<tr>
					<td valign="top" width="100%" class="blacksquare">
					  <!--#include file="ProgramFormat.asp" -->
				   </td>
				 </tr>
				 </table>
		   
		
	
		
		
		
	 

 <% End If %>

 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<% If sAssetType = "Tape" Then %>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="49.5%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="blackSquare" align="center"><b><i>SAFE AREA CHECK</i></b></td>
				</tr>
			</table>
		</td>
		<td width="1%">&nbsp;</td>
		<td width="1%">&nbsp;</td>
		
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="left_right_bottom_border">&nbsp;</td>
					<td class="bottom_border"><b>&nbsp;All Display Formats</b></td>
					<td class="left_right_bottom_border"><b>&nbsp;16:9 (when aspect ratio converted to 4:3)</b>
				</tr>
				<tr>
					<td class="left_right_bottom_border"><b>&nbsp;Opening Titles:&nbsp;</b></td>
					<td class="bottom_border">&nbsp;<%=rsHeader.Fields("OTPercent")%> Safe:&nbsp;</td>
					<td class="left_right_bottom_border">&nbsp;Safe for:&nbsp; <%=rsHeader.Fields("OTVer")%></td>
				</tr>
				<tr>
					<td class="left_right_bottom_border"><b>&nbsp;Closing Titles:&nbsp;</b></td>
					<td class="bottom_border">&nbsp;<%=rsHeader.Fields("CTPercent")%> Safe:&nbsp;</td>
					<td class="left_right_bottom_border">&nbsp;Safe for:&nbsp; <%=rsHeader.Fields("CTVer")%></td>
				</tr>
				<tr>
					<td class="left_right_bottom_border"><b>&nbsp;Captions:&nbsp;</b></td>
					<td class="bottom_border">&nbsp;<%=rsHeader.Fields("CapPercent")%> Safe:&nbsp;</td>
					<td class="left_right_bottom_border">&nbsp;Safe for:&nbsp; <%=rsHeader.Fields("CapVer")%>&nbsp;</td>
				</tr>
			</table>
		</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
 <% End If %>

<table width="100%" border="0" cellspacing="0" cellpadding="1" style="display:block;min-height:100px;" >
  <tr>
    <td  align="center" <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%> colspan="5"<%End If%>>
	  <font class="txt_italic" size="2"><b>OVERALL COMMENTS</b></font>
    </td>
    <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%>
    <td align="center" width="5" >
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
    <td align="center" valign="top">
      <font class="txt_italic" size="2"><b>AUDIO COMMENTS / CORRECTIVE ACTIONS</b></font>
    </td>
	<td align="center" width="5">
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
	 <td align="center" valign="top">
      <font class="txt_italic" size="2"><b>VIDEO COMMENTS / CORRECTIVE ACTIONS</b></font>
    </td>
    <%End If%>
  </tr>
  <tr>
    <td height="100%" <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%> colspan="5"<%Else%> width="33%"<%End If%>>
		  <table  width="100%" height="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000">
			<tr>
			  <td  valign="top">&nbsp;<%=rsFullSpot.Fields("Comments")%> 
			  <p>&nbsp;</p>
			  <p>&nbsp;</p>
			  </td>
			</tr>
		  </table>
	   </td>
    <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%>
    <td align="center" width="5">
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
    <td width="33%" valign="top" height="100%">
	 	  <table  width="100%" height="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000">
			<tr>
			  <td  valign="top">&nbsp;<%=rsFullSpot.Fields("RecommendationComments")%>
			   <p>&nbsp;</p>
			  <p>&nbsp;</p>
			  </td>
			</tr>
		  </table>
	  </td>
	<td align="center" width="5">
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
	<td width="33%" valign="top" height="100%">
		  <table width="100%" height="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000">
			<tr>
			  <td  valign="top">&nbsp;<%=rsFullSpot.Fields("VideoComments")%>&nbsp;
			  <p>&nbsp;</p>
			  <p>&nbsp;</p>
			  </td>
			</tr>
		  </table>
	   </td>
    <%End If%>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

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
      <h2 class="txt_boldtype2">MASTER QUALITY CONTROL REPORT FOR<br>
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

<table width="100%" border="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!--#include file="Header.asp" -->

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
            <td width="12%" align="center" class="left_top_border"><b>Time Code</b></td>
            <td width="5%" align="center" class="left_top_border"><b>Type</b></td>
            <td width="54%" align="center" class="left_top_border"><b>Fault Description</b></td>
            <td width="5%" align="center" class="left_top_border"><b>GRD</b></td>
            <td width="7%" align="center" class="left_top_border"><b>Sector</b></td>
            <td width="9%" align="center" class="left_top_border"><b>Approved</b></td>
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
				
				if nTotalLines > 420 Then
					exit do           
				
				else
			
		  %>
          <tr>
            <td width="12%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Time_Code"))%>&nbsp;</td>
            <td width="5%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("QC_Code"))%>&nbsp;</td>
            <td width="54%" align="left" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Note"))%>&nbsp;</td>
            <td width="5%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("QC_Grade"))%>&nbsp;</td>
            <td width="7%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Action"))%>&nbsp;</td>
            <td width="9%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then 
													if rsBVMastLog.Fields("in_master") = -1 then
														Response.write("Yes")
													else
														Response.Write("")
													end if
												 end if%>&nbsp;</td>
            <td width="8%" align="center" class="left_right_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("item_duratn"))%>&nbsp;</td>
          </tr>
          <%	end if
             if rsBVMastLog.EOF = false then rsBVMastLog.MoveNext 
             loop%>
          <tr>
			<td colspan=7 class="top_border">&nbsp;</td>
		  </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td colspan=5>&nbsp;</td>
    </tr>
    <tr>
      <td>Type:</td>
      <td>F=Film</td>
      <td>V=Video</td>
      <td>A=Audio</td>
      <td colspan=2 align="center">
			<table cellspacing=0 border=1 bordercolor="#000000" width=90 id="tblTapeFormat">
				<tr>
					<td width=30 align="center" valign="middle">U-L</td>
					<td width=30 align="center" valign="middle">U-C</td>
					<td width=30 align="center" valign="middle">U-R</td>
				</tr>
				<tr>
					<td width=30 align="center" valign="middle">M-L</td>
					<td width=30 align="center" valign="middle">M-C</td>
					<td width=30 align="center" valign="middle">M-R</td>
				</tr>
				<tr>
					<td width=30 align="center" valign="middle">L-L</td>
					<td width=30 align="center" valign="middle">L-C</td>
					<td width=30 align="center" valign="middle">L-R</td>
				</tr>
			</table>	
      </td>
    </tr>
    <tr>
		<td colspan=5>&nbsp;</td>
    </tr>
    <%if rsHeader.Fields("GradingScale") = 3 then %>
    <tr> 
      <td>Severity Grades:</td>
      <td>1=Acceptable</td>
      <td>2=Marginal</td>
      <td>3=Unacceptable</td>
      <td colspan=2>&nbsp;</td>
    </tr>
    <%end if%>
    <%if rsHeader.Fields("GradingScale") = 4 then %>
    <tr> 
      <td>Severity Grades:</td>
      <td>1=Standard/Non Detectable</td>
      <td>2=Acceptable</td>
      <td>3=Marginal/Intrusive</td>
      <td>4=Unacceptable</td>
      <td>&nbsp;</td>
    </tr>
    <%end if%>
    <%if rsHeader.Fields("GradingScale") = 5 then %>
    <tr> 
      <td>Severity Grades:</td>
      <td>1=Very Annoying</td>
      <td>2=Annoying</td>
      <td>3=Slightly Annoying</td>
      <td>4=Perceptible but not Annoying</td>
      <td>5=Imperceptible</td>
    </tr>
    <%end if%>
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
      <h2 class="txt_boldtype2">MASTER QUALITY CONTROL REPORT FOR<br>
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
<table width="100%" border="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!--#include file="Header.asp" -->

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
       

 