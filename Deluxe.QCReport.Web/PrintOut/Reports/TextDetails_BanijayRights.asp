
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
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("BurntInSubtitlesOrCC")%></td>
	</tr>

    <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">Title Board: &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("TitleBoardInShow")%></td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("TitleBoardAfterProg")%></td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Violence?</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("Violence")%></td>
	</tr>

   <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">In and out of part: &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("InAndOutOfPartInShow")%></td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("InAndOutOfPartAfterProg")%></td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Nudity?</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("Nudity")%></td>
	</tr>
	
	 <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">End Credits: &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("EndCreditsInShow")%></td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("EndCreditsAfterProg")%></td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Swearing?</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("Swearing")%></td>
	</tr>
	
	 <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">Astons, namestraps etc: &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("AstonsNamestrapsEtcInShow")%></td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("AstonsNamestrapsEtcAfterProg")%></td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Bleeped / Un-bleeped:</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("BleepedOrUnBleeped")%></td>
	</tr>
	
	 <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">Astons, namestraps etc: &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("AstonsNamestrapsEtcInShow")%></td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("AstonsNamestrapsEtcAfterProg")%></td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Bleeped / Un-bleeped:</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("BleepedOrUnBleeped")%></td>
	</tr>
	
	 <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">Subtitles / Closed Captions? &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("SubtitlesOrClosedCaptionsInShow")%></td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("SubtitlesOrClosedCaptionsAfterProg")%></td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Unbleeped split track available?</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("UnbleepedSplitTrackAvailable")%></td>
	</tr>
	 <tr>
	  <td style="width:30%; text-align:right;" class="bottom_border BanijayRightsProgrammeLayout">Is there a second texted / textless version? &nbsp;</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("IsThereASecondTextedOrTextlessVersionInShow")%></td>
	  <td style="width:10%;background-color:#BFBFBF" class="bottom_border" >&nbsp;</td>
	  <td style="width:30%;" class="bottom_border BanijayRightsProgrammeLayout" >Sponsorship / Product Placement?</td>
	  <td style="width:10%;" class="bottom_border BanijayRightsText" >&nbsp;<%=rsTextDetails.Fields("SponsorshipOrProductPlacement")%></td>
	</tr>


</table>

<%

  rsTextDetails.Close
  Set rsTextDetails = Nothing
  

%>