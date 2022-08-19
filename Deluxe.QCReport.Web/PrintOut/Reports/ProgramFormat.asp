
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td align="center" class="bottom_border" > 
            <b>PROGRAMME LAYOUT</b>
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
              <tr>
			   <!--<td width="4%" class="txt_boldtype2 bottom_border" >Item No.</td> -->
                <td width="40%" class="txt_boldtype2 bottom_border" >Description</td>
                <td width="34%" class="txt_boldtype2 bottom_border">Time Code</td>
                <td width="22%" class="txt_boldtype2 bottom_border">Length</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td  valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
            <%while not rsTapeFormat.EOF%>
              <tr>
			    <!-- <td width="4%"><%=rsTapeFormat.Fields("item_num")%></td> -->
                <td width="40%"><%=rsTapeFormat.Fields("description")%></td>
                <td width="34%"><%=rsTapeFormat.Fields("Time_Code")%></td>
                <td width="22%"><%=rsTapeFormat.Fields("Length")%></td>
              </tr>
            <%rsTapeFormat.MoveNext
            wend%>
            </table>
          </td>
        </tr>
      </table>