<!-- Updated to ensure no blank channels are added to the report Isaac Koomson 04/01/2012 -->
<!--<link REL="stylesheet" TYPE="text/css" HREF="../css/qcs.css">-->
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak {break-after: always; page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; }

.BanijayRightsProgramme{
	background-color:#5C013F;
	color: #fff;
	font-size:14px;
	font-weight:bold;
	width:20%;
	text-align:right;
	border-style:none;
}

.BanijayRightsText{
	font-size:14px;

}

</style>

<%

''Response.Write "BANIJAY RIGHTS QC REPORT"

%>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#5C013F; border-style:none">
  <tr>
     <td  align="right" style="font-size:35px;font-weight:bold;width:40%; color:#fff"> 
      BANIJAY RIGHTS QC REPORT
    </td>
	<td   style="width:10%"> 
      &nbsp;
    </td>
	<td width="40%" align="left">
	 <img SRC="../images/Logos/BanijayRights_Logo_3.png" border="0">
	</td>
	
  </tr>
 </table> 


  <table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-top:none">
	    
	     <tr>
             <td class="BanijayRightsProgramme">&nbsp;Programme Title:&nbsp;</td>
			 <td colspan="3" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Show")%></td>
         </tr> 
		 
		 <tr> 
                <td class="BanijayRightsProgramme">&nbsp;File Name:&nbsp;</td>
				<td colspan="3" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Filename")%></td>
				
         </tr>
		
		 <tr> 
                <td class="BanijayRightsProgramme">&nbsp;Episode Title:&nbsp;</td>
				<td colspan="3" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Epis_Name")%></td>
				
         </tr>
		 
		 
         <tr > 
                <td class="BanijayRightsProgramme">&nbsp;Episode Number:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Epis_No")%></td>
				<td class="BanijayRightsProgramme">&nbsp;Version:&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("Version")%></td>
         </tr>
		 
		 <tr > 
                <td class="BanijayRightsProgramme">&nbsp;File Wrapper:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("FileWrapper")%></td>
				<td class="BanijayRightsProgramme">&nbsp; Video Lines:&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("VideoLines")%></td>
         </tr>
		 
		 <tr > 
                <td class="BanijayRightsProgramme">&nbsp;Codec:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Video_Codec")%></td>
				<td class="BanijayRightsProgramme">&nbsp; Type of HDR:&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("TypeOfHDR")%></td>
         </tr>
		 
		 <tr > 
                <td class="BanijayRightsProgramme">&nbsp;SDR / HDR:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("SDROrHDR")%></td>
				<td class="BanijayRightsProgramme">&nbsp; Time code:&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("Timecode")%></td>
         </tr>
		 
		  <tr > 
                <td class="BanijayRightsProgramme">&nbsp;Frame Rate:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("FrameRate")%></td>
				<td class="BanijayRightsProgramme">&nbsp; Caption Safe:&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("CaptionSafe")%></td>
         </tr>
		 
		   <tr > 
                <td class="BanijayRightsProgramme">&nbsp;Aspect Ratio:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Aspect")%></td>
				<td class="BanijayRightsProgramme">&nbsp; Embedded CC Track?&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("EmbeddedCCTrack")%></td>
         </tr>
		 
		 
		  
     </table>
	 
	 
	 <table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-top:none; border-bottom:none; background-color:#BFBFBF">
	   <tr>
          <td>&nbsp;</td>
      </tr> 
	 </table>
	 	  
	  <table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-bottom:none; background-color:#FF4370">
	   <tr>
          <td style="font-size:14px; font-weight: bold; text-align:center;padding: 5px 5px 5px 5px;">AUDIO</td>
      </tr> 
	 </table>
	 <table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-bottom:none; background-color:#BFBFBF">
	   <tr>
          <td>&nbsp;</td>
      </tr> 
	 </table>
	 
	 <!-- AUDIO -->
		 
	  <!-- #include file="FileAudioSpecifications_BanijayRights.asp" -->
	  
	  	 <table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-top:none; border-bottom:none; background-color:#BFBFBF">
	   <tr>
          <td>&nbsp;</td>
      </tr> 
	 </table>
	 	  
	  <table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-bottom:none; background-color:#FF4370">
	   <tr>
          <td style="font-size:14px; font-weight: bold; text-align:center;padding: 5px 5px 5px 5px;">VIDEO</td>
      </tr> 
	 </table>
	 <table width="100%" border="0" cellspacing="0" cellpadding="1" style="border-bottom:none; background-color:#BFBFBF">
	   <tr>
          <td>&nbsp;</td>
      </tr> 
	 </table>
	 
	  <!-- VIDEO -->
	  
		 
	 <table width="100%" border="1" cellspacing="0" cellpadding="0" >
        <tr>
			<td colspan="2" style="background-color:#5C013F;width:30%;color:#fff;font-weight:bold; font-size:14px;text-align:center; ">
				 Bars / Line-up
			</td>
			 <td style="background-color:#BFBFBF; width:10%;border:none">
				 &nbsp;
			</td>  
			<td colspan="5" style="background-color:#5C013F; width:60%; color:#fff;font-weight:bold; font-size:14px; text-align:center; ">
				Programme Overall Technical Spec
			</td>
       </tr>
	   
	   
	   <tr>
	   
	       <td style="width:12%">&nbsp;Video Gain: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("Bar_Vid")%></td>
	       <td style="background-color:#BFBFBF; border:none;width:10%">&nbsp;</td>
	       <td style="width:12%">&nbsp;Lum. Peak: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("Lum_Peak")%></td>
		   <td style="background-color:#BFBFBF;width:10%">&nbsp;</td>
		   <td style="width:12%">&nbsp;Chroma Peak: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("Chroma_Peak")%></td>
	   </tr>
	   
	    <tr>
	   
	       <td style="width:12%">&nbsp;Chroma Gain: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("Bar_Chr")%></td>
	       <td style="background-color:#BFBFBF; border:none;width:10%">&nbsp;</td>
	       <td style="width:12%">&nbsp;Lum. Avg: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("Lum_Avg")%></td>
		   <td style="background-color:#BFBFBF;width:10%">&nbsp;</td>
		   <td style="width:12%">&nbsp;Chroma Avg: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("Chroma_Avg")%></td>
	   </tr>
	   
	    <tr>
	   
	       <td style="width:12%">&nbsp;Set Up: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("Bar_Set")%></td>
	       <td style="background-color:#BFBFBF; border:none;width:10%">&nbsp;</td>
	       <td style="width:12%">&nbsp;Black Level: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("Black")%></td>
		   <td style="background-color:#BFBFBF;width:10%">&nbsp;</td>
		   <td style="width:12%">&nbsp;PSE Result: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("PSEResult")%></td>
	   </tr>
	   
     </table>
	 
	 
	 
	 
	 
	  
