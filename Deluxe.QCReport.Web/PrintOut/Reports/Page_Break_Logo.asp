
<table class="section-table" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td align="left" width="110" valign="top"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0" ></td>
    <td align="center"> 
      <h2 class="txt_boldtype_header" > QUALITY CONTROL REPORT FOR<br>
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
	<td align="right">
	    <table width="220" border="1" cellspacing="0" cellpadding="0">
	       <tr>
		      <td class="status-label">STATUS</td>
			   <% SetStatus(rsHeader.Fields("Eval_Stat"))  %>
      	   </tr>
		   <tr>
		      <td class="grade-label">Video Grade:</td>
			   <%= SetGrade(rsHeader.Fields("grdVideo")) %>
     	   </tr>
		   <tr>
		      <td class="grade-label">Audio Grade:</td>
			   <%= SetGrade(rsHeader.Fields("grdAudio")) %>
	       </tr>
		   <tr>
		     <td class="grade-label">Overall Grade:</td>
			  <%= SetGrade(rsHeader.Fields("grdOverall")) %>
           </tr>
      </table>
	</td>
  </tr>
  <tr>
	<td colspan="2" align="center"><b><%=rsHeader.Fields("Address")%></b>&nbsp;</td>
	 <td align="right">
		Page:&nbsp;<%=thisPage%>&nbsp;of&nbsp;<span id="totalPage<%=thisPage%>"></span>
    </td>
  </tr>
</table>
