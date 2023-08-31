
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

<div class="div-frame-border">
  <table width="100%" border="1" cellspacing="0" cellpadding="1">
		      <tr> 
	            <td colspan="4" class="header"><b>HDR METADATA</b></td>
	          </tr>	
			  <tr> 
				  <td width="75%"  colspan="3">&nbsp;Xml Document: <b>&nbsp; <b><%=rsHDRMetadata.Fields("XmlDocument")%></b></td>
		     	 <td width="25%" >&nbsp;Xml Creation Date:<b>&nbsp; <b><%=rsHDRMetadata.Fields("XmlCreationDate")%></b></td>
			</tr>	
            <tr> 
			  
             <tr> 
				  <td width="25%" >&nbsp;HDR Metadata Supplied: <b>&nbsp; <b><%=rsHDRMetadata.Fields("HDRMetadataSupplied")%></b></td>
				  <td width="25%" >&nbsp;HDR Metadata Type:<b>&nbsp; <b><%=rsHDRMetadata.Fields("HDRMetadataType")%></b></td>
				  <td width="25%" >&nbsp;Does xml Metadata match the Base file Metadata:<b>&nbsp; <b><%=rsHDRMetadata.Fields("XmlAndBaseFileMetadataMatch")%></b></td>
				   <td width="25%" >&nbsp;MaxCLL:<b>&nbsp; <b><%=rsHDRMetadata.Fields("MaxCLL")%></b></td>
			</tr>	
            <tr> 
			     
				  <td width="25%" >&nbsp;MaxFALL:<b>&nbsp; <b><%=rsHDRMetadata.Fields("MaxFALL")%></b></td>
				  <td width="25%" >&nbsp;</td>
				  <td width="25%" >&nbsp;</td>
				  <td width="25%" >&nbsp;</td>
           </tr>			
			
			  
			 <tr> 
	            <td colspan="4" align="center"><b>Dolby Vision & ST.2086 Checks</b></td>
	          </tr>	
              <tr> 
	            <td colspan="4"><b>Mastering Display</b></td>
	          </tr>				  
			  <tr> 
				  <td width="25%" >&nbsp;Color Primaries:   <b>&nbsp; <b><%=rsHDRMetadata.Fields("ColorPrimariesMastering")%></b></td>
				  <td width="25%" >&nbsp;White Point:   <b>&nbsp; <b><%=rsHDRMetadata.Fields("WhitePointMastering")%></b></td>
				  <td width="25%" >&nbsp;Peak Brightness:<b>&nbsp; <b><%=rsHDRMetadata.Fields("PeakBrightnessMastering")%></b></td>
				  <td width="25%" >&nbsp;Minimum Brightness:<b>&nbsp; <b><%=rsHDRMetadata.Fields("MinimumBrightnessMastering")%></b></td>
			</tr>
						  
			  <tr> 
	            <td colspan="4" align="center"><b>Dolby Vision Checks</b></td>
	          </tr>	
              <tr> 
	            <td colspan="4" ><b>Color Encoding</b></td>
	          </tr>				  
			  <tr> 
				  <td width="25%" >&nbsp;Color Primaries:   <b>&nbsp; <b><%=rsHDRMetadata.Fields("ColorPrimariesDolbyVision")%></b></td>
				  <td width="25%" >&nbsp;White Point:   <b>&nbsp; <b><%=rsHDRMetadata.Fields("WhitePointDolbyVision")%></b></td>
				  <td width="25%" >&nbsp;Peak Brightness:<b>&nbsp; <b><%=rsHDRMetadata.Fields("PeakBrightnessDolbyVision")%></b></td>
				  <td width="25%" >&nbsp;Minimum Brightness:<b>&nbsp; <b><%=rsHDRMetadata.Fields("MinimumBrightnessDolbyVision")%></b></td>
			</tr>
			  <tr> 
			     
				  <td width="25%" >&nbsp;Encoding:<b>&nbsp; <b><%=rsHDRMetadata.Fields("Encoding")%></b></td>
				  <td width="25%" >&nbsp;Color Space:<b>&nbsp; <b><%=rsHDRMetadata.Fields("ColourSpace")%></b></td>
				  <td width="25%" >&nbsp;Color Range:<b>&nbsp; <b><%=rsHDRMetadata.Fields("ColourRange")%></b></td>
				  <td width="25%" >&nbsp;</td>
	        </tr>
						  
			  <tr> 
	            <td colspan="4" align="center"><b>Xml vs Base file</b></td>
	          </tr>	
              			  
			  <tr> 
				  <td width="25%" >&nbsp;Do Color Primaries match Video File:   <b>&nbsp; <b><%=rsHDRMetadata.Fields("ColourPrimariesMatchVideoFile")%></b></td>
				  <td width="25%" >&nbsp;Does Framerate match Video File:    <b>&nbsp; <b><%=rsHDRMetadata.Fields("FrameRateMatchVideoFile")%></b></td>
				  <td width="25%" >&nbsp;Does Canvas Aspect Ratio match Video File:<b>&nbsp; <b><%=rsHDRMetadata.Fields("CanvasAspectRatioMatchVideoFile")%></b></td>
				   <td width="25%" >&nbsp;Does Image Aspect Ratio match Video File:<b>&nbsp; <b><%=rsHDRMetadata.Fields("ImageAspectRatioMatchVideoFile")%></b></td>
			</tr>
			  <tr> 
			    
				  <td width="25%" >&nbsp;Does Color Range match Video File:  <b>&nbsp; <b><%=rsHDRMetadata.Fields("ColourRangeMatchVideoFile")%></b></td>
				  <td width="25%" >&nbsp;</td>
				  <td width="25%" >&nbsp;</td>
				  <td width="25%" >&nbsp;</td>
	        </tr>
				
</table>


</div>

				
			
				
<% End If	
				
Set rsHDRMetadata = Nothing				

				
End If				
%>				