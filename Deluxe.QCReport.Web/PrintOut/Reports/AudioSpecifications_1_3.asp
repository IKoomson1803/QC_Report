<!-- Include file by Isaac Koomson 18/12/2012 -->
          
           <% If Not IsNull(rsHeader.Fields("Ch1_Desc").value) And Trim(rsHeader.Fields("Ch1_Desc").value) <> ""  Then %>
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch1&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch1_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language1")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase1")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate1")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch1_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch1_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch1_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch1_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH1_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
			      <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch1").value) And rsFullSpot.Fields("FullQC_Ch1").value = True Then
				      Response.Write("<b>F</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch1").value) And rsFullSpot.Fields("SpotQC_Ch1").value = True Then
				     Response.Write("<b>S</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch2_Desc").value) And Trim(rsHeader.Fields("Ch2_Desc").value) <> ""  Then %>
                            <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch2&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch2_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language2")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase2")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate2")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch2_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch2_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch2_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch2_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH2_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch2").value) And rsFullSpot.Fields("FullQC_Ch2").value = True Then
				      Response.Write("<b>F</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch2").value) And rsFullSpot.Fields("SpotQC_Ch2").value = True Then
				     Response.Write("<b>S</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch3_Desc").value) And Trim(rsHeader.Fields("Ch3_Desc").value) <> ""  Then %>  
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