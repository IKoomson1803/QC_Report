
  <table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-top:none">
	    
	     <tr>
             <td class="BanijayRightsProgrammeDetails">&nbsp;Programme Title:&nbsp;</td>
			 <td colspan="3" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Show")%></td>
         </tr> 
		 
		 <tr> 
                <td class="BanijayRightsProgrammeDetails">&nbsp;File Name:&nbsp;</td>
				<td colspan="3" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Filename")%></td>
				
         </tr>
		
		 <tr> 
                <td class="BanijayRightsProgrammeDetails">&nbsp;Episode Title:&nbsp;</td>
				<td colspan="3" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Epis_Name")%></td>
				
         </tr>
		 
		 
         <tr > 
                <td class="BanijayRightsProgrammeDetails">&nbsp;Episode Number:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Epis_No")%></td>
				<td class="BanijayRightsProgrammeDetails">&nbsp;Version:&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("Version")%></td>
         </tr>
		 
		 <tr > 
                <td class="BanijayRightsProgrammeDetails">&nbsp;File Wrapper:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("FileWrapper")%></td>
				<td class="BanijayRightsProgrammeDetails">&nbsp; Video Lines:&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("VideoLines")%></td>
         </tr>
		 
		 <tr > 
                <td class="BanijayRightsProgrammeDetails">&nbsp;Codec:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Video_Codec")%></td>
				<td class="BanijayRightsProgrammeDetails">&nbsp; Type of HDR:&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("TypeOfHDR")%></td>
         </tr>
		 
		 <tr > 
                <td class="BanijayRightsProgrammeDetails">&nbsp;SDR / HDR:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("SDROrHDR")%></td>
				<td class="BanijayRightsProgrammeDetails">&nbsp; Time code:&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("Timecode")%></td>
         </tr>
		 
		  <tr > 
                <td class="BanijayRightsProgrammeDetails">&nbsp;Frame Rate:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("FrameRate")%></td>
				<td class="BanijayRightsProgrammeDetails">&nbsp; Caption Safe:&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("CaptionSafe")%></td>
         </tr>
		 
		   <tr > 
                <td class="BanijayRightsProgrammeDetails">&nbsp;Aspect Ratio:&nbsp; </td>
				<td class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Aspect")%></td>
				<td class="BanijayRightsProgrammeDetails">&nbsp; Embedded CC Track?&nbsp; </td>
				<td class="BanijayRightsText"> &nbsp;<%=rsHeader.Fields("EmbeddedCCTrack")%></td>
         </tr>
		 
		 
		  
     </table>
	 