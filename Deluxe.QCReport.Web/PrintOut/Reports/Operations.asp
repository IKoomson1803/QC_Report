<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td class="section-header">File Information</td>
  </tr>
</table>

<p></p>


<table width="100%" border="0" cellspacing="0" cellpadding="0"  height="90">
  <tr>
    <td valign="top"  > 
      <table width="100%" border="1" cellspacing="0" cellpadding="0"  > <!-- bordercolor="#000000" -->
	  
	    <tr>
	     
		  <td class="section-detail">File Record / Encode Date:</td>
		  <td class="section-text"><%if isnull(rsHeader.Fields("Rec_Date")) then
									Response.Write(rsHeader.Fields("Rec_Date"))
								  else
									Response.Write(replace(rsHeader.Fields("Rec_Date"), "TBD", ""))
		
						  end if%>>
		 </td>
		 
	    <td class="section-detail" >Record Facility: </td>
		<td class="section-text"><%=rsHeader.Fields("Rec_fac")%></td>
		
	    <td class="section-detail" >Source Standard:</td>
		<td class="section-text"><%=rsHeader.Fields("Src_standard")%></td>
		
		<td class="section-detail" >Source Format:</td>
		<td class="section-text" ><%=rsHeader.Fields("src_format")%></td>
		
        <td class="section-detail" >Source Desc:</td>
		<td class="section-text" ><%=rsHeader.Fields("src_desc")%></td>
		
		
	   	  
	  <%  If sAssetType = "Tape" Then %>
		   <tr>
			<td class="section-detail" >Record VTR:</td>
            <td class="section-text" ><%=rsHeader.Fields("Rec_Vtr")%></td>
	 		   
		   <td class="section-detail" >Stock Mfg:</td> 	
           <td class="section-text" ><%=rsHeader.Fields("Stock_mfg")%></td>
		   
		   
		   <td class="section-detail" >Stock Batch #:</td>	
           <td class="section-text" ><%=rsHeader.Fields("Stock_Batch")%></td>
	       
		   
		   <td class="section-detail" ></td>
		   <td >&nbsp;</td>
		   
		   <td class="section-detail" ></td>
		   <td >&nbsp;</td>
		   
		   </tr>
	  <%  End If %>
	   
	   <tr>
	         <%
				  If rsHDRMetadata.BOF  = False Then
						If rsHDRMetadata.Fields("NotRequired") = False Then	
						   Response.Write  "<td class='section-detail'>Xml Creation Date: </td>" & _	
						   "<td class='section-text'>" & rsHDRMetadata.Fields("XmlCreationDate") & "</td>" 						    
						End If	
				  End If		 		
				%>	
	   
	   
	         <td  class="section-detail" >Additional Info:</td>
			 <td colspan="9" class="section-text"><%=rsHeader.Fields("addinfo")%></td>
	   </tr>
	     
      </table>
    </td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td class="section-header">QC Details</td>
  </tr>
</table>

<p></p>

<table width="100%" border="0" cellspacing="0" cellpadding="0"  height="90">
  <tr>
    <td valign="top"  > 
        <table width="100%" border="1" cellspacing="0" cellpadding="0"  >
					  
			  <%  If Not IsNull(rsHeader.Fields("FullName")) Then  %>
			   <tr>
				 <td class="section-detail" >QC Date:</td> 
				 <td class="section-text" ><%=rsHeader.Fields("QC_Date")%></td>
				 
				 <td class="section-detail" >QC Operator:</td> 
				 <td class="section-text" ><%=rsHeader.Fields("FullName")%></td> 
				 
				 <td class="section-detail" >QC OF: </td>
				 <td class="section-text" ><%=rsHeader.Fields("Operator_Activity")%></td> 
				 
				 <td class="section-detail" >Revised By: </td>
				 <td class="section-text" ><%=rsHeader.Fields("Revised_By")%></td>
				 
				<td class="section-detail" >Revised Date: </td>
				<td class="section-text" ><%=rsHeader.Fields("revised_date")%></td>
				
			 </tr>
			 
			 <tr>
		  		<td class="section-detail" >QC Player:</td>
				<td class="section-text"><%=rsHeader.Fields("QC_VTR")%></td>
				
				<td class="section-detail" >MFR / QC Room: </td>
				<td class="section-text" ><%=rsHeader.Fields("Bay_num")%></td>
				
				<td class="section-detail" ></td>
				<td>&nbsp;</td>
				
				<td class="section-detail" ></td>
				<td>&nbsp;</td>
				
				<td class="section-detail" ></td>
				<td>&nbsp;</td>
		       </tr>
			 <% End If %>
		  
		  <%  If Not IsNull(rsHeader.Fields("FullName2")) Then  %>
		  
		  <tr>
			 <td class="section-detail" >QC Date:</td>
			 <td class="section-text" ><%=rsHeader.Fields("QC_Date_2")%></td>
			 
			 <td class="section-detail" >QC Operator:</td>
			 <td class="section-text" ><%=rsHeader.Fields("FullName2")%></td> 
			 
			 <td class="section-detail" >QC OF:</td> 
			 <td class="section-text" ><%=rsHeader.Fields("Operator_2_Activity")%></td> 
			 
			 <td class="section-detail" >Revised By:</td> 
			 <td class="section-text" ><%=rsHeader.Fields("Revised_By_2")%></td>
			 
			<td class="section-detail" >Revised Date:</td>
			<td class="section-text" ><%=rsHeader.Fields("Revised_Date_2")%></td>

		  </tr>
		  
		   <tr>
			<td class="section-detail" >QC Player:</td>
			<td class="section-text" ><%=rsHeader.Fields("QC_VTR_2")%></td>
			
			<td class="section-detail" >MFR / QC Room:</td>
			<td class="section-text" ><%=rsHeader.Fields("Bay_num_2")%></td>
			
			<td class="section-detail" ></td>
			<td>&nbsp;</td>
			
			<td class="section-detail" ></td>
			<td>&nbsp;</td>
			
			<td class="section-detail" ></td>
			<td>&nbsp;</td>
			
		  </tr>
		  
		  <% End If %>
		
     </table>
    </td>
  </tr>
</table>


