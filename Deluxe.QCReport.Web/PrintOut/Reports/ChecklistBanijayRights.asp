 <% If Not rsChecklistBanijayRights.BOF = True And Not rsChecklistBanijayRights.EOF = True Then %>
      <% If Not IsNull(rsChecklistBanijayRights.Fields("ChecklistCompleted"))  And rsChecklistBanijayRights.Fields("ChecklistCompleted") = true Then %> 
	  
  <table width="100%" border="1" cellspacing="0" cellpadding="0" >	  
	    <tr >
			<!--<td style="text-align:center;font-weight: bold;height:30px"  colspan="10" class="txt_italic" size="3">
			&nbsp;CHECKLIST - Banijay Rights&nbsp; 
			</td> -->
			
			 <td align="center" class="blackSquare" style="padding-bottom:2px" colspan="10" > 
            <font class="txt_italic" size="3"><b>CHECKLIST - Banijay Rights</b></font>
          </td>
	 </tr>
	   <tr>
	       <td style="font-weight:bold;text-align:center;width:40%;font-weight:bold;height:20px" colspan="4" >&nbsp;FILE & MEASUREMENTS</td>
	       <td  style="font-weight:bold;text-align:center;width:60%; height:20px" colspan="6">&nbsp;SPECIFICS</td>
     </tr>
	   <tr>
	       <td style="font-weight:bold;text-align:center;width:10%" >&nbsp;File Details</td>
	       <td  style="font-weight:bold;text-align:center;width:10%" >&nbsp;Video Codec</td>
		   <td style="font-weight:bold;text-align:center;width:10%"  >&nbsp;Audio Codec</td>
	       <td  style="font-weight:bold;text-align:center;width:10%" >&nbsp;</td>
		   
		   <td style="font-weight:bold;text-align:center;width:10%" >&nbsp;Video</td>
	       <td  style="font-weight:bold;text-align:center;width:10%" >&nbsp;Textless</td>
		   <td style="font-weight:bold;text-align:center;width:10%"  >&nbsp;Audio</td>
	       <td  style="font-weight:bold;text-align:center;width:10%" >&nbsp;WAV</td>
	       <td  style="font-weight:bold;text-align:center;width:20%" colspan="2" >
		     <table width="100%" border="0" cellspacing="0" cellpadding="0" >
			   <tr>
			     <td style="font-weight:bold;text-align:center;width:100%;border-bottom: 1px solid" colspan="2" >&nbsp;Compliance</td>
			   <tr>
			  <tr>
			     <td style="font-weight:bold;text-align:center;width:50.3%;border-right: 2px solid" >&nbsp;Video</td>
				 <td style="font-weight:bold;text-align:center;width:49.7%;" >&nbsp;Audio</td>
			   <tr>
			 </table>	
		   </td>
     </tr>
	  
	   <tr>
	       <td style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				   <tr>
					   <td style="width:60%;padding-left:3px">Banijay file to Spec:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							  If Not IsNull(rsChecklistBanijayRights.Fields("FileToSpec")) Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("FileToSpec"), "Yes", "No") 
							  End If
						  %>
						</td>
				   </tr>
			 </table>
	   </td>
	       <td  style="width:10%" >
	          <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Format:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							 If Not IsNull(rsChecklistBanijayRights.Fields("Format")) Then
					           Response.Write  rsChecklistBanijayRights.Fields("Format") 
					        End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
		   <td style="width:10%"  >
		       <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Bit Depth:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							 If Not IsNull(rsChecklistBanijayRights.Fields("BitDepth")) Then
					           Response.Write  rsChecklistBanijayRights.Fields("BitDepth") 
					        End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
	       <td  style="width:10%" >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Is the file Metadata correct:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("IsTheFileMetadataCorrect")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("IsTheFileMetadataCorrect"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
		   
		   <td style="width:10%" >
		       <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Display Aspect Ratio correct:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							 If Not IsNull(rsChecklistBanijayRights.Fields("DisplayAspectRatioCorrect")) Then
					           Response.Write  rsChecklistBanijayRights.Fields("DisplayAspectRatioCorrect") 
					        End If
						  %>
						</td>
				   </tr>
			 </table> 
		    </td>
	       <td  style="width:10%" >
		       <table style="width:100%" cellspacing="0">
				   <tr>
					   <td style="width:60%;padding-left:3px">Are textless elements present:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							  If Not IsNull(rsChecklistBanijayRights.Fields("AreTextlessElementsPresent")) Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("AreTextlessElementsPresent"), "Yes", "No") 
							  End If
						  %>
						</td>
				   </tr>
			 </table>
		   </td>
		   <td style="width:10%"  >
			   <table style="width:100%" cellspacing="0">
					   <tr>
						   <td style="width:60%;padding-left:3px">Is audio layout correct:</td>
						   <td style="width:40%;font-weight:bold;padding-left:3px">		  
							   <%
								  If Not IsNull(rsChecklistBanijayRights.Fields("IsAudioLlayoutCorrect")) Then
								   Response.Write  IIf(rsChecklistBanijayRights.Fields("IsAudioLlayoutCorrect"), "Yes", "No") 
								  End If
							  %>
							</td>
					   </tr>
				 </table>
		   </td>
	       <td  style="width:10%" >
		        <table style="width:100%" cellspacing="0">
					   <tr>
						   <td style="width:60%;padding-left:3px">WAVS supplied:</td>
						   <td style="width:40%;font-weight:bold;padding-left:3px">		  
							   <%
								  If Not IsNull(rsChecklistBanijayRights.Fields("WAVSSupplied")) Then
								   Response.Write  IIf(rsChecklistBanijayRights.Fields("WAVSSupplied"), "Yes", "No") 
								  End If
							  %>
							</td>
					   </tr>
				 </table>
		   </td>
	       <td  style="width:10%" > 
                  <table style="width:100%" cellspacing="0">
				   <tr>
					   <td style="width:60%;padding-left:3px">Compliance checked and logged:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							  If Not IsNull(rsChecklistBanijayRights.Fields("VideoComplianceCheckedAndLogged")) Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("VideoComplianceCheckedAndLogged"), "Yes", "No") 
							  End If
						  %>
						</td>
				   </tr>
			 </table>
		   </td>
		   <td  style="width:10%" >
               <table style="width:100%" cellspacing="0">
				   <tr>
					   <td style="width:60%;padding-left:3px">Audio Compliance checked and logged:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							  If Not IsNull(rsChecklistBanijayRights.Fields("AudioComplianceCheckedAndLogged")) Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("AudioComplianceCheckedAndLogged"), "Yes", "No") 
							  End If
						  %>
						</td>
				   </tr>
			 </table>
		   </td>
     </tr>
	  
	  <tr>
	       <td style="width:10%" >
		      <table style="width:100%" cellspacing="0">
			   <tr>
			   <td style="width:60%;padding-left:3px">Decode check pass:</td>
			   <td style="width:40%;font-weight:bold;padding-left:3px">		  
				   <%
					  If Not IsNull(rsChecklistBanijayRights.Fields("DecodeCheckPass")) Then
				       Response.Write  IIf(rsChecklistBanijayRights.Fields("DecodeCheckPass"), "Yes", "No") 
				      End If
				  %>
		        </td>
			   </tr>
			 </table>
	   </td>
	       <td  style="width:10%" >
		       <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Standard:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							 If Not IsNull(rsChecklistBanijayRights.Fields("Standard")) Then
					           Response.Write  rsChecklistBanijayRights.Fields("Standard") 
					        End If
						  %>
						</td>
				   </tr>
			 </table> 
	      </td>
		   <td style="width:10%"  >
		        <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Bit Rate:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							 If Not IsNull(rsChecklistBanijayRights.Fields("AudioBitRate")) Then
					           Response.Write  rsChecklistBanijayRights.Fields("AudioBitRate") 
					        End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
	       <td  style="width:10%" >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Interlaced / Progressive correctly flagged:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("InterlacedOrProgressiveCorrectlyFlagged")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("InterlacedOrProgressiveCorrectlyFlagged"), "Yes", "No") 
									 Response.Write  "<br/><span> " & rsChecklistBanijayRights.Fields("InterlacedOrProgressiveCorrectlyNotFlaggedReason") & "</span>" 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
		   
		   <td style="width:10%" >
		       <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Interlaced vs Progressive: checked and correct:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							 If Not IsNull(rsChecklistBanijayRights.Fields("InterlacedVsProgressiveCheckedAndCorrect")) Then
					           Response.Write  rsChecklistBanijayRights.Fields("InterlacedVsProgressiveCheckedAndCorrect") 
					        End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
	       <td  style="width:10%" >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Are there textless covers for all texted shots:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("AreThereTextlessCoversForAllTextedShots")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("AreThereTextlessCoversForAllTextedShots"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   
		   </td>
		   <td style="width:10%"  >
		        <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Is line up tone correct:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("IsLineupToneCorrect")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("IsLineupToneCorrect"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
	       <td  style="width:10%" >
		      <table style="width:100%" cellspacing="0">
					   <tr>
						   <td style="width:60%;padding-left:3px">All associated WAVS present:</td>
						   <td style="width:40%;font-weight:bold;padding-left:3px">		  
							   <%
								  If Not IsNull(rsChecklistBanijayRights.Fields("AllAssociatedWAVSPresent")) Then
								   Response.Write  IIf(rsChecklistBanijayRights.Fields("AllAssociatedWAVSPresent"), "Yes", "No") 
								   Response.Write  "<br/><span> " & rsChecklistBanijayRights.Fields("AllAssociatedWAVSNotPresentReason") & "</span>" 
								  End If
							  %>
							</td>
					   </tr>
				 </table>
		   </td>
	       <td  style="width:10%" > 
                  <table style="width:100%" cellspacing="0">
				   <tr>
					   <td style="width:60%;padding-left:3px">Flashing Lights / Epilepsy Warning Present:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							  If Not IsNull(rsChecklistBanijayRights.Fields("FlashingLightsOrEpilepsyWarningPresent")) Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("FlashingLightsOrEpilepsyWarningPresent"), "Yes", "No") 
							  End If
						  %>
						</td>
				   </tr>
			 </table>
		   </td>
		   <td  style="width:10%" >
                <table style="width:100%" cellspacing="0">
				   <tr>
					   <td style="width:60%;padding-left:3px">Content Censored - Bleeped Or Blurred:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							  If Not IsNull(rsChecklistBanijayRights.Fields("AudioContentCensoredBleepedOrBlurred")) Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("AudioContentCensoredBleepedOrBlurred"), "Yes", "No") 
							  End If
						  %>
						</td>
				   </tr>
			 </table>
		   </td>
     </tr>
	  
	  <tr>
	       <td style="width:10%" >
		     <table style="width:100%" cellspacing="0">
			     <tr>
					   <td style="width:60%;padding-left:3px">Confirm the video format:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("ConfirmVideoFormat")) Then
								  Response.Write  rsChecklistBanijayRights.Fields("ConfirmVideoFormat") 
							  End If
						  %>
						</td>
			     </tr>
			 </table>
	   </td>
	       <td  style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Frame rate:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							 If Not IsNull(rsChecklistBanijayRights.Fields("FrameRate")) Then
					           Response.Write  rsChecklistBanijayRights.Fields("FrameRate") 
					        End If
						  %>
						</td>
				   </tr>
			 </table> 
	      </td>
		   <td style="width:10%"  >
		        <table style="width:100%" cellspacing="0">
			     <tr>
					   <td style="width:60%;padding-left:3px">Sample Rate:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("SampleRate")) Then
								  Response.Write  rsChecklistBanijayRights.Fields("SampleRate") 
							  End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
	       <td  style="width:10%" >
		          <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">CLAP Present:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("CLAPPresent")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("CLAPPresent"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
		   
		   <td style="width:10%" >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Does the file contain line-up:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("DoesTheFileContainLineup")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("DoesTheFileContainLineup"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
	       <td  style="width:10%" >
		      <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Are the textless covers the same timing as texted shots:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("AreTheTextlessCoversTheSameTimingAsTextedShots")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("AreTheTextlessCoversTheSameTimingAsTextedShots"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
		   <td style="width:10%"  >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Is Loudness (R128) a pass:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("IsLoudnessR128APass")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("IsLoudnessR128APass"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
	       <td  style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >  
                 <table style="width:100%" cellspacing="0">
				   <tr>
					   <td style="width:60%;padding-left:3px">Content Censored - Bleeped Or Blurred:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							  If Not IsNull(rsChecklistBanijayRights.Fields("VideoContentCensoredBleepedOrBlurred")) Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("VideoContentCensoredBleepedOrBlurred"), "Yes", "No") 
							  End If
						  %>
						</td>
				   </tr>
			 </table>
		   </td>
		   <td  style="width:10%" > 
                <table style="width:100%" cellspacing="0">
				   <tr>
					   <td style="width:60%;padding-left:3px">Extreme Language Present:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							  If Not IsNull(rsChecklistBanijayRights.Fields("ExtremeLanguagePresent")) Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("ExtremeLanguagePresent"), "Yes", "No") 
							  End If
						  %>
						</td>
				   </tr>
			 </table>
		   </td>
     </tr>
	 
	 <tr>
	       <td style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Bit Rate Video:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							 If Not IsNull(rsChecklistBanijayRights.Fields("VideoBitRate")) Then
					           Response.Write  rsChecklistBanijayRights.Fields("VideoBitRate") 
					        End If
						  %>
						</td>
				   </tr>
			 </table> 
	      </td>
		   <td style="width:10%"  >
		          <table style="width:100%" cellspacing="0">
			     <tr>
					   <td style="width:60%;padding-left:3px">Discrete:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							    If Not IsNull(rsChecklistBanijayRights.Fields("Discrete")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("Discrete"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
	       <td  style="width:10%" >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Colour Primaries Present:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("ColourPrimariesPresent")) Then
				                    Response.Write  rsChecklistBanijayRights.Fields("ColourPrimariesPresent")
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
		   
		   <td style="width:10%" >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Is the Slate present and information correct:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("IsTheSlatePresentAndInformationCorrect")) Then
				                    Response.Write  rsChecklistBanijayRights.Fields("IsTheSlatePresentAndInformationCorrect")
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		  </td>
	       <td  style="width:10%" >
		          <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Is the grade and aspect ratio the same as texted shots:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("IsTheGradeAndAspectRatioTheSameAsTextedShots")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("IsTheGradeAndAspectRatioTheSameAsTextedShots"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
		   <td style="width:10%"  >
		      <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Is M&E present and complete:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("IsMAndEPresentAndComplete")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("IsMAndEPresentAndComplete"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
	       <td  style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >  
                <table style="width:100%" cellspacing="0">
				   <tr>
					   <td style="width:60%;padding-left:3px">Nudity Present:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							  If Not IsNull(rsChecklistBanijayRights.Fields("NudityPresent")) Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("NudityPresent"), "Yes", "No") 
							  End If
						  %>
						</td>
				   </tr>
			 </table>
		   </td>
		   <td  style="width:10%" > 
                    <table style="width:100%" cellspacing="0">
				   <tr>
					   <td style="width:60%;padding-left:3px">Time Specific:  Audio Present:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							  If Not IsNull(rsChecklistBanijayRights.Fields("TimeSpecificAudioPresent")) Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("TimeSpecificAudioPresent"), "Yes", "No") 
							  End If
						  %>
						</td>
				   </tr>
			 </table>
		   </td>
     </tr>
	 
	 <tr>
	       <td style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Frame size / Resolution:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							 If Not IsNull(rsChecklistBanijayRights.Fields("FrameSizeOrResolution")) Then
					           Response.Write  rsChecklistBanijayRights.Fields("FrameSizeOrResolution") 
					        End If
						  %>
						</td>
				   </tr>
			 </table> 
	      </td>
		  <td style="width:10%" >&nbsp;</td>
		   <td style="width:10%"  >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Transfer Characteristics Present:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("TransferCharacteristicsPresent")) Then
				                    Response.Write  rsChecklistBanijayRights.Fields("TransferCharacteristicsPresent")
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		  </td>
	      
	       <td  style="width:10%" >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Does the programme start on the hour:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("DoesTheProgrammeStartOnTheHour")) Then
				                    Response.Write  rsChecklistBanijayRights.Fields("DoesTheProgrammeStartOnTheHour")
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
		   <td style="width:10%"  >
		        <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Is there 10 seconds of black between programme & Textless:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("IsThere10SecondsOfBlackBetweenProgrammeAndTextless")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("IsThere10SecondsOfBlackBetweenProgrammeAndTextless"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
	       <td  style="width:10%" >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Is Mix Minus Narration present and complete:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("IsMixMinusNarrationPresentAndComplete")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("IsMixMinusNarrationPresentAndComplete"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
	       <td  style="width:10%" >&nbsp;</td>
		   <td  style="width:10%" > 
                  <table style="width:100%" cellspacing="0">
				   <tr>
					   <td style="width:60%;padding-left:3px">Time Specific: Text Present:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							  If Not IsNull(rsChecklistBanijayRights.Fields("TimeSpecificTextPresent")) Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("TimeSpecificTextPresent"), "Yes", "No") 
							  End If
						  %>
						</td>
				   </tr>
			 </table>
		   </td>
		   <td  style="width:10%" > 

		   </td>
     </tr>
	 
	 <tr>
	       <td style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Aspect Ratio:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							 If Not IsNull(rsChecklistBanijayRights.Fields("AspectRatio")) Then
					           Response.Write  rsChecklistBanijayRights.Fields("AspectRatio") 
					        End If
						  %>
						</td>
				   </tr>
			 </table> 
	      </td>
		   <td style="width:10%"  >&nbsp;</td>
	       <td  style="width:10%" >
		      <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Matrix Coefficients Present:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							 If Not IsNull(rsChecklistBanijayRights.Fields("MatrixCoefficientsPresent")) Then
					           Response.Write  rsChecklistBanijayRights.Fields("MatrixCoefficientsPresent") 
					        End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
		   
		   <td style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Is the programme Seamless or Parted:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						  <%
							    If Not IsNull(rsChecklistBanijayRights.Fields("IsTheProgrammeSeamlessOrParted")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("IsTheProgrammeSeamlessOrParted"), "Yes", "No") 
				               End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
	       <td  style="width:10%" >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Is there 10 seconds of black before end of file:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("IsThere10SecondsOfBlackBeforeEndOfFile")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("IsThere10SecondsOfBlackBeforeEndOfFile"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
		   <td style="width:10%"  >
		       <table style="width:100%" cellspacing="0">
			        <tr>
					   <td style="width:60%;padding-left:3px">Mono vs Stereo Checked?</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("MonoVsStereoChecked")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("MonoVsStereoChecked"), "Yes", "No") 
				               End If
						  %>
						</td>
			     </tr>
			 </table>
		   </td>
	       <td  style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >  
                   <table style="width:100%" cellspacing="0">
					   <tr>
						   <td style="width:60%;padding-left:3px">Product Placement Present:</td>
						   <td style="width:40%;font-weight:bold;padding-left:3px">		  
							   <%
								  If Not IsNull(rsChecklistBanijayRights.Fields("ProductPlacementPresent")) Then
								   Response.Write  IIf(rsChecklistBanijayRights.Fields("ProductPlacementPresent"), "Yes", "No") 
								  End If
							  %>
							</td>
					   </tr>
			     </table>   
		   </td>
		   <td  style="width:10%" > 

		   </td>
     </tr>
	 
	 <tr>
	       <td style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >&nbsp;</td>
		   <td style="width:10%"  >&nbsp;</td>
	       <td  style="width:10%" >&nbsp;</td>
		   
		   <td style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Parted breaks logged:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						  <%
							    If Not IsNull(rsChecklistBanijayRights.Fields("PartedBreaksLogged")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("PartedBreaksLogged"), "Yes", "No") 
				               End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
	       <td  style="width:10%" >&nbsp;</td>
		   <td style="width:10%"  >
		    <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Audio in sync:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						  <%
							    If Not IsNull(rsChecklistBanijayRights.Fields("AudioInSync")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("AudioInSync"), "Yes", "No") 
				               End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
	       <td  style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >  
                <table style="width:100%" cellspacing="0">
					   <tr>
						   <td style="width:60%;padding-left:3px">Country specific phone numbers, competitions, websites hashtags:</td>
						   <td style="width:40%;font-weight:bold;padding-left:3px">		  
							   <%
								  If Not IsNull(rsChecklistBanijayRights.Fields("CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags")) Then
								   Response.Write  IIf(rsChecklistBanijayRights.Fields("CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags"), "Yes", "No") 
								  End If
							  %>
							</td>
					   </tr>
			     </table> 
		   </td>
		   <td  style="width:10%" > 

		   </td>
     </tr>
	 
	  <tr>
	       <td style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >&nbsp;</td>
		   <td style="width:10%"  >&nbsp;</td>
	       <td  style="width:10%" >&nbsp;</td>
		   
		   <td style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">If parted, specify (if 1 second black between parts):</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						  <%
							    If Not IsNull(rsChecklistBanijayRights.Fields("IfPartedSpecifyIfOneSecondBlackBetweenParts")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("IfPartedSpecifyIfOneSecondBlackBetweenParts"), "Yes", "No") 
				               End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
	       <td  style="width:10%" >&nbsp;</td>
		   <td style="width:10%"  >&nbsp;</td>
	       <td style="width:10%"  >&nbsp;</td>
	       <td style="width:10%"  >&nbsp;</td>
		   <td style="width:10%"  >&nbsp;</td>
     </tr>
	 
	  <tr>
	       <td style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >&nbsp;</td>
		   <td style="width:10%"  >&nbsp;</td>
	       <td  style="width:10%" >&nbsp;</td>
		   
		   <td style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Bumpers present and logged:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						  <%
							    If Not IsNull(rsChecklistBanijayRights.Fields("BumpersPresentAndLogged")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("BumpersPresentAndLogged"), "Yes", "No") 
				               End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
	       <td  style="width:10%" >
		   
		   </td>
		   <td style="width:10%"  >
		   
		   </td>
	       <td  style="width:10%" >
		   
		   </td>
	       <td  style="width:10%" >  

		   </td>
		   <td  style="width:10%" > 

		   </td>
     </tr>
	 
	 
	 <tr>
	       <td style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >&nbsp;</td>
		   <td style="width:10%"  >&nbsp;</td>
	       <td  style="width:10%" >&nbsp;</td>
		   
		   <td style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">"International Sales and Distribution Banijay  Rights"
                                (OR ESI) credit present (or Not Present)
                                within the end credit roller. Checked and added to comments?:</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						  <%
							    If Not IsNull(rsChecklistBanijayRights.Fields("InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments"), "Yes", "No") 
				               End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
	       <td  style="width:10%" >
		   
		   </td>
		   <td style="width:10%"  >
		   
		   </td>
	       <td  style="width:10%" >
		   
		   </td>
	       <td  style="width:10%" >  

		   </td>
		   <td  style="width:10%" > 

		   </td>
     </tr>
	 
	 <tr>
	       <td style="width:10%" >&nbsp;</td>
	       <td  style="width:10%" >&nbsp;</td>
		   <td style="width:10%"  >&nbsp;</td>
	       <td  style="width:10%" >&nbsp;</td>
		   
		   <td style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Does the file contain ESI / Banijay logo at the end of program</td>
					   <td style="width:40%;font-weight:bold;padding-left:3px">		  
						  <%
							    If Not IsNull(rsChecklistBanijayRights.Fields("DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram"), "Yes", "No") 
				               End If
						  %>
						</td>
				   </tr>
			 </table> 
		   </td>
	       <td  style="width:10%" >
		   
		   </td>
		   <td style="width:10%"  >
		   
		   </td>
	       <td  style="width:10%" >
		   
		   </td>
	       <td  style="width:10%" >  

		   </td>
		   <td  style="width:10%" > 

		   </td>
     </tr>
	 
	  
</table>		  
 <%

      End If 	 
   End If 
	  
   If Not rsChecklistBanijayRights Is Nothing Then
     rsChecklistBanijayRights.Close
	 set rsChecklistBanijayRights = Nothing
	End If 
  %>	  