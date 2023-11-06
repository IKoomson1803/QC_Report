  <%   If Not rsVidAud.BOF = True And Not rsVidAud.EOF = True Then %> 
  
   <table class="section-table" border="0" cellspacing="0" cellpadding="1">
			  <tr>
			     <td class="section-header" >Video and Audio </td>
			   </tr>
		  </table>

			<p></p>


<table class="section-table" border="1" cellspacing="0" cellpadding="0" >
       
        <tr>
            <td width="40%"  class="section-sub-header" >Item</td>
           <td width="20%"  class="section-sub-header">Rating</td>
           <td width="40%"  class="section-sub-header">Description</td>
        </tr>
       
		  <tr>
			<td class="section-text" >Luminance Levels:</td>
			<td class="section-text"><%=rsVidAud.Fields("LuminanceLevelsRating")%></td>
			<td class="section-text"><%=rsVidAud.Fields("LuminanceLevelsDetails")%></td>
		  </tr>
		  
		  <tr>
			<td class="section-text" >Black Levels:</td>
			<td class="section-text"><%=rsVidAud.Fields("BlackLevelsRating")%></td>
			<td class="section-text"><%=rsVidAud.Fields("BlackLevelsDetails")%></td>
		  </tr>
		  
		   <tr>
			<td class="section-text" >Chrominance Levels:</td>
			<td class="section-text"><%=rsVidAud.Fields("ChrominanceLevelsRating")%></td>
			<td class="section-text"><%=rsVidAud.Fields("ChrominanceLevelsDetails")%></td>
		  </tr>
		  
		   <tr>
			<td class="section-text" >Audio Peaks and Loudness:</td>
			<td class="section-text"<%=rsVidAud.Fields("AudioPeaksAndLoudnessRating")%></td>
			<td class="section-text"><%=rsVidAud.Fields("AudioPeaksAndLoudnessDetails")%></td>
		  </tr>
		  
		   <tr>
			<td class="section-text" >TitleSafe:</td>
			<td class="section-text"><%=rsVidAud.Fields("TitleSafeRating")%></td>
			<td class="section-text"><%=rsVidAud.Fields("TitleSafeDetails")%></td>
		  </tr>
		  
		   
		   <tr style="font-size: 30px; ">
			<td width="78%" colspan="2" class="grade-label"  style="text-align:right;">QC Result:</td>
		  <%= SetStatus(rsVidAud.Fields("QCResult")) %>
			
			
		  </tr>
          
  </table>

 
<%
End If

Set rsVidAud = Nothing

%>