<!-- Include file by Isaac Koomson 01/01/2023 -->
          
           <% If Not IsNull(rsHeader.Fields("Ch1_Desc").value) And Trim(rsHeader.Fields("Ch1_Desc").value) <> ""   Then %>
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
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language2")%>&nbsp;</td>
	    		<td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH2_LKFS")%>&nbsp;</td>
			  </tr>
			<% End If %>