<!-- Updated to ensure no blank channels are added to the report Isaac Koomson 04/01/2012 -->
<link REL="stylesheet" TYPE="text/css" HREF="../css/qcs.css">
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak { page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; }
</style>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype_header">RUNTIME QUALITY CONTROL WITH TEXT INFO REPORT FOR<br>
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
    <td align="right">
		Page:&nbsp;1&nbsp;of&nbsp;1
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

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="25">
  <tr>
    <td height="12">
    <p align="center"><b>&nbsp;1 = </b>Very Annoying<b>&nbsp;&nbsp;
    2 = </b>Annoying<b>&nbsp;&nbsp;
    3 = </b>Slightly Annoying<b>&nbsp;&nbsp;
    4 = </b>Perceptible but not Annoying&nbsp;&nbsp;
    <b>5 = </b>ImPerceptible
	</td>
  </tr>
  
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
  
 <!--#include file="Operations.asp" -->
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

<!--#include file="Measurements.asp" -->

 

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

  <!--#include file="SafeAreaCheck.asp" -->
 

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
       
	           positionDisney = InStr(1, UCase(rsHeader.Fields("CustName")), "DISNEY")
			   positionLionsGate = InStr(1, UCase(rsHeader.Fields("CustName")), "LIONSGATE")
			   positionWarner = InStr(1, UCase(rsHeader.Fields("CustName")), "WARNER")
			   positionWildBunch  = InStr(1, UCase(rsHeader.Fields("CustName")), "WILD BUNCH")
			   
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

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!--#include file="Comments.asp" -->


<!-- START  TEXT INFO -->

<div class="PageBreak"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype_header">RUNTIME QUALITY CONTROL WITH TEXT INFO REPORT FOR<br>
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
    <td align="right">
		Page:&nbsp;1&nbsp;of&nbsp;2
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="25">
  <tr>
    <td height="12">
    <p align="center"><b>&nbsp;1 = </b>Very Annoying<b>&nbsp;&nbsp;
    2 = </b>Annoying<b>&nbsp;&nbsp;
    3 = </b>Slightly Annoying<b>&nbsp;&nbsp;
    4 = </b>Perceptible but not Annoying&nbsp;&nbsp;
    <b>5 = </b>ImPerceptible
	</td>
  </tr>
  
  
  <tr>
    <td height="13"></td>
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
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr height=30> 
			<td width="64%" align="center" class="left_top_border"><b>Text</b></td>
            <td width="13%" align="center" class="left_top_border"><b>Time Code In</b></td>
            <td width="13%" align="center" class="left_right_top_border"><b>Time Code Out</b></td>

          </tr>
          <% nTotalLines = 0
		   do while Not rsTextInfo.EOF
             ''do while nTotalLines < 520
              ''nLines = 0
				''if rsTextInfo.EOF = false then 
					''nLines = GetLines(rsTextInfo.Fields("TextInfo"))
					''nTotalLines = nTotalLines + nLines
				''else 
				''nTotalLines = nTotalLines + 13	 
				''end if
				
				''if nTotalLines > 520 Then
					''exit do           
				
				''else
			
		  %>
          <tr>
			<td width="4%" align="center" class="left_top_border"><%if rsTextInfo.EOF = false then Response.Write(rsTextInfo.Fields("TextInfo"))%>&nbsp</td>
            <td width="11%" align="center" class="left_top_border"><%if rsTextInfo.EOF = false then Response.write(rsTextInfo.Fields("TimecodeIn"))%>&nbsp;</td>
            <td width="5%" align="center" class="left_right_top_border"><%if rsTextInfo.EOF = false then Response.write(rsTextInfo.Fields("TimecodeOut"))%>&nbsp;</td>
          </tr>
          <%	''end if
             if rsTextInfo.EOF = false then rsTextInfo.MoveNext 
             loop%>
          <tr>
			<td colspan=3 class="top_border">&nbsp;</td>
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


<!-- END  TEXT INFO  -->
<!-- #include file="FaultImages.asp" -->

             
