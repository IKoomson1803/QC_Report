
<table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000" height="36">
  <tr>
  <td>
       <table width="100%" border="0" cellspacing="0" cellpadding="1" >
	       <tr>
             <td >Title:&nbsp; <b><%=rsHeader.Fields("Show")%></b></td>
			 <!--
             <td>Part Number:&nbsp;<b>Part <%=rsHeader.Fields("This_part")%> of <%=rsHeader.Fields("tot_part")%></b></td>
			 -->
			 
			  <td>Description:&nbsp;<b><%=rsHeader.Fields("TapeDesc1")%></b></td>
             <td>QC Number:&nbsp;<b><%=rsHeader.Fields("QCNum")%></b></td>
			</tr> 
			 <tr> 
               <td colspan="4">&nbsp;</td>
            </tr>
			<tr>
             <td >Episode Name:&nbsp; <b><%=rsHeader.Fields("Epis_name")%></b></td>
             <td>Episode Number:&nbsp;<b><%=rsHeader.Fields("Epis_no")%></b></td>
             <td>WO Number:&nbsp;<b><%=rsHeader.Fields("wonum")%></b></td>
			</tr> 
			 <tr> 
              <td colspan="4">&nbsp;</td>
            </tr>
			<tr>
				
              <td >Subtitles:&nbsp; <b>

			  <%
			   If Not IsNull(rsHeader.Fields("Subtitle")) Then
			      Response.Write  rsHeader.Fields("Subtitle")
               Else 
				  Response.Write rsHeader.Fields("Subtitle_QC")
			   End If
			  %>
			  
			  
			  
			  </b>
			  
			  
			  </td>
	         		 
             <td>Language: <b><%=rsHeader.Fields("HLanguage")%></b></td>
             <td>PO Number:&nbsp; <b><%=rsHeader.Fields("Pono")%></b></td>
			 
			</tr> 
			 <tr> 
                <td colspan="4">&nbsp;</td>
            </tr>
			<tr>
             
             <td>TRT:&nbsp;<b><%=rsHeader.Fields("TRT")%></b></b></td>
			 <td>Textless @ Tail: <b><%if rsHeader.Fields("textless") = "Y" Then
                                       Response.Write("Yes")
                                    else
										Response.Write("No")
									end if%></b></td>
									
			<td>Textless Duration: <b><%=rsHeader.Fields("Duration")%></b>
			
			</td>		
			<%
		           If Not IsNull(sAssetType) And sAssetType = "Tape"   Then
				       Response.Write "<tr><td colspan='3'>&nbsp;</td></tr>" 
                     '' Response.Write "<td>Tape Number: <b>" & rsHeader.Fields("TapeNumber") & "</b></td>"
					  Response.Write "<tr><td colspan='3'>Tape Number: <b>" & rsHeader.Fields("TapeNumber") & "</b></td></tr>"
	               End If		   
		      %>
			  
			</tr> 
			
		    <%
		           If Not IsNull(sAssetType) And sAssetType = "File"   Then
				     Response.Write "<tr><td colspan='3'>&nbsp;</td></tr>" 
                     Response.Write "<tr><td colspan='3'>Filename: <b>" & rsHeader.Fields("Filename") & "</b></td></tr>" 
                   End If		   
		      %>
            

             <tr> 
                <td colspan="4">&nbsp;</td>
             </tr>
			  <td>Time Code:&nbsp;<b>
			 
			 <% If Not IsNull(rsHeader.Fields("Timecode")) Then
			    Response.Write rsHeader.Fields("Timecode")
			  Else
			    Response.Write rsHeader.Fields("Time_code")
			 End If
			 %>
			 </b>
			 
			 </td>
			 
			 <td >Version:&nbsp; <b><%=rsHeader.Fields("Version")%></b></td>
			 <td>UID No. / Production ID:&nbsp;<b><%=rsHeader.Fields("CatalogueID")%></b></td>
							
			
			</tr>
			

               <tr> 
                <td colspan="4">&nbsp;</td>
            </tr>
			
			<tr>
             <td >Status:&nbsp; <font size=3><b><%=rsHeader.Fields("Eval_Stat")%></b></font></td>
             <td>Head Logo:&nbsp;<b><%=rsHeader.Fields("HeadLogo")%></b></td>
             <td>Tail Logo:&nbsp; <b><%=rsHeader.Fields("TailLogo")%></b></td>
			</tr> 
			 <tr> 
                <td colspan="4">&nbsp;</td>
             </tr>
			<tr>
			 <td><b>Overall Grade:</b>&nbsp; <b><%=rsHeader.Fields("grdOverall")%></b></td>
             <td ><b>Video Grade:</b>&nbsp; <b><%=rsHeader.Fields("grdVideo")%></b></td>
             <td><b>Audio Grade:</b>&nbsp;<b><%=rsHeader.Fields("grdAudio")%></b></td>
            
			</tr> 
			<tr>
			 
        </table>
	</td>
  </tr>
  </table>