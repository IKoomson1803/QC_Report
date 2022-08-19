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
      <h2 class="txt_boldtype2">RUNTIME QUALITY CONTROL REPORT FOR<br>
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

 <table width="100%" border="0" cellspacing="0" cellpadding="1">
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
  
 
<!--#include file="Operations.asp" -->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

  
<!--#include file="Measurements.asp" -->

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
    <td>
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
			  
	</td>
  </tr>
</table>

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


<!--#include file="FileAudioSpecifications.asp" -->
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
	
	 <table width="100%" border="0" cellspacing="0" cellpadding="1">
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


 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

 <table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="1"  >
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
    <td height="200px" <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%> colspan="5"<%Else%> width="33%"<%End If%>>
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
    <td width="33%" valign="top" height="200px">
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
	<td width="33%" valign="top" height="200px">
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

<!-- #include file="FaultImages.asp" -->

