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
			  <td  class="section-detail" >Tape Number: <%=rsHeader.Fields("TapeNumber")%></td>
			  
			  <td  class="section-label">Format:><%=rsHeader.Fields("Format")%></td>
			  
			  <td  class="section-label" style="font-size:14px;font-weigth:bold;">Standard:&nbsp; <b><%=rsHeader.Fields("Standard")%></td>
			  
			  <td  class="section-label" style="font-size:14px;font-weigth:bold;">Aspect Ratio:&nbsp; <b><%=rsHeader.Fields("Aspect")%></td>
			  
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
			  <td  class="section-label" ><span style="font-size:14px; font-weight:bold;">Format:</td>
			  <td class="section-text" > <%=rsHeader.Fields("Format")%></td>
			  
			  <td  class="section-label"><span style="font-size:14px; font-weight:bold;">Standard:</td>
			  <td class="section-text" > <%=rsHeader.Fields("Standard")%></td>
			  
			  <td  class="section-label"><span style="font-size:14px; font-weight:bold;">Aspect Ratio:</td>
			  <td class="section-text" > <%=rsHeader.Fields("Aspect")%></td>
			  
			   <td  class="section-label"><span style="font-size:14px; font-weight:bold;">Frame Size:</td>
			   <td class="section-text" > <%=rsHeader.Fields("Frame_Size")%></td>
			   
			</tr>
			
		    <tr> 
			   <td  <td class="section-label" >Video Codec:</td>
			   <td class="section-text" ><%=rsHeader.Fields("Video_Codec")%></td>
			   
			  <td  <td class="section-label" >Video Bit Rate:</td>
			  <td class="section-text" ><%=rsHeader.Fields("Video_Bit_Rate")%> </td>
			  
			  
			  <td  <td class="section-label" >Video Bit Depth:</td>
			  <td class="section-text" ><%=rsHeader.Fields("Video_Bit_Depth")%></td>
			  
			  <td  <td class="section-label" >Bit Rate Mode:</td>
			  <td class="section-text" ><%=rsHeader.Fields("Bit_Rate_Mode")%></td>
			  
			</tr>
			
			<tr> 
			   <td  <td class="section-label" >Audio Codec:</td>
			   <td class="section-text" ><%=rsHeader.Fields("Audio_Codec")%></td>
			   
			  <td  <td class="section-label" >Audio Bit Rate:</td>
			  <td class="section-text" ><%=rsHeader.Fields("Audio_Bit_Rate")%> </td>
			  
			   <td  <td class="section-label" >Audio Bit Depth:</td>
			   <td class="section-text" ><%=rsHeader.Fields("Audio_Bit_Depth")%></td>
			   
             <td  <td class="section-label" >Sample Rate:</td>
			 <td class="section-text" ><%=rsHeader.Fields("Sample_Rate")%></td>
			 
		 </tr>
			
			<tr> 
			   
			  <td  <td class="section-label" >GOP Structure:</td>
			  <td class="section-text" ><%=rsHeader.Fields("GOP_Structure")%></td>
			  
			  <td  <td class="section-label" >Gamut:</td>
			  <td class="section-text" ><%=rsHeader.Fields("Gamut")%> </td>
			  
			  <td  <td class="section-label" >Colour Encoding:</td>
			  <td class="section-text" ><%=rsHeader.Fields("Colour_Encoding")%></td>
			  
			  <td  <td class="section-label" >Colour Range:</td>
			  <td class="section-text" ><%=rsHeader.Fields("ColourRange")%></td>
			  
			</tr>
			
			<tr> 
			   <td  <td class="section-label" >File Size:</td>
			   <td class="section-text" ><%=rsHeader.Fields("File_Size")%></td>
			   
			  <td  <td class="section-label" >Colour Primaries:</td>
			  <td class="section-text" ><%=rsHeader.Fields("ColourPrimaries")%></td>
			  
			  <td  <td class="section-label" >Transfer Characteristics:</td>
			  <td class="section-text" ><%=rsHeader.Fields("TransferCharacteristics")%></td>
			  
			  <td  <td class="section-label" >Matrix Coefficients:</td>
			  <td class="section-text" ><%=rsHeader.Fields("MatrixCoefficients")%></td>
			  
			  
			</tr>
			
			<tr> 
			   <td <td class="section-label" >Max CLL:</td>
		      <td class="section-text" ><%=rsHeader.Fields("MaxCLL")%></td>
			   
			  <td  <td class="section-label" >Max FALL:</td>
			<td class="section-text" ><%=rsHeader.Fields("MaxFALL")%></td>
			  
			  <td>&nbsp;</td>
			    <td>&nbsp;</td>
				
				  <td>&nbsp;</td>
				    <td>&nbsp;</td>
				  
			  
			  
			</tr>
			
			
						
			<tr> 
			  	  
			 <td  colspan="8"  >&nbsp; </td>  
			 
			</tr>
			
			
			
                
            <tr> 
			  <td  class="section-label" colspan="2">Bars</td>
			  <td  class="section-label" colspan="4">Waveform Levels</td>
			  <td   class="section-label" colspan="2">Line Measurements</td>
			</tr>  
			
			<tr>
			  <td <td class="section-label" >Video Gain: </td>
			  <td class="section-text" ><%=rsHeader.Fields("Bar_Vid")%>&nbsp;&nbsp;<%=siremv%> </td>
			  
			  <td <td class="section-label" >Luma Peak: </td>
			  <td class="section-text" ><%=rsHeader.Fields("Lum_Peak")%>&nbsp;&nbsp;<%=siremv%></td>
			  
			  <td <td class="section-label" >Chroma Peak:</td>
			  <td class="section-text" ><%=rsHeader.Fields("Chroma_Peak")%>&nbsp;&nbsp;<%=siremv%></td>
			
			    <% If Not IsNull(rsHeader.Fields("HBlanking")) Then %>
				  <td class="section-label" >&nbsp;H Blanking:</td>
				  <td class="section-text" ><%=rsHeader.Fields("HBlanking")%></td>
				  
				 <% Else %>
					 <td class="section-label" >&nbsp;H Blanking:</td>
					 <td class="section-text" ><%=rsHeader.Fields("HBlank")%></td>
				<% End If %>
			
			</tr>
			
			<tr>
		       <td <td class="section-label" >Chroma Gain:</td>
			   <td class="section-text" ><%=rsHeader.Fields("Bar_Chr")%>&nbsp;&nbsp;<%=siremv%></td>
			   
			     <td <td class="section-label" >Luma Avg:</td>
				 <td class="section-text" ><%=rsHeader.Fields("Lum_Avg")%>&nbsp;&nbsp;<%=siremv%></td>
				 
				<td  <td class="section-label" >Chroma Avg:</td>
				<td class="section-text" ><%=rsHeader.Fields("Chroma_Avg")%>&nbsp;&nbsp;<%=siremv%></td>
				
				 <% If Not IsNull(rsHeader.Fields("VBlanking")) Then %>
				   <td <td class="section-label" >V Blanking:</td>
				   <td class="section-text" ><%=rsHeader.Fields("VBlanking")%></td>
			   <% Else %>
				 <td  <td class="section-label" >V Blanking:</td>
				 <td class="section-text" ><%=rsHeader.Fields("VBlank")%></td>
				 
				<% End If %>
		  </tr>
		  
		  <tr>
		   <td  <td class="section-label" >Black Level:</td>
		   <td class="section-text" ><%=rsHeader.Fields("Black")%>&nbsp;&nbsp;<%=siremv%></td>
	   
	       <td class="section-label" >&nbsp;Black Level:</td>
		   <td class="section-text" ><%=rsHeader.Fields("Black")%>&nbsp;&nbsp;<%=siremv%></td>
		   
		  <td <td class="section-label" >Active Picture:</td>
		  <td class="section-text" ><%=rsHeader.Fields("Active_Picture")%></td>
		  
		    <td>&nbsp;</td>
			  <td>&nbsp;</td>
			
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
