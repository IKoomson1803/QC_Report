<%
Dim rsProgLayout, sqlProgLayout, rsTapeLayout, sqlTapeLayout

set rsProgLayout = Server.CreateObject("ADODB.Recordset")

sqlProgLayout ="SELECT * FROM BanijahRightsProgrammeLayout " & _
			" WHERE QCNum = " & clng(sQCNum) & " AND SubQCnum = " & cint(sRev)
			
rsProgLayout.ActiveConnection = cnQCS
rsProgLayout.Open sqlProgLayout

set rsTapeLayout = Server.CreateObject("ADODB.Recordset")

sqlTapeLayout ="SELECT * FROM BanijahRightsTapeLayout " & _
			" WHERE QCNum = " & clng(sQCNum) & " AND SubQCnum = " & cint(sRev)
			
rsTapeLayout.ActiveConnection = cnQCS
rsTapeLayout.Open sqlTapeLayout


%>

	 
		 <table width="100%" class="SolidBorder" cellspacing="0" cellpadding="1" style="border-top:none; border-bottom:none; background-color:#BFBFBF">
		   <tr>
			  <td>&nbsp;</td>
		  </tr> 
		 </table>
			  
		  <table width="100%" class="SolidBorder" cellspacing="0" cellpadding="1" style="border-bottom:none; background-color:#FF4370">
		   <tr>
			  <td style="font-size:14px; font-weight: bold; text-align:center;padding: 5px 5px 5px 5px;">PROGRAMME LAYOUT</td>
		  </tr> 
		 </table>
		 <table width="100%" class="SolidBorder" cellspacing="0" cellpadding="1" style="border-bottom:none; background-color:#BFBFBF">
		   <tr>
			  <td>&nbsp;</td>
		  </tr> 
		 </table>
		 
	 

	<table width="100%" border="1" cellspacing="0" cellpadding="0" >
			<tr>
			  <td  class="left_bottom_border BanijayRightsProgrammeLayout"> &nbsp;</td>
			  <td  class="bottom_border BanijayRightsProgrammeLayout" >Programme In</td>
			  <td  class="bottom_border BanijayRightsProgrammeLayout" >Programme Out</td>
			  <td  colspan = "3" align="center" class="bottom_border BanijayRightsProgrammeLayout" >Total Length including breaks</td>
			</tr>
			 <tr>
			  <td style="width:20%;font-size:14px;text-align:left;" class="left_bottom_border BanijayRightsProgrammeLayout" >Programme</td>
			  <td style="width:20%;" class="bottom_border BanijayRightsProgrammeLayout" >H:M:S:F</td>
			  <td style="width:20%;" class="bottom_border BanijayRightsProgrammeLayout" >H:M:S:F</td>
			  <td style="width:40%;" colspan = "3" align="center" class="bottom_border BanijayRightsProgrammeLayout" >H:M:S:F</td>
			</tr>
			<tr>
			  <td style="width:20%; text-align:center;" class="left_bottom_border BanijayRightsProgrammeLayout">&nbsp;</td>
			  <td style="width:20%; text-align:center !important;" class="bottom_border BanijayRightsText" >
			  <%
			      If Not rsProgLayout.EOF And Not  rsProgLayout.BOF Then
					      Response.Write  rsProgLayout.Fields("ProgrammeIn")
			      End If
			  %>
			  </td>
			  <td style="width:20%; text-align:center;" class="bottom_border BanijayRightsText" >
			  <%
			      If Not rsProgLayout.EOF And Not  rsProgLayout.BOF Then
					      Response.Write  rsProgLayout.Fields("ProgrammeOut")
			      End If
	
			  %>
			  </td>
			  <td style="width:40%; text-align:center;" colspan = "3" align="center" class="bottom_border BanijayRightsText" >
			  <% 
			      If Not rsProgLayout.EOF And Not  rsProgLayout.BOF Then
					      Response.Write  rsProgLayout.Fields("TotalLengthIncludingBreaks")
			      End If
			  %>
			  </td>
			</tr>
		
			<tr>
				  <td style="width:20%; text-align:center;font-size:14px;text-align:left;" class="txt_boldtype2 left_bottom_border BanijayRightsProgrammeLayout" >Layout</td>
					<td style="width:20%; text-align:center;" class="txt_boldtype2 bottom_border BanijayRightsProgrammeLayout">Timecode In</td>
					<td style="width:20%; text-align:center;" class="txt_boldtype2 bottom_border BanijayRightsProgrammeLayout">Timecode In</td>
					 <td style="width:20%; text-align:center;" class="txt_boldtype2 bottom_border BanijayRightsProgrammeLayout">Part Duration ex holds</td>
					 <td style="width:20%; text-align:center;" colspan = "2" class="txt_boldtype2 bottom_border BanijayRightsProgrammeLayout">&nbsp;</td>
			  </tr>
			  <tr>
					  <td style="width:20%; text-align:center;"  class="left_bottom_border BanijayRightsProgrammeLayout">&nbsp;</td>
					  <td style="width:20%; text-align:center;" class="bottom_border BanijayRightsProgrammeLayout" >H:M:S:F</td>
					  <td style="width:20%; text-align:center;" class="bottom_border BanijayRightsProgrammeLayout" >H:M:S:F</td>
					  <td style="width:20%; text-align:center;" class="bottom_border BanijayRightsProgrammeLayout" >H:M:S:F</td>
					  <td style="width:20%; text-align:center;" colspan = "2" class="txt_boldtype2 bottom_border BanijayRightsProgrammeLayout">Count As Show</td>
				</tr>
				<%while not rsTapeLayout.EOF%>
				  <tr>
					
				  
				   <!-- <td style="width:4%; text-align:center;" class="BanijayRightsProgrammeDetails"><%=rsTapeLayout.Fields("ItemNum")%>&nbsp;</td> -->
					<td style="width:23%; text-align:right;" class="BanijayRightsProgrammeDetails">
					
					<%=rsTapeLayout.Fields("Type")%>&nbsp;
					
					</td>
					<td style="width:23%; text-align:center;" class="BanijayRightsText"><%=rsTapeLayout.Fields("TimecodeIn")%></td>
					<td style="width:23%; text-align:center;" class="BanijayRightsText"><%=rsTapeLayout.Fields("TimecodeOut")%></td>
					 <td style="width:23%; text-align:center;" class="BanijayRightsText"><%=rsTapeLayout.Fields("PartDurationExcludingHolds")%></td>
					<td style="width:4%; text-align:center;"   class="BanijayRightsText"><%=rsTapeLayout.Fields("CountAsShow")%></td>
					
					
					
				  </tr>
				<%rsTapeLayout.MoveNext
				wend%>
				 <tr>
					<td style="width:20%; text-align:center;"  class="BanijayRightsProgrammeLayout">&nbsp;</td>
					<td style="width:20%; text-align:center;" class="BanijayRightsProgrammeLayout">Programme Duration:&nbsp;</td>
					<td style="width:20%; text-align:center;" class="BanijayRightsText">
					<%=rsProgLayout.Fields("ProgrammeDuration")%>
					</td>
					 <td style="width:20%; text-align:center;" class="BanijayRightsProgrammeLayout">Number of parts:&nbsp;</td>
					<td style="width:20%; text-align:center;" colspan = "2" class="BanijayRightsText">
					<%=rsProgLayout.Fields("NumberOfParts")%>
					</td>
			</tr>
		  </table>
		  
		  <table width="100%" class="SolidBorder" cellspacing="0" cellpadding="1" style="border-top:none; border-bottom:none; background-color:#BFBFBF">
		   <tr>
			  <td>&nbsp;</td>
		  </tr> 
		 </table>
			  
		  <table width="100%" class="SolidBorder" cellspacing="0" cellpadding="1" >
		   <tr>
			  <td class="BanijayRightsProgrammeLayout" style="text-align:right;width:25%;">Slate / Clock Accurate:&nbsp;</td>
			  <td class="BanijayRightsText" style="width:25%; text-align:center;">
			  <%
			      If Not rsProgLayout.EOF And Not  rsProgLayout.BOF Then
					      Response.Write  rsProgLayout.Fields("SlateAccurate")
			      End If
			  
			  %>
			  
			  </td>
			   <td class="BanijayRightsProgrammeLayout" style="text-align:right;;width:25%;">Next week / trailer present:&nbsp;</td>
			  <td class="BanijayRightsText" style="width:25%; text-align:center;">
			  
			  <%
			       If Not rsProgLayout.EOF And Not  rsProgLayout.BOF Then
					      Response.Write  rsProgLayout.Fields("NextWeekOrTrailerPresent")
			      End If
					  
			  %>
			  
			  </td>
		  </tr> 
		 </table>
		 <table width="100%" border="0" cellspacing="0" cellpadding="1" style="border-bottom:none; background-color:#BFBFBF">
		   <tr>
			  <td>&nbsp;</td>
		  </tr> 
		 </table>

	  
<%

   

  rsProgLayout.Close
  Set rsProgLayout = Nothing
  
   rsTapeLayout.Close
  Set rsTapeLayout = Nothing

%>