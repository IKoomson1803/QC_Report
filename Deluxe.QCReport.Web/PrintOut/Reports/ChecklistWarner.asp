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
	   <td colspan="2"  class="section-label">Video and Content:</td>
	   <td colspan="2"  class="section-label"4>Audio and Metadata</td>
  </tr>
   
    <tr>
     <td class="section-label checklist-2-label" >Was OV report supplied:</td>
	  <td class="section-text checklist-2-text" >
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("WasOVReportSupplied")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("WasOVReportSupplied"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  <td class="section-label checklist-2-label" >Is Audio on file OV:</td>
	  <td class="section-text checklist-2-text" >
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsAudioOnFileOV")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("IsAudioOnFileOV"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
   
   
    <tr>
     <td class="section-label" >Were localised text documents supplied:</td>
	  <td class="section-text" >
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("WereAllLocalisedTextDocumentsSupplied")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("WereAllLocalisedTextDocumentsSupplied"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	    <td  <td class="section-label" >Does the audio channel layout match the original versions (with no M&E):</td>
		  <td class="section-text" >
				  
		   <%
				  If Not IsNull(rsChecklistWarner.Fields("DoesTheAudioChannelLayoutMatchOriginalVersionsWithNoMandE")) Then
				   Response.Write  rsChecklistWarner.Fields("DoesTheAudioChannelLayoutMatchOriginalVersionsWithNoMandE")
				  End If
			 %>
		  
		  </td>
	   
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
	  <td class="section-text" >
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	 <td <td class="section-label" >Does the audio language match the original versions:</td>
	  <td class="section-text" >
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("DoesTheAudioLanguageMatchOriginalVersions")) Then
			   Response.Write  rsChecklistWarner.Fields("DoesTheAudioLanguageMatchOriginalVersions")
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
     <td <td class="section-label" >Do OV Timecodes and approved faults match the created language variant:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	   <td  <td class="section-label" >Is There M&E on File:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsThereMAndEOnFile")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("IsThereMAndEOnFile"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
      <td <td class="section-label" >Has the slate been checked for Text content / Timings / Audio config:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig"), "Yes", "No") 
			  End If
		 %>
	  </td>
	  
	  <td  <td class="section-label" >Is 5.1 audio config L, R, C, LFE, Ls, Rs:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
	  
  </tr>
  
   <tr>
      <td <td class="section-label" >Has the Aspect Ratio been checked on the slate and programme:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  <td class="section-label" >Audio / Video Sync Checked / Logged:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("AudioOrVideoSyncCheckedOrLogged")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("AudioOrVideoSyncCheckedOrLogged"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
  
  
  </tr>
  
   <tr>
    <td <td class="section-label" >Is created language variant File Normal Video Range:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsCreatedLanguageVariantFileNormalVideoRange")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("IsCreatedLanguageVariantFileNormalVideoRange"), "Yes", "No") 
			  End If
		 %>
	  </td>
	    
	<td  <td class="section-label" >Has all File Metadata been checked:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("HasAllFileMetadatBeenChecked")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("HasAllFileMetadatBeenChecked"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
	  
  </tr>
  
  
   <tr>
     <td <td class="section-label" >Are all inserts Normal Video Range:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("AreAllInsertsNormalVideoRange")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("AreAllInsertsNormalVideoRange"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	 <td  <td class="section-label" >File format:</td>
	  <td class="section-text" >
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("FileFormat")) Then
			   Response.Write  rsChecklistWarner.Fields("FileFormat") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
  
	<td <td class="section-label" >Have all localised inserts been checked for text content / Graphics / Spelling / Grammar:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  <td class="section-label" >Codec:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("Codec")) Then
			   Response.Write  rsChecklistWarner.Fields("Codec")
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
     <td <td class="section-label" >First and last cut been checked / logged as reference:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("FirstAndLastCutBeenCheckedOrloggedAsReference")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("FirstAndLastCutBeenCheckedOrloggedAsReference"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  <td class="section-label" >Standard / Frame rate:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("StandardOrFrameRate")) Then
			   Response.Write  rsChecklistWarner.Fields("StandardOrFrameRate") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
     <td <td class="section-label" >Is Dub Card Normal Video Range:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsDubCardNormalVideoRange")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("IsDubCardNormalVideoRange"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  class="section-label" >Resolution:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("Resolution")) Then
			   Response.Write  rsChecklistWarner.Fields("Resolution")
			  End If
		 %>
	  
	  </td>

	  
  </tr>
  
   <tr>
    
	    <td  class="section-label" >Has the Dub Card been checked for text content / Graphics / Spelling / Grammar:</td>
		  <td class="section-text">
		
		   <%
				  If Not IsNull(rsChecklistWarner.Fields("HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar")) Then
				   Response.Write  IIf(rsChecklistWarner.Fields("HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar"), "Yes", "No") 
				  End If
			 %>
		  </td>
	   
	      <td  class="section-label" >Progressive:</td>
		  <td class="section-text" >
				  
		   <%
				  If Not IsNull(rsChecklistWarner.Fields("Progressive")) Then
				   Response.Write  IIf(rsChecklistWarner.Fields("Progressive"), "Yes", "No") 
				  End If
			 %>
		  
		  </td>
  
  
  </tr>
  
   <tr>
         <td  class="section-label" >Has all texted content been listed in Localised language in report and checked:</td>
		  <td class="section-text">
		
		   <%
				  If Not IsNull(rsChecklistWarner.Fields("HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked")) Then
				   Response.Write  IIf(rsChecklistWarner.Fields("HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked"), "Yes", "No") 
				  End If
			 %>
		  </td>
	   
	   <td  class="section-label" >CLAP Present:</td>
	  <td  class="section-text">
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("CLAPPresent")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("CLAPPresent"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
      <td  class="section-label" >Is the New Warner Bros Blue Shield Logo Present Top / Tail:</td>
	  <td class="section-text">
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail")) Then
			   Response.Write  rsChecklistWarner.Fields("IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail")
			  End If
		 %>
	  </td>
	   	   
	 <td  class="section-label" >Audio Bit Depth / Rate:</td>
	  <td class="section-text" >
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("AudioBitDepthOrRate")) Then
			   Response.Write  rsChecklistWarner.Fields("AudioBitDepthOrRate") 
			  End If
		 %>
	  
	  </td>
	    
  </tr>
  
  
  <tr>
  
   <td  class="section-label" >Is Audio Discrete:</td>
	<td class="section-text" >
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsAudioDiscreate")) Then
			   Response.Write  rsChecklistWarner.Fields("IsAudioDiscreate")
			  End If
		 %>
	  
	  </td>
		  
     <td  class="section-label" ></td>
	 <td ></td>
	 
		  
  
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
 