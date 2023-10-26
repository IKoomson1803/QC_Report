<table class="section-table" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td class="section-header">File Information</td>
  </tr>
</table>

<p></p>





<table class="section-table" border="0">
 <tr>
  <td>
       <table width="100%" border="1" cellspacing="0" cellpadding="0" >
	     		
			
			 <tr>
      		  <td class="section-label programme-details-label" >Description:</td>
			  <td class="section-text programme-details-text" colspan="5"><%=rsHeader.Fields("TapeDesc1")%></td>
			</tr> 
								
	
		    <%
		           If Not IsNull(sAssetType) And sAssetType = "File"   Then
				     ''Response.Write "<tr><td colspan='3'>&nbsp;</td></tr>" 
                     Response.Write "<tr>" & _
					 "<td class='section-label programme-details-label section-text-blue'>Filename:</td>" & _
					 "<td colspan='5' class='section-text section-text-blue' >" & rsHeader.Fields("Filename") & "</td>" & _
					 "</tr>" 
                   End If		   
		      %>
			  
			  <%
				  If rsHDRMetadata.BOF  = False Then
						If rsHDRMetadata.Fields("NotRequired") = False Then	
							   Response.Write "<tr>"  & _
							     "<td class='section-label programme-details-label section-text-blue'>xml Document:</td>"  & _
								 "<td colspan='5' class='section-text section-text-blue'>" & rsHDRMetadata.Fields("XmlDocument") & "</td>" & _
							    "</tr>" 
						End If	
				  End If		 		
				%>	
  
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
           			
			<tr>
			  <td class="section-label operations-label" >Time Code:</td>
			  <td class="section-text operations-text" ><%=rsHeader.Fields("Timecode")%></td>
				
		       <td class="section-label operations-label" >Version:</td>
			   <td class="section-text operations-text"><%=rsHeader.Fields("Version")%></td>
			   
			    <td class="section-empty-label operations-label" >&nbsp;</td>
			    <td class="section-text operations-text" >&nbsp;</td>
			  
            <!--			  
			 <td class="section-label" >UID No. / Production ID:</td>
			 <td class="section-text" ><%=rsHeader.Fields("CatalogueID")%></td>
			 -->
			 
		 </tr>
		 
		 
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
		 
		 <tr>
		<td class="section-label" >Source Format:</td>
		<td class="section-text" ><%=rsHeader.Fields("src_format")%></td>
		
        <td class="section-label" >Source Desc:</td>
		<td class="section-text" colspan="4"><%=rsHeader.Fields("src_desc")%></td>
		
		
		
		
		</tr>
		 
	
			 
        </table>
	</td>
  </tr>
  </table>



<table class="section-table" border="0" cellspacing="0" cellpadding="1">
  <tr>
   &nbsp;
  </tr>
</table>
