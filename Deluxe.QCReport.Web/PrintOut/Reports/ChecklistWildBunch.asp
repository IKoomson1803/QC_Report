
 
  <% If Not rsChecklistWildBunch.BOF = True And Not rsChecklistWildBunch.EOF = True Then %>
     <% If Not IsNull(rsChecklistWildBunch.Fields("ChecklistCompleted"))  And rsChecklistWildBunch.Fields("ChecklistCompleted") = true Then %> 
	 
	 <table width="100%" border="0" cellspacing="0" cellpadding="0" >
			   <tr>
			     <td class="section-header" >&nbsp;Checklist: Wild Bunch&nbsp;|&nbsp;File to Spec: 
				       <%
							  If Not IsNull(rsChecklistWildBunch.Fields("IsFile")) Then
							    Response.Write  IIf(rsChecklistWildBunch.Fields("IsFile"), "Yes", "No") 
							  End If
					  %>
				 </td>
			   
			   </tr>
		  </table>	   

			<p></p>

  <table width="100%" border="1" cellspacing="0" cellpadding="0" >
  
   <tr>
	   <td colspan="2"  class="section-detail" >&nbsp;Video and Content:</td>
	   <td colspan="2"  class="section-detail" >&nbsp;Audio and Metadata</td>
  </tr>
  
  <tr>
  
     <td  class="section-detail">&nbsp;Full scale files are acceptable, is this mentioned & logged:</td>
					  <td >&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("FullScaleFilesAreAcceptableIsThisMentionedAndLogged")) Then
							   Response.Write rsChecklistWildBunch.Fields("FullScaleFilesAreAcceptableIsThisMentionedAndLogged")
							  End If
						 %>
					  </td>
					  
	 <td  class="section-detail">&nbsp;Is Mono Audio Present:</td>
				  <td >&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("MonoAudioListTracks")) Then
						   Response.Write    IIf(rsChecklistWildBunch.Fields("MonoAudioListTracks"), "Yes", "No")  
						  End If
					 %>
				  
				  </td>
		  
		  
  </tr>
  
    <tr>
	
     <td class="section-detail">&nbsp;Are Normal Video Range levels legal and within spec:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AreNormalVideoRangeLevelsLegalAndWithinSpec")) Then
			   Response.Write  rsChecklistWildBunch.Fields("AreNormalVideoRangeLevelsLegalAndWithinSpec")
			  End If
		 %>
	  </td>
	   
	  <td  class="section-detail">&nbsp;Is Split track audio present:</td>
	  <td>&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("SplitTrackAudio")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("SplitTrackAudio"), "Yes", "No")   
			  End If
		 %>
	  
	  </td>
  </tr>
  
    <tr>
	 <td class="section-detail">&nbsp;Aspect ratio checked on all content:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AspectRatioCheckedOnAllContent")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AspectRatioCheckedOnAllContent"), "Yes", "No") 
			  End If
		 %>
	  </td>
	  <td  class="section-detail">&nbsp;Is M&E clean of dialogues:</td>
	  <td>&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("IsMAndECleanOfDialogues")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("IsMAndECleanOfDialogues"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>

  
  </tr>
  
    <tr>
	 <td class="section-detail">&nbsp;All H&V Blanking checked:</td>
	  <td>&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllHAndVBlankingChecked")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllHAndVBlankingChecked"), "Yes", "No") 
			  End If
		 %>
	  </td>
	
	<td class="section-detail">&nbsp;Are M&E tracks fully filled:</td>
	  <td>&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AreMAndETracksFullyFilled")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AreMAndETracksFullyFilled"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>

  </tr>
  
    <tr>
     <td class="section-detail">&nbsp;All logos and added text logged (include plot related featured text):</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  class="section-detail">&nbsp;Has all File Metadata been checked:</td>
	  <td>&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("HasAllFileMetadataBeenChecked")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("HasAllFileMetadataBeenChecked"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>

	  
  </tr>
  
    <tr>
     
	 <td  class="section-detail">&nbsp;Title/captions/end credits text is present over black, picture or card and logged:</td>
	  <td >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
     <td class="section-detail">&nbsp;File format  / Codec:</td>
	  <td >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("FileFormatOrCodec")) Then
			   Response.Write  rsChecklistWildBunch.Fields("FileFormatOrCodec")
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   
  
    <tr>
      
	    <td class="section-detail">&nbsp;All Wildbunch logos logged:</td>
		  <td >&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistWildBunch.Fields("LoggedWildbunchLogoPresent")) Then
				   Response.Write  IIf(rsChecklistWildBunch.Fields("LoggedWildbunchLogoPresent"), "Yes", "No") 
				  End If
			 %>
		  </td>
	   
	    <td  class="section-detail">&nbsp;Standard / Frame rate:</td>
		  <td  >&nbsp;
				  
		   <%
				  If Not IsNull(rsChecklistWildBunch.Fields("StandardOrFrameRate")) Then
				   Response.Write  rsChecklistWildBunch.Fields("StandardOrFrameRate") 
				  End If
			 %>
		  
		  </td>
  </tr>
  
    <tr>
     <td class="section-detail">&nbsp;Is prominent branding / copyright within content logged:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("BrandingOrCopyrightwithinContentLogged")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("BrandingOrCopyrightwithinContentLogged"), "Yes", "No") 
			  End If
		 %>
	  </td>
	 
	 <td class="section-detail">&nbsp;Progressive:</td>
	  <td>&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("Progressive")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("Progressive"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
	  
  
  </tr>
  
    <tr>
     <td class="section-detail">&nbsp;All text - titles, captions & end credits 90% caption safe:</td>
	  <td>&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe"), "Yes", "No") 
			  End If
		 %>
	  </td>
	
	 <td  class="section-detail">&nbsp;Resolution:</td>
	  <td>&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("Resolution")) Then
			   Response.Write  rsChecklistWildBunch.Fields("Resolution") 
			  End If
		 %>
	  
	  </td>
	   
	   
	   
  
  </tr>
  
    <tr>
    
	<td  class="section-detail">&nbsp;All Texted shots (Added text) must have corresponding textless covers:</td>
	  <td>&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers"), "Yes", "No") 
			  End If
		 %>
	  </td>
	
	 <td class="section-detail">&nbsp;Tagged / labelled audio (WB TV only ):</td>
	  <td>&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("TaggedOrLabelledAudioWBTVOnly")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("TaggedOrLabelledAudioWBTVOnly"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
	   
  
  </tr>
  
    <tr>
      <td class="section-detail">&nbsp;All textless must match the grade, framing and aspect ratio of its corresponding texted shot:</td>
	  <td>&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot"), "Yes", "No") 
			  End If
		 %>
	  </td>
	 <td  class="section-detail">&nbsp;Audio Bit Depth / Rate:</td>
	  <td >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AudioBitDepthOrRate")) Then
			   Response.Write  rsChecklistWildBunch.Fields("AudioBitDepthOrRate") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
    <tr>
    
	<td class="section-detail">&nbsp;All textless covers must be the same timing as the corresponding texted shot:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot"), "Yes", "No") 
			  End If
		 %>
	  </td>
	
	<td class="section-detail">&nbsp;Is Audio Discrete:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("IsAudioDiscreate")) Then
			   Response.Write  rsChecklistWildBunch.Fields("IsAudioDiscreate")
			  End If
		 %>
	  </td>
	
  
  </tr>
  
  
   
  
  </table>
  
    <% End If %>
  
  <% End If %>
	
	
  <%
   If Not rsChecklistWildBunch Is Nothing Then
     rsChecklistWildBunch.Close
	 set rsChecklistWildBunch = Nothing
	End If 
  %>