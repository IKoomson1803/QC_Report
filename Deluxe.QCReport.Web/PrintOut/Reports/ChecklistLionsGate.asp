 <%
 Function IIf(bClause, sTrue, sFalse)
    If CBool(bClause) Then
        IIf = sTrue
    Else 
        IIf = sFalse
    End If
End Function
 
 %>
 
  <% If Not rsChecklistLionsGate.BOF = True And Not rsChecklistLionsGate.EOF = True Then %>
  
    <% If Not IsNull(rsChecklistLionsGate.Fields("ChecklistCompleted"))  And rsChecklistLionsGate.Fields("ChecklistCompleted") = true Then %>    
	
	
	<table class="section-table" border="0" cellspacing="0" cellpadding="0" >
			   <tr>
			     <td class="section-header" >Checklist: Lionsgate&nbsp;|&nbsp;File to Spec: 
				         <%
							 If Not IsNull(rsChecklistLionsGate.Fields("IsFile")) Then
							    Response.Write  IIf(rsChecklistLionsGate.Fields("IsFile"), "Yes", "No") 
							  End If
					  %>
				 </td>
			   
			   </tr>
		  </table>	   

			<p></p>
	
  
  <table class="section-table" border="1" cellspacing="0" cellpadding="0" >
     
  <tr>
	   <td colspan="2"  class="section-label">Video and Content</td>
	   <td colspan="2"  class="section-label">Audio and Metadata</td>
  </tr>
  <tr>
     <td class="section-label checklist-2-label" >Is the file Full Range Video:</td>
	  <td class="section-text checklist-2-text">
	
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("IsTheFileFullRangeVideo")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("IsTheFileFullRangeVideo"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  class="section-label  checklist-2-label" >Is 2.0 Stereo TV full mix present and QC'd:</td>
	  <td  class="section-text checklist-2-text">
			  
		  <%
			  If Not IsNull(rsChecklistLionsGate.Fields("Is_2_0_StereoTVFullMixPresentAndQCeD")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("Is_2_0_StereoTVFullMixPresentAndQCeD"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
	   
 
  </tr>
 <tr>
 
    <td class="section-label" >Are the Video levels correct on the Head-build:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("AreTheVideoLevelsCorrectOnTheHeadBuild")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("AreTheVideoLevelsCorrectOnTheHeadBuild"), "Yes", "No") 
			  End If
		 %>
	  </td>
	  
	   <td  class="section-label" >Has the 5.1 mix been spot checked:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("HasThe_5_1_MixBeenSpotChecked")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("HasThe_5_1_MixBeenSpotChecked"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
 
 
  </tr>

  <tr>
      <td class="section-label" >Are the Video levels correct on the content:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("AreTheVideoLevelsCorrectOnTheContent")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("AreTheVideoLevelsCorrectOnTheContent"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	 <td  class="section-label" >Has all File Metadata been checked:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("HasAllFileMetadataBeenChecked")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("HasAllFileMetadataBeenChecked"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
  
 
  </tr>
  <tr>
     <td class="section-label" >Has the Aspect Ratio been checked on the slate and programme:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("HasTheAspectRatioBeenCheckedOTheSlateAndProgramme")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("HasTheAspectRatioBeenCheckedOTheSlateAndProgramme"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	 <td  class="section-label" >File format / Codec:</td>
	  <td  class="section-text">
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("FileFormatOrCodec")) Then
			   Response.Write  rsChecklistLionsGate.Fields("FileFormatOrCodec") 
			  End If
		 %>
	  
	  </td>
  
 
  </tr>
  <tr>
     <td class="section-label" >Is the info on the slate correct:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("IsTheInfoOnTheSlateCcorrect")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("IsTheInfoOnTheSlateCcorrect"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	   
	  <td  class="section-label"> Standard / Frame rate:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("StandardOrFrameRate")) Then
			   Response.Write  rsChecklistLionsGate.Fields("StandardOrFrameRate") 
			  End If
		 %>
	  
	  </td>
	   
 
  </tr>
  <tr>
      <td class="section-label" >Is the Lionsgate Celestial logo added / present:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("IsTheLionsgateCeletiallLogoAddedOrPresent")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("IsTheLionsgateCeletiallLogoAddedOrPresent"), "Yes", "No") 
			  End If
		 %>
	  </td>
	 
  <td  class="section-label" >Resolution:</td>
  <td  class="section-text">
		  
   <%
		  If Not IsNull(rsChecklistLionsGate.Fields("Resolution")) Then
		   Response.Write  rsChecklistLionsGate.Fields("Resolution") 
		  End If
	 %>
  
  </td>

  </tr>
  <tr>
     <td class="section-label" >Is all added text within 16:9 90% title safe:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("IsAllAddedTextWithin16_9NinetyPercentTitleSafe")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("IsAllAddedTextWithin16_9NinetyPercentTitleSafe"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	   <td  class="section-label" >Progressive:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("Progressive")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("Progressive"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
  
 
  </tr>
  <tr>
   <td class="section-label" >Has all added text been listed (including plot significant featured text):</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText"), "Yes", "No") 
			  End If
		 %>
	  </td>
	  <td  class="section-label" >CLAP Present:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("CLAPPresent")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("CLAPPresent"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
  
 
  </tr>
  <tr>
     <td class="section-label" >Are there textless and clean graphic covers after feature for all texted shots:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	   <td class="section-label" >Flashing images present - (Images likely to cause a seizure):</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("FlashingImagesPpresentImagesLikelyToCauseASeizure")) Then
			   Response.Write  IIf(rsChecklistLionsGate.Fields("FlashingImagesPpresentImagesLikelyToCauseASeizure"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
  
 
  </tr>
  
  <tr>
   
	   <td  class="section-label" >Audio Bit Depth / Rate:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistLionsGate.Fields("AudioBitDepthOrRate")) Then
			   Response.Write  rsChecklistLionsGate.Fields("AudioBitDepthOrRate") 
			  End If
		 %>
	  
	 <td  class="section-label" >Is Audio Discrete:</td>
				  <td  class="section-text">
						  
				   <%
						  If Not IsNull(rsChecklistLionsGate.Fields("IsAudioDiscreate")) Then
						   Response.Write  rsChecklistLionsGate.Fields("IsAudioDiscreate")
						  End If
					 %>
				  
				  </td>
 
  </tr>
  
 
  
    </table>
    <% End If %>
  
  <% End If %>
	
	
  <%
   If Not rsChecklistLionsGate Is Nothing Then
     rsChecklistLionsGate.Close
	 set rsChecklistLionsGate = Nothing
	End If 
  %>