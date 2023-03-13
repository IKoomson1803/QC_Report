<!-- Include file by Isaac Koomson 01/03/2023 -->

           <% If Not IsNull(rsHeader.Fields("Ch5_Desc").value) And Trim(rsHeader.Fields("Ch5_Desc").value) <> ""  Then %>
               <tr>
                <td  class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;5&nbsp;</b></td>
                <td  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent5")%>&nbsp;</td>
				<td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language5")%>&nbsp;</td>
	    		<td  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_Desc")%>&nbsp;</td
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_Tone")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_Avg")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_Peak")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_TruePeak")%>&nbsp;</td>
				 <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH5_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch6_Desc").value) And Trim(rsHeader.Fields("Ch6_Desc").value) <> ""  Then %> 
               <tr>
                <td  class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;6&nbsp;</b></td>
                <td  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent6")%>&nbsp;</td>
				<td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language6")%>&nbsp;</td>
	    		<td  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Desc")%>&nbsp;</td>>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Tone")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Avg")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_Peak")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_TruePeak")%>&nbsp;</td>
				 <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH6_LKFS")%>&nbsp;</td>
			  </tr>
                <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch7_Desc").value) And Trim(rsHeader.Fields("Ch7_Desc").value) <> ""  Then %> 
              <tr>
                <td  class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;7&nbsp;</b></td>
                <td  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent7")%>&nbsp;</td>
				<td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language7")%>&nbsp;</td>
	    		<td  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch7_Desc")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch7_Tone")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch7_Avg")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch7_Peak")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH7_TruePeak")%>&nbsp;</td>
				 <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch7_LKFS")%>&nbsp;</td>
			  </tr>
                <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch8_Desc").value) And Trim(rsHeader.Fields("Ch8_Desc").value) <> ""  Then %> 
               <tr>
                <td  class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;8&nbsp;</b></td>
                <td  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent8")%>&nbsp;</td>
				<td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language8")%>&nbsp;</td>
	    		<td  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch8_Desc")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch8_Tone")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch8_Avg")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch8_Peak")%>&nbsp;</td>
                <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH8_TruePeak")%>&nbsp;</td>
				 <td   class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch8_LKFS")%>&nbsp;</td>
			  </tr>
               <% End If %>
              