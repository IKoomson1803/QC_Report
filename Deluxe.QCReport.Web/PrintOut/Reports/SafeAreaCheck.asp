 <table width="100%" border="1" cellspacing="0" cellpadding="0" >
		<tr>
			 <td colspan="3" align="center"><b>SAFE AREA CHECK</b></td>
		</tr>
		<tr>
			<td ><b>&nbsp;Opening Titles:&nbsp;</b></td>
			<td ><b>&nbsp;Captions:&nbsp;</b></td>
			<td ><b>&nbsp;Closing Titles:&nbsp;</b></td>
		</tr>
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
		
</table>