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

<div class="div-frame-border">
     
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
 
  <tr>
    <td>
	<% If sAssetType = "Tape" Then %>
		  <table width="100%" border="1" cellspacing="0" cellpadding="1">
		      <tr> 
	            <td colspan="4" class="header">MEASUREMENTS</td>
	          </tr>
			<tr> 
			  <td width="25%" style="font-size:14px;font-weigth:bold;">&nbsp;<b>Tape Number:&nbsp;<b> <%=rsHeader.Fields("TapeNumber")%></b></td>
			  <td width="25%" style="font-size:14px;font-weigth:bold;">&nbsp;<b>Format:&nbsp; <b><%=rsHeader.Fields("Format")%></b></td>
			  <td width="25%" style="font-size:14px;font-weigth:bold;">&nbsp;<b>Standard:&nbsp; <b><%=rsHeader.Fields("Standard")%></b></td>
			  <td width="25%" style="font-size:14px;font-weigth:bold;">&nbsp;<b>Aspect Ratio:&nbsp; <b><%=rsHeader.Fields("Aspect")%></b></td>
			  <td width="25%">&nbsp; </td>
			</tr>
			
			 <!--#include file="VideoSpecifications_2.asp" -->
	
		</table>
	<% Else %>
		  <table width="100%" border="1" cellspacing="0" cellpadding="1">
		      <tr> 
	            <td colspan="4" class="header">MEASUREMENTS</td>
	          </tr>
		  
			<tr> 
			  <td width="25%" ><span style="font-size:14px; font-weight:bold;">&nbsp;Format:<b>&nbsp; <%=rsHeader.Fields("Format")%></b></td>
			  <td width="25%" ><span style="font-size:14px; font-weight:bold;">&nbsp;Standard:<b>&nbsp; <%=rsHeader.Fields("Standard")%></b></td>
			  <td width="25%" ><span style="font-size:14px; font-weight:bold;">&nbsp;Aspect Ratio:<b>&nbsp; <%=rsHeader.Fields("Aspect")%></b></td>
			   <td width="25%"><span style="font-size:14px; font-weight:bold;">&nbsp;Frame Size:<b>&nbsp; <%=rsHeader.Fields("Frame_Size")%></b></td>
			</tr>
			
		    <tr> 
			   <td width="25%">&nbsp;Video Codec:&nbsp; <b><%=rsHeader.Fields("Video_Codec")%></b></td>
			  <td width="25%">&nbsp;Video Bit Rate:&nbsp;<b><%=rsHeader.Fields("Video_Bit_Rate")%></b> </td>
			  <td width="25%">&nbsp;Video Bit Depth:&nbsp; <b><%=rsHeader.Fields("Video_Bit_Depth")%></b></td>
			  <td width="25%">&nbsp;Bit Rate Mode:&nbsp; <b><%=rsHeader.Fields("Bit_Rate_Mode")%></b></td>	
			</tr>
			
			<tr> 
			   <td width="25%">&nbsp;Audio Codec:&nbsp; <b><%=rsHeader.Fields("Audio_Codec")%></b></td>
			  <td width="25%">&nbsp;Audio Bit Rate:&nbsp;<b><%=rsHeader.Fields("Audio_Bit_Rate")%></b> </td>
			   <td width="25%">&nbsp;Audio Bit Depth:&nbsp; <b><%=rsHeader.Fields("Audio_Bit_Depth")%></b></td>
             <td width="25%">&nbsp;Sample Rate:&nbsp; <b><%=rsHeader.Fields("Sample_Rate")%></b></td>
		 </tr>
			
			<tr> 
			   
			  <td width="25%">&nbsp;GOP Structure:&nbsp; <b><%=rsHeader.Fields("GOP_Structure")%></b></td>
			  <td width="25%">&nbsp;Gamut:&nbsp;<b><%=rsHeader.Fields("Gamut")%></b> </td>
			  <td width="25%">&nbsp;Colour Encoding:&nbsp; <b><%=rsHeader.Fields("Colour_Encoding")%></b></td>
			  <td width="25%">&nbsp;Colour Range:&nbsp; <b><%=rsHeader.Fields("ColourRange")%></b></td>
			</tr>
			
			<tr> 
			   <td width="25%">&nbsp;File Size:&nbsp; <b><%=rsHeader.Fields("File_Size")%></b></td>
			  <td width="25%">&nbsp;</td>
			  <td width="25%">&nbsp;</td>
			  <td width="25%">&nbsp;</td>
			  
			</tr>
			
			
			<tr> 
			  	  
			<!--  <td  width="25%" >Video Gain:&nbsp;<b><%=rsHeader.Fields("Bar_Vid")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp; </td>  
			 <td  width="25%">Chr Gain:&nbsp;<b><%=rsHeader.Fields("Bar_Chr")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			  <td  width="25%" ><span>Luma Peak:</span>&nbsp;<b><%=rsHeader.Fields("Lum_Peak")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			 <td  width="25%" >Luma Avg:&nbsp;<b><%=rsHeader.Fields("Lum_Avg")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>-->
			</tr>
                
            <tr> 
			  <td width="25%" ><span style="font-size:12px; font-weight:bold;">&nbsp;Bars</td>
			  <td width="50%" colspan="2"><span style="font-size:12px; font-weight:bold;">&nbsp; Waveform Levels</td>
			  <td width="25%" ><span style="font-size:12px; font-weight:bold;">&nbsp;Line Measuremants</td>
			</tr>  
			
			<tr>
			  <td >&nbsp;Video Gain:&nbsp;<b><%=rsHeader.Fields("Bar_Vid")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp; </td>
			  <td>&nbsp;Luma Peak:&nbsp;<b><%=rsHeader.Fields("Lum_Peak")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			  <td>&nbsp;Chroma Peak:&nbsp;<b><%=rsHeader.Fields("Chroma_Peak")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			
			    <% If Not IsNull(rsHeader.Fields("HBlanking")) Then %>
				  <td>&nbsp;H Blanking:&nbsp;<b><%=rsHeader.Fields("HBlanking")%></b>&nbsp;</td>
				  
				 <% Else %>
					 <td>&nbsp;H Blanking:&nbsp;<b><%=rsHeader.Fields("HBlank")%></b>&nbsp;</td>
				<% End If %>
			
			</tr>
			
			<tr>
		       <td>&nbsp;Chroma Gain:&nbsp;<b><%=rsHeader.Fields("Bar_Chr")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</b></td>
			     <td>&nbsp;Luma Avg:&nbsp;<b><%=rsHeader.Fields("Lum_Avg")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
				<td >&nbsp;Chroma Avg:&nbsp; <b><%=rsHeader.Fields("Chroma_Avg")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
				
				 <% If Not IsNull(rsHeader.Fields("VBlanking")) Then %>
				   <td>&nbsp;V Blanking:&nbsp;<b><%=rsHeader.Fields("VBlanking")%></b>&nbsp;</td>
			   <% Else %>
				 <td >&nbsp;V Blanking:&nbsp;<b><%=rsHeader.Fields("VBlank")%></b>&nbsp;</td>
				 
				<% End If %>
		  </tr>
		  
		  <tr>
		   <td >&nbsp;Black Level:&nbsp;<b><%=rsHeader.Fields("Black")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
		   <td>&nbsp;Max CLL:&nbsp;<b><%=rsHeader.Fields("MaxCLL")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
	       <td >&nbsp;Black Level:&nbsp;<b><%=rsHeader.Fields("Black")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
		  <td>&nbsp;Active Picture:&nbsp;<b><%=rsHeader.Fields("Active_Picture")%></b>&nbsp;</td>
			
		  </tr>
		  
		   <tr>
		   <td >&nbsp;</td>
		    <td >&nbsp;Max FALL:&nbsp; <b><%=rsHeader.Fields("MaxFALL")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
		     <td>&nbsp;</td>
			 <td >&nbsp;</td>
		  </tr>
		  
		  
			  
			  
    
			
		</table>
	<% End If %>
	
    </td>
	
	
	
	
  </tr>
</table>

</div>

<!--
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
-->


<!--#include file="HDRMetadata.asp" -->
