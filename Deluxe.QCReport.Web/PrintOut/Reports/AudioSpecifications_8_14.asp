<!-- Include file by Isaac Koomson 08/11/2012 -->
     
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
				      Response.Write("<b>F</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch8").value) And rsFullSpot.Fields("SpotQC_Ch8").value = True Then
				     Response.Write("<b>S</b>")
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
				      Response.Write("<b>F</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch9").value) And rsFullSpot.Fields("SpotQC_Ch9").value = True Then
				     Response.Write("<b>S</b>")
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
				      Response.Write("<b>F</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch10").value) And rsFullSpot.Fields("SpotQC_Ch10").value = True Then
				     Response.Write("<b>S</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch11_Desc").value) And Trim(rsHeader.Fields("Ch11_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch11&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("Ch11_Desc")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language11")%>&nbsp;</td>
				
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"InPhase11")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=FieldExists(rsHeader,"Discreate11")%>&nbsp;</td>
				
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch11_LKFS")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch11_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch11_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch11_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH11_TruePeak")%>&nbsp;</td>
				<td width="9%">&nbsp;
				 <%
				    if Not IsNull(rsFullSpot.Fields("FullQC_Ch11").value) And rsFullSpot.Fields("FullQC_Ch11").value = True Then
				      Response.Write("<b>F</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch11").value) And rsFullSpot.Fields("SpotQC_Ch11").value = True Then
				     Response.Write("<b>S</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
               <% End If %>
			  
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
				      Response.Write("<b>F</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch12").value) And rsFullSpot.Fields("SpotQC_Ch12").value = True Then
				     Response.Write("<b>S</b>")
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
				      Response.Write("<b>F</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch13").value) And rsFullSpot.Fields("SpotQC_Ch13").value = True Then
				     Response.Write("<b>S</b>")
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
				      Response.Write("<b>F</b>")
				  ElseIf Not IsNull(rsFullSpot.Fields("SpotQC_Ch14").value) And rsFullSpot.Fields("SpotQC_Ch14").value = True Then
				     Response.Write("<b>S</b>")
				  End If
				
				%>
				&nbsp;</td>
              </tr>
             <% End If %>
			   