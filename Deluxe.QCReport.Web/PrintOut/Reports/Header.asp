<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td class="section-header">Programme Details</td>
  </tr>
</table>

<p></p>

<!-- <div class="div-frame-border-3"> -->
   

<table width="100%" border="0">
 <tr>
  <td>
       <table width="100%" border="1" cellspacing="0" cellpadding="0" >
	       <tr>
             <td class="section-detail">&nbsp;Title: </td>
			 <td>&nbsp;<b><%=rsHeader.Fields("Show")%></b></td>
			 			 
			  <td class="section-detail">&nbsp;Description:</td>
			  <td>&nbsp;<b><%=rsHeader.Fields("TapeDesc1")%></b></td>
			  			  
             <td class="section-detail">&nbsp;QC Number:</td>
			 <td>&nbsp;<b><%=rsHeader.Fields("QCNum")%></b></td>
			</tr> 
			
			
			<tr>
             <td  class="section-detail">&nbsp;Episode Name:</td>
			 <td>&nbsp; <b><%=rsHeader.Fields("Epis_name")%></b></td>
			 			 
             <td  class="section-detail">&nbsp;Episode Number:</td>
			 <td>&nbsp;<b><%=rsHeader.Fields("Epis_no")%></b></td>
			 			 
             <td  class="section-detail">&nbsp;WO Number:</td>
			 <td>&nbsp;<b><%=rsHeader.Fields("wonum")%></b></td>
			</tr> 
						
			<tr>
				
              <td  class="section-detail">&nbsp;Subtitles:</td>
			  <td>
			  &nbsp; 
			  <b>

			  <%
			   If Not IsNull(rsHeader.Fields("Subtitle")) Then
			      Response.Write  rsHeader.Fields("Subtitle")
               Else 
				  Response.Write rsHeader.Fields("Subtitle_QC")
			   End If
			  %>
		  
			  </b>
						  
			  </td>
	         		 
             <td class="section-detail">&nbsp;Language:</td>
			 <td>&nbsp;<b><%=rsHeader.Fields("HLanguage")%></b></td>

             <td class="section-detail">&nbsp;PO Number:</td>
			 <td>&nbsp; <b><%=rsHeader.Fields("Pono")%></b></td>
			 
			</tr> 
						
			<tr>
             
             <td class="section-detail">&nbsp;TRT:</td>
			 <td>&nbsp;<b><%=rsHeader.Fields("TRT")%></b></b></td>
			 
			 <td class="section-detail">&nbsp;Textless @ Tail:</td> 
			  <td>
			  &nbsp;
			 <b><%if rsHeader.Fields("textless") = "Y" Then
                                       Response.Write("Yes")
                                    else
										Response.Write("No")
									end if%></b></td>
			</td>
			
			<td class="section-detail">&nbsp;Textless Duration:</td>
              <td>
			  &nbsp;
			<b><%=rsHeader.Fields("Duration")%></b></td>		
			<%
		           If Not IsNull(sAssetType) And sAssetType = "Tape"   Then
				       Response.Write "<tr><td colspan='3'>&nbsp;</td></tr>" 
                     '' Response.Write "<td>&nbsp;Tape Number: <b>" & rsHeader.Fields("TapeNumber") & "</b></td>"
					  Response.Write "<tr><td colspan='3'>&nbsp;Tape Number: <b>" & rsHeader.Fields("TapeNumber") & "</b></td></tr>"
	               End If		   
		      %>
			  </td>
			  
			</tr> 
			
		    <%
		           If Not IsNull(sAssetType) And sAssetType = "File"   Then
				     ''Response.Write "<tr><td colspan='3'>&nbsp;</td></tr>" 
                     Response.Write "<tr>" & _
					 "<td class='section-detail'>&nbsp;Filename:</td>" & _
					 "<td colspan='5'>&nbsp;<b>" & rsHeader.Fields("Filename") & "</b></td>" & _
					 "</tr>" 
                   End If		   
		      %>
			  
			  <%
				  If rsHDRMetadata.BOF  = False Then
						If rsHDRMetadata.Fields("NotRequired") = False Then	
							   Response.Write "<tr>"  & _
							     "<td class='section-detail'>&nbsp;Xml Document:</td>"  & _
								 "<td colspan='5'>&nbsp; <b>" & rsHDRMetadata.Fields("XmlDocument") & "</b></td>" & _
							    "</tr>" 
						End If	
				  End If		 		
				%>	
  
           			
			<tr>
			  <td class="section-detail">&nbsp;Time Code:</td>
			  <td>&nbsp;<b><%=rsHeader.Fields("Timecode")%></b></td>
				
		       <td class="section-detail">&nbsp;Version:</td>
			   <td>&nbsp; <b><%=rsHeader.Fields("Version")%></b></td>
			   
			 <td class="section-detail">&nbsp;UID No. / Production ID:</td>
			 <td>&nbsp;<b><%=rsHeader.Fields("CatalogueID")%></b></td>
		 </tr>
					
			<tr>
             <td  class="section-detail">&nbsp;Status:</td>
			 <td>&nbsp; <font size=3><b><%=rsHeader.Fields("Eval_Stat")%></b></font></td>
			 
             <td  class="section-detail">&nbsp;Head Logo:</td>
			 <td>&nbsp;<b><%=rsHeader.Fields("HeadLogo")%></b></td>
			 
             <td  class="section-detail">&nbsp;Tail Logo:</td>
			 <td>&nbsp; <b><%=rsHeader.Fields("TailLogo")%></b></td>
			</tr> 
			
						
			<tr>
			 <td  class="section-detail"><b>&nbsp;Overall Grade:</td>
			 <td>&nbsp; <b><%=rsHeader.Fields("grdOverall")%></b></td>
			 
             <td   class="section-detail"><b>&nbsp;Video Grade:</td>
			 <td>&nbsp; <b><%=rsHeader.Fields("grdVideo")%></b></td>
			 
             <td  class="section-detail"><b>&nbsp;Audio Grade:</td>
			 <td>&nbsp;<b><%=rsHeader.Fields("grdAudio")%></b></td>
            
			</tr> 
			
			 
        </table>
	</td>
  </tr>
  </table>


<!-- </div> -->

