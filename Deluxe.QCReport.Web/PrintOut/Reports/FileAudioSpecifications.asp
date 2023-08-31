<%
<!-- Include file by Isaac Koomson 18/12/2012 -->
          
bIsTwoChannels = IsRequiredChannels(rsHeader.Fields("Ch2_Desc").value)
bIsFourChannels = IsRequiredChannels(rsHeader.Fields("Ch4_Desc").value)
bIsSixChannels = IsRequiredChannels(rsHeader.Fields("Ch6_Desc").value)
bIsEightChannels = IsRequiredChannels(rsHeader.Fields("Ch8_Desc").value)
bIsTenChannels = IsRequiredChannels(rsHeader.Fields("Ch10_Desc").value)
bIsTwelveChannels = IsRequiredChannels(rsHeader.Fields("Ch12_Desc").value)
bIsFourteenChannels = IsRequiredChannels(rsHeader.Fields("Ch14_Desc").value) 
bIsSixteenChannels = IsRequiredChannels(rsHeader.Fields("Ch16_Desc").value) 
bIsEighteenChannels = IsRequiredChannels(rsHeader.Fields("Ch18_Desc").value)
bIsTwentyChannels = IsRequiredChannels(rsHeader.Fields("Ch20_Desc").value)
bIsTwentyTwoChannels = IsRequiredChannels(rsHeader.Fields("Ch22_Desc").value)
bIsTwentyFourChannels = IsRequiredChannels(rsHeader.Fields("Ch24_Desc").value)

'' Response.write "Ch2: " & bIsTwoChannels & "<br/>"
'' Response.write "Ch4: " & bIsFourChannels & "<br/>"
'' Response.write "Ch6: " & bIsSixChannels & "<br/>"
'' Response.write "Ch8: " & bIsEightChannels & "<br/>"
 ''Response.write "Ch10: " & bIsTenChannels  & "<br/>"
'' Response.write "Ch12: " & bIsTwelveChannels  & "<br/>"
'' Response.write "Ch14: " & bIsFourteenChannels & "<br/>"
'' Response.write "Ch16: " & bIsSixteenChannels & "<br/>"
'' Response.write "Ch18: " & bIsEighteenChannels & "<br/>"
'' Response.write "Ch20: " & bIsTwentyChannels & "<br/>"
 ''Response.write "Ch22: " & bIsTwentyTwoChannels & "<br/>"
 ''Response.write "Ch24: " & bIsTwentyFourChannels & "<br/>"
 
 ''Response.write "sAssetType: " & sAssetType & "<br/>"
 

'' Response.end

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

