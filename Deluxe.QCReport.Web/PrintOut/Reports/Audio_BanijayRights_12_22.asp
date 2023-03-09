<!-- Include file by Isaac Koomson 01/03/2023 -->

           <% If Not IsNull(rsHeader.Fields("Ch12_Desc").value) And Trim(rsHeader.Fields("Ch12_Desc").value) <> ""  Then %>
             <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;12&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent12")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language12")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH12_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH12_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH12_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH12_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH12_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH12_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch13_Desc").value) And Trim(rsHeader.Fields("Ch13_Desc").value) <> ""  Then %> 
                <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;13&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent13")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language13")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH13_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH13_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH13_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH13_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH13_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH13_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch14_Desc").value) And Trim(rsHeader.Fields("Ch14_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;14&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent14")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language14")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH14_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH14_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH14_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH14_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH14_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH14_LKFS")%>&nbsp;</td>
			  </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch15_Desc").value) And Trim(rsHeader.Fields("Ch15_Desc").value) <> ""  Then %> 
               <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;15&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent15")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language15")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH15_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH15_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH15_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH15_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH15_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH15_LKFS")%>&nbsp;</td>
			  </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch16_Desc").value) And Trim(rsHeader.Fields("Ch16_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;16&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent16")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language16")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH16_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH16_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH16_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH16_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH16_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH16_LKFS")%>&nbsp;</td>
			  </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch17_Desc").value) And Trim(rsHeader.Fields("Ch17_Desc").value) <> ""  Then %> 
                <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;17&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent17")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language17")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH17_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH17_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH17_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH17_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH17_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH17_LKFS")%>&nbsp;</td>
			  </tr>
			  
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch18_Desc").value) And Trim(rsHeader.Fields("Ch18_Desc").value) <> ""  Then %> 
               <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;18&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent18")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language18")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH18_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH18_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH18_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH18_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH18_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH18_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch19_Desc").value) And Trim(rsHeader.Fields("Ch19_Desc").value) <> ""  Then %> 
             <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;19&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent17")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language19")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH19_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH19_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH19_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH19_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH19_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH19_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch20_Desc").value) And Trim(rsHeader.Fields("Ch20_Desc").value) <> ""  Then %> 
             <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;20&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent20")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language20")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH20_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH20_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH20_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH20_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH20_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH20_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
                            			  
			 <% If Not IsNull(rsHeader.Fields("Ch21_Desc").value) And Trim(rsHeader.Fields("Ch21_Desc").value) <> ""  Then %> 
               <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;21&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent21")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language21")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH21_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH21_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH21_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH21_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH21_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH21_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch22_Desc").value) And Trim(rsHeader.Fields("Ch22_Desc").value) <> ""  Then %> 
               <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;22&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent22")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language22")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH22_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH22_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH22_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH22_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH22_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH22_LKFS")%>&nbsp;</td>
			  </tr>
			  
             <% End If %>
              