<!-- Include file by Isaac Koomson 01/03/2023 -->

           <% If Not IsNull(rsHeader.Fields("Ch6_Desc").value) And Trim(rsHeader.Fields("Ch6_Desc").value) <> ""  Then %>
             <tr>
                <td width="4%" class="right_border BanijayRightsLable"><b>&nbsp;Channel&nbsp;6&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent6")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language6")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch7_Desc").value) And Trim(rsHeader.Fields("Ch7_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border BanijayRightsLable"><b>&nbsp;Channel&nbsp;7&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent7")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language7")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch7_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch7_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch7_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch7_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH7_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch7_LKFS")%>&nbsp;</td>
			  </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch8_Desc").value) And Trim(rsHeader.Fields("Ch8_Desc").value) <> ""  Then %> 
               <tr>
                <td width="4%" class="right_border BanijayRightsLable"><b>&nbsp;Channel&nbsp;8&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent8")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language8")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch8_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch8_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch8_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch8_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH8_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch8_LKFS")%>&nbsp;</td>
			  </tr>
			  
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch9_Desc").value) And Trim(rsHeader.Fields("Ch9_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border BanijayRightsLable"><b>&nbsp;Channel&nbsp;9&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent9")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language9")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch9_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch9_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch9_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch9_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH9_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch9_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch10_Desc").value) And Trim(rsHeader.Fields("Ch10_Desc").value) <> ""  Then %> 
               <tr>
                <td width="4%" class="right_border BanijayRightsLable"><b>&nbsp;Channel&nbsp;10&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent10")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language10")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch10_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch10_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch10_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch10_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH10_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch10_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>