<div class="div-frame-border">
  
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
	<tr>
	  <td class="left_right_top_border header"  colspan="5">
	   AUDIO LAYOUT (F/S = Full or Spot Check QC)
	  </td>
	<tr>
	<!--<tr>
	   <td class="left_border">&nbsp;Tone Phase:&nbsp;<b><%=rsHeader.Fields("Tone_Phase")%></b>&nbsp;</td>
	   <td >Comp/M&E Comp:&nbsp;<b><%=rsHeader.Fields("Comp_Sync")%></b>&nbsp;</td>
	   <td >Noise Reduction:&nbsp;<b><%=rsHeader.Fields("NR")%></b>&nbsp;</td>
	   <td class="right_border" colspan="2">&nbsp;</td>
	 </tr>
	 <tr>
	   <td class="left_border"> &nbsp;TC Integrity:&nbsp;<b><%=rsHeader.Fields("TCInteg")%></b>&nbsp; </td>
	   <td >LTC & VITC Match:&nbsp;<b><%=rsHeader.Fields("LTC_VITC_Match")%></b>&nbsp;</td>
	   <td >&nbsp;</td>
	   <td class="right_border" colspan="2">&nbsp;</td>
	  </tr>-->
	<tr>
		  <td colspan="5" height="100%"  >
				 <table width="100%" border="0" cellspacing="0" cellpadding="0" >
					   <tr>
						 <td  width="100%"  border="0"  height="100%" valign="top"  >
						   <table width="100%" border="1" cellspacing="0" cellpadding="2" height="100%" >
							    <tr>
									<td height="17px" width="6%" class="txt_boldtype2 left_bottom_border">&nbsp;</td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Track</b></td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Language</b></td>
									
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;In Phase</b></td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Discrete</b></td>
									
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;LUFS</b></td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Tone</b></td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Average db</b></td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Peak db</b></td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;True Peak</b></td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Full / Spot</b></td>
							  </tr>
							  <% If bIsTwoChannels = True And bIsFourChannels = False  Then %>
						         <!--#include file="AudioSpecifications_1_2.asp" -->
							 <% ElseIf bIsFourChannels = True And bIsSixChannels = False Then %>
							    <!--#include file="AudioSpecifications_1_2.asp" -->
							<% ElseIf bIsSixChannels = True And bIsEightChannels = False Then %>
							    <!--#include file="AudioSpecifications_1_3.asp" -->	
							 <% ElseIf bIsEightChannels = True  And bIsTenChannels = False Then %>	
								<!--#include file="AudioSpecifications_1_4.asp" -->
							 <% ElseIf bIsTenChannels = True  And bIsTwelveChannels = False Then %>	
								<!--#include file="AudioSpecifications_1_5.asp" -->	
							<% ElseIf bIsTwelveChannels = True And bIsFourteenChannels = False Then %>		
								<!--#include file="AudioSpecifications_1_6.asp" -->
							<% ElseIf bIsFourteenChannels = True And bIsSixteenChannels = False Then %>		
								<!--#include file="AudioSpecifications_1_7.asp" -->	
							<% ElseIf bIsSixteenChannels = True And bIsEighteenChannels = False Then %>	
								<!--#include file="AudioSpecifications_1_8.asp" -->
							<% ElseIf bIsEighteenChannels = True And bIsTwentyChannels = False Then %>	
								<!--#include file="AudioSpecifications_1_9.asp" -->	
							<% ElseIf bIsTwentyChannels  = True And bIsTwentyTwoChannels = False Then %>		
								<!--#include file="AudioSpecifications_1_10.asp" -->
							<% ElseIf bIsTwentyTwoChannels = True And bIsTwentyFourChannels = False Then %>		
								<!--#include file="AudioSpecifications_1_11.asp" -->	
							<% ElseIf bIsTwentyFourChannels = True Then %>		
								<!--#include file="AudioSpecifications_1_12.asp" -->
    						<% End If %>
						  							     
							 <% If bIsTwoChannels = True And bIsFourChannels = False  Then %>
						           <!--#include file="AudioSpecifications_3_4.asp" -->
							<% ElseIf bIsFourChannels = True And bIsSixChannels = False Then %>
							    <!--#include file="AudioSpecifications_3_4.asp" -->
							<% ElseIf bIsSixChannels = True And bIsEightChannels = False Then %>
							    <!--#include file="AudioSpecifications_4_6.asp" -->	
							 <% ElseIf bIsEightChannels = True = True And bIsTenChannels = False Then %>	
								<!--#include file="AudioSpecifications_5_8.asp" -->
							 <% ElseIf bIsTenChannels = True  And bIsTwelveChannels = False Then %>	
								<!--#include file="AudioSpecifications_6_10.asp" -->	
							<% ElseIf bIsTwelveChannels = True  And bIsFourteenChannels = False Then %>		
								<!--#include file="AudioSpecifications_7_12.asp" -->
							<% ElseIf bIsFourteenChannels = True  And bIsSixteenChannels = False Then %>		
								<!--#include file="AudioSpecifications_8_14.asp" -->	
							<% ElseIf bIsSixteenChannels = True And bIsEighteenChannels = False Then %>	
								<!--#include file="AudioSpecifications_9_16.asp" -->
							<% ElseIf bIsEighteenChannels = True  And bIsTwentyChannels  = False Then %>	
								<!--#include file="AudioSpecifications_10_18.asp" -->	
							<% ElseIf bIsTwentyChannels  = True  And bIsTwentyTwoChannels = False Then %>		
								<!--#include file="AudioSpecifications_11_20.asp" -->
							<% ElseIf bIsTwentyTwoChannels = True  And bIsTwentyFourChannels = False Then %>		
								<!--#include file="AudioSpecifications_12_22.asp" -->	
							<% ElseIf bIsTwentyFourChannels = True Then %>		
								<!--#include file="AudioSpecifications_13_24.asp" -->
    						<% End If %>
							
						   </table>
											 
						 </td>
					   </tr>
				 </table>
		  </td>
	</tr>
</table>


</div>
