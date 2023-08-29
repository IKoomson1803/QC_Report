<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000" class="frame-border" height="90">
  <tr>
    <td valign="top" > 
      <table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000" rules="all" >
	  
	    <tr>
	     
		  <td>&nbsp;Record / Encode Date:&nbsp; <b><%if isnull(rsHeader.Fields("Rec_Date")) then
									Response.Write(rsHeader.Fields("Rec_Date"))
								  else
									Response.Write(replace(rsHeader.Fields("Rec_Date"), "TBD", ""))
		
						  end if%></b>
		 
	    <td>&nbsp;Record Facility: <b><%=rsHeader.Fields("Rec_fac")%></b></td>
	  
		</td>
        <td>&nbsp;Source Standard:&nbsp; <b><%=rsHeader.Fields("Src_standard")%></b></td>
		<td>&nbsp;Source Format:&nbsp; <b><%=rsHeader.Fields("src_format")%></b></td>
        <td>&nbsp;Source Desc:&nbsp; <b><%=rsHeader.Fields("src_desc")%></b></td>
	   	  
	  <%  If sAssetType = "Tape" Then %>
		   <tr>
		
			<td>
             <b>&nbsp;Record VTR:&nbsp;<%=rsHeader.Fields("Rec_Vtr")%></b>
		  </td>
	 		   
		   <td>	
              <b>&nbsp;Stock Mfg:&nbsp;<%=rsHeader.Fields("Stock_mfg")%></b>
		   </td>
		   <td>	
               <b>&nbsp;Stock Batch #:&nbsp;<%=rsHeader.Fields("Stock_Batch")%></b>
	  </td>
		   <td>&nbsp;</td>
		   <td>&nbsp;</td>
		   </tr>
	  <%  End If %>
	   
	   <tr>
	   <td colspan="5" >&nbsp;Additional Info: <b><%=rsHeader.Fields("addinfo")%></b></td>
	   </tr>
	  
	  
	  
	  <tr>
	    <td colspan="5" class="header">QC DETAILS </td>
	  </tr>
	  
	  <%  If Not IsNull(rsHeader.Fields("FullName")) Then  %>
	   <tr>
		 <td>&nbsp;QC Date: &nbsp;<b><%=rsHeader.Fields("QC_Date")%></b></td>
		 <td>&nbsp;QC Operator: &nbsp;<b><%=rsHeader.Fields("FullName")%></b></td> 
		 <td>&nbsp;QC OF: &nbsp;<b><%=rsHeader.Fields("Operator_Activity")%></b></td> 
		 <td>&nbsp;Revised By: &nbsp;<b><%=rsHeader.Fields("Revised_By")%></b></td>
		<td>&nbsp;Revised Date: &nbsp;<b><%=rsHeader.Fields("revised_date")%></b></td>
     </tr>
	 
	 <tr>
  
    <td>&nbsp;QC Player:&nbsp;<b><%=rsHeader.Fields("QC_VTR")%></b></td>
	<td>&nbsp;MFR / QC Room: &nbsp;<b><%=rsHeader.Fields("Bay_num")%></b></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
	 <% End If %>
  
  <%  If Not IsNull(rsHeader.Fields("FullName2")) Then  %>
  
  <tr>
     <td>&nbsp;QC Date: &nbsp;<b><%=rsHeader.Fields("QC_Date_2")%></b></td>
     <td>&nbsp;QC Operator: &nbsp;<b><%=rsHeader.Fields("FullName2")%></b></td> 
	 <td>&nbsp;QC OF: &nbsp;<b><%=rsHeader.Fields("Operator_2_Activity")%></b></td> 
	 <td>&nbsp;Revised By: &nbsp;<b><%=rsHeader.Fields("Revised_By_2")%></b></td>
    <td>&nbsp;Revised Date: &nbsp;<b><%=rsHeader.Fields("Revised_Date_2")%></b></td>

  </tr>
  
   <tr>
  
    <td>&nbsp;QC Player:&nbsp;<b><%=rsHeader.Fields("QC_VTR_2")%></b></td>
	<td>&nbsp;MFR / QC Room: &nbsp;<b><%=rsHeader.Fields("Bay_num_2")%></b></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
  
  <% End If %>
	  
	  
     
      </table>
    </td>
  </tr>
</table>