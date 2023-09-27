


<%
If rsHDRMetadata.BOF  = False Then
			If rsHDRMetadata.Fields("NotRequired") = False Then	
				
				
%>					
				
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

 <table width="100%" border="0" cellspacing="0" cellpadding="1">
			  <tr>
				<td class="section-header">HDR Metadata</td>
			  </tr>
		  </table>

<p></p>

  <table width="100%" border="1" cellspacing="0" cellpadding="0">
		     	  
			
             <tr> 
				 <td class="section-detail" >HDR Metadata Supplied: </td>
				  <td class="section-text"><%=rsHDRMetadata.Fields("HDRMetadataSupplied")%></td>
				  
				 <td class="section-detail" >HDR Metadata Type:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("HDRMetadataType")%></td>
				  
				 <td class="section-detail" >Does xml Metadata match the Base file Metadata:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("XmlAndBaseFileMetadataMatch")%></td>
				  
				   <td   class="section-detail">Xml MaxCLL:</td>
				    <td class="section-text" ><%=rsHDRMetadata.Fields("MaxCLL")%></td>
			</tr>	
            <tr> 
			     
				  <td  class="section-detail">Xml MaxFALL:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("MaxFALL")%></td>
				  
				  <td >&nbsp;</td>
				  <td >&nbsp;</td>
				  
				  <td>&nbsp;</td>
				  <td >&nbsp;</td>
				  
				  <td >&nbsp;</td>
				  <td >&nbsp;</td>
				  
           </tr>			
			
			  
			 <tr> 
	            <td colspan="8" align="center" class="section-detail">Dolby Vision & ST.2086 Checks</td>
	          </tr>	
              <tr> 
	            <td colspan="8" class="section-detail">Mastering Display</td>
	          </tr>				  
			  <tr> 
				  <td  class="section-detail">Color Primaries: </td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("ColorPrimariesMastering")%></td>
				  
				  <td  class="section-detail">White Point: </td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("WhitePointMastering")%></td>
				  
				  <td  class="section-detail">Peak Brightness:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("PeakBrightnessMastering")%></td>
				  
				  <td  class="section-detail">Minimum Brightness:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("MinimumBrightnessMastering")%></td>
				  
			</tr>
						  
			  <tr> 
	            <td colspan="8" align="center" class="section-detail">Dolby Vision Checks</td>
	          </tr>	
              <tr> 
	            <td colspan="8" class="section-detail">Color Encoding></td>
	          </tr>				  
			  <tr> 
				  <td  class="section-detail">Color Primaries: </td> 
				  <td class="section-text" ><%=rsHDRMetadata.Fields("ColorPrimariesDolbyVision")%></td>
				  
				  <td  class="section-detail">White Point: </td> 
				  <td class="section-text" ><%=rsHDRMetadata.Fields("WhitePointDolbyVision")%></td>
				  
				  <td  class="section-detail"><%=RMetadata.Fields("PeakBrightnessDolbyVision")%></td>
				  
				  <td  class="section-detail">Minimum Brightness:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("MinimumBrightnessDolbyVision")%></td>
			</tr>
			  <tr> 
			     
				  <td  class="section-detail">Encoding:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("Encoding")%></td>
				  
				  <td  class="section-detail">Color Space:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("ColourSpace")%></td>
				  
				  <td  class="section-detail">Color Range:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("ColourRange")%></td>
				  
				  <td >&nbsp;</td>
				  <td >&nbsp;</td>
	        </tr>
						  
			  <tr> 
	            <td colspan="8" align="center" class="section-detail">Xml vs Base file</td>
	          </tr>	
              			  
			  <tr> 
				 <td class="section-detail" >Do Color Primaries match Video File: </td>
                   <td class="section-text" ><%=rsHDRMetadata.Fields("ColourPrimariesMatchVideoFile")%></td>
				  
				 <td class="section-detail" >Does Framerate match Video File: </td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("FrameRateMatchVideoFile")%></td>
				  
				 <td class="section-detail" >Does Canvas Aspect Ratio match Video File:</td>
				  <td class="section-text" ><%=rsHDRMetadata.Fields("CanvasAspectRatioMatchVideoFile")%></td>
				  
				  <td class="section-detail" >Does Image Aspect Ratio match Video File:</td>
				   <td class="section-text" ><%=rsHDRMetadata.Fields("ImageAspectRatioMatchVideoFile")%></td>
			</tr>
			  <tr> 
			    
				  <td  class="section-detail">Does Color Range match Video File: </td> 
				  <td class="section-text" ><%=rsHDRMetadata.Fields("ColourRangeMatchVideoFile")%></td>
				  
				  <td class="section-detail">&nbsp;</td>
				  <td class="section-text">&nbsp;</td>
				  
				  <td class="section-detail">&nbsp;</td>
				  <td class="section-text">&nbsp;</td>
				  
				  <td class="section-detail">&nbsp;</td>
				  <td class="section-text">&nbsp;</td>
	        </tr>
				
</table>




				
			
				
<% End If	
				
Set rsHDRMetadata = Nothing				

				
End If				
%>				