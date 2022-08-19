
<table width="100%" border="0" cellspacing="0" cellpadding="1" >
  <tr>
    <td align="center" <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%> colspan="5"<%End If%>>
      <b>OVERALL COMMENTS</b>
    </td>
    <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%>
    <td align="center" width="5" >
      &nbsp;
    </td>
	
	<td align="center" valign="top">
      <b>VIDEO COMMENTS / CORRECTIVE ACTIONS</b>
    </td>
	
    
	<td align="center" width="5">
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
	
	<td align="center" valign="top">
      <b>AUDIO COMMENTS / CORRECTIVE ACTIONS</b>
    </td>
	 
    <%End If%>
  </tr>
  <tr>
    <td <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%> colspan="5"<%Else%> width="33%"<%End If%> height="200px">
      <table width="100%" height="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000">
        <tr>
          <td  valign="top">
		  &nbsp;<%=rsFullSpot.Fields("Comments")%>&nbsp;
		  
		  <p>&nbsp;</p>
	      <p>&nbsp;</p>
		  </td>
        </tr>
      </table>
    </td>
    <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%>
    <td align="center" width="5">
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
    <td width="33%" valign="top" height="200px">
      <table width="100%" height="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000">
        <tr>
          <td  valign="top">
		   &nbsp;<%=rsFullSpot.Fields("VideoComments")%>&nbsp;
		  
		  
		  <p>&nbsp;</p>
	      <p>&nbsp;</p>
		  </td>
        </tr>
      </table>
    </td>
	<td align="center" width="5">
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
	<td width="33%" valign="top" height="200px">
      <table width="100%" height="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000">
        <tr>
          <td  valign="top">
		  &nbsp;<%=rsFullSpot.Fields("RecommendationComments")%>&nbsp;
		 
		  <p>&nbsp;</p>
	      <p>&nbsp;</p>
		  </td>
        </tr>
      </table>
    </td>
    <%End If%>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
