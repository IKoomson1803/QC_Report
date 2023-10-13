
 
  <% If Not rsChecklistWildBunch.BOF = True And Not rsChecklistWildBunch.EOF = True Then %>
     <% If Not IsNull(rsChecklistWildBunch.Fields("ChecklistCompleted"))  And rsChecklistWildBunch.Fields("ChecklistCompleted") = true Then %> 
	 
	 <table class="section-table" border="0" cellspacing="0" cellpadding="0" >
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

  <table class="section-table" border="1" cellspacing="0" cellpadding="0" >
  
   <tr>
	   <td colspan="2"  class="section-sub-header" >Video and Content:</td>
	   <td colspan="2"  class="section-sub-header" >Audio and Metadata</td>
  </tr>
  
  <tr>
  
     <td  class="section-label checklist-2-label">Full scale files are acceptable, is this mentioned & logged:</td>
					  <td class="section-text checklist-2-text">
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("FullScaleFilesAreAcceptableIsThisMentionedAndLogged")) Then
							   Response.Write rsChecklistWildBunch.Fields("FullScaleFilesAreAcceptableIsThisMentionedAndLogged")
							  End If
						 %>
					  </td>
					  
	 <td  class="section-label checklist-2-label">Is Mono Audio Present:</td>
				  <td class="section-text checklist-2-text" >
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("MonoAudioListTracks")) Then
						   Response.Write    IIf(rsChecklistWildBunch.Fields("MonoAudioListTracks"), "Yes", "No")  
						  End If
					 %>
				  
				  </td>
		  
		  
  </tr>
  
    <tr>
	
     <td class="section-label checklist-2-label">Are Normal Video Range levels legal and within spec:</td>
	  <td class="section-text  checklist-2-text">
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AreNormalVideoRangeLevelsLegalAndWithinSpec")) Then
			   Response.Write  rsChecklistWildBunch.Fields("AreNormalVideoRangeLevelsLegalAndWithinSpec")
			  End If
		 %>
	  </td>
	   
	  <td  class="section-label checklist-2-label">Is Split track audio present:</td>
	  <td class="section-text  checklist-2-text">
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("SplitTrackAudio")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("SplitTrackAudio"), "Yes", "No")   
			  End If
		 %>
	  
	  </td>
  </tr>
  
    <tr>
	 <td class="section-label">Aspect ratio checked on all content:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AspectRatioCheckedOnAllContent")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AspectRatioCheckedOnAllContent"), "Yes", "No") 
			  End If
		 %>
	  </td>
	  <td  class="section-label">Is M&E clean of dialogues:</td>
	  <td class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("IsMAndECleanOfDialogues")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("IsMAndECleanOfDialogues"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>

  
  </tr>
  
    <tr>
	 <td class="section-label">All H&V Blanking checked:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllHAndVBlankingChecked")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllHAndVBlankingChecked"), "Yes", "No") 
			  End If
		 %>
	  </td>
	
	<td class="section-label">Are M&E tracks fully filled:</td>
	  <td class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AreMAndETracksFullyFilled")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AreMAndETracksFullyFilled"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>

  </tr>
  
    <tr>
     <td class="section-label">All logos and added text logged (include plot related featured text):</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  class="section-label">Has all File Metadata been checked:</td>
	  <td class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("HasAllFileMetadataBeenChecked")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("HasAllFileMetadataBeenChecked"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>

	  
  </tr>
  
    <tr>
     
	 <td  class="section-label">Title/captions/end credits text is present over black, picture or card and logged:</td>
	  <td class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
     <td class="section-label">File format  / Codec:</td>
	  <td class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("FileFormatOrCodec")) Then
			   Response.Write  rsChecklistWildBunch.Fields("FileFormatOrCodec")
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   
  
    <tr>
      
	    <td class="section-label">All Wildbunch logos logged:</td>
		  <td class="section-text">
		
		   <%
				  If Not IsNull(rsChecklistWildBunch.Fields("LoggedWildbunchLogoPresent")) Then
				   Response.Write  IIf(rsChecklistWildBunch.Fields("LoggedWildbunchLogoPresent"), "Yes", "No") 
				  End If
			 %>
		  </td>
	   
	    <td  class="section-label">Standard / Frame rate:</td>
		  <td  class="section-text">
				  
		   <%
				  If Not IsNull(rsChecklistWildBunch.Fields("StandardOrFrameRate")) Then
				   Response.Write  rsChecklistWildBunch.Fields("StandardOrFrameRate") 
				  End If
			 %>
		  
		  </td>
  </tr>
  
    <tr>
     <td class="section-label">Is prominent branding / copyright within content logged:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("BrandingOrCopyrightwithinContentLogged")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("BrandingOrCopyrightwithinContentLogged"), "Yes", "No") 
			  End If
		 %>
	  </td>
	 
	 <td class="section-label">Progressive:</td>
	  <td class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("Progressive")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("Progressive"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
	  
  
  </tr>
  
    <tr>
     <td class="section-label">All text - titles, captions & end credits 90% caption safe:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe"), "Yes", "No") 
			  End If
		 %>
	  </td>
	
	 <td  class="section-label">Resolution:</td>
	  <td class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("Resolution")) Then
			   Response.Write  rsChecklistWildBunch.Fields("Resolution") 
			  End If
		 %>
	  
	  </td>
	   
	   
	   
  
  </tr>
  
    <tr>
    
	<td  class="section-label">All Texted shots (Added text) must have corresponding textless covers:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers"), "Yes", "No") 
			  End If
		 %>
	  </td>
	
	 <td class="section-label">Tagged / labelled audio (WB TV only ):</td>
	  <td class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("TaggedOrLabelledAudioWBTVOnly")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("TaggedOrLabelledAudioWBTVOnly"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
	   
  
  </tr>
  
    <tr>
      <td class="section-label">All textless must match the grade, framing and aspect ratio of its corresponding texted shot:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot"), "Yes", "No") 
			  End If
		 %>
	  </td>
	 <td  class="section-label">Audio Bit Depth / Rate:</td>
	  <td class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AudioBitDepthOrRate")) Then
			   Response.Write  rsChecklistWildBunch.Fields("AudioBitDepthOrRate") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
    <tr>
    
	<td class="section-label">All textless covers must be the same timing as the corresponding texted shot:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWildBunch.Fields("AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot")) Then
			   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot"), "Yes", "No") 
			  End If
		 %>
	  </td>
	
	<td class="section-label">Is Audio Discrete:</td>
	  <td class="section-text">
	
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