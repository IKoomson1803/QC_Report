<!-- Updated to ensure no blank channels are added to the report Isaac Koomson 04/01/2012 -->
<!--<link REL="stylesheet" TYPE="text/css" HREF="../css/qcs.css">-->
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak {break-after: always; page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; height:30px }
</style>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180"><img SRC="../images/Logos/DPP_Logo.jpg" border="0"></td>
    <td align="right"> 
      <span style="font-size:14px">www.digitalproductionpartnership.co.uk</span>
    </td>
	
  </tr>
  
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


     <table width="100%" border="1" cellspacing="0" cellpadding="1" >
	      <tr>
             <td colspan="4" style="font-size:14px; font-weight:bold; background-color:#D3D3D3;" >&nbsp;Programme Details</td>
              
		 </tr> 
	     <tr>
             <td style="width:10%" >&nbsp;Programme Details&nbsp;</td>
			 <td style="width:70">&nbsp;<%=rsHeader.Fields("ProgrammeDetails")%></td>
             <td style="width:5%;font-size:14px; font-weight:bold;" >&nbsp;Duration&nbsp; </td>
			 <td style="width:15%">&nbsp;<%=rsHeader.Fields("Duration")%></td> 
		 </tr> 
		 <tr> 
                <td>&nbsp;File Name&nbsp;</td>
				<td colspan="3">&nbsp;<%=rsHeader.Fields("Filename")%></td>
				
         </tr>
		 <tr> 
                <td>&nbsp;Production Number&nbsp;</td> 
				<td colspan="3">&nbsp;<%=rsHeader.Fields("ProductionNumber")%></td>
         </tr>	
         <tr> 
                <td>&nbsp;Series Title&nbsp; </td>
				<td colspan="3">&nbsp;<%=rsHeader.Fields("Show")%></td>
         </tr>
          <tr> 
                <td>&nbsp;ProgrammeTitle/Number&nbsp;</td>
				<td colspan="3">&nbsp;<%=rsHeader.Fields("ProgrammeTitleAndNumber")%></td>
         </tr>
         <tr> 
                <td>&nbsp;Episode Title/Number&nbsp;</td>
				<td colspan="3">&nbsp;<%=rsHeader.Fields("Epis_Name")%></td>
         </tr>		 
     </table>
	 
	 
	 
     <table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-top-style:none" >
	      <tr>
             <td colspan="4" style="font-size:14px; font-weight:bold; background-color:#D3D3D3;" >&nbsp;Production Details</td>
              
		 </tr> 
	     <tr>
             <td style="width:40%" >&nbsp;Production Company&nbsp;</td>
			 <td colspan="3" style="width:60%">&nbsp;<%=rsHeader.Fields("ProductionCompany")%></td>
            
		 </tr> 
		   <tr>
             <td style="width:25%" >&nbsp;Contact Phone Number&nbsp;</td>
			 <td style="width:20%">&nbsp;<%=rsHeader.Fields("ContactPhoneNumber")%></td>
             <td style="width:20%">&nbsp;Post Company&nbsp; </td>
			 <td style="width:35%">&nbsp;<%=rsHeader.Fields("PostCompany")%></td> 
		 </tr> 
			 
     </table>
	 
	 
	 <!-- #include file="ChecklistDPP.asp" -->
	 
	  <table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-top-style:none">
	      <tr>
             <td colspan="4" style="font-size:14px; font-weight:bold; background-color:#D3D3D3;" >&nbsp;Commercial Broadcasters Only</td>
              
		 </tr> 
	     <tr>
             <td style="width:50%" >&nbsp;Product placement logo present & in safe area (if required)&nbsp;</td>
			 <td style="width:10%">&nbsp;
			 
			 <%
							  If Not IsNull(rsHeader.Fields("ProductPlacementLogoPresentAndInSafeArea")) Then
							    Response.Write  IIf(rsHeader.Fields("ProductPlacementLogoPresentAndInSafeArea"), "Yes", "No") 
							  End If
					  %>
	
			 </td>
			  <td style="width:30%" >&nbsp;T&Cs within safe area&nbsp;</td>
			 <td style="width:20%">&nbsp;
			 
			 <%
							  If Not IsNull(rsHeader.Fields("TAndCsWithinSafeArea")) Then
							    Response.Write  IIf(rsHeader.Fields("TAndCsWithinSafeArea"), "Yes", "No") 
							  End If
					  %>
	
			 </td>
			 
             
		 </tr> 
		  <tr>
             <td style="width:50%" >&nbsp;Sponsorship head/tail present (if required)&nbsp;</td>
			 <td style="width:10%">&nbsp;
			 
			 <%
							  If Not IsNull(rsHeader.Fields("SponsorshipHeadAndTailPresent")) Then
							    Response.Write  IIf(rsHeader.Fields("SponsorshipHeadAndTailPresent"), "Yes", "No") 
							  End If
					  %>
	
			 </td>
			  <td style="width:30%" class="left_top_border">&nbsp;</td>
			 <td style="width:20%" class="left_right_top_border"> &nbsp;</td>
			 
             
		 </tr>  
     </table>
	 
	 
	 
