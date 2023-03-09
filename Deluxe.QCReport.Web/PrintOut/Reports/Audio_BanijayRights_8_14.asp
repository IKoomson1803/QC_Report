<!-- Include file by Isaac Koomson 01/03/2023 -->
     
	        <% If Not IsNull(rsHeader.Fields("Ch8_Desc").value) And Trim(rsHeader.Fields("Ch8_Desc").value) <> ""  Then %>
             <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;8&nbsp;</b></td>
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
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;9&nbsp;</b></td>
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
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;10&nbsp;</b></td>
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
			  
			 <% If Not IsNull(rsHeader.Fields("Ch11_Desc").value) And Trim(rsHeader.Fields("Ch11_Desc").value) <> ""  Then %> 
               <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;11&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent11")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language11")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch11_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch11_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch11_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch11_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH11_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch11_LKFS")%>&nbsp;</td>
			  </tr>
			  
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch12_Desc").value) And Trim(rsHeader.Fields("Ch12_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;12&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent12")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language12")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch12_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch12_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch12_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch12_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH12_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch12_LKFS")%>&nbsp;</td>
			  </tr>
               <% End If %>
			  
			 <% If Not IsNull(rsHeader.Fields("Ch13_Desc").value) And Trim(rsHeader.Fields("Ch13_Desc").value) <> ""  Then %> 
              <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;13&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent13")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language12")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch13_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch13_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch13_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch13_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH13_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch13_LKFS")%>&nbsp;</td>
			  </tr>
              <% End If %>
              
              <% If Not IsNull(rsHeader.Fields("Ch14_Desc").value) And Trim(rsHeader.Fields("Ch14_Desc").value) <> ""  Then %>
               <tr>
                <td width="4%" class="right_border BanijayRightsProgrammeDetails"><b>&nbsp;Channel&nbsp;14&nbsp;</b></td>
                <td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("TrackContent14")%>&nbsp;</td>
				<td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Language14")%>&nbsp;</td>
	    		<td width="15%" class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch14_Desc")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch14_Tone")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch14_Avg")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch14_Peak")%>&nbsp;</td>
                <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("CH14_TruePeak")%>&nbsp;</td>
				 <td width="9%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Ch14_LKFS")%>&nbsp;</td>
			  </tr>
             <% End If %>
			   