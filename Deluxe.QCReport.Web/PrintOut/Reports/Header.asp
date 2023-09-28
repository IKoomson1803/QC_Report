<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td class="section-header">Programme Details</td>
  </tr>
</table>

<p></p>


   

<table width="100%" border="0">
 <tr>
  <td>
       <table width="100%" border="1" cellspacing="0" cellpadding="0" >
	       <tr>
             <td class="section-label" >Title: </td>
			 <td class="section-text" ><%=rsHeader.Fields("Show")%></td>
			 			 
			  <td class="section-label" >Description:</td>
			  <td class="section-text" ><%=rsHeader.Fields("TapeDesc1")%></td>
			  			  
             <td class="section-label" >QC Number:</td>
			 <td class="section-text" ><%=rsHeader.Fields("QCNum")%></td>
			</tr> 
			
			
			<tr>
             <td  class="section-label" >Episode Name:</td>
			 <td class="section-text"><%=rsHeader.Fields("Epis_name")%></td>
			 			 
             <td  class="section-label" >Episode Number:</td>
			 <td class="section-text" ><%=rsHeader.Fields("Epis_no")%></td>
			 			 
             <td  class="section-label" >WO Number:</td>
			 <td class="section-text" ><%=rsHeader.Fields("wonum")%></td>
			</tr> 
						
			<tr>
				
              <td  class="section-label" >Subtitles:</td>
			  <td class="section-text">
			   
			  <b>

			  <%
			   If Not IsNull(rsHeader.Fields("Subtitle")) Then
			      Response.Write  rsHeader.Fields("Subtitle")
               Else 
				  Response.Write rsHeader.Fields("Subtitle_QC")
			   End If
			  %>
		  
			  
						  
			  </td>
	         		 
             <td class="section-label" >Language:</td>
			 <td class="section-text" ><%=rsHeader.Fields("HLanguage")%></td>

             <td class="section-label" >PO Number:</td>
			 <td class="section-text"><%=rsHeader.Fields("Pono")%></td>
			 
			</tr> 
						
			<tr>
             
             <td class="section-label" >TRT:</td>
			 <td class="section-text" ><%=rsHeader.Fields("TRT")%></td>
			 
			 <td class="section-label" >Textless @ Tail:</td> 
			  <td class="section-text">
			 <%if rsHeader.Fields("textless") = "Y" Then
                                       Response.Write("Yes")
                                    else
										Response.Write("No")
									end if%></td>
			</td>
			
			<td class="section-label" >Textless Duration:</td>
              <td class="section-text">
			<b><%=rsHeader.Fields("Duration")%></td>		
			<%
		           If Not IsNull(sAssetType) And sAssetType = "Tape"   Then
				      '' Response.Write "<tr><td colspan='3'>&nbsp;</td></tr>" 
                     '' Response.Write "<td>&nbsp;Tape Number: <b>" & rsHeader.Fields("TapeNumber") & "</td>"
					  Response.Write "<tr><td colspan='3'>Tape Number:" & rsHeader.Fields("TapeNumber") & "</td></tr>"
	               End If		   
		      %>
			  </td>
			  
			</tr> 
			
		    <%
		           If Not IsNull(sAssetType) And sAssetType = "File"   Then
				     ''Response.Write "<tr><td colspan='3'>&nbsp;</td></tr>" 
                     Response.Write "<tr>" & _
					 "<td class='section-label'>Filename:</td>" & _
					 "<td colspan='5' class='section-text' >" & rsHeader.Fields("Filename") & "</td>" & _
					 "</tr>" 
                   End If		   
		      %>
			  
			  <%
				  If rsHDRMetadata.BOF  = False Then
						If rsHDRMetadata.Fields("NotRequired") = False Then	
							   Response.Write "<tr>"  & _
							     "<td class='section-label'>Xml Document:</td>"  & _
								 "<td colspan='5' class='section-text'>" & rsHDRMetadata.Fields("XmlDocument") & "</td>" & _
							    "</tr>" 
						End If	
				  End If		 		
				%>	
  
           			
			<tr>
			  <td class="section-label" >Time Code:</td>
			  <td class="section-text" ><%=rsHeader.Fields("Timecode")%></td>
				
		       <td class="section-label" >Version:</td>
			   <td class="section-text"><%=rsHeader.Fields("Version")%></td>
			   
			 <td class="section-label" >UID No. / Production ID:</td>
			 <td class="section-text" ><%=rsHeader.Fields("CatalogueID")%></td>
		 </tr>
					
			<tr>
             <td  class="section-label" >Status:</td>
			 <td class="section-text"><%=rsHeader.Fields("Eval_Stat")%></td>
			 
             <td  class="section-label" >Head Logo:</td>
			 <td class="section-text" ><%=rsHeader.Fields("HeadLogo")%></td>
			 
             <td  class="section-label" >Tail Logo:</td>
			 <td class="section-text"><%=rsHeader.Fields("TailLogo")%></td>
			</tr> 
			
						
			<tr>
			 <td  class="section-label"><b>Overall Grade:</td>
			 <td class="section-text"><%=rsHeader.Fields("grdOverall")%></td>
			 
             <td   class="section-label"><b>Video Grade:</td>
			 <td class="section-text"><%=rsHeader.Fields("grdVideo")%></td>
			 
             <td  class="section-label"><b>Audio Grade:</td>
			 <td class="section-text" ><%=rsHeader.Fields("grdAudio")%></td>
            
			</tr> 
			
			 
        </table>
	</td>
  </tr>
  </table>




