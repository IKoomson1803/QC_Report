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
	     
		  <td class="section-detail">&nbsp;File Record / Encode Date:</td>
		  <td>&nbsp; <b><%if isnull(rsHeader.Fields("Rec_Date")) then
									Response.Write(rsHeader.Fields("Rec_Date"))
								  else
									Response.Write(replace(rsHeader.Fields("Rec_Date"), "TBD", ""))
		
						  end if%></b>
		 </td>
		 
	    <td class="section-detail">&nbsp;Record Facility: </td>
		<td>&nbsp;<b><%=rsHeader.Fields("Rec_fac")%></b></td>
		
	    <td class="section-detail">&nbsp;Source Standard:</td>
		<td>&nbsp; <b><%=rsHeader.Fields("Src_standard")%></b></td>
		
		<td class="section-detail">&nbsp;Source Format:</td>
		<td>&nbsp; <b><%=rsHeader.Fields("src_format")%></b></td>
		
        <td class="section-detail">&nbsp;Source Desc:</td>
		<td>&nbsp; <b><%=rsHeader.Fields("src_desc")%></b></td>
		
		
	   	  
	  <%  If sAssetType = "Tape" Then %>
		   <tr>
			<td class="section-detail">&nbsp;Record VTR:</td>
            <td> &nbsp;<b><%=rsHeader.Fields("Rec_Vtr")%></b></td>
	 		   
		   <td class="section-detail">&nbsp;Stock Mfg:</td> 	
            <td> &nbsp; <b><%=rsHeader.Fields("Stock_mfg")%></b></td>
		   
		   
		   <td class="section-detail">&nbsp;Stock Batch #:</td>	
             <td> <b>&nbsp;<%=rsHeader.Fields("Stock_Batch")%></b></td>
	       
		   
		   <td class="section-detail">&nbsp;</td>
		   <td >&nbsp;</td>
		   
		   <td class="section-detail">&nbsp;</td>
		   <td >&nbsp;</td>
		   
		   </tr>
	  <%  End If %>
	   
	   <tr>
	         <%
				  If rsHDRMetadata.BOF  = False Then
						If rsHDRMetadata.Fields("NotRequired") = False Then	
						   Response.Write  "<td class='section-detail'>&nbsp;Xml Creation Date: </td>" & _	
						   "<td>&nbsp;<b>" & rsHDRMetadata.Fields("XmlCreationDate") & "</b></td>" 						    
						End If	
				  End If		 		
				%>	
	   
	   
	         <td  class="section-detail">&nbsp;Additional Info:</td>
			 <td colspan="9">&nbsp;<b><%=rsHeader.Fields("addinfo")%></b></td>
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
				 <td class="section-detail">&nbsp;QC Date:</td> 
				 <td>&nbsp;<b><%=rsHeader.Fields("QC_Date")%></b></td>
				 
				 <td class="section-detail">&nbsp;QC Operator:</td> 
				 <td>&nbsp;<b><%=rsHeader.Fields("FullName")%></b></td> 
				 
				 <td class="section-detail">&nbsp;QC OF: </td>
				 <td>&nbsp;<b><%=rsHeader.Fields("Operator_Activity")%></b></td> 
				 
				 <td class="section-detail">&nbsp;Revised By: </td>
				 <td>&nbsp;<b><%=rsHeader.Fields("Revised_By")%></b></td>
				 
				<td class="section-detail">&nbsp;Revised Date: </td>
				<td>&nbsp;<b><%=rsHeader.Fields("revised_date")%></b></td>
				
			 </tr>
			 
			 <tr>
		  		<td class="section-detail">&nbsp;QC Player:</td>
				<td>&nbsp;&nbsp;<b><%=rsHeader.Fields("QC_VTR")%></b></td>
				
				<td class="section-detail">&nbsp;MFR / QC Room: </td>
				<td>&nbsp;<b><%=rsHeader.Fields("Bay_num")%></b></td>
				
				<td class="section-detail">&nbsp;</td>
				<td>&nbsp;</td>
				
				<td class="section-detail">&nbsp;</td>
				<td>&nbsp;</td>
				
				<td class="section-detail">&nbsp;</td>
				<td>&nbsp;</td>
		       </tr>
			 <% End If %>
		  
		  <%  If Not IsNull(rsHeader.Fields("FullName2")) Then  %>
		  
		  <tr>
			 <td class="section-detail">&nbsp;QC Date:</td>
			 <td>&nbsp;<b><%=rsHeader.Fields("QC_Date_2")%></b></td>
			 
			 <td class="section-detail">&nbsp;QC Operator:</td>
			 <td>&nbsp;<b><%=rsHeader.Fields("FullName2")%></b></td> 
			 
			 <td class="section-detail">&nbsp;QC OF:</td> 
			 <td>&nbsp;<b><%=rsHeader.Fields("Operator_2_Activity")%></b></td> 
			 
			 <td class="section-detail">&nbsp;Revised By:</td> 
			 <td>&nbsp;<b><%=rsHeader.Fields("Revised_By_2")%></b></td>
			 
			<td class="section-detail">&nbsp;Revised Date:</td>
			<td>&nbsp;<b><%=rsHeader.Fields("Revised_Date_2")%></b></td>

		  </tr>
		  
		   <tr>
			<td class="section-detail">&nbsp;QC Player:</td>
			<td>&nbsp;<b><%=rsHeader.Fields("QC_VTR_2")%></b></td>
			
			<td class="section-detail">&nbsp;MFR / QC Room:</td>
			<td>&nbsp;<b><%=rsHeader.Fields("Bay_num_2")%></b></td>
			
			<td class="section-detail">&nbsp;</td>
			<td>&nbsp;</td>
			
			<td class="section-detail">&nbsp;</td>
			<td>&nbsp;</td>
			
			<td class="section-detail">&nbsp;</td>
			<td>&nbsp;</td>
			
		  </tr>
		  
		  <% End If %>
		
     </table>
    </td>
  </tr>
</table>


