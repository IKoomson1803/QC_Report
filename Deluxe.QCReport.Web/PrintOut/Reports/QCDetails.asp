<table class="section-table" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td class="section-header">QC Details</td>
  </tr>
</table>

<p></p>






<table class="section-table" border="0" cellspacing="0" cellpadding="0"  height="90">
  <tr>
    <td valign="top"  > 
      <table width="100%" border="1" cellspacing="0" cellpadding="0"  > <!-- bordercolor="#000000" -->
	  
	 
		
		
	   	  
	  <%  If sAssetType = "Tape" Then %>
		   <tr>
			<td class="section-label operations-label" >Record VTR:</td>
            <td class="section-text operations-text" ><%=rsHeader.Fields("Rec_Vtr")%></td>
	 		   
		   <td class="section-label operations-label" >Stock Mfg:</td> 	
           <td class="section-text operations-text" ><%=rsHeader.Fields("Stock_mfg")%></td>
		   
		   
		   <td class="section-label operations-label" >Stock Batch #:</td>	
           <td class="section-text operations-text" ><%=rsHeader.Fields("Stock_Batch")%></td>
	       
		   
		 
		   
		   </tr>
	  <%  End If %>
	   
	  
	   
	   <%  If Not IsNull(rsHeader.Fields("FullName")) Then  %>
			   <tr>
				 <td class="section-label operations-label" >QC Date:</td> 
				 <td class="section-text  operations-text" ><%=rsHeader.Fields("QC_Date")%></td>
				 
				 <td class="section-label operations-label" >QC Operator:</td> 
				 <td class="section-text  operations-text" ><%=rsHeader.Fields("FullName")%></td> 
			 
				 <td class="section-label  operations-label" >Revised By: </td>
				 <td class="section-text  operations-text" ><%=rsHeader.Fields("Revised_By")%></td>
				 
				
				
			 </tr>
			 			 
			 <tr>
			    <td class="section-label" >Revised Date: </td>
				<td class="section-text" ><%=rsHeader.Fields("revised_date")%></td>
				
		  		<td class="section-label operations-label" >QC Player:</td>
				<td class="section-text"><%=rsHeader.Fields("QC_VTR")%></td>
				
				<td class="section-label operations-label" >MFR / QC Room: </td>
				<td class="section-text" ><%=rsHeader.Fields("Bay_num")%></td>
				
			   </tr>
			   
			   <tr>
			      <td class="section-label" >QC OF: </td>
				 <td class="section-text" colspan="5" ><%=rsHeader.Fields("Operator_Activity")%></td> 
			 
			 </tr>
			   
			 <% End If %>
		  
		  <%  If Not IsNull(rsHeader.Fields("FullName2")) Then  %>
		  		  
		  
		   <tr>
				 <td class="section-label operations-label" >QC Date:</td> 
				 <td class="section-text  operations-text" ><%=rsHeader.Fields("QC_Date_2")%></td>
				 
				 <td class="section-label operations-label" >QC Operator:</td> 
				 <td class="section-text  operations-text" ><%=rsHeader.Fields("FullName2")%></td> 
			 
				 <td class="section-label  operations-label" >Revised By: </td>
				 <td class="section-text  operations-text" ><%=rsHeader.Fields("Revised_By_2")%></td>
		
				
			 </tr>
			 			 
			 <tr>
			    <td class="section-label" >Revised Date: </td>
				<td class="section-text" ><%=rsHeader.Fields("Revised_Date_2")%></td>
				
		  		<td class="section-label operations-label" >QC Player:</td>
				<td class="section-text"><%=rsHeader.Fields("QC_VTR_2")%></td>
				
				<td class="section-label operations-label" >MFR / QC Room: </td>
				<td class="section-text" ><%=rsHeader.Fields("Bay_num_2")%></td>
				
			   </tr>
			   
			   <tr>
			      <td class="section-label" >QC OF: </td>
				 <td class="section-text" colspan="5" ><%=rsHeader.Fields("Operator_2_Activity")%></td> 
			 
			 </tr>
		  
		
			  
		  <% End If %>
	     
      </table>
    </td>
  </tr>
</table>

