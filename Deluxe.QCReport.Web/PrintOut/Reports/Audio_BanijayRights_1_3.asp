<!-- Include file by Isaac Koomson 01/03/2023 -->
          
           <% If Not IsNull(rsHeader.Fields("Ch1_Desc").value) And Trim(rsHeader.Fields("Ch1_Desc").value) <> ""  Then %>
             <tr>
                <td  class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel 1&nbsp;</b></td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent1")%>&nbsp;</td>
				<td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language1")%>&nbsp;</td>
	    		<td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH1_Desc")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH1_Tone")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH1_Avg")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH1_Peak")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH1_TruePeak")%>&nbsp;</td>
				 <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH1_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch2_Desc").value) And Trim(rsHeader.Fields("Ch2_Desc").value) <> ""  Then %>
               <tr>
                <td  class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel 2&nbsp;</b></td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent2")%>&nbsp;</td>
				<td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language2")%>&nbsp;</td>
	    		<td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_Desc")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_Tone")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_Avg")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_Peak")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_TruePeak")%>&nbsp;</td>
				 <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("CH3_Desc").value) And Trim(rsHeader.Fields("CH3_Desc").value) <> ""  Then %>  
             <tr>
                <td  class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel 3&nbsp;;</b></td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent3")%>&nbsp;</td>
				<td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language3")%>&nbsp;</td>
	    		<td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch3_Desc")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch3_Tone")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch3_Avg")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch3_Peak")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH3_TruePeak")%>&nbsp;</td>
				 <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch3_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>  