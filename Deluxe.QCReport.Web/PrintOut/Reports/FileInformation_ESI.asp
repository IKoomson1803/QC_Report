

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
	     		
			 <%
		           If Not IsNull(sAssetType) And sAssetType = "File"   Then
				     ''Response.Write "<tr><td colspan='3'>&nbsp;</td></tr>" 
                     Response.Write "<tr>" & _
					 "<td class='section-label programme-details-label section-text-big-font'>Filename:</td>" & _
					 "<td colspan='5' class='section-text section-text-blue' >" & rsHeader.Fields("Filename") & "</td>" & _
					 "</tr>" 
                   End If		   
		      %>
			  
			 <tr>
      		  <td class="section-label programme-details-label" >Description:</td>
			  <td class="section-text programme-details-text" colspan="5"><%=rsHeader.Fields("TapeDesc1")%></td>
			</tr> 
			
			<tr>
			  <td class="section-label operations-label" >Time Code:</td>
			  <td class="section-text operations-text" ><%=rsHeader.Fields("Timecode")%></td>
				
		       <td class="section-label operations-label" >Version:</td>
			   <td class="section-text operations-text"  colspan="3"><%=rsHeader.Fields("Version")%></td>
	
		     </tr>
								
				  <tr>
			  <td class="section-label operations-label" >Banijay file to Spec:</td>
			
			   <%
			   
			       If Not IsNull(rsChecklistBanijayRights.Fields("FileToSpec")) Then
				          SetChecklistText(rsChecklistBanijayRights.Fields("FileToSpec"))
				      End If
			   
				  %>
			  
			 
		       <td class="section-label operations-label" >Decode check pass:</td>
			   
			  
			    <%
			     If Not IsNull(rsChecklistBanijayRights.Fields("DecodeCheckPass") ) Then
				           SetChecklistText_3( rsChecklistBanijayRights.Fields("DecodeCheckPass"))
				      End If
			     %>
			   
	
		 </tr>

        </table>
	</td>
  </tr>
  </table>


