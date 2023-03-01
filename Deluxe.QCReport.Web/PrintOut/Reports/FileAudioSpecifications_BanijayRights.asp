<%
<!-- Include file by Isaac Koomson 28/02/2023 -->
          
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

' Response.write "Ch2: " & bIsTwoChannels & "<br/>"
' Response.write "Ch4: " & bIsFourChannels & "<br/>"
' Response.write "Ch6: " & bIsSixChannels & "<br/>"
' Response.write "Ch8: " & bIsEightChannels & "<br/>"
' Response.write "Ch10: " & bIsTenChannels  & "<br/>"
' Response.write "Ch12: " & bIsTwelveChannels  & "<br/>"
' Response.write "Ch14: " & bIsFourteenChannels & "<br/>"
' Response.write "Ch16: " & bIsSixteenChannels & "<br/>"
' Response.write "Ch18: " & bIsEighteenChannels & "<br/>"
' Response.write "Ch20: " & bIsTwentyChannels & "<br/>"
' Response.write "Ch22: " & bIsTwentyTwoChannels & "<br/>"
' Response.write "Ch24: " & bIsTwentyFourChannels & "<br/>"

' Response.end

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

<table width="100%" border="0" cellspacing="0" cellpadding="0" >
<tr>
	  <td class="left_right_top_border" style="padding:2px; font-size:14px;background-color:#5C013F;color:#fff;" align="center" colspan="5">
	    <b>Bit Rate: &nbsp;<%=rsHeader.Fields("BitRate")%></b>
	  </td>
	 
	<tr>
	
	<tr>
		  <td colspan="5" height="100%"  >
				 <table width="100%" border="0" cellspacing="0" cellpadding="0" >
					   <tr>
						 <td  width="100%" border="0" height="100%" valign="top"  >
						   <table width="100%" border="1" cellspacing="0" cellpadding="0" height="100%" >
							   <tr>
									<td height="17px" width="6%" class="txt_boldtype2 left_bottom_border">&nbsp;</td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Track Content</b></td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Language</b></td>
								    <td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Position</b></td>
								   	<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Tone</b></td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Average db</b></td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;Peak</b></td>
									<td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;True Peak</b></td>
									 <td height="17px" width="9%" class="txt_boldtype2 left_bottom_border"><b>&nbsp;LKFS</b></td>
							  </tr>
								  <% If bIsTwoChannels = True And bIsFourChannels = False  Then %>
										 <!--#include file="Audio_BanijayRights_1_2.asp" -->
									 <% ElseIf bIsFourChannels = True And bIsSixChannels = False Then %>
										<!--#include file="Audio_BanijayRights_1_2.asp" -->
									<% ElseIf bIsSixChannels = True And bIsEightChannels = False Then %>
										<!--#include file="Audio_BanijayRights_1_3.asp" -->	
									 <% ElseIf bIsEightChannels = True  And bIsTenChannels = False Then %>	
										<!--#include file="Audio_BanijayRights_1_4.asp" -->
									 <% ElseIf bIsTenChannels = True  And bIsTwelveChannels = False Then %>	
										<!--#include file="Audio_BanijayRights_1_5.asp" -->	
									<% ElseIf bIsTwelveChannels = True And bIsFourteenChannels = False Then %>		
										<!--#include file="Audio_BanijayRights_1_6.asp" -->
									<% ElseIf bIsFourteenChannels = True And bIsSixteenChannels = False Then %>		
										<!--#include file="Audio_BanijayRights_1_7.asp" -->	
									<% ElseIf bIsSixteenChannels = True And bIsEighteenChannels = False Then %>	
										<!--#include file="Audio_BanijayRights_1_8.asp" -->
									<% ElseIf bIsEighteenChannels = True And bIsTwentyChannels = False Then %>	
										<!--#include file="Audio_BanijayRights_1_9.asp" -->	
									<% ElseIf bIsTwentyChannels  = True And bIsTwentyTwoChannels = False Then %>		
										<!--#include file="Audio_BanijayRights_1_10.asp" -->
									<% ElseIf bIsTwentyTwoChannels = True And bIsTwentyFourChannels = False Then %>		
										<!--#include file="Audio_BanijayRights_1_11.asp" -->	
									<% ElseIf bIsTwentyFourChannels = True Then %>		
										<!--#include file="Audio_BanijayRights_1_12.asp" -->
									<% End If %>
													 
								 
             
						            <% If bIsTwoChannels = True And bIsFourChannels = False  Then %>
						           <!--#include file="Audio_BanijayRights_3_4.asp" -->
									<% ElseIf bIsFourChannels = True And bIsSixChannels = False Then %>
										<!--#include file="Audio_BanijayRights_3_4.asp" -->
									<% ElseIf bIsSixChannels = True And bIsEightChannels = False Then %>
										<!--#include file="Audio_BanijayRights_4_6.asp" -->	
									<% ElseIf bIsEightChannels = True = True And bIsTenChannels = False Then %>	
										<!--#include file="Audio_BanijayRights_5_8.asp" -->
									 <% ElseIf bIsTenChannels = True  And bIsTwelveChannels = False Then %>	
										<!--#include file="Audio_BanijayRights_6_10.asp" -->
                                     <% ElseIf bIsTwelveChannels = True  And bIsFourteenChannels = False Then %>		
										<!--#include file="Audio_BanijayRights_7_12.asp" -->
                                      <% ElseIf bIsFourteenChannels = True  And bIsSixteenChannels = False Then %>		
										<!--#include file="Audio_BanijayRights_8_14.asp" -->	
                                     <% ElseIf bIsSixteenChannels = True And bIsEighteenChannels = False Then %>	
										<!--#include file="Audio_BanijayRights_9_16.asp" -->
									<% ElseIf bIsEighteenChannels = True  And bIsTwentyChannels  = False Then %>	
										<!--#include file="Audio_BanijayRights_10_18.asp" -->	
									<% ElseIf bIsTwentyChannels  = True  And bIsTwentyTwoChannels = False Then %>		
										<!--#include file="Audio_BanijayRights_11_20.asp" -->	
										<% ElseIf bIsTwentyTwoChannels = True  And bIsTwentyFourChannels = False Then %>		
										<!--#include file="Audio_BanijayRights_12_22.asp" -->	
									<% ElseIf bIsTwentyFourChannels = True Then %>		
										<!--#include file="Audio_BanijayRights_13_24.asp" -->
										
									<% End If %>
								   
								   
                             </table>
   						   </td>
	                    </tr>
				</table>
		  </td>
	</tr>
</table>