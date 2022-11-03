 '' <%  If Not rsChecklistBanijayRights.BOF = True And Not rsChecklistBanijayRights.EOF = True Then %> 
    <table width="100%" border="1" cellspacing="0" cellpadding="2" >	 
            <tr> 
	            <td colspan="3" align="center"><b>SPECIFICS</b></td>
	          </tr>
           <tr>
				<td style="font-weight:bold;text-align:center;width:33%" >&nbsp;Video</td>
			   <td  style="font-weight:bold;text-align:center;width:33%" >&nbsp;Audio</td>
			   <td style="font-weight:bold;text-align:center;width:33%"  >&nbsp;Textless</td>
			</tr> 
          <tr>
		      <td>Display Aspect Ratio correct:&nbsp;
				 <b>   <% 
					 If Not IsNull(rsChecklistBanijayRights.Fields("DisplayAspectRatioCorrect")) Then
					   Response.Write  rsChecklistBanijayRights.Fields("DisplayAspectRatioCorrect") 
					End If
				  %> </b>
		    </td>
			 <td>Is audio layout correct:&nbsp;
				 <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("IsAudioLlayoutCorrect")) Then
					   Response.Write  IIf(rsChecklistBanijayRights.Fields("IsAudioLlayoutCorrect"), "Yes", "No") 
					  End If
				  %> </b>
		   </td>
	         <td>Are textless elements present:&nbsp;
				 <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("AreTextlessElementsPresent")) Then
					   Response.Write  rsChecklistBanijayRights.Fields("AreTextlessElementsPresent")
					  End If
				  %> </b>
		   </td>
		  
	      
	       
	  </tr>
      <tr>
	      <td>Interlaced vs Progressive: checked and correct:&nbsp;
				 <b>   <% 
					 If Not IsNull(rsChecklistBanijayRights.Fields("InterlacedVsProgressiveCheckedAndCorrect")) Then
					   Response.Write  rsChecklistBanijayRights.Fields("InterlacedVsProgressiveCheckedAndCorrect") 
					End If
				  %> </b>
		   </td>
	      
		   <td>Is line up tone correct:&nbsp;
			 <b>   <% 
				   If Not IsNull(rsChecklistBanijayRights.Fields("IsLineupToneCorrect")) Then
						Response.Write  IIf(rsChecklistBanijayRights.Fields("IsLineupToneCorrect"), "Yes", "No") 
				   End If
			  %> </b>
		   </td>
		   
		    <td>Are there textless covers for all texted shots:&nbsp;
				 <b>   <% 
					   If Not IsNull(rsChecklistBanijayRights.Fields("AreThereTextlessCoversForAllTextedShots")) Then
							Response.Write  rsChecklistBanijayRights.Fields("AreThereTextlessCoversForAllTextedShots")
					   End If
				  %> </b>
		   </td>
      </tr>
       <tr>
	       <td>Does the file contain line-up:&nbsp;
			   <b>   <% 
				   If Not IsNull(rsChecklistBanijayRights.Fields("DoesTheFileContainLineup")) Then
						Response.Write  rsChecklistBanijayRights.Fields("DoesTheFileContainLineup") 
				   End If
			  %> </b>
		   </td>
	      
		   <td>Is Loudness (R128) a pass:&nbsp;
			  <b>   <% 
				   If Not IsNull(rsChecklistBanijayRights.Fields("IsLoudnessR128APass")) Then
						Response.Write  IIf(rsChecklistBanijayRights.Fields("IsLoudnessR128APass"), "Yes", "No") 
				   End If
			  %> </b>
		   </td>
		   
		    <td>Are the textless covers the same timing as texted shots:&nbsp;
			 <b>   <% 
				   If Not IsNull(rsChecklistBanijayRights.Fields("AreTheTextlessCoversTheSameTimingAsTextedShots")) Then
						Response.Write  rsChecklistBanijayRights.Fields("AreTheTextlessCoversTheSameTimingAsTextedShots") 
				   End If
			  %> </b>
		   </td>
    
	   </tr>
       <tr>
	         <td>Slate present:&nbsp;
				  <b>   <% 
					   If Not IsNull(rsChecklistBanijayRights.Fields("SlatePresent")) Then
							Response.Write  rsChecklistBanijayRights.Fields("SlatePresent")
					   End If
				  %> </b>
		  </td>
		  
		   <td>Is M&E present and complete:&nbsp;
				 <b>   <% 
					   If Not IsNull(rsChecklistBanijayRights.Fields("IsMAndEPresentAndComplete")) Then
							Response.Write  rsChecklistBanijayRights.Fields("IsMAndEPresentAndComplete") 
					   End If
				  %> </b>
		   </td>
		   
	       <td>Is the grade and aspect ratio the same as texted shots:&nbsp;
			  <b>   <% 
				   If Not IsNull(rsChecklistBanijayRights.Fields("IsTheGradeAndAspectRatioTheSameAsTextedShots")) Then
						Response.Write  rsChecklistBanijayRights.Fields("IsTheGradeAndAspectRatioTheSameAsTextedShots")
				   End If
			  %> </b>
		   </td>
		  
	      
	      
	   </tr>
         <tr>
		     <td>Slate information correct:&nbsp;
				  <b>   <% 
					   If Not IsNull(rsChecklistBanijayRights.Fields("SlateInformationCorrect")) Then
							Response.Write  rsChecklistBanijayRights.Fields("SlateInformationCorrect")
					   End If
				  %> </b>
		  </td>
		
		   <td>Is Mix Minus Narration present and complete:&nbsp;
				 <b>   <% 
					   If Not IsNull(rsChecklistBanijayRights.Fields("IsMixMinusNarrationPresentAndComplete")) Then
							Response.Write  rsChecklistBanijayRights.Fields("IsMixMinusNarrationPresentAndComplete")
					   End If
				  %> </b>
		   </td>
		   
		   <td>Is there 10 seconds of black between programme & Textless:&nbsp;
			  <b>   <% 
				   If Not IsNull(rsChecklistBanijayRights.Fields("IsThere10SecondsOfBlackBetweenProgrammeAndTextless")) Then
						Response.Write  rsChecklistBanijayRights.Fields("IsThere10SecondsOfBlackBetweenProgrammeAndTextless")
				   End If
			  %> </b>
		   </td>
	       
	       
		 </tr>
         <tr>
		    
		     <td>Does the programme start on the hour:&nbsp;
				  <b>   <% 
					   If Not IsNull(rsChecklistBanijayRights.Fields("DoesTheProgrammeStartOnTheHour")) Then
							Response.Write  rsChecklistBanijayRights.Fields("DoesTheProgrammeStartOnTheHour")
					   End If
				  %> </b>
		   </td>
		 
		   
		    <td>Mono vs Stereo Checked?&nbsp;
			 <b>   <% 
				   If Not IsNull(rsChecklistBanijayRights.Fields("MonoVsStereoChecked")) Then
						Response.Write  IIf(rsChecklistBanijayRights.Fields("MonoVsStereoChecked"), "Yes", "No") 
				   End If
			  %> </b>
		   </td>
		   
	       <td>Is there 10 seconds of black before end of file:&nbsp;
			  <b>   <% 
				   If Not IsNull(rsChecklistBanijayRights.Fields("IsThere10SecondsOfBlackBeforeEndOfFile")) Then
						Response.Write  rsChecklistBanijayRights.Fields("IsThere10SecondsOfBlackBeforeEndOfFile") 
				   End If
			  %> </b>
		   </td>
		  
   	 
		 </tr>
          <tr>
		       <td>Is the programme Seamless or Parted:&nbsp;
			  <b>   <% 
					If Not IsNull(rsChecklistBanijayRights.Fields("IsTheProgrammeSeamlessOrParted")) Then
						Response.Write  rsChecklistBanijayRights.Fields("IsTheProgrammeSeamlessOrParted")
				   End If
			  %> </b>
		   </td>
		  
	       <td>Audio in sync:&nbsp;
			  <b>   <% 
					If Not IsNull(rsChecklistBanijayRights.Fields("AudioInSync")) Then
						Response.Write  IIf(rsChecklistBanijayRights.Fields("AudioInSync"), "Yes", "No") 
				   End If
			  %> </b>
		   </td>
	       <td>&nbsp;</td>
		  </tr>
           <tr>
		      <td>If parted, specify (if 1 second black between parts):&nbsp;
				  <b>   <% 
						If Not IsNull(rsChecklistBanijayRights.Fields("IfPartedSpecifyIfOneSecondBlackBetweenParts")) Then
							Response.Write  rsChecklistBanijayRights.Fields("IfPartedSpecifyIfOneSecondBlackBetweenParts") 
					   End If
				  %> </b>
		   </td>
		   
	        <td>WAVS supplied:&nbsp;
				 <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("WAVSSupplied")) Then
					   Response.Write  IIf(rsChecklistBanijayRights.Fields("WAVSSupplied"), "Yes", "No") 
					  End If
				  %> </b>
		   </td>
		   <td>&nbsp;</td>
		   </tr>
           <tr>
		      <td>Parted breaks logged:&nbsp;
			  <b>   <% 
					If Not IsNull(rsChecklistBanijayRights.Fields("PartedBreaksLogged")) Then
						Response.Write  rsChecklistBanijayRights.Fields("PartedBreaksLogged")
				   End If
			  %> </b>
		   </td>
		   
		
	       <td>All associated WAVS present:&nbsp;
				 <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("AllAssociatedWAVSPresent")) Then
					    Response.Write  rsChecklistBanijayRights.Fields("AllAssociatedWAVSPresent")
					   
					     If rsChecklistBanijayRights.Fields("AllAssociatedWAVSNotPresentReason") <> "" Then
					          Response.Write  "<br/><span> " & rsChecklistBanijayRights.Fields("AllAssociatedWAVSNotPresentReason") & "</span>" 
					     End If	  
							  
					  End If
				  %> </b>
		   </td>
		    <td>&nbsp;</td>
	    </tr>
		<tr>
		       <td>Bumpers present and logged:&nbsp;
				 <b>   <% 
						If Not IsNull(rsChecklistBanijayRights.Fields("BumpersPresentAndLogged")) Then
							Response.Write  rsChecklistBanijayRights.Fields("BumpersPresentAndLogged")
					   End If
				  %> </b>
		   </td>
		    <td>&nbsp;</td>
			 <td>&nbsp;</td>
		</tr>
		<tr>
		     <td  colspan="3"> Noted in comments:  "International Sales and Distribution Banijay Rights" credit present (or Not Present) within the end Credit roller:
				  <b>   <% 
						If Not IsNull(rsChecklistBanijayRights.Fields("InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments")) Then
							Response.Write  rsChecklistBanijayRights.Fields("InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments") 
					   End If
				  %> </b>
		   </td>
	     
     </tr>
		<tr>
		   <td  colspan="3"> Noted in Log:  ESI / Banijay logo at the end of program:
			   <b>   <% 
					If Not IsNull(rsChecklistBanijayRights.Fields("DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram")) Then
						Response.Write  rsChecklistBanijayRights.Fields("DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram") 
				   End If
			  %> </b>
		   </td>

		</tr>
		
		<tr>
		   <td  colspan="3">Noted in Log:  All End Logos:
			   <b>   <% 
					If Not IsNull(rsChecklistBanijayRights.Fields("AllEndLogos")) Then
						Response.Write  rsChecklistBanijayRights.Fields("AllEndLogos") 
				   End If
			  %> </b>
		   </td>

		</tr>
         
 </table>
 
 <table width="100%" border="0" cellspacing="0" cellpadding="0" >	 
            <tr> 
	            <td>&nbsp;</td>
	          </tr>
 </table>
 
 
 <table width="100%" border="1" cellspacing="0" cellpadding="2" >	 
	<tr> 
		<td colspan="2" align="center" style="font-size:14px;font-weigth:bold;"><b>COMPLIANCE</b></td>
	  </tr>
	  
	  <tr> 
		<td colspan="2"  style="font-weight:bold;text-align:center;">All Compliance in programme checked and logged:
           <b>   <% 
				  If Not IsNull(rsChecklistBanijayRights.Fields("VideoComplianceCheckedAndLogged")) Then
				   Response.Write  IIf(rsChecklistBanijayRights.Fields("VideoComplianceCheckedAndLogged"), "Yes", "No") 
				  End If
			 %> </b>

		</td>
	  </tr>
	  <tr> 
		<td style="width:50%; font-weight:bold;" align="center">Video</td>
		<td style="width:50%; font-weight:bold;" align="center">Audio</td>
	  </tr>
	   <tr> 
		<td  style="width:50%" >Flashing Lights / Epilepsy Warning Present:
                 <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("FlashingLightsOrEpilepsyWarningPresent")) Then
					   Response.Write  IIf(rsChecklistBanijayRights.Fields("FlashingLightsOrEpilepsyWarningPresent"), "Yes", "No") 
					  End If
			   %> </b>
		   </td>
		   <td  style="width:50%" > Audio Compliance checked and logged:
                 <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("AudioContentCensoredBleepedOrBlurred")) Then
					   Response.Write  rsChecklistBanijayRights.Fields("AudioContentCensoredBleepedOrBlurred") 
					  End If
				  %> </b>
		   </td>
	  </tr>
	   <tr> 
		 <td  style="width:50%" > Content Censored - Blurred:
               <b>   <% 
				  If Not IsNull(rsChecklistBanijayRights.Fields("VideoContentCensoredBleepedOrBlurred")) Then
				   Response.Write  rsChecklistBanijayRights.Fields("VideoContentCensoredBleepedOrBlurred")
				  End If
			    %> </b>
		   </td>
		   <td  style="width:50%" >Content Censored - Bleeped:
             <b>   <% 
				  If Not IsNull(rsChecklistBanijayRights.Fields("AudioContentCensoredBleepedOrBlurred")) Then
				   Response.Write  rsChecklistBanijayRights.Fields("AudioContentCensoredBleepedOrBlurred")
				  End If
			  %> </b>
		   </td>
	  </tr>
	   <tr> 
		 <td  style="width:50%" > Nudity Present: 
				 <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("NudityPresent")) Then
					   Response.Write  IIf(rsChecklistBanijayRights.Fields("NudityPresent"), "Yes", "No") 
					  End If
				  %> </b>
		   </td>
		    <td  style="width:50%" > Extreme Language Present:
             <b>   <% 
				  If Not IsNull(rsChecklistBanijayRights.Fields("ExtremeLanguagePresent")) Then
				   Response.Write  IIf(rsChecklistBanijayRights.Fields("ExtremeLanguagePresent"), "Yes", "No") 
				  End If
			  %> </b>
		   </td>
		   
		   
	  </tr>
	  <tr>
	    <td  style="width:50%" > Rude Gestures: 
				 <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("RudeGestures")) Then
					   Response.Write  IIf(rsChecklistBanijayRights.Fields("RudeGestures"), "Yes", "No") 
					  End If
				  %> </b>
		   </td>
		     <td  style="width:50%" > Time Specific:  Audio Present:
				  <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("TimeSpecificAudioPresent")) Then
					   Response.Write  IIf(rsChecklistBanijayRights.Fields("TimeSpecificAudioPresent"), "Yes", "No") 
					  End If
				  %> </b>
		   </td>
		   
		   
	       
	  </tr>
	   <tr>
	      <td  style="width:50%" > Harm or Offence Present: (Including Drug And Alchol Abuse): 
				 <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("HarmOrOffencePresentIncludingDrugAndAlcholAbuse")) Then
					   Response.Write  IIf(rsChecklistBanijayRights.Fields("HarmOrOffencePresentIncludingDrugAndAlcholAbuse"), "Yes", "No") 
					  End If
				  %> </b>
		   </td>
	       <td style="width:50%">&nbsp;</td>
	  
	  </tr>
	  
	   <tr> 
		 <td  style="width:50%" > Time Specific: Text Present:
			  <b>   <% 
				  If Not IsNull(rsChecklistBanijayRights.Fields("TimeSpecificTextPresent")) Then
				   Response.Write  IIf(rsChecklistBanijayRights.Fields("TimeSpecificTextPresent"), "Yes", "No") 
				  End If
			  %> </b>
		   </td>
		<td style="width:50%">&nbsp;</td>
	  </tr>
	   <tr> 
		<td  style="width:50%" >  Product Placement Present:
				 <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("ProductPlacementPresent")) Then
					   Response.Write  IIf(rsChecklistBanijayRights.Fields("ProductPlacementPresent"), "Yes", "No") 
					  End If
				  %> </b> 
		   </td>
		<td style="width:50%">&nbsp;</td>
	  </tr>
	 
	   <tr> 
		<td colspan="2" >Country specific phone numbers, competitions, websites hashtags:&nbsp;
				 <b>   <% 
					  If Not IsNull(rsChecklistBanijayRights.Fields("CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags")) Then
					   Response.Write  IIf(rsChecklistBanijayRights.Fields("CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags"), "Yes", "No") 
					  End If
				  %> </b>
		</td>
	  </tr>
	  
	  
 </table>
 
 
 '' <%    End If  %> 