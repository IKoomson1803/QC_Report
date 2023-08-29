 <table width="100%" border="1" cellspacing="0" cellpadding="0" class="frame-border"  >
  <tr>
    <td>
	     <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000" rules="all" >
			<tr>
				 <td colspan="3" class="header"><b>SAFE AREA CHECK</b></td>
			</tr>
			<tr>
				<td >&nbsp;Opening Titles:&nbsp;
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
		
				<td >&nbsp;Captions:&nbsp;
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
			
				
				<td >&nbsp;Closing Titles:&nbsp;
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
				<td >&nbsp;
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
	
	</td>
  </tr>
</table>
 
 
 
 
 
