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
  
       <table width="100%" border="1" cellspacing="0" cellpadding="0" >
     <tr>
	    <td style="text-align:center;font-weight: bold;border-left: 2px solid;border-top: 2px solid;border-bottom: 1px solid;border-right: 2px solid"  colspan="2">
		<table width="100%" border="0" cellspacing="0" cellpadding="1" >
			   <tr>
			     <td class="header" >&nbsp;CHECKLIST: LIONSGATE&nbsp;|&nbsp;File to Spec: 
				       <%
							  If Not IsNull(rsChecklistLionsGate.Fields("IsFile")) Then
							    Response.Write  IIf(rsChecklistLionsGate.Fields("IsFile"), "Yes", "No") 
							  End If
					  %>
				 </td>
			   
			   </tr>
		  </table>	   
		</td>
	</tr>
  <tr>
	   <td style="font-weight:bold;text-align:center;width:50%">&nbsp;Video and Content</td>
	   <td  style="font-weight:bold;text-align:center;width:50%">&nbsp;Audio and Metadata<</td>
  </tr>
  <tr>
     <td >
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;Is the file Full Range Video:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistLionsGate.Fields("IsTheFileFullRangeVideo")) Then
							   Response.Write  IIf(rsChecklistLionsGate.Fields("IsTheFileFullRangeVideo"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Is 2.0 Stereo TV full mix present and QC'd:</td>
				  <td  style="width:30%">&nbsp;
						  
				      <%
						  If Not IsNull(rsChecklistLionsGate.Fields("Is_2_0_StereoTVFullMixPresentAndQCeD")) Then
						   Response.Write  IIf(rsChecklistLionsGate.Fields("Is_2_0_StereoTVFullMixPresentAndQCeD"), "Yes", "No") 
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
			      <td style="width:70%;">&nbsp;Are the Video levels correct on the Head-build:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistLionsGate.Fields("AreTheVideoLevelsCorrectOnTheHeadBuild")) Then
							   Response.Write  IIf(rsChecklistLionsGate.Fields("AreTheVideoLevelsCorrectOnTheHeadBuild"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	  
	   <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Has the 5.1 mix been spot checked:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistLionsGate.Fields("HasThe_5_1_MixBeenSpotChecked")) Then
						   Response.Write  IIf(rsChecklistLionsGate.Fields("HasThe_5_1_MixBeenSpotChecked"), "Yes", "No") 
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
			      <td style="width:70%;">&nbsp;Are the Video levels correct on the content:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistLionsGate.Fields("AreTheVideoLevelsCorrectOnTheContent")) Then
							   Response.Write  IIf(rsChecklistLionsGate.Fields("AreTheVideoLevelsCorrectOnTheContent"), "Yes", "No") 
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
						  If Not IsNull(rsChecklistLionsGate.Fields("HasAllFileMetadataBeenChecked")) Then
						   Response.Write  IIf(rsChecklistLionsGate.Fields("HasAllFileMetadataBeenChecked"), "Yes", "No") 
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
			      <td style="width:70%;">&nbsp;Has the Aspect Ratio been checked on the slate and programme:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistLionsGate.Fields("HasTheAspectRatioBeenCheckedOTheSlateAndProgramme")) Then
							   Response.Write  IIf(rsChecklistLionsGate.Fields("HasTheAspectRatioBeenCheckedOTheSlateAndProgramme"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	    <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;File format / Codec:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistLionsGate.Fields("FileFormatOrCodec")) Then
						   Response.Write  rsChecklistLionsGate.Fields("FileFormatOrCodec") 
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
			      <td style="width:70%;">&nbsp;Is the info on the slate correct:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistLionsGate.Fields("IsTheInfoOnTheSlateCcorrect")) Then
							   Response.Write  IIf(rsChecklistLionsGate.Fields("IsTheInfoOnTheSlateCcorrect"), "Yes", "No") 
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
						  If Not IsNull(rsChecklistLionsGate.Fields("StandardOrFrameRate")) Then
						   Response.Write  rsChecklistLionsGate.Fields("StandardOrFrameRate") 
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
			      <td style="width:70%;">&nbsp;Is the Lionsgate Celestial logo added / present:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistLionsGate.Fields("IsTheLionsgateCeletiallLogoAddedOrPresent")) Then
							   Response.Write  IIf(rsChecklistLionsGate.Fields("IsTheLionsgateCeletiallLogoAddedOrPresent"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	 
   <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Resolution:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistLionsGate.Fields("Resolution")) Then
						   Response.Write  rsChecklistLionsGate.Fields("Resolution") 
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
			      <td style="width:70%;">&nbsp;Is all added text within 16:9 90% title safe:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistLionsGate.Fields("IsAllAddedTextWithin16_9NinetyPercentTitleSafe")) Then
							   Response.Write  IIf(rsChecklistLionsGate.Fields("IsAllAddedTextWithin16_9NinetyPercentTitleSafe"), "Yes", "No") 
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
						  If Not IsNull(rsChecklistLionsGate.Fields("Progressive")) Then
						   Response.Write  IIf(rsChecklistLionsGate.Fields("Progressive"), "Yes", "No") 
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
			      <td style="width:70%;">&nbsp;Has all added text been listed (including plot significant featured text):</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistLionsGate.Fields("HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText")) Then
							   Response.Write  IIf(rsChecklistLionsGate.Fields("HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	  <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;CLAP Present:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistLionsGate.Fields("CLAPPresent")) Then
						   Response.Write  IIf(rsChecklistLionsGate.Fields("CLAPPresent"), "Yes", "No") 
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
			      <td style="width:70%;">&nbsp;Are there textless and clean graphic covers after feature for all texted shots:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistLionsGate.Fields("AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots")) Then
							   Response.Write  IIf(rsChecklistLionsGate.Fields("AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td >
	   <!--
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Colour Primaries:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistLionsGate.Fields("ColourPrimaries")) Then
						   Response.Write  rsChecklistLionsGate.Fields("ColourPrimaries") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		   -->
		   &nbsp;
		  </td>
  
 
  </tr>
  <tr>
     <td >
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;Flashing images present - (Images likely to cause a seizure):</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklistLionsGate.Fields("FlashingImagesPpresentImagesLikelyToCauseASeizure")) Then
							   Response.Write  IIf(rsChecklistLionsGate.Fields("FlashingImagesPpresentImagesLikelyToCauseASeizure"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	    <td >
		<!--
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Transfer Characteristics:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistLionsGate.Fields("TransferCharacteristics")) Then
						   Response.Write  rsChecklistLionsGate.Fields("TransferCharacteristics")
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		   -->
		   &nbsp;
		  </td>
  
 
  </tr>
  <tr>
	  
   <td >
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;</td>
				  <td style="width:30%">&nbsp; </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td >
	   <!--
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Matrix Coefficients:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistLionsGate.Fields("MatrixCoefficients")) Then
						   Response.Write  rsChecklistLionsGate.Fields("MatrixCoefficients")
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		   -->
		   &nbsp;
		  </td>
 
  </tr>
  <tr>
     <td >
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;</td>
				  <td style="width:30%">&nbsp; </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Audio Bit Depth / Rate:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistLionsGate.Fields("AudioBitDepthOrRate")) Then
						   Response.Write  rsChecklistLionsGate.Fields("AudioBitDepthOrRate") 
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
			      <td style="width:70%;">&nbsp;</td>
				  <td style="width:30%">&nbsp;</td>
     	   </tr>
		
			</table>
	   </td>
	   
	  
		  
		   <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Is Audio Discrete:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistLionsGate.Fields("IsAudioDiscreate")) Then
						   Response.Write  rsChecklistLionsGate.Fields("IsAudioDiscreate")
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
   If Not rsChecklistLionsGate Is Nothing Then
     rsChecklistLionsGate.Close
	 set rsChecklistLionsGate = Nothing
	End If 
  %>