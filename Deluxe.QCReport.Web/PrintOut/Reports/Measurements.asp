<%

Response.Buffer = True
Response.CacheControl = "no-cache"
Response.AddHeader "Pragma", "no-cache"
Response.Expires = -1


if rsHeader.Fields("IRE_MV") = "M" then
		siremv = "" ''"mv"
	else
		siremv = "" ''"ire"
	end if
%>


     
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
 
  <tr>
    <td>
	<% If sAssetType = "Tape" Then %>
	       <table width="100%" border="0" cellspacing="0" cellpadding="1">
			  <tr>
				<td class="section-header">Measurements</td>
			  </tr>
		  </table>

			<p></p>
	
	
		  <table width="100%" border="1" cellspacing="0" cellpadding="1">
		     <tr> 
			  <td  class="section-detail" style="font-size:14px;font-weigth:bold;">&nbsp;<b>Tape Number:&nbsp;<b> <%=rsHeader.Fields("TapeNumber")%></b></td>
			  
			  <td  class="section-detail" style="font-size:14px;font-weigth:bold;">&nbsp;<b>Format:&nbsp; <b><%=rsHeader.Fields("Format")%></b></td>
			  
			  <td  class="section-detail" style="font-size:14px;font-weigth:bold;">&nbsp;<b>Standard:&nbsp; <b><%=rsHeader.Fields("Standard")%></b></td>
			  
			  <td  class="section-detail" style="font-size:14px;font-weigth:bold;">&nbsp;<b>Aspect Ratio:&nbsp; <b><%=rsHeader.Fields("Aspect")%></b></td>
			  
			  <td  class="bottom_border">&nbsp; </td>
			</tr>
			
			 <!--#include file="VideoSpecifications_2.asp" -->
	
		</table>
	<% Else %>
	       <table width="100%" border="0" cellspacing="0" cellpadding="1">
			  <tr>
				<td class="section-header">Measurements</td>
			  </tr>
		  </table>

			<p></p>
	
		  <table width="100%" border="1" cellspacing="0" cellpadding="1">
		     		  
			<tr> 
			  <td  class="section-detail" ><span style="font-size:14px; font-weight:bold;">&nbsp;Format:</td>
			  <td><b>&nbsp; <%=rsHeader.Fields("Format")%></b></td>
			  
			  <td  class="section-detail"><span style="font-size:14px; font-weight:bold;"></td>
			  <td>&nbsp;Standard:<b>&nbsp; <%=rsHeader.Fields("Standard")%></b></td>
			  
			  <td  class="section-detail"><span style="font-size:14px; font-weight:bold;"></td>
			  <td>&nbsp;Aspect Ratio:<b>&nbsp; <%=rsHeader.Fields("Aspect")%></b></td>
			  
			   <td  class="section-detail"><span style="font-size:14px; font-weight:bold;"></td>
			   <td>&nbsp;Frame Size:<b>&nbsp; <%=rsHeader.Fields("Frame_Size")%></b></td>
			   
			</tr>
			
		    <tr> 
			   <td  class="section-detail">&nbsp;Video Codec:</td>
			   <td>&nbsp; <b><%=rsHeader.Fields("Video_Codec")%></b></td>
			   
			  <td  class="section-detail">&nbsp;Video Bit Rate:</td>
			  <td>&nbsp;<b><%=rsHeader.Fields("Video_Bit_Rate")%></b> </td>
			  
			  
			  <td  class="section-detail">&nbsp;Video Bit Depth:</td>
			  <td>&nbsp; <b><%=rsHeader.Fields("Video_Bit_Depth")%></b></td>
			  
			  <td  class="section-detail">&nbsp;Bit Rate Mode:</td>
			  <td>&nbsp; <b><%=rsHeader.Fields("Bit_Rate_Mode")%></b></td>
			  
			</tr>
			
			<tr> 
			   <td  class="section-detail">&nbsp;Audio Codec:</td>
			   <td>&nbsp; <b><%=rsHeader.Fields("Audio_Codec")%></b></td>
			   
			  <td  class="section-detail">&nbsp;Audio Bit Rate:</td>
			  <td>&nbsp;<b><%=rsHeader.Fields("Audio_Bit_Rate")%></b> </td>
			  
			   <td  class="section-detail">&nbsp;Audio Bit Depth:</td>
			   <td>&nbsp; <b><%=rsHeader.Fields("Audio_Bit_Depth")%></b></td>
			   
             <td  class="section-detail">&nbsp;Sample Rate:</td>
			 <td>&nbsp; <b><%=rsHeader.Fields("Sample_Rate")%></b></td>
			 
		 </tr>
			
			<tr> 
			   
			  <td  class="section-detail">&nbsp;GOP Structure:</td>
			  <td>&nbsp; <b><%=rsHeader.Fields("GOP_Structure")%></b></td>
			  
			  <td  class="section-detail">&nbsp;Gamut:</td>
			  <td>&nbsp;<b><%=rsHeader.Fields("Gamut")%></b> </td>
			  
			  <td  class="section-detail">&nbsp;Colour Encoding:</td>
			  <td>&nbsp; <b><%=rsHeader.Fields("Colour_Encoding")%></b></td>
			  
			  <td  class="section-detail">&nbsp;Colour Range:</td>
			  <td>&nbsp; <b><%=rsHeader.Fields("ColourRange")%></b></td>
			  
			</tr>
			
			<tr> 
			   <td  class="section-detail">&nbsp;File Size:</td>
			   <td>&nbsp; <b><%=rsHeader.Fields("File_Size")%></b></td>
			   
			  <td  class="section-detail">&nbsp;Colour Primaries:</td>
			  <td>&nbsp; <b><%=rsHeader.Fields("ColourPrimaries")%></b></td>
			  
			  <td  class="section-detail">&nbsp;Transfer Characteristics:</td>
			  <td>&nbsp; <b><%=rsHeader.Fields("TransferCharacteristics")%></b></td>
			  
			  <td  class="section-detail">&nbsp;Matrix Coefficients:</td>
			  <td>&nbsp; <b><%=rsHeader.Fields("MatrixCoefficients")%></b></td>
			  
			  
			</tr>
			
			
						
			<tr> 
			  	  
			 <td  colspan="8"  >&nbsp; </td>  
			 
			</tr>
			
			
			
                
            <tr> 
			  <td  class="section-detail" colspan="2"><span style="font-size:12px; font-weight:bold;">&nbsp;Bars</td>
			  <td width="50%"  class="section-detail" colspan="4"><span style="font-size:12px; font-weight:bold;">&nbsp; Waveform Levels</td>
			  <td   class="section-detail" colspan="2"><span style="font-size:12px; font-weight:bold;">&nbsp;Line Measurements</td>
			</tr>  
			
			<tr>
			  <td class="section-detail">&nbsp;Video Gain: </td>
			  <td>&nbsp;<b><%=rsHeader.Fields("Bar_Vid")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp; </td>
			  
			  <td class="section-detail">&nbsp;Luma Peak: </td>
			  <td>&nbsp;<b><%=rsHeader.Fields("Lum_Peak")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			  
			  <td class="section-detail">&nbsp;Chroma Peak:</td>
			  <td>&nbsp;<b><%=rsHeader.Fields("Chroma_Peak")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			
			    <% If Not IsNull(rsHeader.Fields("HBlanking")) Then %>
				  <td class="section-detail" >&nbsp;H Blanking:</td>
				  <td>&nbsp;<b><%=rsHeader.Fields("HBlanking")%></b>&nbsp;</td>
				  
				 <% Else %>
					 <td class="section-detail" >&nbsp;H Blanking:</td>
					 <td>&nbsp;<b><%=rsHeader.Fields("HBlank")%></b>&nbsp;</td>
				<% End If %>
			
			</tr>
			
			<tr>
		       <td class="section-detail">&nbsp;Chroma Gain:</td>
			   <td>&nbsp;<b><%=rsHeader.Fields("Bar_Chr")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</b></td>
			   
			     <td class="section-detail">&nbsp;Luma Avg:</td>
				 <td>&nbsp;<b><%=rsHeader.Fields("Lum_Avg")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
				 
				<td  class="section-detail">&nbsp;Chroma Avg:</td>
				<td>&nbsp; <b><%=rsHeader.Fields("Chroma_Avg")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
				
				 <% If Not IsNull(rsHeader.Fields("VBlanking")) Then %>
				   <td class="section-detail">&nbsp;V Blanking:</td>
				   <td>&nbsp;<b><%=rsHeader.Fields("VBlanking")%></b>&nbsp;</td>
			   <% Else %>
				 <td  class="section-detail">&nbsp;V Blanking:</td>
				 <td>&nbsp;<b><%=rsHeader.Fields("VBlank")%></b>&nbsp;</td>
				 
				<% End If %>
		  </tr>
		  
		  <tr>
		   <td  class="section-detail">&nbsp;Black Level:</td>
		   <td>&nbsp;<b><%=rsHeader.Fields("Black")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
		   
		   <td class="section-detail">&nbsp;Max CLL:</td>
		   <td>&nbsp;<b><%=rsHeader.Fields("MaxCLL")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
		   
	       <td class="section-detail" >&nbsp;Black Level:</td>
		   <td>&nbsp;<b><%=rsHeader.Fields("Black")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
		   
		  <td class="section-detail">&nbsp;Active Picture:</td>
		  <td>&nbsp;<b><%=rsHeader.Fields("Active_Picture")%></b>&nbsp;</td>
		  
			
		  </tr>
		  
		   <tr>
		   <td >&nbsp;</td>
		   <td >&nbsp;</td>
		   
		    <td  class="section-detail">&nbsp;Max FALL:</td>
			<td>&nbsp; <b><%=rsHeader.Fields("MaxFALL")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			
		   
		   
		    <td >&nbsp;</td>
			 <td >&nbsp;</td>
			 
			 <td >&nbsp;</td>
			 <td >&nbsp;</td>
		  </tr>
		  
		  
			  
			  
    
			
		</table>
	<% End If %>
	
    </td>
	
	
	
	
  </tr>
</table>



<!--
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
-->


<!--#include file="HDRMetadata.asp" -->
