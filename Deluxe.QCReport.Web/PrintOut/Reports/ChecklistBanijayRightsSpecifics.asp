  <%   If Not rsChecklistBanijayRights.BOF = True And Not rsChecklistBanijayRights.EOF = True Then %> 
   
     <table class="section-table" border="0" cellspacing="0" cellpadding="1">
			  <tr>
			     <td class="section-header" >Specifics </td>
			   </tr>
		  </table>

			<p></p>


   <table class="section-table" border="1" cellspacing="0" cellpadding="1" >	 
   
			 <tr>
			   <td colspan="2"  class="section-sub-header" style="width:50%" >Video</td>
			   <td colspan="2"  class="section-sub-header" style="width:25%">Audio</td>
			   <td colspan="2"  class="section-sub-header" style="width:25%">Textless</td>
		    </tr>
           
		    <tr>
				 <td class="section-label checklist-label" >Display Aspect Ratio correct:</td>
				  <% SetChecklistText( rsChecklistBanijayRights.Fields("DisplayAspectRatioCorrect")  )  %>
				
			   <td class="section-label checklist-label" >Is audio layout correct:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("IsAudioLlayoutCorrect") )  %>
			   
									  
			   <td class="section-label checklist-label" >Are textless elements present:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("AreTextlessElementsPresent") )  %>
     	 </tr>
		 
		 
		  <tr>
				 <td class="section-label checklist-label" >Interlaced vs Progressive: checked and correct:</td>
				  <% SetChecklistText(rsChecklistBanijayRights.Fields("InterlacedVsProgressiveCheckedAndCorrect")  )  %>
				
			   <td class="section-label checklist-label" >Is line up tone correct:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("IsLineupToneCorrect") )  %>
			   
									  
			   <td class="section-label checklist-label" >Are there textless covers for all texted shots:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("AreThereTextlessCoversForAllTextedShots") )  %>
     	 </tr>
		 
          <tr>
				 <td class="section-label checklist-label" >Does the file contain line-up:</td>
				  <% SetChecklistText( rsChecklistBanijayRights.Fields("DoesTheFileContainLineup")  )  %>
				
			   <td class="section-label checklist-label" >Is Loudness (R128) a pass:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("IsLoudnessR128APass") )  %>
			   
									  
			   <td class="section-label checklist-label" >Are the textless covers the same timing as texted shots:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("AreTheTextlessCoversTheSameTimingAsTextedShots") )  %>
     	 </tr>
		 
           
         <tr>
				 <td class="section-label checklist-label" >Slate present:</td>
				  <% SetChecklistText( rsChecklistBanijayRights.Fields("SlatePresent")  )  %>
				
			   <td class="section-label checklist-label" >Is M&E present and complete:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("IsMAndEPresentAndComplete")  )  %>
			   
									  
			   <td class="section-label checklist-label" >Is the grade and aspect ratio the same as texted shots:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("IsTheGradeAndAspectRatioTheSameAsTextedShots") )  %>
     	 </tr>
           
          <tr>
				 <td class="section-label checklist-label" >Slate information correct:</td>
				  <% SetChecklistText( rsChecklistBanijayRights.Fields("SlateInformationCorrect")  )  %>
				
			   <td class="section-label checklist-label" >Is Mix Minus Narration present and complete:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("IsMixMinusNarrationPresentAndComplete")  )  %>
			   
									  
			   <td class="section-label checklist-label" >Is there 10 seconds of black between programme & Textless:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("IsThere10SecondsOfBlackBetweenProgrammeAndTextless") )  %>
     	 </tr>
   
	    <tr>
				 <td class="section-label checklist-label" >Does the programme start on the hour:</td>
				  <% SetChecklistText( rsChecklistBanijayRights.Fields("DoesTheProgrammeStartOnTheHour")  )  %>
				
			   <td class="section-label checklist-label" >Mono vs Stereo Checked?:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("MonoVsStereoChecked"))  %>
			   
									  
			   <td class="section-label checklist-label" >Is there 10 seconds of black before end of file:</td>
			   <% SetChecklistText(  rsChecklistBanijayRights.Fields("IsThere10SecondsOfBlackBeforeEndOfFile") )  %>
     	 </tr>
   
	   
	   <tr>
				 <td class="section-label checklist-label" >Is the programme Seamless or Parted:</td>
				  <% SetChecklistText( rsChecklistBanijayRights.Fields("IsTheProgrammeSeamlessOrParted")  )  %>
				
			   <td class="section-label checklist-label" >Audio in sync:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("AudioInSync") )  %>
			   
				  <td class="checklist-empty-label">&nbsp;</td>
		     	<td class="section-text checklist-empty-text">&nbsp;</td>	
     	 </tr>
	    
		 
		  <tr>
				 <td class="section-label checklist-label" >If parted, specify (if 1 second black between parts):</td>
				  <% SetChecklistText( rsChecklistBanijayRights.Fields("IfPartedSpecifyIfOneSecondBlackBetweenParts")   )  %>
				
			   <td class="section-label checklist-label" >WAVS supplied:</td>
			   <% SetChecklistText( rsChecklistBanijayRights.Fields("WAVSSupplied") )  %>
			   
				  <td class="checklist-empty-label">&nbsp;</td>
		     	<td class="section-text checklist-empty-text">&nbsp;</td>	
     	 </tr>
	    
		  <tr>
				 <td class="section-label checklist-label" >Parted breaks logged:</td>
				  <% SetChecklistText( rsChecklistBanijayRights.Fields("PartedBreaksLogged")   )  %>
				
			   <td class="section-label checklist-label" >All associated WAVS present:</td>
			    <% SetChecklistAndSpanText( rsChecklistBanijayRights.Fields("AllAssociatedWAVSPresent") )  %> 
			   
				  <td class="checklist-empty-label">&nbsp;</td>
		     	<td class="section-text checklist-empty-text">&nbsp;</td>	
     	 </tr>
		 
            <tr>
				 <td class="section-label checklist-label" >Bumpers present and logged:</td>
				  <% SetChecklistText(rsChecklistBanijayRights.Fields("BumpersPresentAndLogged") )  %>
				
			    <td class="checklist-empty-label">&nbsp;</td>
		     	<td class="section-text checklist-empty-text">&nbsp;</td>	
			   
				  <td class="checklist-empty-label">&nbsp;</td>
		     	<td class="section-text checklist-empty-text">&nbsp;</td>	
     	 </tr>
	    
				
				
	    <tr>
				 <td class="section-label checklist-label" > Noted in comments:  "International Sales and Distribution Banijay Rights" credit present (or Not Present) within the end Credit roller: </td>
				  <% SetChecklistText( rsChecklistBanijayRights.Fields("InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments") )  %>
				
			    <td class="checklist-empty-label">&nbsp;</td>
		     	<td class="section-text checklist-empty-text">&nbsp;</td>	
			   
				  <td class="checklist-empty-label">&nbsp;</td>
		     	<td class="section-text checklist-empty-text">&nbsp;</td>	
     	 </tr>	
		 
		 <tr>
				 <td class="section-label checklist-label" > Noted in Log:  ESI / Banijay logo at the end of program: </td>
				  <% SetChecklistText( rsChecklistBanijayRights.Fields("DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram") )  %>
				
			    <td class="checklist-empty-label">&nbsp;</td>
		     	<td class="section-text checklist-empty-text">&nbsp;</td>	
			   
				  <td class="checklist-empty-label">&nbsp;</td>
		     	<td class="section-text checklist-empty-text">&nbsp;</td>	
     	 </tr>	
		 
		  <tr>
				 <td class="section-label checklist-label" > Noted in Log:  All End Logos: </td>
				  <% SetChecklistText( rsChecklistBanijayRights.Fields("AllEndLogos")  )  %>
				
			    <td class="checklist-empty-label">&nbsp;</td>
		     	<td class="section-text checklist-empty-text">&nbsp;</td>	
			   
				  <td class="checklist-empty-label">&nbsp;</td>
		     	<td class="section-text checklist-empty-text">&nbsp;</td>	
     	 </tr>	
				
 
	          
 </table>
 
 <table width="100%" border="0" cellspacing="0" cellpadding="0" >	 
            <tr> 
	            <td>&nbsp;</td>
	          </tr>
 </table>
 
 <!-- <div class="PageBreak"></div> -->
 
  <table class="section-table" border="0" cellspacing="0" cellpadding="1">
			  <tr>
			     <td class="section-header" >Compliance </td>
			   </tr>
		  </table>

			<p></p>
 
 <table class="section-table" border="1" cellspacing="0" cellpadding="2" >	 
	
	  
	  <tr> 
		<td colspan="4"  class="section-sub-header">All Compliance in programme checked and logged:
           <b>   <% 
				  If Not IsNull(rsChecklistBanijayRights.Fields("VideoComplianceCheckedAndLogged")) Then
				   Response.Write  IIf(rsChecklistBanijayRights.Fields("VideoComplianceCheckedAndLogged"), "Yes", "No") 
				  End If
			 %> </b>

		</td>
	  </tr>
	
	  
	  
	  <tr> 
		<td class="section-sub-header" colspan="2">Video</td>
		<td class="section-sub-header" colspan="2">Audio</td>
	  </tr>
	  
	  
	  
	   <tr> 
		<td   class="section-label checklist-2-label" >Flashing Lights / Epilepsy Warning Present:</td>
		  <% SetChecklistText_2( rsChecklistBanijayRights.Fields("FlashingLightsOrEpilepsyWarningPresent") ) %>
		  
		  <td   class="section-label checklist-2-label" >Content Censored - Bleeped:</td>
		  <% SetChecklistText_2( rsChecklistBanijayRights.Fields("AudioContentCensoredBleepedOrBlurred") ) %>
		  
	  </tr>
	  
	  <tr> 
		<td   class="section-label checklist-2-label" > Content Censored - Blurred:</td>
		  <% SetChecklistText_2( rsChecklistBanijayRights.Fields("VideoContentCensoredBleepedOrBlurred") ) %>
		  
		  <td   class="section-label checklist-2-label" >Extreme Language Present:</td>
		  <% SetChecklistText_2( rsChecklistBanijayRights.Fields("ExtremeLanguagePresent") ) %>
		  
	  </tr>
	  
	  <tr> 
		<td   class="section-label checklist-2-label" >  Nudity Present:</td>
		  <% SetChecklistText_2( rsChecklistBanijayRights.Fields("NudityPresent")) %>
		  
		  <td   class="section-label checklist-2-label" >Time Specific:  Audio Present:</td>
		  <% SetChecklistText_2( rsChecklistBanijayRights.Fields("TimeSpecificAudioPresent") ) %>
		  
	  </tr>
	  
	   <tr> 
		<td   class="section-label checklist-2-label" >  Rude Gestures:</td>
		  <% SetChecklistText_2(rsChecklistBanijayRights.Fields("RudeGestures")) %>
		  
		  <td   class="checklist-2-empty-label" >&nbsp;</td>
		 <td   class="checklist-2-empty-text" >&nbsp;</td>
		  
	  </tr>
	  
	   <tr> 
		<td   class="section-label checklist-2-label" >   Harm or Offence Present: (Including Drug And Alchol Abuse):</td>
		  <% SetChecklistText_2( rsChecklistBanijayRights.Fields("HarmOrOffencePresentIncludingDrugAndAlcholAbuse") ) %>
		  
		  <td   class="checklist-2-empty-label" >&nbsp;</td>
		 <td   class="checklist-2-empty-text" >&nbsp;</td>
		  
	  </tr>
	  
	    <tr> 
		<td   class="section-label checklist-2-label" >  Time Specific: Text Present:</td>
		  <% SetChecklistText_2( rsChecklistBanijayRights.Fields("TimeSpecificTextPresent") ) %>
		  
		  <td   class="checklist-2-empty-label" >&nbsp;</td>
		 <td   class="checklist-2-empty-text" >&nbsp;</td>
		  
	  </tr>
	  
	    <tr> 
		<td   class="section-label checklist-2-label" >   Product Placement Present:</td>
		  <% SetChecklistText_2( rsChecklistBanijayRights.Fields("ProductPlacementPresent") ) %>
		  
		  <td   class="checklist-2-empty-label" >&nbsp;</td>
		 <td   class="checklist-2-empty-text" >&nbsp;</td>
		  
	  </tr>
	  
	  <tr> 
		<td   class="section-label checklist-2-label" >   Country specific phone numbers, competitions, websites & hashtags:</td>
		  <% SetChecklistText_2( rsChecklistBanijayRights.Fields("CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags") ) %>
		  
		  <td   class="checklist-2-empty-label" >&nbsp;</td>
		 <td   class="checklist-2-empty-text" >&nbsp;</td>
		  
	  </tr>
	  
	  
	  	  
 </table>
 
 
 <%    End If  %> 