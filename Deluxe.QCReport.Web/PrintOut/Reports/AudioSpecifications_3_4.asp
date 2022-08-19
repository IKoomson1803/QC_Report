<!-- Include file by Isaac Koomson 17/12/2012 -->

        <% If Not IsNull(rsHeader.Fields("Ch3_Desc").value) And Trim(rsHeader.Fields("Ch3_Desc").value) <> ""   Then %>
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch3&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch3_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language3")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase3")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate3")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch3_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch3_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch3_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch3_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH3_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
			 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch3").value) And rsFullSpot.Fields("FullQC_Ch3").value = True Then
				      Response.Write("<b>F</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch3").value) And rsFullSpot.Fields("SpotQC_Ch3").value = True Then
				     Response.Write("<b>S</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
           <% End If %>
				
			<% If Not IsNull(rsHeader.Fields("Ch4_Desc").value) And Trim(rsHeader.Fields("Ch4_Desc").value) <> ""  Then %>	
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch4&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch4_Desc")%></b>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language4")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase4")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate4")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch4_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch4_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch4_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch4_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH4_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch4").value) And rsFullSpot.Fields("FullQC_Ch4").value = True Then
				      Response.Write("<b>F</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch4").value) And rsFullSpot.Fields("SpotQC_Ch4").value = True Then
				     Response.Write("<b>S</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
		  <% End If %>