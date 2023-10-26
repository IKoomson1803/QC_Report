 <%
'' Function IIf(bClause, sTrue, sFalse)
    ''If CBool(bClause) Then
       '' IIf = sTrue
  ''  Else 
      ''  IIf = sFalse
   '' End If
''End Function
 
 %>
 
 
 <% If Not rsChecklistWarner.BOF = True And Not rsChecklistWarner.EOF = True Then %>
      <% If Not IsNull(rsChecklistWarner.Fields("ChecklistCompleted"))  And rsChecklistWarner.Fields("ChecklistCompleted") = true Then %> 
	  
	   <table width="100%" border="0" cellspacing="0" cellpadding="0" >
			   <tr>
			     <td class="section-header" >Checklist: Warner Localised Variants&nbsp;|&nbsp;File to Spec: 
				         <%
							  If Not IsNull(rsChecklistWarner.Fields("IsFile")) Then
							    Response.Write  IIf(rsChecklistWarner.Fields("IsFile"), "Yes", "No") 
							  End If
					  %>
				 </td>
			   
			   </tr>
		  </table>	   

			<p></p>
 
 
   <table width="100%" border="1" cellspacing="0" cellpadding="0" >
      
   <tr>
	   <td colspan="2"  class="section-sub-header">Video and Content:</td>
	   <td colspan="2"  class="section-sub-header"Audio and Metadata</td>
  </tr>
   
    <tr>
     <td class="section-label checklist-2-label" >Was OV report supplied:</td>
	 <% SetChecklistText_2( rsChecklistWarner.Fields("WasOVReportSupplied") ) %>
	
	  <td  <td class="section-label checklist-2-label" >Is Audio on file OV:</td>
	  <% SetChecklistText_2( rsChecklistWarner.Fields("IsAudioOnFileOV") ) %>
	   
  </tr>
   
   
    <tr>
     <td class="section-label" >Were localised text documents supplied:</td>
	 <% SetChecklistText_2( rsChecklistWarner.Fields("WereAllLocalisedTextDocumentsSupplied") ) %>
	 
	  
	    <td  <td class="section-label" >Does the audio channel layout match the original versions (with no M&E):</td>
		<% SetChecklistText_2( rsChecklistWarner.Fields("DoesTheAudioChannelLayoutMatchOriginalVersionsWithNoMandE") ) %>
		
		
	   
	   <!--
	   <td >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Is the audio channel layout 5.1 + 2.0:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklistWarner.Fields("IsTheAudioChannelLayout_5_1_And_2_0")) Then
						   Response.Write  IIf(rsChecklistWarner.Fields("IsTheAudioChannelLayout_5_1_And_2_0"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
    -->
  </tr>
  
  
   <tr>
    <td class="section-label" >Was OV report used to create the language variant report & time codes / faults copied:</td>
	<% SetChecklistText_2( rsChecklistWarner.Fields("WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied") ) %>
		   
	 <td <td class="section-label" >Does the audio language match the original versions:</td>
	 <% SetChecklistText_2( rsChecklistWarner.Fields("DoesTheAudioLanguageMatchOriginalVersions") ) %>
	 
	 </tr>
  
   <tr>
     <td <td class="section-label" >Do OV Timecodes and approved faults match the created language variant:</td>
	 <% SetChecklistText_2( rsChecklistWarner.Fields("DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant") ) %>
	 
	  <td  <td class="section-label" >Is There M&E on File:</td>
	   <% SetChecklistText_2( rsChecklistWarner.Fields("IsThereMAndEOnFile") ) %>
	 
  
  </tr>
  
   <tr>
      <td <td class="section-label" >Has the slate been checked for Text content / Timings / Audio config:</td>
	    <% SetChecklistText_2( rsChecklistWarner.Fields("HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig") ) %>
	  
	
	  <td  <td class="section-label" >Is 5.1 audio config L, R, C, LFE, Ls, Rs:</td>
	    <% SetChecklistText_2( rsChecklistWarner.Fields("Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs") ) %>
	  
	 	  
  </tr>
  
   <tr>
      <td <td class="section-label" >Has the Aspect Ratio been checked on the slate and programme:</td>
	     <% SetChecklistText_2( rsChecklistWarner.Fields("HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme") ) %>
	  
	 <td  <td class="section-label" >Audio / Video Sync Checked / Logged:</td>
	    <% SetChecklistText_2( rsChecklistWarner.Fields("AudioOrVideoSyncCheckedOrLogged") ) %>
	 
	
  </tr>
  
   <tr>
    <td <td class="section-label" >Is created language variant File Normal Video Range:</td>
	   <% SetChecklistText_2( rsChecklistWarner.Fields("IsCreatedLanguageVariantFileNormalVideoRange") ) %>
    
	<td  <td class="section-label" >Has all File Metadata been checked:</td>
	   <% SetChecklistText_2( rsChecklistWarner.Fields("HasAllFileMetadatBeenChecked") ) %>
	

  </tr>
  
  
   <tr>
     <td <td class="section-label" >Are all inserts Normal Video Range:</td>
	    <% SetChecklistText_2( rsChecklistWarner.Fields("AreAllInsertsNormalVideoRange") ) %>
	 
	 <td  <td class="section-label" >File format:</td>
	    <% SetChecklistText_2(  rsChecklistWarner.Fields("FileFormat")  ) %>
	
  </tr>
  
   <tr>
  
	<td <td class="section-label" >Have all localised inserts been checked for text content / Graphics / Spelling / Grammar:</td>
	   <% SetChecklistText_2(  rsChecklistWarner.Fields("HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar")  ) %>
	
	  
	  <td  <td class="section-label" >Codec:</td>
	     <% SetChecklistText_2(  rsChecklistWarner.Fields("Codec")  ) %>
	 
  
  </tr>
  
   <tr>
     <td <td class="section-label" >First and last cut been checked / logged as reference:</td>
	   <% SetChecklistText_2(  rsChecklistWarner.Fields("FirstAndLastCutBeenCheckedOrloggedAsReference")  ) %>
	 
	  <td  <td class="section-label" >Standard / Frame rate:</td>
	   <% SetChecklistText_2(  rsChecklistWarner.Fields("StandardOrFrameRate") ) %>
	  
	   
  </tr>
  
   <tr>
     <td <td class="section-label" >Is Dub Card Normal Video Range:</td>
	   <% SetChecklistText_2(  rsChecklistWarner.Fields("IsDubCardNormalVideoRange") ) %>

	  <td  class="section-label" >Resolution:</td>
	   <% SetChecklistText_2(   rsChecklistWarner.Fields("Resolution") ) %>
	
  </tr>
  
   <tr>
    
	    <td  class="section-label" >Has the Dub Card been checked for text content / Graphics / Spelling / Grammar:</td>
		<% SetChecklistText_2(  rsChecklistWarner.Fields("HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar") ) %>
		
	   
	      <td  class="section-label" >Progressive:</td>
		  <% SetChecklistText_2(  rsChecklistWarner.Fields("Progressive") ) %>
		  
		
  </tr>
  
   <tr>
         <td  class="section-label" >Has all texted content been listed in Localised language in report and checked:</td>
		 <% SetChecklistText_2( rsChecklistWarner.Fields("HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked") ) %>
	
	   <td  class="section-label" >CLAP Present:</td>
	   <% SetChecklistText_2(rsChecklistWarner.Fields("CLAPPresent") ) %>
	   
	 
  </tr>
  
   <tr>
      <td  class="section-label" >Is the New Warner Bros Blue Shield Logo Present Top / Tail:</td>
	   <% SetChecklistText_2( rsChecklistWarner.Fields("IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail") ) %>
	   
	  <td  class="section-label" >Audio Bit Depth / Rate:</td>
	   <% SetChecklistText_2( rsChecklistWarner.Fields("AudioBitDepthOrRate")  ) %>
	
  </tr>
  
  
  <tr>
  
   <td  class="section-label" >Is Audio Discrete:</td>
    <% SetChecklistText_2( rsChecklistWarner.Fields("IsAudioDiscreate")  ) %>
 
     <td  class="section-label" >&nbsp;</td>
	 <td section-text checklist-empty-text>&nbsp;</td>
	 
		  
  
  </tr>
   
   
     </table>
	 
 <% End If %>	 
	 
     
  <% End If %>
	
	
  <%
   If Not rsChecklistWarner Is Nothing Then
     rsChecklistWarner.Close
	 set rsChecklistWarner = Nothing
	End If 
  %>
 