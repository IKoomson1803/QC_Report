<!-- Include file by Isaac Koomson 01/03/2023 -->
          
          
			  
			  <% If Not IsNull(rsHeader.Fields("Ch1_Desc").value) And Trim(rsHeader.Fields("Ch1_Desc").value) <> ""  Then %>
              <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel 1&nbsp;</b></td>
                <td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent1")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language1")%>&nbsp;</td>
	    		<td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch1_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch1_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch1_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch1_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH1_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch1_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			  <% If Not IsNull(rsHeader.Fields("Ch2_Desc").value) And Trim(rsHeader.Fields("Ch2_Desc").value) <> ""  Then %>
              <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel 2&nbsp;</b></td>
                <td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent2")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language3")%>&nbsp;</td>
	    		<td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch2_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch2_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch2_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch2_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch2_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			  <% If Not IsNull(rsHeader.Fields("Ch3_Desc").value) And Trim(rsHeader.Fields("Ch3_Desc").value) <> ""  Then %>
             <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel 3&nbsp;</b></td>
                <td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent3")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language3")%>&nbsp;</td>
	    		<td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch3_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch3_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch3_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch3_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH3_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch3_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			  <% If Not IsNull(rsHeader.Fields("Ch4_Desc").value) And Trim(rsHeader.Fields("Ch4_Desc").value) <> ""  Then %>
              <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel 4&nbsp;</b></td>
                <td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent4")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language4")%>&nbsp;</td>
	    		<td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH4_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH4_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH4_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH4_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH4_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH4_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			  <% If Not IsNull(rsHeader.Fields("Ch5_Desc").value) And Trim(rsHeader.Fields("Ch5_Desc").value) <> ""  Then %>
                <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel 5&nbsp;</b></td>
                <td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent5")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language5")%>&nbsp;</td>
	    		<td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			  
			  <% If Not IsNull(rsHeader.Fields("Ch6_Desc").value) And Trim(rsHeader.Fields("Ch6_Desc").value) <> ""  Then %>
               <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel 6&nbsp;</b></td>
                <td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent6")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language6")%>&nbsp;</td>
	    		<td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_LKFS")%>&nbsp;</td>
			  </tr>
			  
             <% End If %>