<!--
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<div class="PageBreak"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td width="180"><img SRC="../images/Logos/DPP_Logo.jpg" border="0"></td>
    <td align="right"> 
      <span style="font-size:14px">www.digitalproductionpartnership.co.uk</span>
    </td>
	
  </tr>
 
</table>
 
-->
  
  
        <table width="100%" border="0" cellspacing="0" cellpadding="1" style="border-top-style:none;margin-top:-2px">
		   <tr> 
			   <td colspan=4 class="left_right_top_border" style="font-size:14px; font-weight:bold; background-color:#D3D3D3;">&nbsp;Production and Technical Warnings</td>
		  </tr>
          <tr> 
	
            <td width="5%" align="center" class="left_top_border">TimeCode</td>
            <td width="40%" align="center" class="left_top_border">Issue</td>
            <td width="40%" align="center" class="left_top_border">Action / Resolution</td>
            <td width="15%" align="center" class="left_right_top_border">Initials</td>
	  
          </tr>
		      <%
			    If rsDPPLog.BOF  = False Then
						 nTotalLines = 0
					 ''Dim faultsCount,itemNo
					 ''itemNo = 1
					 faultsCount = (rsDPPLog.RecordCount * 13) + 420
					 
						 do while nTotalLines < faultsCount '' Changed increased magic number 420  by Isaac Koomson 13/02/2002
						  nLines = 0
						  
							if rsDPPLog.EOF = false then 
								nLines = GetLines(rsDPPLog.Fields("Issue"))
								nTotalLines = nTotalLines + nLines
							else 
								 nTotalLines = nTotalLines + 13	 
							end if
							
							if nTotalLines > faultsCount Then '' Changed increased magic number 420 by Isaac Koomson 13/02/2002
								exit do           
							elseif rsDPPLog.EOF = false then 
						
				  %>
						  <tr>
							 <td  align="center" class="left_top_border" style="width:10%">&nbsp;<%=rsDPPLog.Fields("TimeCode")%>&nbsp;&nbsp;</td>
							<td  align="center"  class="left_top_border" style="width:40%">&nbsp;<%=rsDPPLog.Fields("Issue")%>	&nbsp;&nbsp;</td>					
							<td  align="center"  class="left_top_border" style="width:40%">&nbsp;<%=rsDPPLog.Fields("ActionOrResolution")%>&nbsp;</td>
							<td  align="center"  class="left_right_top_border" style="width:10%">&nbsp;<%=rsDPPLog.Fields("Initials")%>&nbsp;</td>
						 </tr>
					 <%	
							itemNo = itemNo + 1  
							rsDPPLog.MoveNext 
						 end if
						 
						 ''if rsDPPLog.EOF = false then rsDPPLog.MoveNext 
						 
					 loop
		
				
				Else
						
							''Dim i As Integer
							i = 1
							Do While i <= 10
							
							    Response.Write  "<tr>"
									Response.Write  "<td  align='center' class='left_top_border' style='width:10%'>&nbsp;&nbsp;&nbsp;</td>"
									Response.Write  "<td  align='center'  class='left_top_border' style='width:40%'>&nbsp;&nbsp;&nbsp;</td>"					
									Response.Write  "<td  align='left'  class='left_top_border' style='width:40%'>&nbsp;&nbsp;</td>"
									Response.Write  "<td  align='center'  class='left_right_top_border' style='width:10%'>&nbsp;&nbsp;</td>"
								 Response.Write  "</tr>"
								 
						         i = i + 1
							Loop

				End If
		  
			  
			  
			  %>
		  
		  	 
				 
				 
			<tr> 
			   <td colspan=4 class="top_border">&nbsp;</td>
		  </tr>
        </table>
   

<!-- END  LOG  -->

<table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-top-style:none;margin-top:-35px" >
	      <tr>
             <td colspan="4" style="font-size:14px; font-weight:bold; background-color:#D3D3D3;" >&nbsp;Production sign off as acceptable for transmission</td>
              
		 </tr> 
	     <tr>
             <td style="width:25%" >&nbsp;Authorised by:&nbsp;</td>
			 <td style="width:25%">&nbsp;<b><%=rsHeader.Fields("AuthorisedBy")%></b></td>
             <td style="width:25%" >&nbsp;Job Title:&nbsp;</td>
			 <td style="width:25%">&nbsp;<b><%=rsHeader.Fields("JobTitle")%></b></td>
		 </tr> 
		   <tr>
             <td style="width:25%" >&nbsp;Date&nbsp;</td>
			 <td style="width:25%">&nbsp;<b><%=rsHeader.Fields("AuthorisedDate")%></b></td>
               <td style="width:25%" class="left_top_border">&nbsp;</td>
			 <td style="width:25%;background-color:#D3D3D3;" class="left_right_top_border"> &nbsp;</td>
		 </tr> 
			 
     </table>
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
