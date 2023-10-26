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
	   <td colspan="2"  class="section-sub-header">Video and Content</td>
	   <td colspan="2"  class="section-sub-header">Audio and Metadata</td>
  </tr>
  <tr>
     <td class="section-label checklist-2-label" >Is the file Full Range Video:</td>
	   <% SetChecklistText_2( rsChecklistLionsGate.Fields("IsTheFileFullRangeVideo") ) %>
	 
	   
	  <td  class="section-label  checklist-2-label" >Is 2.0 Stereo TV full mix present and QC'd:</td>
	  <% SetChecklistText_2( rsChecklistLionsGate.Fields("Is_2_0_StereoTVFullMixPresentAndQCeD") ) %>

	 
  </tr>
 <tr>
 
    <td class="section-label" >Are the Video levels correct on the Head-build:</td>
	<% SetChecklistText_2(rsChecklistLionsGate.Fields("AreTheVideoLevelsCorrectOnTheHeadBuild") ) %>
	  
	   <td  class="section-label" >Has the 5.1 mix been spot checked:</td>
	   <% SetChecklistText_2( rsChecklistLionsGate.Fields("HasThe_5_1_MixBeenSpotChecked") ) %>

  </tr>

  <tr>
      <td class="section-label" >Are the Video levels correct on the content:</td>
	    <% SetChecklistText_2( rsChecklistLionsGate.Fields("AreTheVideoLevelsCorrectOnTheContent") ) %>
	  
	 <td  class="section-label" >Has all File Metadata been checked:</td>
	  <% SetChecklistText_2( rsChecklistLionsGate.Fields("HasAllFileMetadataBeenChecked")) %>
	
  <tr>
     <td class="section-label" >Has the Aspect Ratio been checked on the slate and programme:</td>
	  <% SetChecklistText_2( rsChecklistLionsGate.Fields("HasTheAspectRatioBeenCheckedOTheSlateAndProgramme") ) %>

	 <td  class="section-label" >File format / Codec:</td>
	  <% SetChecklistText_2( rsChecklistLionsGate.Fields("FileFormatOrCodec") ) %>

  </tr>
  <tr>
     <td class="section-label" >Is the info on the slate correct:</td>
	 <% SetChecklistText_2( rsChecklistLionsGate.Fields("IsTheInfoOnTheSlateCcorrect") ) %>
	 
     <td  class="section-label"> Standard / Frame rate:</td>
	 <% SetChecklistText_2( rsChecklistLionsGate.Fields("StandardOrFrameRate") ) %>
	
  </tr>
  <tr>
      <td class="section-label" >Is the Lionsgate Celestial logo added / present:</td>
	   <% SetChecklistText_2( rsChecklistLionsGate.Fields("IsTheLionsgateCeletiallLogoAddedOrPresent") ) %>
	   
	 	 
  <td  class="section-label" >Resolution:</td>
   <% SetChecklistText_2( rsChecklistLionsGate.Fields("Resolution") ) %>
   
  
  </tr>
  <tr>
     <td class="section-label" >Is all added text within 16:9 90% title safe:</td>
	  <% SetChecklistText_2( rsChecklistLionsGate.Fields("IsAllAddedTextWithin16_9NinetyPercentTitleSafe") ) %>
	  
		   
	   <td  class="section-label" >Progressive:</td>
	     <% SetChecklistText_2( rsChecklistLionsGate.Fields("Progressive") ) %>
		 
	
  </tr>
  <tr>
   <td class="section-label" >Has all added text been listed (including plot significant featured text):</td>
     <% SetChecklistText_2( rsChecklistLionsGate.Fields("HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText") ) %>
	 
	
	  <td  class="section-label" >CLAP Present:</td>
	   <% SetChecklistText_2( rsChecklistLionsGate.Fields("CLAPPresent")) %>
	   
	
  </tr>
  <tr>
     <td class="section-label" >Are there textless and clean graphic covers after feature for all texted shots:</td>
	   <% SetChecklistText_2( rsChecklistLionsGate.Fields("AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots") ) %>
	
	   <td class="section-label" >Flashing images present - (Images likely to cause a seizure):</td>
	     <% SetChecklistText_2( rsChecklistLionsGate.Fields("FlashingImagesPpresentImagesLikelyToCauseASeizure") ) %>
		 

  </tr>
  
  <tr>
   
	   <td  class="section-label" >Audio Bit Depth / Rate:</td>
	      <% SetChecklistText_2(  rsChecklistLionsGate.Fields("AudioBitDepthOrRate") ) %>
		  
	
	 <td  class="section-label" >Is Audio Discrete:</td>
	     <% SetChecklistText_2(  rsChecklistLionsGate.Fields("IsAudioDiscreate") ) %>
	
 
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