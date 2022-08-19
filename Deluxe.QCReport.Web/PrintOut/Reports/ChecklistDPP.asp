 
 <% If Not rsChecklistDPP.BOF = True And Not rsChecklistDPP.EOF = True Then %>
      <% If Not IsNull(rsChecklistDPP.Fields("ChecklistCompleted"))  And rsChecklistDPP.Fields("ChecklistCompleted") = true Then %> 
 
 
   <table width="100%" border="1" cellspacing="0" cellpadding="0" style="border-top-style:none" >
    <tr>
       <td colspan="4" style="font-size:14px; font-weight:bold; background-color:#D3D3D3;"  >&nbsp;Checklist</td>
	</tr>
    <tr>
       <td style="width:40%;">&nbsp;AQC Warnings Reviewed</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("AQCWarningsReviewed")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("AQCWarningsReviewed"), "Yes", "No") 
				  End If
			 %>
		  </td>
		  
		  <td style="width:40%;">&nbsp;Stills are de-interlaced correctly</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("StillsAreDeinterlacedCorrectly")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("StillsAreDeinterlacedCorrectly"), "Yes", "No") 
				  End If
			 %>
		  </td>
      </tr>
	  
	  <tr>
       <td style="width:40%;">&nbsp;PSE report reviewed</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("PSEReportReviewed")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("PSEReportReviewed"), "Yes", "No") 
				  End If
			 %>
		  </td>
		  
		  <td style="width:40%;">&nbsp;Line up starts at 09:59:30:00</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("LineUpStartsAt_09_59_30_00")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("LineUpStartsAt_09_59_30_00"), "Yes", "No") 
				  End If
			 %>
		  </td>
      </tr>
	  
	  
	   <tr>
       <td style="width:40%;">&nbsp;AS-11 DPP metadata checked</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("AS11DPPMetadataChecked")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("AS11DPPMetadataChecked"), "Yes", "No") 
				  End If
			 %>
		  </td>
		  
		  <td style="width:40%;">&nbsp;First part clock/slate starts at 09:59:50:00</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("FirstPartClockOrSlateStartsAt_09_59_50_00")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("FirstPartClockOrSlateStartsAt_09_59_50_00"), "Yes", "No") 
				  End If
			 %>
		  </td>
      </tr>
	  
	  <tr>
       <td style="width:40%;">&nbsp;Audio channel layout matches metadata</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("AudioChannelLayoutMatchesMetadata")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("AudioChannelLayoutMatchesMetadata"), "Yes", "No") 
				  End If
			 %>
		  </td>
		  
		  <td style="width:40%;">&nbsp;First part programme starts at 10:00:00:00</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("FirstPartProgrammeStartsAt_10_00_00_00")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("FirstPartProgrammeStartsAt_10_00_00_00"), "Yes", "No") 
				  End If
			 %>
		  </td>
      </tr>
	  
	  <tr>
       <td style="width:40%;">&nbsp;Multichannel audio metadata matches</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("MultichannelAudioMetadataMatches")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("MultichannelAudioMetadataMatches"), "Yes", "No") 
				  End If
			 %>
		  </td>
		  
		  <td style="width:40%;">&nbsp;Captions inside safe area</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("CaptionsInsideSafeArea")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("CaptionsInsideSafeArea"), "Yes", "No") 
				  End If
			 %>
		  </td>
      </tr>
	  
	  
	   <tr>
       <td style="width:40%;">&nbsp;Multichannel down-mix sound phase checked</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("MultichannelDownMixSoundPhaseChecked")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("MultichannelDownMixSoundPhaseChecked"), "Yes", "No") 
				  End If
			 %>
		  </td>
		  
		  <td style="width:40%;">&nbsp;End Credits meet broadcaster branding</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("EndCreditsMeetBroadcasterBranding")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("EndCreditsMeetBroadcasterBranding"), "Yes", "No") 
				  End If
			 %>
		  </td>
      </tr>
	  
	   <tr>
       <td style="width:40%;">&nbsp;Clock/Slate information matches metadata</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("ClockOrSlateInformationMatchesMetadata")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("ClockOrSlateInformationMatchesMetadata"), "Yes", "No") 
				  End If
			 %>
		  </td>
		  
		  <td style="width:40%;">&nbsp;Rollers and motion GFX are interlaced & smooth</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("RollersAndMotionGFXAreInterlacedAndSmooth")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("RollersAndMotionGFXAreInterlacedAndSmooth"), "Yes", "No") 
				  End If
			 %>
		  </td>
      </tr>
	  
	  <tr>
       <td style="width:40%;">&nbsp;AFD correct</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("AFDCorrect")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("AFDCorrect"), "Yes", "No") 
				  End If
			 %>
		  </td>
		  
		  <td style="width:40%;">&nbsp;Freeze/living hold present at end</td>
		  <td style="width:10%">&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistDPP.Fields("FreezeOrlivingHoldPresentAtEnd")) Then
				   Response.Write  IIf(rsChecklistDPP.Fields("FreezeOrlivingHoldPresentAtEnd"), "Yes", "No") 
				  End If
			 %>
		  </td>
      </tr>
  </table>
	 
 <% End If %>	 
	 
     
  <% End If %>
	
	
  <%
   If Not rsChecklistDPP Is Nothing Then
     rsChecklistDPP.Close
	 set rsChecklistDPP = Nothing
	End If 
  %>
 