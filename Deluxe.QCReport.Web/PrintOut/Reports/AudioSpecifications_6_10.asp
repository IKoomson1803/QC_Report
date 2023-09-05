<!-- Include file by Isaac Koomson 18/12/2012 -->

           <% If Not IsNull(rsHeader.Fields("Ch6_Desc").value) And Trim(rsHeader.Fields("Ch6_Desc").value) <> ""  Then %>
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch6&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch6_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language6")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase6")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate6")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch6_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch6_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch6_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch6_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH6_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch6").value) And rsFullSpot.Fields("FullQC_Ch6").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch6").value) And rsFullSpot.Fields("SpotQC_Ch6").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch7_Desc").value) And Trim(rsHeader.Fields("Ch7_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch7&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch7_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language7")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase7")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate7")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch7_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch7_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch7_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch7_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH7_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
			 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch7").value) And rsFullSpot.Fields("FullQC_Ch7").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch7").value) And rsFullSpot.Fields("SpotQC_Ch7").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch8_Desc").value) And Trim(rsHeader.Fields("Ch8_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch8&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch8_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language8")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase8")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate8")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch8_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch8_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch8_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch8_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH8_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch8").value) And rsFullSpot.Fields("FullQC_Ch8").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch8").value) And rsFullSpot.Fields("SpotQC_Ch8").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch9_Desc").value) And Trim(rsHeader.Fields("Ch9_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch9&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch9_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language9")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase9")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate9")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch9_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch9_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch9_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch9_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH9_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch9").value) And rsFullSpot.Fields("FullQC_Ch9").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch9").value) And rsFullSpot.Fields("SpotQC_Ch9").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch10_Desc").value) And Trim(rsHeader.Fields("Ch10_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch10&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch10_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language10")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase10")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate10")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch10_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch10_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch10_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch10_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH10_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch10").value) And rsFullSpot.Fields("FullQC_Ch10").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch10").value) And rsFullSpot.Fields("SpotQC_Ch10").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
             <% End If %>