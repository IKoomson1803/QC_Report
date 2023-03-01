<!-- Include file by Isaac Koomson0  01/03/2023 -->

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
                <td width="4%" class="right_border"><b>&nbsp;CH130&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent10")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language10")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH10_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH10_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH10_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH10_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH10_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH10_LKFS")%>&nbsp;</td>
			  </tr>
			  
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch11_Desc").value) And Trim(rsHeader.Fields("Ch11_Desc").value) <> ""  Then %> 
              <tr>
              
			  <tr>
                <td width="4%" class="right_border"><b>&nbsp;CH1&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent11")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language11")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH11_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH11_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH11_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH11_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH11_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH11_LKFS")%>&nbsp;</td>
			  </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch12_Desc").value) And Trim(rsHeader.Fields("Ch12_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;CH12&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent12")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language12")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH12_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH12_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH12_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH12_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH12_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH12_LKFS")%>&nbsp;</td>
			  </tr>
			  
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch13_Desc").value) And Trim(rsHeader.Fields("Ch13_Desc").value) <> ""  Then %> 
                <tr>
                <td width="4%" class="right_border"><b>&nbsp;CH13&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent13")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language13")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH13_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH13_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH13_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH13_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH13_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH13_LKFS")%>&nbsp;</td>
			  </tr>
			  
              <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch14_Desc").value) And Trim(rsHeader.Fields("Ch14_Desc").value) <> ""  Then %> 
                <tr>
                <td width="4%" class="right_border"><b>&nbsp;CH14&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent14")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language14")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH14_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH14_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH14_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH14_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH14_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH14_LKFS")%>&nbsp;</td>
			  </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch15_Desc").value) And Trim(rsHeader.Fields("Ch15_Desc").value) <> ""  Then %> 
               <tr>
                <td width="4%" class="right_border"><b>&nbsp;CH15&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent15")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language15")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH15_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH15_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH15_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH15_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH15_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH15_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch16_Desc").value) And Trim(rsHeader.Fields("Ch16_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border"><b>&nbsp;CH16&nbsp;</b></td>
                <td width="15%">&nbsp;<%=rsHeader.Fields("TrackContent16")%>&nbsp;</td>
				<td width="9%">&nbsp;<%=rsHeader.Fields("Language16")%>&nbsp;</td>
	    		<td width="15%">&nbsp;<%=rsHeader.Fields("CH16_Desc")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH16_Tone")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH16_Avg")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH16_Peak")%>&nbsp;</td>
                <td width="9%">&nbsp;<%=rsHeader.Fields("CH16_TruePeak")%>&nbsp;</td>
				 <td width="9%">&nbsp;<%=rsHeader.Fields("CH16_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
			  
			 