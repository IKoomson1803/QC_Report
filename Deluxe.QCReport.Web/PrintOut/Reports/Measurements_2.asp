 <!--
 <table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
-->

<!-- div class="div-frame-border"> -->


 <table width="100%" border="0" cellspacing="0" cellpadding="0" >
    <tr>


  <td style="border-right-style::none">
   
        <table width="100%" border="1" cellspacing="0" cellpadding="0">
		     
			<tr> 
			   <td >&nbsp;<b>Bars</b> </td>
				  
			</tr>
			
			<tr>
			<td >&nbsp;Video Gain:&nbsp;<b><%=rsHeader.Fields("Bar_Vid")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp; </td>
			</tr>
	      <tr>
		  <td>&nbsp;Chroma Gain:&nbsp;<b><%=rsHeader.Fields("Bar_Chr")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</b></td>
		  </tr>
	  
		  <tr>
		   <td >&nbsp;Black Level:&nbsp;<b><%=rsHeader.Fields("Black")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
		  </tr>
		  
		  <tr>
		   <td >&nbsp;&nbsp</td>
		  </tr>
		</table>
   
   </td>


 

     <td style="border-right-style:none">
   
        <table width="100%" border="1" cellspacing="0" cellpadding="0">
		     
			<tr> 
			   <td colspan="2" >&nbsp;<b>Waveform Levels</b> </td>
	    	</tr>
			
			<tr>
			  <td>&nbsp;Luma Peak:&nbsp;<b><%=rsHeader.Fields("Lum_Peak")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			  <td>&nbsp;Chroma Peak:&nbsp;<b><%=rsHeader.Fields("Chroma_Peak")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			</tr>
			
			<tr>
			    <td>&nbsp;Luma Avg:&nbsp;<b><%=rsHeader.Fields("Lum_Avg")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
				<td >&nbsp;Chroma Avg:&nbsp; <b><%=rsHeader.Fields("Chroma_Avg")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			</tr>
			
			<tr>
			    <td>&nbsp;Max CLL:&nbsp;<b><%=rsHeader.Fields("MaxCLL")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
				 <td >&nbsp;Black Level:&nbsp;<b><%=rsHeader.Fields("Black")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			</tr>
			
			
			<tr>
			   <td >&nbsp;Max FALL:&nbsp; <b><%=rsHeader.Fields("MaxFALL")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			   <td>&nbsp;</td>
			</tr>
	
		</table>
   
   </td>

<td>
   
        <table width="100%" border="1" cellspacing="0" cellpadding="0">
		     
			<tr> 
			   <td >&nbsp;<b>Line Measuremants</b> </td>
			  </tr>
                <tr>			  
			   <% If Not IsNull(rsHeader.Fields("HBlanking")) Then %>
				  <td>&nbsp;H Blanking:&nbsp;<b><%=rsHeader.Fields("HBlanking")%></b>&nbsp;</td>
				  
				 <% Else %>
					 <td>&nbsp;H Blanking:&nbsp;<b><%=rsHeader.Fields("HBlank")%></b>&nbsp;</td>
				<% End If %>
			</tr>
			 			   
			<tr>
			  <% If Not IsNull(rsHeader.Fields("VBlanking")) Then %>
				   <td>&nbsp;V Blanking:&nbsp;<b><%=rsHeader.Fields("VBlanking")%></b>&nbsp;</td>
			 <% Else %>
				 <td >&nbsp;V Blanking:&nbsp;<b><%=rsHeader.Fields("VBlank")%></b>&nbsp;</td>
				 
				<% End If %>
			   
			</tr>
			
			<tr>
			 <td>&nbsp;Active Picture:&nbsp;<b><%=rsHeader.Fields("Active_Picture")%></b>&nbsp;</td>
			</tr>
			
			<tr>
			 <td>&nbsp;</td>
			</tr>
	
		</table>
   
   </td>


</tr>


</table>



<!-- </div> -->


