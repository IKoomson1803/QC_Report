<div class="div-frame-border-3">


<table width="100%" border="0" cellspacing="0" cellpadding="0"  height="90">
  <tr>
    <td valign="top"  > 
      <table width="100%" border="0" cellspacing="0" cellpadding="0"  > <!-- bordercolor="#000000" -->
	  
	    <tr>
	     
		  <td class="right_bottom_border">&nbsp;File Record / Encode Date:&nbsp; <b><%if isnull(rsHeader.Fields("Rec_Date")) then
									Response.Write(rsHeader.Fields("Rec_Date"))
								  else
									Response.Write(replace(rsHeader.Fields("Rec_Date"), "TBD", ""))
		
						  end if%></b>
		 </td>
	    <td class="right_bottom_border">&nbsp;Record Facility: <b><%=rsHeader.Fields("Rec_fac")%></b></td>
	    <td class="right_bottom_border">&nbsp;Source Standard:&nbsp; <b><%=rsHeader.Fields("Src_standard")%></b></td>
		<td class="right_bottom_border">&nbsp;Source Format:&nbsp; <b><%=rsHeader.Fields("src_format")%></b></td>
        <td class="bottom_border">&nbsp;Source Desc:&nbsp; <b><%=rsHeader.Fields("src_desc")%></b></td>
		
		
	   	  
	  <%  If sAssetType = "Tape" Then %>
		   <tr>
		
			<td class="right_bottom_border">
             <b>&nbsp;Record VTR:&nbsp;<%=rsHeader.Fields("Rec_Vtr")%></b>
		  </td>
	 		   
		   <td class="right_bottom_border"> 	
              <b>&nbsp;Stock Mfg:&nbsp;<%=rsHeader.Fields("Stock_mfg")%></b>
		   </td>
		   <td class="right_bottom_border">	
               <b>&nbsp;Stock Batch #:&nbsp;<%=rsHeader.Fields("Stock_Batch")%></b>
	       </td>
		   <td class="right_bottom_border">&nbsp;</td>
		   <td class="bottom_border">&nbsp;</td>
		   </tr>
	  <%  End If %>
	   
	   <tr>
	         <%
				  If rsHDRMetadata.BOF  = False Then
						If rsHDRMetadata.Fields("NotRequired") = False Then	
						   Response.Write  "<td class='right_bottom_border'>&nbsp;Xml Creation Date: <b>" & rsHDRMetadata.Fields("XmlCreationDate") & "</b></td>"							    
						End If	
				  End If		 		
				%>	
	   
	   
	         <td colspan="4" class="bottom_border">&nbsp;Additional Info: <b><%=rsHeader.Fields("addinfo")%></b></td>
	   </tr>
	  
	  
	  
	  <tr>
	    <td colspan="5" class="header bottom_border">QC DETAILS </td>
	  </tr>
	  
	  <%  If Not IsNull(rsHeader.Fields("FullName")) Then  %>
	   <tr>
		 <td  class="right_bottom_border">&nbsp;QC Date: &nbsp;<b><%=rsHeader.Fields("QC_Date")%></b></td>
		 <td  class="right_bottom_border">&nbsp;QC Operator: &nbsp;<b><%=rsHeader.Fields("FullName")%></b></td> 
		 <td  class="right_bottom_border">&nbsp;QC OF: &nbsp;<b><%=rsHeader.Fields("Operator_Activity")%></b></td> 
		 <td  class="right_bottom_border">&nbsp;Revised By: &nbsp;<b><%=rsHeader.Fields("Revised_By")%></b></td>
		<td class="bottom_border">&nbsp;Revised Date: &nbsp;<b><%=rsHeader.Fields("revised_date")%></b></td>
     </tr>
	 
	 <tr>
  
    <td class="right_border">&nbsp;QC Player:&nbsp;<b><%=rsHeader.Fields("QC_VTR")%></b></td>
	<td class="right_border">&nbsp;MFR / QC Room: &nbsp;<b><%=rsHeader.Fields("Bay_num")%></b></td>
	<td class="right_border">&nbsp;</td>
	<td class="right_border">&nbsp;</td>
	<td >&nbsp;</td>
  </tr>
	 <% End If %>
  
  <%  If Not IsNull(rsHeader.Fields("FullName2")) Then  %>
  
  <tr>
     <td class="right_bottom_border">&nbsp;QC Date: &nbsp;<b><%=rsHeader.Fields("QC_Date_2")%></b></td>
     <td class="right_bottom_border">&nbsp;QC Operator: &nbsp;<b><%=rsHeader.Fields("FullName2")%></b></td> 
	 <td class="right_bottom_border">&nbsp;QC OF: &nbsp;<b><%=rsHeader.Fields("Operator_2_Activity")%></b></td> 
	 <td class="right_bottom_border">&nbsp;Revised By: &nbsp;<b><%=rsHeader.Fields("Revised_By_2")%></b></td>
    <td class="bottom_border">&nbsp;Revised Date: &nbsp;<b><%=rsHeader.Fields("Revised_Date_2")%></b></td>

  </tr>
  
   <tr>
  
    <td class="right_bottom_border">&nbsp;QC Player:&nbsp;<b><%=rsHeader.Fields("QC_VTR_2")%></b></td>
	<td class="right_bottom_border">&nbsp;MFR / QC Room: &nbsp;<b><%=rsHeader.Fields("Bay_num_2")%></b></td>
	<td class="right_bottom_border">&nbsp;</td>
	<td class="right_bottom_border">&nbsp;</td>
	<td class="bottom_border">&nbsp;</td>
  </tr>
  
  <% End If %>
	  
	  
     
      </table>
    </td>
  </tr>
</table>



</div>

