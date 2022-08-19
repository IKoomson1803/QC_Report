<%

If sAssetType = "Tape" Then
   videoHeight = ""
Else
   videoHeight = "100%"
End If

if rsHeader.Fields("IRE_MV") = "M" then
		siremv = "mv"
	else
		siremv = "ire"
	end if
%>



<table   width="100%"    border="0" cellspacing="0" cellpadding="0"  >
  <tr>
    <td class="blackSquare" align="center" style="padding:2px;height:17px;">
	<b><font class="txt_italic" size="3">VIDEO SPECIFICATIONS</font>&nbsp;&nbsp;(Checks carried out in unity)</b>
	</td>
  </tr>
  <tr>
     <td class="left_right_bottom_border">
         <table width="100%" border="0"  cellspacing="0" cellpadding="0" >
		   <tr>
		     <td height="100%" <% If sAssetType = "Tape" Then %> width="25%" <% Else %> width="33.3%" <% End If %>  class="right_border" ><div class="floatLeft" >&nbsp;Video Gain:&nbsp;</div> <div class="floatRight" > <b><%=rsHeader.Fields("Bar_Vid")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp; </div></td>
			 <td height="100%" <% If sAssetType = "Tape" Then %> width="25%" <% Else %> width="33.3%" <% End If %>  class="right_border"    ><div class="floatLeft" >&nbsp;Chr Gain:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("Bar_Chr")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</div></td>
			 <td height="100%" <% If sAssetType = "Tape" Then %> width="25%" class="right_border" <% Else %> width="33.3%" <% End If %> ><div class="floatLeft" >&nbsp;Set Up Level:&nbsp;</div><b><div class="floatRight" ><%=rsHeader.Fields("Bar_Set")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</div></td>
			 <% If sAssetType = "Tape" Then %>
			   <td  width="25%" height="100%" ><div class="floatLeft" >&nbsp;Black Level:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("Black")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</div></td>
			 <% End IF %>
		   <tr>
		 </table>
     </td>
  </tr>
  <tr>
     <td class="left_right_bottom_border"  >
         <table valign="top" width="100%"  border="0" cellspacing="0" cellpadding="0">
		   <tr>
		     <td height="100%" <% If sAssetType = "Tape" Then %> width="25%" <% Else %> width="33.3%" <% End If %> class="right_border"  ><div class="floatLeft" >&nbsp;Luma Peak:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("Lum_Peak")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</div></td>
			 <td height="100%" <% If sAssetType = "Tape" Then %> width="25%" <% Else %> width="33.3%" <% End If %> class="right_border"  ><div class="floatLeft" >&nbsp;Luma Avg:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("Lum_Avg")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;<div></td>
			 <td height="100%" <% If sAssetType = "Tape" Then %> width="25%" class="right_border" <% Else %> width="33.3%" <% End If %>   ><div class="floatLeft" >&nbsp;Chroma Peak:&nbsp; </div><div class="floatRight" ><b><%=rsHeader.Fields("Chroma_Peak")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;<div></td>
			  <% If sAssetType = "Tape" Then %>
			   <td height="100%" width="25%"  ><div class="floatLeft" >&nbsp;Chroma Avg:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("Chroma_Avg")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</div></td>
			 <% End IF %>
		   <tr>
		 </table>
     </td>
  </tr>
  
  <tr>
     <td  valign="top"  <%If sAssetType = "Tape" Then%> class="left_right_border"<%Else%> class="left_right_bottom_border"<%End If%> >
         <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
		   <tr>
		   <% If sAssetType = "Tape" Then %>
		    <td  width="25%" height="100%" class="right_bottom_border"><div class="floatLeft" >&nbsp;Active Picture:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("Active_Picture")%></b>&nbsp;</div></td>
			
		     <% If Not rsHeader.Fields("HBlank") Is Nothing Or Not rsHeader.Fields("VBlank") Is Nothing Then %>
			   <td width="25%" height="100%" class="right_bottom_border"><div class="floatLeft" >&nbsp;H Blanking:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("HBlank")%></b>&nbsp;</div></td>
			   <td width="25%" height="100%" class="right_bottom_border"><div class="floatLeft" >&nbsp;V Blanking:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("VBlank")%></b>&nbsp;</div></td>
			 <% Else %>
			    <td width="25%" height="100%" class="right_bottom_border"><div class="floatLeft" >&nbsp;H Blanking:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("HBlanking")%></b>&nbsp;</div></td>
			   <td width="25%" height="100%" class="right_bottom_border"><div class="floatLeft" >&nbsp;V Blanking:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("VBlanking")%></b>&nbsp;</div></td>
			 <% End If %>
			 
			 <td width="25%" height="100%" >
				 <div class="right_bottom_border floatLeft" style="display:inline-block;width:50%;heigth:100%;">
				   <div class="floatLeft" > &nbsp;Cond:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("channel_cond")%></b>&nbsp;</div>
				 </div>
				 <div class="bottom_border floatLeft" style="display:inline-block;width:50%;heigth:100%;">
				   <div class="floatLeft" > &nbsp;Track:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("ctl_track")%></b>&nbsp;</div>
				 </div>
			 </td>
			<!-- <td width="20%" >&nbsp;CTL Track:&nbsp;<b></b>&nbsp;&nbsp;</td>  -->
		  <% Else %>
             <td  width="33.3%" height="100%" class="right_border" ><div class="floatLeft" > &nbsp;Active Picture:&nbsp;</div><div class="floatRight" > <b><%=rsHeader.Fields("Active_Picture")%></b>&nbsp;</div></td>
			 <td  width="33.3%" height="100%" class="right_border"><div class="floatLeft" > &nbsp;Black Level:&nbsp;</div><div class="floatRight" > <b><%=rsHeader.Fields("Black")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</div></td>
			 <td width="33.3%"  height="100%" ><div class="floatLeft" > &nbsp;Chroma Avge:&nbsp;</div><div class="floatRight" > <b><%=rsHeader.Fields("Chroma_Avg")%></b>&nbsp;&nbsp;<%=siremv%>&nbsp;</div></td>
		   <% End If %>
		   <tr>
		 </table>
     </td>
	</tr>
	<% If sAssetType = "Tape" Then %>
	 <tr>
     <td class="left_right_bottom_border" >
         <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
		   <tr>
		     <td width="25%" class="right_border"><div class="floatLeft" > &nbsp;Tape Wrap:&nbsp;</div><div class="floatRight" > <b><%=rsHeader.Fields("Tape_Wrap_QC")%></b>&nbsp;</div></td>
			 <td width="25%" class="right_border"><div class="floatLeft" >&nbsp;Subtitle:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("Subtitle_QC")%></b>&nbsp;</div></td>
			 <td width="25%" class="right_border"><div class="floatLeft" >&nbsp;VITC:&nbsp;</div><div class="floatRight" ><b><%=rsHeader.Fields("VITC")%>&nbsp;</div></td>
			 <td width="25%" >
				  <div class="right_border floatLeft" style="display:inline-block;width:50%;heigth:100%;">
				   <div class="floatLeft" > &nbsp;Label:&nbsp;</div><div class="floatRight" > <b><%=rsHeader.Fields("Labels_QC")%></b>&nbsp;</div>
				 </div>
				 <div style="display:inline-block;width:50%;heigth:100%;float:left;">
				   <div class="floatLeft" > &nbsp;Slate:&nbsp;</div><div class="floatRight" > <b><%=rsHeader.Fields("Slate_qc")%></b>&nbsp;</div>
				 </div>
		    </td>
	
		   <tr>
		 </table>
     </td>
  </tr>
  <% End If %>
</table>
