


<%
If rsHDRMetadata.BOF  = False Then
			If rsHDRMetadata.Fields("NotRequired") = False Then	
				
				
%>					
				
<table class="section-table" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

 <table class="section-table" border="0" cellspacing="0" cellpadding="1">
			  <tr>
				<td class="section-header">HDR Metadata</td>
			  </tr>
		  </table>

<p></p>

  <table class="section-table" border="1" cellspacing="0" cellpadding="0">
		     	  
			
             <tr> 
				 <td class="section-label hdr-metadata-label" >HDR Metadata Supplied: </td>
				  <td class="section-text hdr-metadata-text"><%=rsHDRMetadata.Fields("HDRMetadataSupplied")%></td>
				  
				 <td class="section-label hdr-metadata-label" >HDR Metadata Type:</td>
				  <td class="section-text hdr-metadata-text" ><%=rsHDRMetadata.Fields("HDRMetadataType")%></td>
				  
				 <td class="section-label hdr-metadata-label" >Does xml Metadata match the Base file Metadata:</td>
				  <td class="section-text hdr-metadata-text" ><%=rsHDRMetadata.Fields("XmlAndBaseFileMetadataMatch")%></td>
				  
				
			</tr>	
            <tr> 
			      <td   class="section-label">Xml MaxCLL:</td>
				    <td class="section-text" ><%=rsHDRMetadata.Fields("MaxCLL")%></td>
					
			     
				  <td  class="section-label">Xml MaxFALL:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("MaxFALL")%></td>
				  
				 <td class="section-empty-label"  >&nbsp; </td>
			      <td class="section-empty-label"  >&nbsp; </td>
				  
				  				  
           </tr>			
			
			  
			 <tr> 
	            <td colspan="8" class="section-sub-header">DOLBY VISION & ST.2086 CHECKS</td>
	          </tr>	
              <tr> 
	            <td colspan="8" align="center" class="section-label">Mastering Display</td>
	          </tr>				  
			  <tr> 
				  <td  class="section-label">Color Primaries: </td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("ColorPrimariesMastering")%></td>
				  
				  <td  class="section-label">White Point: </td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("WhitePointMastering")%></td>
				  
				  <td  class="section-label">Peak Brightness:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("PeakBrightnessMastering")%></td>
				</tr>

				<tr>
	                <td  class="section-label">Minimum Brightness:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("MinimumBrightnessMastering")%></td>
				  
				   <td class="section-empty-label"  >&nbsp; </td>
			      <td class="section-empty-label"  >&nbsp; </td>
				  
				   <td class="section-empty-label"  >&nbsp; </td>
			      <td class="section-empty-label"  >&nbsp; </td>
				  
			</tr>			   
			
				<!--		  
			  <tr> 
	            <td colspan="8" class="section-sub-header">DOLBY VISION CHECKS</td>
	          </tr>	
			  -->
			  
              <tr> 
	            <td colspan="8" align="center" class="section-label">Color Encoding</td>
	          </tr>				  
			  <tr> 
				  <td  class="section-label">Color Primaries: </td> 
				  <td class="section-text" ><%=rsHDRMetadata.Fields("ColorPrimariesDolbyVision")%></td>
	  
				  
				   <td  class="section-label">White Point: </td> 
				  <td  class="section-label"><%=RMetadata.Fields("PeakBrightnessDolbyVision")%></td>
				  
				  <td  class="section-label">Minimum Brightness:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("MinimumBrightnessDolbyVision")%></td>
			</tr>
			  <tr> 
			  <td  class="section-label">Peak Brightness: </td> 
				  <td class="section-text" ><%=rsHDRMetadata.Fields("WhitePointDolbyVision")%></td>
				  
			     
				  <td  class="section-label">Encoding:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("Encoding")%></td>
				  
				  <td  class="section-label">Color Space:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("ColourSpace")%></td>
			
	        </tr>
			
			<tr>
			    	  
				  <td  class="section-label">Color Range:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("ColourRange")%></td>
				  
				   <td class="section-empty-label"  >&nbsp; </td>
			      <td class="section-empty-label"  >&nbsp; </td>
				  
				   <td class="section-empty-label"  >&nbsp; </td>
			      <td class="section-empty-label"  >&nbsp; </td>
			
			</tr>
						  
			  <tr> 
	            <td colspan="8" class="section-sub-header">XML VS BASE FILE</td>
	          </tr>	
              			  
			  <tr> 
			       <td class="section-label" >Do Color Primaries match Video File: </td>
                   <td class="section-text" ><%=rsHDRMetadata.Fields("ColourPrimariesMatchVideoFile")%></td>
				  
				 <td class="section-label" >Does Framerate match Video File: </td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("FrameRateMatchVideoFile")%></td>
				  
				 <td class="section-label" >Does Canvas Aspect Ratio match Video File:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("CanvasAspectRatioMatchVideoFile")%></td>
				  
				
			</tr>
			  <tr> 
			      <td class="section-label" >Does Image Aspect Ratio match Video File:</td>
				   <td class="section-text" ><%=rsHDRMetadata.Fields("ImageAspectRatioMatchVideoFile")%></td>
			    
				  <td  class="section-label">Does Color Range match Video File: </td> 
				  <td class="section-text" ><%=rsHDRMetadata.Fields("ColourRangeMatchVideoFile")%></td>
				  
				   <td class="section-empty-label"  >&nbsp; </td>
			      <td class="section-empty-label"  >&nbsp; </td>
				  
				 
	        </tr>
				
</table>




				
			
				
<% End If	
				
Set rsHDRMetadata = Nothing				

				
End If				
%>				