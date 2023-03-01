<!-- Include file by Isaac Koomson 01/03/2023 -->
          
          <% If Not IsNull(rsHeader.Fields("Ch1_Desc").value) And Trim(rsHeader.Fields("Ch1_Desc").value) <> ""  Then %>
                <tr>
                <td width="4%" class="right_border"><b>&nbsp;CH1&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent1")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language1")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH1_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH1_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH1_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH1_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH1_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH1_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch2_Desc").value) And Trim(rsHeader.Fields("Ch2_Desc").value) <> ""  Then %>
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;CH2&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent2")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language2")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH2_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH2_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH2_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH2_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH2_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH2_LKFS")%>&nbsp;</td>
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
                <td width="4%" class="right_border"><b>&nbsp;CH4&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent4")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language4")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH4_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH4_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH4_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH4_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH4_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH4_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch5_Desc").value) And Trim(rsHeader.Fields("Ch5_Desc").value) <> ""  Then %>
                <tr>
                <td width="4%" class="right_border"><b>&nbsp;CH5&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent5")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language5")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH5_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH5_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH5_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH5_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH5_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH5_LKFS")%>&nbsp;</td>
			  </tr>
            <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch6_Desc").value) And Trim(rsHeader.Fields("Ch6_Desc").value) <> ""  Then %>
               <tr>
                <td width="4%" class="right_border"><b>&nbsp;CH6&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent6")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language6")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH6_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH6_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH6_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH6_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH6_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH6_LKFS")%>&nbsp;</td>
			  </tr>
            <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch7_Desc").value) And Trim(rsHeader.Fields("Ch7_Desc").value) <> ""  Then %>
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch7&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent7")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language7")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("Ch7_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch7_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch7_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch7_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH7_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("Ch7_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch8_Desc").value) And Trim(rsHeader.Fields("Ch8_Desc").value) <> ""  Then %>
             <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch8&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent8")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language8")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("Ch8_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch8_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch8_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch8_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH8_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("Ch8_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch9_Desc").value) And Trim(rsHeader.Fields("Ch9_Desc").value) <> ""  Then %>
               <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch9&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent9")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language9")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("Ch9_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch9_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch9_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch9_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH9_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("Ch9_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch10_Desc").value) And Trim(rsHeader.Fields("Ch10_Desc").value) <> ""  Then %>
             <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch10&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent10")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language10")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("Ch10_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch10_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch10_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch10_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH10_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("Ch10_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch11_Desc").value) And Trim(rsHeader.Fields("Ch11_Desc").value) <> ""  Then %>
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;Ch11&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent11")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language11")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("Ch11_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch11_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch11_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("Ch11_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH11_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("Ch11_LKFS")%>&nbsp;</td>
			  </tr>
			  
              <% End If %>