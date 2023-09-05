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
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch1").value) And rsFullSpot.Fields("SpotQC_Ch1").value = True Then
				     Response.Write("<b>Spot</b>")
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
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch2").value) And rsFullSpot.Fields("SpotQC_Ch2").value = True Then
				     Response.Write("<b>Spot</b>")
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
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch3").value) And rsFullSpot.Fields("SpotQC_Ch3").value = True Then
				     Response.Write("<b>Spot</b>")
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
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch4").value) And rsFullSpot.Fields("SpotQC_Ch4").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
                <% End If %>
			  
			  <% If Not IsNull(rsHeader.Fields("Ch5_Desc").value) And Trim(rsHeader.Fields("Ch5_Desc").value) <> ""  Then %>
               <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch5&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch5_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language5")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase5")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate5")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch5_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch5_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch5_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch5_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH5_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch5").value) And rsFullSpot.Fields("FullQC_Ch5").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch5").value) And rsFullSpot.Fields("SpotQC_Ch5").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
             <% End If %>
			  
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