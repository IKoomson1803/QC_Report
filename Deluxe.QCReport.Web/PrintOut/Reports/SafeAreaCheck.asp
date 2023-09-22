  <table width="100%" border="0" cellspacing="0" cellpadding="1">
			  <tr>
				<td class="section-header">Safe Area Check</td>
			  </tr>
		  </table>

			<p></p>
  

 <table width="100%" border="1" cellspacing="0" cellpadding="0"   >
			
			<tr>
				<td class="section-detail">&nbsp;Opening Titles: </td>
				<td>
				&nbsp;
				  <b>
						 <%
					
					   If rsHeader.Fields("OTPercent") <> "" Then
						  Response.Write  rsHeader.Fields("OTPercent") & " Safe"
					   Else 
						 Response.Write "&nbsp;"
					   End If
				
					%>
					
				  </b>
				</td>
		
				<td class="section-detail">&nbsp;Captions:</td>
				<td>
				&nbsp;
				 <b>
				 <%
				
				   If rsHeader.Fields("OTPercent") <> "" Then
					  Response.Write  rsHeader.Fields("OTPercent") & " Safe"
				   Else 
					 Response.Write "&nbsp;"
				   End If
			
				%>
				
				 
				 </b>
	
				</td>
			
				
				<td class="section-detail" >&nbsp;Closing Titles:</td>
				<td>
				&nbsp;
				  <b>
				     <%
				
				   If rsHeader.Fields("CTPercent") <> "" Then
					  Response.Write  rsHeader.Fields("CTPercent") & " Safe"
				   Else 
					 Response.Write "&nbsp;"
				   End If
			
				%>
				
				  
				  </b>
	
				
				</td>
				
				
			</tr>
			
			
			<!--
			<tr>
				<td>&nbsp;
				<%
				
				   If rsHeader.Fields("OTPercent") <> "" Then
					  Response.Write  rsHeader.Fields("OTPercent") & " Safe"
				   Else 
					 Response.Write "&nbsp;"
				   End If
			
				%>
				
				&nbsp;&nbsp;
				
				</td>
				
				<td >&nbsp;
				
					<%
				
				   If rsHeader.Fields("CapPercent") <> "" Then
					  Response.Write  rsHeader.Fields("CapPercent") & " Safe"
				   Else 
					 Response.Write "&nbsp;"
				   End If
			
				%>
							
				
				</td>
				
				<td >&nbsp;
				
				<%
				
				   If rsHeader.Fields("CTPercent") <> "" Then
					  Response.Write  rsHeader.Fields("CTPercent") & " Safe"
				   Else 
					 Response.Write "&nbsp;"
				   End If
			
				%>
				
				
				
				</td>
				
			</tr>
			-->
      </table>




