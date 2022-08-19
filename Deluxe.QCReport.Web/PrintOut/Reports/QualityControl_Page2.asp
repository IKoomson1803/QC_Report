



  
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td colspan=5>&nbsp;</td>
    </tr>
    <tr>
      <td>Type:</td>
      <td>F=Film</td>
      <td>V=Video</td>
      <td>A=Audio</td>
      <td colspan=2 align="center">
			<table cellspacing=0 border=1 bordercolor="#000000" width=90 id="tblTapeFormat">
				<tr>
					<td width=30 align="center" valign="middle">U-L</td>
					<td width=30 align="center" valign="middle">U-C</td>
					<td width=30 align="center" valign="middle">U-R</td>
				</tr>
				<tr>
					<td width=30 align="center" valign="middle">M-L</td>
					<td width=30 align="center" valign="middle">M-C</td>
					<td width=30 align="center" valign="middle">M-R</td>
				</tr>
				<tr>
					<td width=30 align="center" valign="middle">L-L</td>
					<td width=30 align="center" valign="middle">L-C</td>
					<td width=30 align="center" valign="middle">L-R</td>
				</tr>
			</table>	
      </td>
    </tr>
    <tr>
		<td colspan=5>&nbsp;</td>
    </tr>
    <%if rsHeader.Fields("GradingScale") = 3 then %>
    <tr> 
      <td>Severity Grades:</td>
      <td>1=Acceptable</td>
      <td>2=Marginal</td>
      <td>3=Unacceptable</td>
      <td colspan=2>&nbsp;</td>
    </tr>
    <%end if%>
    <%if rsHeader.Fields("GradingScale") = 4 then %>
    <tr> 
      <td>Severity Grades:</td>
      <td>1=Standard/Non Detectable</td>
      <td>2=Acceptable</td>
      <td>3=Marginal/Intrusive</td>
      <td>4=Unacceptable</td>
      <td>&nbsp;</td>
    </tr>
    <%end if%>
    <%if rsHeader.Fields("GradingScale") = 5 then %>
    <tr> 
      <td>Severity Grades:</td>
      <td>1=Very Annoying</td>
      <td>2=Annoying</td>
      <td>3=Slightly Annoying</td>
      <td>4=Perceptible but not Annoying</td>
      <td>5=Imperceptible</td>
    </tr>
    <%end if%>
  </table>











