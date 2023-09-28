<table width="100%" border="0" cellspacing="0" cellpadding="1">
			  <tr>
				<td class="section-header">Programme Layout</td>
			  </tr>
 </table>

<p></p>


  
<table width="100%" border="1" cellspacing="0" cellpadding="0" >
       
         <!--<td width="4%" class="txt_boldtype2 bottom_border" >Item No.</td> -->
                <td class="section-label" width="40%" >Description</td>
                <td class="section-label" width="34%" >Time Code</td>
                <td class="section-label"  width="22%" >Length</td>
              </tr> 
        <tr>
		
         <%while not rsTapeFormat.EOF%>
              <tr>
			    <!-- <td width="4%"><%=rsTapeFormat.Fields("item_num")%></td> -->
                <td class="section-text" ><%=rsTapeFormat.Fields("description")%></td>
                <td class="section-text"><%=rsTapeFormat.Fields("Time_Code")%></td>
                <td class="section-text"><%=rsTapeFormat.Fields("Length")%></td>
              </tr>
            <%rsTapeFormat.MoveNext
            wend%>
			
      </table>
