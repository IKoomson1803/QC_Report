	 
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
	   
	   
	   <tr >
	   
	       <td  class="BanijayRightsVideoLable">&nbsp;Video Gain: &nbsp;</td>
		   <td class="BanijayRightsVideoText">&nbsp;<%=rsHeader.Fields("Bar_Vid")%></td>
	       <td style="background-color:#BFBFBF; border:none;width:10%">&nbsp;</td>
	       <td class="BanijayRightsVideoLable">&nbsp;Lum. Peak: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("Lum_Peak")%></td>
		   <td style="background-color:#BFBFBF;width:10%">&nbsp;</td>
		   <td class="BanijayRightsVideoLable">&nbsp;Chroma Peak: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("Chroma_Peak")%></td>
	   </tr>
	   
	    <tr>
	   
	       <td class="BanijayRightsVideoLable">&nbsp;Chroma Gain: &nbsp;</td>
		   <td class="BanijayRightsVideoText">&nbsp;<%=rsHeader.Fields("Bar_Chr")%></td>
	       <td style="background-color:#BFBFBF; border:none;width:10%">&nbsp;</td>
	       <td class="BanijayRightsVideoLable">&nbsp;Lum. Avg: &nbsp;</td>
		   <td class="BanijayRightsVideoText">&nbsp;<%=rsHeader.Fields("Lum_Avg")%></td>
		   <td style="background-color:#BFBFBF;width:10%">&nbsp;</td>
		   <td class="BanijayRightsVideoLable">&nbsp;Chroma Avg: &nbsp;</td>
		   <td style="width:12%">&nbsp;<%=rsHeader.Fields("Chroma_Avg")%></td>
	   </tr>
	   
	    <tr>
	   
	       <td class="BanijayRightsVideoLable">&nbsp;Set Up: &nbsp;</td>
		   <td class="BanijayRightsVideoText">&nbsp;<%=rsHeader.Fields("Bar_Set")%></td>
	       <td style="background-color:#BFBFBF; border:none;width:10%">&nbsp;</td>
	       <td class="BanijayRightsVideoLable">&nbsp;Black Level: &nbsp;</td>
		   <td class="BanijayRightsVideoText">&nbsp;<%=rsHeader.Fields("Black")%></td>
		   <td style="background-color:#BFBFBF;width:10%">&nbsp;</td>
		   <td class="BanijayRightsVideoLable">&nbsp;PSE Result: &nbsp;</td>
		   <td class="BanijayRightsVideoText">&nbsp;<%=rsHeader.Fields("PSEResult")%></td>
	   </tr>
	   
     </table>
	 