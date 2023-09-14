 <%
 ''Function IIf(bClause, sTrue, sFalse)
    ''If CBool(bClause) Then
       '' IIf = sTrue
    ''Else 
        ''IIf = sFalse
    ''End If
''End Function
 
 %>
 
  <% If Not rsChecklistWildBunch.BOF = True And Not rsChecklistWildBunch.EOF = True Then %>
     <% If Not IsNull(rsChecklistWildBunch.Fields("ChecklistCompleted"))  And rsChecklistWildBunch.Fields("ChecklistCompleted") = true Then %> 

     <table width="100%" border="1" cellspacing="0" cellpadding="0" >
    <tr>
	    <td style="text-align:center;font-weight: bold;border-left: 2px solid;border-top: 2px solid;border-bottom: 1px solid;border-right: 2px solid"  colspan="2">
		<table width="100%" border="0" cellspacing="0" cellpadding="1" >
			   <tr>
			     <td class="header" >&nbsp;CHECKLIST: WILD BUNCH&nbsp;|&nbsp;File to Spec: 
				       <%
							  If Not IsNull(rsChecklistWildBunch.Fields("IsFile")) Then
							    Response.Write  IIf(rsChecklistWildBunch.Fields("IsFile"), "Yes", "No") 
							  End If
					  %>
				 </td>
			   
			   </tr>
		  </table>	   
		</td>
	</tr>
  <tr>
  
   <tr>
	   <td style="font-weight:bold;text-align:center;width:50%">&nbsp;Video and Content:</td>
	   <td  style="font-weight:bold;text-align:center;width:50%">&nbsp;Audio and Metadata</td>
  </tr>
  
  <tr>
  
     <td >
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:75%;">&nbsp;Full scale files are acceptable, is this mentioned & logged:</td>
					  <td style="width:25%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("FullScaleFilesAreAcceptableIsThisMentionedAndLogged")) Then
							   Response.Write rsChecklistWildBunch.Fields("FullScaleFilesAreAcceptableIsThisMentionedAndLogged")
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	    <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Is Mono Audio Present:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("MonoAudioListTracks")) Then
						   Response.Write    IIf(rsChecklistWildBunch.Fields("MonoAudioListTracks"), "Yes", "No")  
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
  </tr>
  
    <tr>
	
     <td >
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:75%;">&nbsp;Are Normal Video Range levels legal and within spec:</td>
					  <td style="width:25%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("AreNormalVideoRangeLevelsLegalAndWithinSpec")) Then
							   Response.Write  rsChecklistWildBunch.Fields("AreNormalVideoRangeLevelsLegalAndWithinSpec")
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	     <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Is Split track audio present:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("SplitTrackAudio")) Then
						   Response.Write  IIf(rsChecklistWildBunch.Fields("SplitTrackAudio"), "Yes", "No")   
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	   
  </tr>
  
    <tr>
	 <td >
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:75%;">&nbsp;Aspect ratio checked on all content:</td>
					  <td style="width:25%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("AspectRatioCheckedOnAllContent")) Then
							   Response.Write  IIf(rsChecklistWildBunch.Fields("AspectRatioCheckedOnAllContent"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	    <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Is M&E clean of dialogues:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("IsMAndECleanOfDialogues")) Then
						   Response.Write  IIf(rsChecklistWildBunch.Fields("IsMAndECleanOfDialogues"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
  
	  
  
  </tr>
  
    <tr>
	<td>
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:75%;">&nbsp;All H&V Blanking checked:</td>
					  <td style="width:25%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("AllHAndVBlankingChecked")) Then
							   Response.Write  IIf(rsChecklistWildBunch.Fields("AllHAndVBlankingChecked"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	
	 <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Are M&E tracks fully filled:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("AreMAndETracksFullyFilled")) Then
						   Response.Write  IIf(rsChecklistWildBunch.Fields("AreMAndETracksFullyFilled"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	
	
	  
  
  </tr>
  
    <tr>
     <td >
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:75%;">&nbsp;All logos and added text logged (include plot related featured text):</td>
					  <td style="width:25%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText")) Then
							   Response.Write  IIf(rsChecklistWildBunch.Fields("AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Has all File Metadata been checked:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("HasAllFileMetadataBeenChecked")) Then
						   Response.Write  IIf(rsChecklistWildBunch.Fields("HasAllFileMetadataBeenChecked"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	  
	  
  </tr>
  
    <tr>
     
	   <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:75%;">&nbsp;Title/captions/end credits text is present over black, picture or card and logged:</td>
				  <td  style="width:25%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard")) Then
						   Response.Write  IIf(rsChecklistWildBunch.Fields("LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
     
	   <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;File format  / Codec:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("FileFormatOrCodec")) Then
						   Response.Write  rsChecklistWildBunch.Fields("FileFormatOrCodec")
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	   
	  
  
  </tr>
  
   
  
    <tr>
      
	   <td >
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:75%;">&nbsp;All Wildbunch logos logged:</td>
					  <td style="width:25%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("LoggedWildbunchLogoPresent")) Then
							   Response.Write  IIf(rsChecklistWildBunch.Fields("LoggedWildbunchLogoPresent"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Standard / Frame rate:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("StandardOrFrameRate")) Then
						   Response.Write  rsChecklistWildBunch.Fields("StandardOrFrameRate") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	  
  </tr>
  
    <tr>
      <td >
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:75%;">&nbsp;Is prominent branding / copyright within content logged:</td>
					  <td style="width:25%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("BrandingOrCopyrightwithinContentLogged")) Then
							   Response.Write  IIf(rsChecklistWildBunch.Fields("BrandingOrCopyrightwithinContentLogged"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	 
	  <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Progressive:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("Progressive")) Then
						   Response.Write  IIf(rsChecklistWildBunch.Fields("Progressive"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	   
	  
  
  </tr>
  
    <tr>
     <td>
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:75%;">&nbsp;All text - titles, captions & end credits 90% caption safe:</td>
					  <td style="width:25%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe")) Then
							   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	
	 <td>
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Resolution:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("Resolution")) Then
						   Response.Write  rsChecklistWildBunch.Fields("Resolution") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	   
	   
  
  </tr>
  
    <tr>
    
	<td>
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:75%;">&nbsp;All Texted shots (Added text) must have corresponding textless covers:</td>
					  <td style="width:25%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers")) Then
							   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	
	 <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Tagged / labelled audio (WB TV only ):</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("TaggedOrLabelledAudioWBTVOnly")) Then
						   Response.Write  IIf(rsChecklistWildBunch.Fields("TaggedOrLabelledAudioWBTVOnly"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	   
  
  </tr>
  
    <tr>
      <td>
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:75%;">&nbsp;All textless must match the grade, framing and aspect ratio of its corresponding texted shot:</td>
					  <td style="width:25%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot")) Then
							   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	
	  <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Audio Bit Depth / Rate:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWildBunch.Fields("AudioBitDepthOrRate")) Then
						   Response.Write  rsChecklistWildBunch.Fields("AudioBitDepthOrRate") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	   
	  
  
  
  </tr>
  
    <tr>
    
	 <td>
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:75%;">&nbsp;All textless covers must be the same timing as the corresponding texted shot:</td>
					  <td style="width:25%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot")) Then
							   Response.Write  IIf(rsChecklistWildBunch.Fields("AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	
	 <td>
	   
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;Is Audio Discrete:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistWildBunch.Fields("IsAudioDiscreate")) Then
							   Response.Write  rsChecklistWildBunch.Fields("IsAudioDiscreate")
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
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