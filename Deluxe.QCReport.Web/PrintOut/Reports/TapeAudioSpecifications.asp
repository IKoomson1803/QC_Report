<%
''bIsTwoChannels = IsRequiredChannels(rsHeader.Fields("Language2").value)
''bIsFourChannels = IsRequiredChannels(rsHeader.Fields("Language4").value)
''bIsSixChannels = IsRequiredChannels(rsHeader.Fields("Language6").value)
''bIsEightChannels = IsRequiredChannels(rsHeader.Fields("Language8").value)
''bIsTenChannels = IsRequiredChannels(rsHeader.Fields("Language10").value)
''bIsTwelveChannels = IsRequiredChannels(rsHeader.Fields("Language12").value)
''bIsFourteenChannels = IsRequiredChannels(rsHeader.Fields("Language14").value) 
''bIsSixteenChannels = IsRequiredChannels(rsHeader.Fields("Language16").value) 
''bIsEighteenChannels = IsRequiredChannels(rsHeader.Fields("Language18").value)
''bIsTwentyChannels = IsRequiredChannels(rsHeader.Fields("Language20").value)
''bIsTwentyTwoChannels = IsRequiredChannels(rsHeader.Fields("Language").value)
''bIsTwentyFourChannels = IsRequiredChannels(rsHeader.Fields("Ch24_Desc").value)


 ''Response.write "Ch2: " & bIsTwoChannels & "<br/>"
 ''Response.write "Ch4: " & bIsFourChannels & "<br/>"
''Response.write "Ch6: " & bIsSixChannels & "<br/>"
 ''Response.write "Ch8: " & bIsEightChannels & "<br/>"
 ''Response.write "Ch10: " & bIsTenChannels  & "<br/>"
'' Response.write "Ch12: " & bIsTwelveChannels  & "<br/>"
'' Response.write "Ch14: " & bIsFourteenChannels & "<br/>"
''Response.write "Ch16: " & bIsSixteenChannels & "<br/>"
 ''Response.write "Ch18: " & bIsEighteenChannels & "<br/>"
 ''Response.write "Ch20: " & bIsTwentyChannels & "<br/>"
 ''Response.write "Ch22: " & bIsTwentyTwoChannels & "<br/>"
 ''Response.write "Ch24: " & bIsTwentyFourChannels & "<br/>"

 ''Response.end
 
 Function IsRequiredChannels(colChannelDesc)

  If Not IsNull(colChannelDesc) Then
     If Trim(colChannelDesc) <> "" Then
	   IsRequiredChannels = True
	 Else  
	   IsRequiredChannels = False
	 End If
  Else 
   IsRequiredChannels = False
  End If

End Function

Function FieldExists(ByVal rs, ByVal fieldName)
       If Not IsNull(rs.Fields(fieldName)) Then
      ''If Not rs.Fields(fieldName) Is Nothing Then
		 Response.Write rs.Fields(fieldName)
	 Else
	     Response.Write "&nbsp;"
	End If

End Function


%>


<div width="100%">

	<div style="width:59%;float:left;">

	<table width="100%" border="0" cellspacing="0" cellpadding="0" >
	<tr>
	 <td valign="top" style="width:100%" height="100%" class="blackSquare" >
			<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" >
				 <tr>
				   <td style="width:100%" class="bottom_border" >
					<table width="100%" border="0" cellspacing="0" cellpadding="0" >
					 <tr>
					   <td align="center" style="padding:2px">
						  <b><font class="txt_italic" size="3" >AUDIO SPECIFICATIONS</font>&nbsp;&nbsp;(F/S = Full or Spot Check QC)</b>
					  </td>
					  </tr>
				   </table>
				   </td>
				 </tr>
				 <tr>
					 <td style="width:100%">
						 <table width="100%" border="0" cellspacing="0" cellpadding="1" >
							<tr>
								<td>&nbsp;Tone Phase:&nbsp;<b><%=rsHeader.Fields("Tone_Phase")%></b>&nbsp;</td>
								<td>Comp/M&E Sync:&nbsp;<b><%=rsHeader.Fields("Comp_Sync")%></b>&nbsp;</td>
							</tr>
							 <tr>
								<td>&nbsp;Noise Reduction:&nbsp;<b><%=rsHeader.Fields("NR")%></b>&nbsp;</td>
								<td>TC Integrity:&nbsp;<b><%=rsHeader.Fields("TCInteg")%></b>&nbsp;</td>
							</tr>
							 <tr>
								<td class="bottom_border">&nbsp;LTC & VITC Match:&nbsp;<b><%=rsHeader.Fields("LTC_VITC_Match")%></b>&nbsp;</td>
								<td class="bottom_border">&nbsp;</td>
							</tr>
						 </table>
					 </td>
				</tr>
				<tr> 
				   <td style="width:100%" valign="top">
					   <table width="100%" border="0" cellspacing="0" cellpadding="1" height="100%" >
							<tr>
								<td height="17px" width="6%" class="bottom_border">&nbsp;</td>
								<td height="17px" width="9%" class="bottom_border"><b>Track</b></td>
								<td height="17px" width="9%" class="bottom_border"><b>Lang</b></td>
								
						        <td height="17px" width="9%" class="bottom_border"><b>In Phase</b></td>
						        <td height="17px" width="9%" class="bottom_border"><b>Discreate</b></td>
								
								<td height="17px" width="9%" class="bottom_border"><b>LUFS</b></td>
								<td height="17px" width="9%" class="txt_boldtype2 bottom_border">Tone</td>
								<td height="17px" width="9%" class="txt_boldtype2 bottom_border">Avg db</td>
								<td height="17px" width="9%" class="txt_boldtype2 bottom_border">Peak</td>
								<td height="17px" width="9%" class="txt_boldtype2 bottom_border">True</td>
								<td height="17px" width="9%" class="txt_boldtype2 bottom_border">F/S</td>
							</tr>
							<!--#include file="AudioSpecifications_1_12.asp" -->
						</table>
					</td>
				</tr>
		</table>
	 </td>
	 
	<tr>

	</table>

	</div>


	<div style="width:40%;float:right;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" >
	   <tr>
	       <td  valign="top" style="width:100%" class="blackSquare" >
			<table width="100%" border="0" cellspacing="0" cellpadding="0" >
				 <tr>
					  <td valign="top">
						<!--#include file="ProgramFormat.asp" -->
					  </td>
				  </tr>		 
			 </table>
			 </td>
		 </tr>
	   </table>	 
	 </div>

</div>



