<!-- Include file by Isaac Koomson 18/09/2012 -->

           <% If Not IsNull(rsHeader.Fields("Ch12_Desc").value) And Trim(rsHeader.Fields("Ch12_Desc").value) <> ""  Then %>
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch12&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch12_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language12")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase12")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate12")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch12_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch12_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch12_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch12_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH12_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch12").value) And rsFullSpot.Fields("FullQC_Ch12").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch12").value) And rsFullSpot.Fields("SpotQC_Ch12").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch13_Desc").value) And Trim(rsHeader.Fields("Ch13_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch13&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch13_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language13")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase13")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate13")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch13_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch13_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch13_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch13_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH13_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
			      <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch13").value) And rsFullSpot.Fields("FullQC_Ch13").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch13").value) And rsFullSpot.Fields("SpotQC_Ch13").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch14_Desc").value) And Trim(rsHeader.Fields("Ch14_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch14&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch14_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language14")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase14")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate14")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch14_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch14_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch14_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch14_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH14_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch14").value) And rsFullSpot.Fields("FullQC_Ch14").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch14").value) And rsFullSpot.Fields("SpotQC_Ch14").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch15_Desc").value) And Trim(rsHeader.Fields("Ch15_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch15&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch15_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language15")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase15")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate15")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch15_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch15_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch15_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch15_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH15_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
			 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch15").value) And rsFullSpot.Fields("FullQC_Ch15").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch15").value) And rsFullSpot.Fields("SpotQC_Ch15").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch16_Desc").value) And Trim(rsHeader.Fields("Ch16_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch16&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch16_Desc")%></b>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language16")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase16")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate16")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch16_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch16_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch16_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch16_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH16_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch16").value) And rsFullSpot.Fields("FullQC_Ch16").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch16").value) And rsFullSpot.Fields("SpotQC_Ch16").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch17_Desc").value) And Trim(rsHeader.Fields("Ch17_Desc").value) <> ""  Then %> 
               <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch17&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch17_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language17")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase17")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate17")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch17_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch17_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch17_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch17_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH17_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch17").value) And rsFullSpot.Fields("FullQC_Ch17").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch17").value) And rsFullSpot.Fields("SpotQC_Ch17").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch18_Desc").value) And Trim(rsHeader.Fields("Ch18_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch18&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch18_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language18")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase18")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate18")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch18_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch18_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch18_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch18_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH18_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch18").value) And rsFullSpot.Fields("FullQC_Ch18").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch18").value) And rsFullSpot.Fields("SpotQC_Ch18").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch19_Desc").value) And Trim(rsHeader.Fields("Ch19_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch19&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch19_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language19")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase19")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate19")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch19_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch19_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch19_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch19_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH19_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
			 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch19").value) And rsFullSpot.Fields("FullQC_Ch19").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch19").value) And rsFullSpot.Fields("SpotQC_Ch19").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch20_Desc").value) And Trim(rsHeader.Fields("Ch20_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch20&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch20_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language20")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase20")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate20")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch20_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch20_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch20_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch20_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH20_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch20").value) And rsFullSpot.Fields("FullQC_Ch20").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch20").value) And rsFullSpot.Fields("SpotQC_Ch20").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				
				&nbsp;</td>
              </tr>
             <% End If %>
                            			  
			 <% If Not IsNull(rsHeader.Fields("Ch21_Desc").value) And Trim(rsHeader.Fields("Ch21_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch21&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch21_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language21")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase21")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate21")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch21_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch21_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch21_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch21_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH21_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch21").value) And rsFullSpot.Fields("FullQC_Ch21").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch21").value) And rsFullSpot.Fields("SpotQC_Ch21").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch22_Desc").value) And Trim(rsHeader.Fields("Ch22_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch22&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch22_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language22")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase22")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate22")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch22_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch22_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch22_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch22_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch22_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch22").value) And rsFullSpot.Fields("FullQC_Ch22").value = True Then
				      Response.Write("<b>Full</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch22").value) And rsFullSpot.Fields("SpotQC_Ch22").value = True Then
				     Response.Write("<b>Spot</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
             <% End If %>
              