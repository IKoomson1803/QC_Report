<table class="section-table" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td class="section-header">File Information</td>
  </tr>
</table>

<p></p>


<table class="section-table" border="0" cellspacing="0" cellpadding="0"  height="90">
  <tr>
    <td valign="top"  > 
      <table width="100%" border="1" cellspacing="0" cellpadding="0"  > <!-- bordercolor="#000000" -->
	  
	    <tr>
	     
		  <td class="section-label operations-label">File Record / Encode Date:</td>
		  <td class="section-text operations-text"><%if isnull(rsHeader.Fields("Rec_Date")) then
									Response.Write(rsHeader.Fields("Rec_Date"))
								  else
									Response.Write(replace(rsHeader.Fields("Rec_Date"), "TBD", ""))
		
						  end if%>
		 </td>
		 
	    <td class="section-label operations-label" >Record Facility: </td>
		<td class="section-text operations-text"><%=rsHeader.Fields("Rec_fac")%></td>
		
	    <td class="section-label operations-label" >Source Standard:</td>
		<td class="section-text operations-text"><%=rsHeader.Fields("Src_standard")%></td>
		
		
		
		</tr>
		<td class="section-label" >Source Format:</td>
		<td class="section-text" ><%=rsHeader.Fields("src_format")%></td>
		
        <td class="section-label" >Source Desc:</td>
		<td class="section-text" colspan="4"><%=rsHeader.Fields("src_desc")%></td>
		
		<tr>
		
		
		</tr>
	   	  
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
	   
	   <tr>
	         <%
				  If rsHDRMetadata.BOF  = False Then
				 '' response.write rsHDRMetadata.Fields("NotRequired")
						If rsHDRMetadata.Fields("NotRequired") = False Then	
						   Response.Write  "<td class='section-label'>Xml Creation Date: </td>" & _	
						   "<td class='section-text'>" & rsHDRMetadata.Fields("XmlCreationDate")  & "</td>" 						    
						End If	
				  End If		 		
				%>	
	   
	   
	         <td  class="section-label" >Additional Info:</td>
			 <td colspan="9" class="section-text"><%=rsHeader.Fields("addinfo")%></td>
	   </tr>
	     
      </table>
    </td>
  </tr>
</table>

<table class="section-table" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td class="section-header">QC Details</td>
  </tr>
</table>

<p></p>

<table class="section-table" border="0" cellspacing="0" cellpadding="0"  height="90">
  <tr>
    <td valign="top"  > 
        <table width="100%" border="1" cellspacing="0" cellpadding="0"  >
					  
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


