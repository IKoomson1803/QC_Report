
  <!--
          <tr>
		      <td  width="25%" >Chroma Peak:&nbsp;<b><%=rsHeader.Fields("Chroma_Peak")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
			  <td width="25%" >Chroma Avge:&nbsp; <b><%=rsHeader.Fields("Chroma_Avg")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
		      <td  width="25%" >Set Up Level:&nbsp;<b><%=rsHeader.Fields("Bar_Set")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</td>
             <td  width="25%">&nbsp;</td>
	    <tr>
  
	-->		
	
	<% If sAssetType = "Tape" Then %>
		
	 
		   <tr>
		     <td width="25%" >Tape Wrap:&nbsp;<b><%=rsHeader.Fields("Tape_Wrap_QC")%></b>&nbsp;</td>
			 <td width="25%" >Subtitle:&nbsp;<b><%=rsHeader.Fields("Subtitle_QC")%></b>&nbsp;</div></td>
			 <td width="25%" >VITC:&nbsp;<b><%=rsHeader.Fields("VITC")%>&nbsp;</td>
			 <td width="25%" >
				  <div class="floatLeft" style="display:inline-block;">
				   <div class="floatLeft" > &nbsp;Label:&nbsp;</div><div class="floatRight" > <b><%=rsHeader.Fields("Labels_QC")%></b>&nbsp;</div>
				 </div>
				 <div style="display:inline-blockfloat:left;">
				   <div class="floatLeft" > &nbsp;Slate:&nbsp;</div><div class="floatRight" > <b><%=rsHeader.Fields("Slate_qc")%></b>&nbsp;</div>
				 </div>
		    </td>
	
		   <tr>
		
  <% End If %>

