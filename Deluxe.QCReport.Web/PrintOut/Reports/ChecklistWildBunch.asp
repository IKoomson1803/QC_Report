
 
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
	  <% SetChecklistText_2( rsChecklistWildBunch.Fields("FullScaleFilesAreAcceptableIsThisMentionedAndLogged") ) %>
	  
				  
	 <td  class="section-label checklist-2-label">Is Mono Audio Present:</td>
	   <% SetChecklistText_2( rsChecklistWildBunch.Fields("MonoAudioListTracks") ) %>
			  
  </tr>
  
    <tr>
	
     <td class="section-label checklist-2-label">Are Normal Video Range levels legal and within spec:</td>
	    <% SetChecklistText_2( rsChecklistWildBunch.Fields("AreNormalVideoRangeLevelsLegalAndWithinSpec") ) %>
	
	  <td  class="section-label checklist-2-label">Is Split track audio present:</td>
	      <% SetChecklistText_2( rsChecklistWildBunch.Fields("SplitTrackAudio") ) %>
		  
	 
  </tr>
  
    <tr>
	 <td class="section-label">Aspect ratio checked on all content:</td>
	     <% SetChecklistText_2( rsChecklistWildBunch.Fields("AspectRatioCheckedOnAllContent") ) %>
	
	  <td  class="section-label">Is M&E clean of dialogues:</td>
	      <% SetChecklistText_2( rsChecklistWildBunch.Fields("IsMAndECleanOfDialogues")) %>
	
  </tr>
  
    <tr>
	 <td class="section-label">All H&V Blanking checked:</td>
	     <% SetChecklistText_2( rsChecklistWildBunch.Fields("AllHAndVBlankingChecked") ) %>

	<td class="section-label">Are M&E tracks fully filled:</td>
	    <% SetChecklistText_2( rsChecklistWildBunch.Fields("AreMAndETracksFullyFilled") ) %>
		
	
  </tr>
  
    <tr>
     <td class="section-label">All logos and added text logged (include plot related featured text):</td>
	    <% SetChecklistText_2( rsChecklistWildBunch.Fields("AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText") ) %>
   
	  <td  class="section-label">Has all File Metadata been checked:</td>
	    <% SetChecklistText_2( rsChecklistWildBunch.Fields("HasAllFileMetadataBeenChecked") ) %>
	
  </tr>
  
    <tr>
     
	 <td  class="section-label">Title/captions/end credits text is present over black, picture or card and logged:</td>
	  <% SetChecklistText_2( rsChecklistWildBunch.Fields("LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard") ) %>
	 
     <td class="section-label">File format  / Codec:</td>
	   <% SetChecklistText_2( rsChecklistWildBunch.Fields("FileFormatOrCodec") ) %>
	   
	 
  </tr>
  
   
  
    <tr>
      
	    <td class="section-label">All Wildbunch logos logged:</td>
		   <% SetChecklistText_2( rsChecklistWildBunch.Fields("LoggedWildbunchLogoPresent") ) %>
		 
	    <td  class="section-label">Standard / Frame rate:</td>
		   <% SetChecklistText_2( rsChecklistWildBunch.Fields("StandardOrFrameRate") ) %>
		 
  </tr>
  
    <tr>
     <td class="section-label">Is prominent branding / copyright within content logged:</td>
	    <% SetChecklistText_2( rsChecklistWildBunch.Fields("BrandingOrCopyrightwithinContentLogged") ) %>
	
	 <td class="section-label">Progressive:</td>
	     <% SetChecklistText_2( rsChecklistWildBunch.Fields("Progressive") ) %>
		 
	
  </tr>
  
    <tr>
     <td class="section-label">All text - titles, captions & end credits 90% caption safe:</td>
	     <% SetChecklistText_2(rsChecklistWildBunch.Fields("AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe")) %>
	 
	 <td  class="section-label">Resolution:</td>
	     <% SetChecklistText_2( rsChecklistWildBunch.Fields("Resolution")) %>
	
  </tr>
  
    <tr>
    
	<td  class="section-label">All Texted shots (Added text) must have corresponding textless covers:</td>
	   <% SetChecklistText_2( rsChecklistWildBunch.Fields("AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers") ) %>
	   
		
	 <td class="section-label">Tagged / labelled audio (WB TV only ):</td>
	   <% SetChecklistText_2( rsChecklistWildBunch.Fields("TaggedOrLabelledAudioWBTVOnly") ) %>
	
  </tr>
  
    <tr>
      <td class="section-label">All textless must match the grade, framing and aspect ratio of its corresponding texted shot:</td>
	   <% SetChecklistText_2( rsChecklistWildBunch.Fields("AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot") ) %>
	 
	 <td  class="section-label">Audio Bit Depth / Rate:</td>
	 <% SetChecklistText_2( rsChecklistWildBunch.Fields("AudioBitDepthOrRate") ) %>
	 
  </tr>
  
    <tr>
    
	<td class="section-label">All textless covers must be the same timing as the corresponding texted shot:</td>
	 <% SetChecklistText_2( rsChecklistWildBunch.Fields("AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot") ) %>
	
	<td class="section-label">Is Audio Discrete:</td>
	 <% SetChecklistText_2( rsChecklistWildBunch.Fields("IsAudioDiscreate") ) %>
	
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