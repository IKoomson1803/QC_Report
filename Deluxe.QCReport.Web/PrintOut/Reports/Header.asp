<div class="div-frame-border-3">
   

<table width="100%" border="0>
 <tr>
  <td>
       <table width="100%" border="0" cellspacing="0" cellpadding="1" >
	       <tr>
             <td >&nbsp;Title:&nbsp; <b><%=rsHeader.Fields("Show")%></b></td>
			 <!--
             <td>Part Number:&nbsp;<b>Part <%=rsHeader.Fields("This_part")%> of <%=rsHeader.Fields("tot_part")%></b></td>
			 -->
			 
			  <td>&nbsp;Description:&nbsp;<b><%=rsHeader.Fields("TapeDesc1")%></b></td>
             <td>&nbsp;QC Number:&nbsp;<b><%=rsHeader.Fields("QCNum")%></b></td>
			</tr> 
			
			<!--
			 <tr> 
               <td colspan="4">&nbsp;</td>
            </tr>
			-->
			
			<tr>
             <td >&nbsp;Episode Name:&nbsp; <b><%=rsHeader.Fields("Epis_name")%></b></td>
             <td>&nbsp;Episode Number:&nbsp;<b><%=rsHeader.Fields("Epis_no")%></b></td>
             <td>&nbsp;WO Number:&nbsp;<b><%=rsHeader.Fields("wonum")%></b></td>
			</tr> 
			
			<!--
			 <tr> 
               <td colspan="4">&nbsp;</td>
            </tr>
			-->
			
			<tr>
				
              <td >&nbsp;Subtitles:&nbsp; 
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
	         		 
             <td>&nbsp;Language: <b><%=rsHeader.Fields("HLanguage")%></b></td>
             <td>&nbsp;PO Number:&nbsp; <b><%=rsHeader.Fields("Pono")%></b></td>
			 
			</tr> 
			
			
            <!--
			 <tr> 
               <td colspan="4">&nbsp;</td>
            </tr>
			-->
			
			<tr>
             
             <td>&nbsp;TRT:&nbsp;<b><%=rsHeader.Fields("TRT")%></b></b></td>
			 <td>&nbsp;Textless @ Tail: <b><%if rsHeader.Fields("textless") = "Y" Then
                                       Response.Write("Yes")
                                    else
										Response.Write("No")
									end if%></b></td>
									
			<td>&nbsp;Textless Duration: <b><%=rsHeader.Fields("Duration")%></b></td>		
			<%
		           If Not IsNull(sAssetType) And sAssetType = "Tape"   Then
				       Response.Write "<tr><td colspan='3'>&nbsp;</td></tr>" 
                     '' Response.Write "<td>&nbsp;Tape Number: <b>" & rsHeader.Fields("TapeNumber") & "</b></td>"
					  Response.Write "<tr><td colspan='3'>&nbsp;Tape Number: <b>" & rsHeader.Fields("TapeNumber") & "</b></td></tr>"
	               End If		   
		      %>
			  
			</tr> 
			
		    <%
		           If Not IsNull(sAssetType) And sAssetType = "File"   Then
				     ''Response.Write "<tr><td colspan='3'>&nbsp;</td></tr>" 
                     Response.Write "<tr><td colspan='3'>&nbsp;Filename: <b>" & rsHeader.Fields("Filename") & "</b></td></tr>" 
                   End If		   
		      %>
			  
			  <%
				  If rsHDRMetadata.BOF  = False Then
						If rsHDRMetadata.Fields("NotRequired") = False Then	
							   Response.Write "<tr>"  & _
							     "<td colspan='2'>&nbsp;Xml Document: <b>" & rsHDRMetadata.Fields("XmlDocument") & "</b></td>"  & _
							    "</tr>" 
						End If	
				  End If		 		
				%>	
  
            <!--
			 <tr> 
               <td colspan="4">&nbsp;</td>
            </tr>
			-->
			
			<tr>
			  <td>&nbsp;Time Code:&nbsp;<b><%=rsHeader.Fields("Timecode")%></b></td>
		       <td >&nbsp;Version:&nbsp; <b><%=rsHeader.Fields("Version")%></b></td>
			 <td>&nbsp;UID No. / Production ID:&nbsp;<b><%=rsHeader.Fields("CatalogueID")%></b></td>
		 </tr>
			

             <!--
			 <tr> 
               <td colspan="4">&nbsp;</td>
            </tr>
			-->
			
			<tr>
             <td >&nbsp;Status:&nbsp; <font size=3><b><%=rsHeader.Fields("Eval_Stat")%></b></font></td>
             <td>&nbsp;Head Logo:&nbsp;<b><%=rsHeader.Fields("HeadLogo")%></b></td>
             <td>&nbsp;Tail Logo:&nbsp; <b><%=rsHeader.Fields("TailLogo")%></b></td>
			</tr> 
			
			<!--
			 <tr> 
               <td colspan="4">&nbsp;</td>
            </tr>
			-->
			
			<tr>
			 <td><b>&nbsp;Overall Grade:</b>&nbsp; <b><%=rsHeader.Fields("grdOverall")%></b></td>
             <td ><b>&nbsp;Video Grade:</b>&nbsp; <b><%=rsHeader.Fields("grdVideo")%></b></td>
             <td><b>&nbsp;Audio Grade:</b>&nbsp;<b><%=rsHeader.Fields("grdAudio")%></b></td>
            
			</tr> 
			
			 
        </table>
	</td>
  </tr>
  </table>


</div>

