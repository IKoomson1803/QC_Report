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
             <td class="section-detail" >Title: </td>
			 <td class="section-text" ><%=rsHeader.Fields("Show")%></td>
			 			 
			  <td class="section-detail" >Description:</td>
			  <td class="section-text" ><%=rsHeader.Fields("TapeDesc1")%></td>
			  			  
             <td class="section-detail" >QC Number:</td>
			 <td class="section-text" ><%=rsHeader.Fields("QCNum")%></td>
			</tr> 
			
			
			<tr>
             <td  class="section-detail" >Episode Name:</td>
			 <td class="section-text"><%=rsHeader.Fields("Epis_name")%></td>
			 			 
             <td  class="section-detail" >Episode Number:</td>
			 <td class="section-text" ><%=rsHeader.Fields("Epis_no")%></td>
			 			 
             <td  class="section-detail" >WO Number:</td>
			 <td class="section-text" ><%=rsHeader.Fields("wonum")%></td>
			</tr> 
						
			<tr>
				
              <td  class="section-detail" >Subtitles:</td>
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
	         		 
             <td class="section-detail" >Language:</td>
			 <td class="section-text" ><%=rsHeader.Fields("HLanguage")%></td>

             <td class="section-detail" >PO Number:</td>
			 <td class="section-text"><%=rsHeader.Fields("Pono")%></td>
			 
			</tr> 
						
			<tr>
             
             <td class="section-detail" >TRT:</td>
			 <td class="section-text" ><%=rsHeader.Fields("TRT")%></td>
			 
			 <td class="section-detail" >Textless @ Tail:</td> 
			  <td class="section-text">
			 <%if rsHeader.Fields("textless") = "Y" Then
                                       Response.Write("Yes")
                                    else
										Response.Write("No")
									end if%></td>
			</td>
			
			<td class="section-detail" >Textless Duration:</td>
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
					 "<td class='section-detail'>Filename:</td>" & _
					 "<td colspan='5' class='section-text' >" & rsHeader.Fields("Filename") & "</td>" & _
					 "</tr>" 
                   End If		   
		      %>
			  
			  <%
				  If rsHDRMetadata.BOF  = False Then
						If rsHDRMetadata.Fields("NotRequired") = False Then	
							   Response.Write "<tr>"  & _
							     "<td class='section-detail'>Xml Document:</td>"  & _
								 "<td colspan='5' class='section-text'>" & rsHDRMetadata.Fields("XmlDocument") & "</td>" & _
							    "</tr>" 
						End If	
				  End If		 		
				%>	
  
           			
			<tr>
			  <td class="section-detail" >Time Code:</td>
			  <td class="section-text" ><%=rsHeader.Fields("Timecode")%></td>
				
		       <td class="section-detail" >Version:</td>
			   <td class="section-text"><%=rsHeader.Fields("Version")%></td>
			   
			 <td class="section-detail" >UID No. / Production ID:</td>
			 <td class="section-text" ><%=rsHeader.Fields("CatalogueID")%></td>
		 </tr>
					
			<tr>
             <td  class="section-detail" >Status:</td>
			 <td class="section-text"><%=rsHeader.Fields("Eval_Stat")%></td>
			 
             <td  class="section-detail" >Head Logo:</td>
			 <td class="section-text" ><%=rsHeader.Fields("HeadLogo")%></td>
			 
             <td  class="section-detail" >Tail Logo:</td>
			 <td class="section-text"><%=rsHeader.Fields("TailLogo")%></td>
			</tr> 
			
						
			<tr>
			 <td  class="section-detail"><b>Overall Grade:</td>
			 <td class="section-text"><%=rsHeader.Fields("grdOverall")%></td>
			 
             <td   class="section-detail"><b>Video Grade:</td>
			 <td class="section-text"><%=rsHeader.Fields("grdVideo")%></td>
			 
             <td  class="section-detail"><b>Audio Grade:</td>
			 <td class="section-text" ><%=rsHeader.Fields("grdAudio")%></td>
            
			</tr> 
			
			 
        </table>
	</td>
  </tr>
  </table>




