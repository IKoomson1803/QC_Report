<!-- Include file by Isaac Koomson 17/12/2012 -->

        <% If Not IsNull(rsHeader.Fields("Ch3_Desc").value) And Trim(rsHeader.Fields("Ch3_Desc").value) <> ""   Then %>
              <tr>
                <td width="4%" class="right_border BanijayRightsLable"><b>&nbsp;Channel&nbsp;3&nbsp;</b></td>
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
                <td width="4%" class="right_border BanijayRightsLable"><b>&nbsp;Channel&nbsp;4&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent4")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language4")%>&nbsp;</td>
	    		<td width="15%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch4_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch4_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch4_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch4_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH4_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch4_LKFS")%>&nbsp;</td>
			  </tr>
		  <% End If %>