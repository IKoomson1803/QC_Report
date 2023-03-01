<!-- Include file by Isaac Koomson 01/01/2023 -->
          
          <% If Not IsNull(rsHeader.Fields("Ch1_Desc").value) And Trim(rsHeader.Fields("Ch1_Desc").value) <> ""  Then %>
             <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch1&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent1")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language1")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("Ch1_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch1_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch1_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch1_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH1_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("Ch1_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			  <% If Not IsNull(rsHeader.Fields("Ch2_Desc").value) And Trim(rsHeader.Fields("Ch2_Desc").value) <> ""  Then %>
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch2&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent2")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language2")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("Ch2_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch2_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch2_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch2_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH2_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("Ch2_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			  <% If Not IsNull(rsHeader.Fields("Ch3_Desc").value) And Trim(rsHeader.Fields("Ch3_Desc").value) <> ""  Then %>
             <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch3&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent3")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language3")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("Ch3_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch3_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch3_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch3_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH3_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("Ch3_LKFS")%>&nbsp;</td>
			  </tr>
                <% End If %>
			  
			  <% If Not IsNull(rsHeader.Fields("Ch4_Desc").value) And Trim(rsHeader.Fields("Ch4_Desc").value) <> ""  Then %>
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch4&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent4")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language4")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("Ch4_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch3_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch4_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch4_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH4_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("Ch4_LKFS")%>&nbsp;</td>
			  </tr>
               <% End If %>
			  
			  <% If Not IsNull(rsHeader.Fields("Ch5_Desc").value) And Trim(rsHeader.Fields("Ch5_Desc").value) <> ""  Then %>
               <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch5&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent5")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language5")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("Ch5_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch5_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch5_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch5_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH5_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("Ch5_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			 
			 
               