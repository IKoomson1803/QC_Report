
<%
Dim rsTextDetails, sqlTextDetails

set rsTextDetails = Server.CreateObject("ADODB.Recordset")

sqlTextDetails ="SELECT * FROM BanijayRightsTextDetails " & _
			" WHERE QCNum = " & clng(sQCNum) & " AND SubQCnum = " & cint(sRev)
			
rsTextDetails.ActiveConnection = cnQCS
rsTextDetails.Open sqlTextDetails


%>



<table width="100%" border="1" cellspacing="0" cellpadding="1" >
   <tr>
	  <td style="width:30%;text-align:left;font-weight:14px; border-left: 3px solid black;" class="BanijayRightsProgrammeLayout">&nbsp;Text Details</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsProgrammeLayout" >In Show</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsProgrammeLayout" >After Prog</td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Burnt in Subtitles / CC:</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	         <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write    rsTextDetails.Fields("BurntInSubtitlesOrCC")
			      End If
			  %>
	  </td>
	</tr>

    <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">Title Board: &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
           <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write     rsTextDetails.Fields("TitleBoardInShow")
			      End If
			  %>
	  </td>
	  
	  
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	        <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write      rsTextDetails.Fields("TitleBoardAfterProg")
			      End If
			  %>
	  </td>
	  
	  
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Violence?</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	  	        <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write      rsTextDetails.Fields("Violence")
			      End If
			  %>
	  </td>
	</tr>

   <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">In and out of part: &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	      <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write      rsTextDetails.Fields("InAndOutOfPartInShow")
			      End If
			  %>
	  
	  </td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	        <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write     rsTextDetails.Fields("InAndOutOfPartAfterProg")
			      End If
			  %>
	  
	  </td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Nudity?</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	     <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write     rsTextDetails.Fields("Nudity")
			      End If
			  %>
	  
	  </td>
	</tr>
	
	 <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">End Credits: &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	        <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write      rsTextDetails.Fields("EndCreditsInShow")
			      End If
			  %>
	  
	 
	  </td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	    <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write      rsTextDetails.Fields("EndCreditsAfterProg")
			      End If
			  %>
	  
	  </td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Extreme Language?</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	        <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write      rsTextDetails.Fields("Swearing")
			      End If
			  %>
	 
	  </td>
	</tr>
	
	 <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">Astons, namestraps etc: &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	       <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write      rsTextDetails.Fields("AstonsNamestrapsEtcInShow")
			      End If
			  %>
	  
	  </td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	   <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write     rsTextDetails.Fields("AstonsNamestrapsEtcAfterProg")
			      End If
			  %>
	  
	  
	  </td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Bleeped / Un-bleeped:</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	     <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write      rsTextDetails.Fields("BleepedOrUnBleeped")
			      End If
			  %>
	 
	  </td>
	</tr>
	
	
	 <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">Subtitles / Closed Captions? &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	  <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write       rsTextDetails.Fields("SubtitlesOrClosedCaptionsInShow")
			      End If
			  %>
	 
	  </td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	    <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write       rsTextDetails.Fields("SubtitlesOrClosedCaptionsAfterProg")
			      End If
			  %>
	  
	  </td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Unbleeped split track available?</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	     <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write       rsTextDetails.Fields("UnbleepedSplitTrackAvailable")
			      End If
			  %>
	  
	  </td>
	</tr>
	 <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">Is there a second texted / textless version? &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	   <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write        rsTextDetails.Fields("IsThereASecondTextedOrTextlessVersionInShow")
			      End If
			  %>
	 
	  </td>
	  <td style="width:10%;background-color:#BFBFBF" class="bottom_border" >&nbsp;</td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Sponsorship / Product Placement?</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;
	  <%
			      If Not rsTextDetails.EOF And Not  rsTextDetails.BOF Then
					      Response.Write        rsTextDetails.Fields("SponsorshipOrProductPlacement")
			      End If
			  %>
	  
	  </td>
	</tr>


</table>

<%

  rsTextDetails.Close
  Set rsTextDetails = Nothing
  

%>