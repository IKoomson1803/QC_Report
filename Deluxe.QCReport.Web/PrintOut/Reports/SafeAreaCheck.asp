  <table class="section-table" border="0" cellspacing="0" cellpadding="1">
			  <tr>
				<td class="section-header">Safe Area Check</td>
			  </tr>
		  </table>

			<p></p>
  

 <table class="section-table" border="1" cellspacing="0" cellpadding="0"   >
			
			<tr>
				<td class="section-label safe-area-label">Opening Titles: </td>
				<td class="section-text safe-area-text">
				
						 <%
					
					   If rsHeader.Fields("OTPercent") <> "" Then
						  Response.Write  rsHeader.Fields("OTPercent") & " Safe"
					   Else 
						 Response.Write "&nbsp;"
					   End If
				
					%>
					
				 
				</td>
		
				<td class="section-label safe-area-label">Captions:</td>
				<td class="section-text  safe-area-text">
				
				 <%
				
				   If rsHeader.Fields("OTPercent") <> "" Then
					  Response.Write  rsHeader.Fields("OTPercent") & " Safe"
				   Else 
					 Response.Write "&nbsp;"
				   End If
			
				%>
			
				</td>
			
				
				<td class="section-label  safe-area-label"> Closing Titles:</td>
				<td class="section-text  safe-area-text">
				 
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
			
			
			
      </table>




