
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak {break-after: always; page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; height:30px }
</style>


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
				  <td   class="section-detail">&nbsp;HDR Metadata Supplied: </td>
				  <td>           <b>&nbsp; <b><%=rsHDRMetadata.Fields("HDRMetadataSupplied")%></b></td>
				  
				  <td   class="section-detail">&nbsp;HDR Metadata Type:</td>
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("HDRMetadataType")%></b></td>
				  
				  <td   class="section-detail">&nbsp;Does xml Metadata match the Base file Metadata:</td>
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("XmlAndBaseFileMetadataMatch")%></b></td>
				  
				   <td   class="bottom_border">&nbsp;Xml MaxCLL:</td>
				    <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("MaxCLL")%></b></td>
			</tr>	
            <tr> 
			     
				  <td  class="section-detail">&nbsp;Xml MaxFALL:</td>
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("MaxFALL")%></b></td>
				  
				  <td >&nbsp;</td>
				  <td >&nbsp;</td>
				  
				  <td>&nbsp;</td>
				  <td >&nbsp;</td>
				  
				  <td >&nbsp;</td>
				  <td >&nbsp;</td>
				  
           </tr>			
			
			  
			 <tr> 
	            <td colspan="8" align="center" class="section-detail"><b>Dolby Vision & ST.2086 Checks</b></td>
	          </tr>	
              <tr> 
	            <td colspan="8" class="section-detail">&nbsp;<b>Mastering Display</b></td>
	          </tr>				  
			  <tr> 
				  <td  class="section-detail">&nbsp;Color Primaries: </td>
				  <td ><b>&nbsp; <b><%=rsHDRMetadata.Fields("ColorPrimariesMastering")%></b></td>
				  
				  <td  class="section-detail">&nbsp;White Point: </td>
				  <td ><b>&nbsp; <b><%=rsHDRMetadata.Fields("WhitePointMastering")%></b></td>
				  
				  <td  class="section-detail">&nbsp;Peak Brightness:</td>
				  <td ><b>&nbsp; <b><%=rsHDRMetadata.Fields("PeakBrightnessMastering")%></b></td>
				  
				  <td  class="section-detail">&nbsp;Minimum Brightness:</td>
				  <td ><b>&nbsp; <b><%=rsHDRMetadata.Fields("MinimumBrightnessMastering")%></b></td>
				  
			</tr>
						  
			  <tr> 
	            <td colspan="8" align="center" class="section-detail"><b>Dolby Vision Checks</b></td>
	          </tr>	
              <tr> 
	            <td colspan="8" class="section-detail">&nbsp;<b>Color Encoding</b></td>
	          </tr>				  
			  <tr> 
				  <td  class="section-detail">&nbsp;Color Primaries: </td> 
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("ColorPrimariesDolbyVision")%></b></td>
				  
				  <td  class="section-detail">&nbsp;White Point: </td> 
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("WhitePointDolbyVision")%></b></td>
				  
				  <td  class="section-detail">&nbsp;Peak Brightness:</td>
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("PeakBrightnessDolbyVision")%></b></td>
				  
				  <td  class="section-detail">&nbsp;Minimum Brightness:</td>
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("MinimumBrightnessDolbyVision")%></b></td>
			</tr>
			  <tr> 
			     
				  <td  class="section-detail">&nbsp;Encoding:</td>
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("Encoding")%></b></td>
				  
				  <td  class="section-detail">&nbsp;Color Space:</td>
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("ColourSpace")%></b></td>
				  
				  <td  class="section-detail">&nbsp;Color Range:</td>
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("ColourRange")%></b></td>
				  
				  <td >&nbsp;</td>
				  <td >&nbsp;</td>
	        </tr>
						  
			  <tr> 
	            <td colspan="8" align="center" class="section-detail"><b>Xml vs Base file</b></td>
	          </tr>	
              			  
			  <tr> 
				  <td   class="section-detail">&nbsp;Do Color Primaries match Video File: </td>
                   <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("ColourPrimariesMatchVideoFile")%></b></td>
				  
				  <td   class="section-detail">&nbsp;Does Framerate match Video File: </td>
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("FrameRateMatchVideoFile")%></b></td>
				  
				  <td   class="section-detail">&nbsp;Does Canvas Aspect Ratio match Video File:</td>
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("CanvasAspectRatioMatchVideoFile")%></b></td>
				  
				   <td   class="section-detail">&nbsp;Does Image Aspect Ratio match Video File:</td>
				   <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("ImageAspectRatioMatchVideoFile")%></b></td>
			</tr>
			  <tr> 
			    
				  <td  class="section-detail">&nbsp;Does Color Range match Video File: </td> 
				  <td><b>&nbsp; <b><%=rsHDRMetadata.Fields("ColourRangeMatchVideoFile")%></b></td>
				  
				  <td>&nbsp;</td>
				  <td>&nbsp;</td>
				  
				  <td>&nbsp;</td>
				  <td>&nbsp;</td>
				  
				  <td>&nbsp;</td>
				  <td>&nbsp;</td>
	        </tr>
				
</table>




				
			
				
<% End If	
				
Set rsHDRMetadata = Nothing				

				
End If				
%>				