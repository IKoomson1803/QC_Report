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
			     <td class="section-header" >&nbsp;Checklist: Warner Localised VariantS&nbsp;|&nbsp;File to Spec: 
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
	   <td colspan="2"  class="section-detail">&nbsp;Video and Content:</td>
	   <td colspan="2"  class="section-detail"4>&nbsp;Audio and Metadata</td>
  </tr>
   
    <tr>
     <td class="section-detail">&nbsp;Was OV report supplied:</td>
	  <td>&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("WasOVReportSupplied")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("WasOVReportSupplied"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  class="section-detail">&nbsp;Is Audio on file OV:</td>
	  <td>&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsAudioOnFileOV")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("IsAudioOnFileOV"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
   
   
    <tr>
     <td class="section-detail">&nbsp;Were localised text documents supplied:</td>
	  <td>&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("WereAllLocalisedTextDocumentsSupplied")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("WereAllLocalisedTextDocumentsSupplied"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	    <td  class="section-detail">&nbsp;Does the audio channel layout match the original versions (with no M&E):</td>
		  <td>&nbsp;
				  
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
    <td class="section-detail">&nbsp;Was OV report used to create the language variant report & time codes / faults copied:</td>
	  <td>&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	 <td class="section-detail" >&nbsp;Does the audio language match the original versions:</td>
	  <td>&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("DoesTheAudioLanguageMatchOriginalVersions")) Then
			   Response.Write  rsChecklistWarner.Fields("DoesTheAudioLanguageMatchOriginalVersions")
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
     <td class="section-detail" >&nbsp;Do OV Timecodes and approved faults match the created language variant:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	   <td  class="section-detail" >&nbsp;Is There M&E on File:</td>
	  <td  >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsThereMAndEOnFile")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("IsThereMAndEOnFile"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
      <td class="section-detail" >&nbsp;Has the slate been checked for Text content / Timings / Audio config:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig"), "Yes", "No") 
			  End If
		 %>
	  </td>
	  
	  <td  class="section-detail" >&nbsp;Is 5.1 audio config L, R, C, LFE, Ls, Rs:</td>
	  <td  >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
	  
  </tr>
  
   <tr>
      <td class="section-detail" >&nbsp;Has the Aspect Ratio been checked on the slate and programme:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  class="section-detail" >&nbsp;Audio / Video Sync Checked / Logged:</td>
	  <td  >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("AudioOrVideoSyncCheckedOrLogged")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("AudioOrVideoSyncCheckedOrLogged"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
  
  
  </tr>
  
   <tr>
    <td class="section-detail" >&nbsp;Is created language variant File Normal Video Range:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsCreatedLanguageVariantFileNormalVideoRange")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("IsCreatedLanguageVariantFileNormalVideoRange"), "Yes", "No") 
			  End If
		 %>
	  </td>
	    
	<td  class="section-detail" >&nbsp;Has all File Metadata been checked:</td>
	  <td  >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("HasAllFileMetadatBeenChecked")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("HasAllFileMetadatBeenChecked"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
	  
  </tr>
  
  
   <tr>
     <td class="section-detail" >&nbsp;Are all inserts Normal Video Range:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("AreAllInsertsNormalVideoRange")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("AreAllInsertsNormalVideoRange"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	 <td  class="section-detail" >&nbsp;File format:</td>
	  <td  >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("FileFormat")) Then
			   Response.Write  rsChecklistWarner.Fields("FileFormat") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
  
	<td class="section-detail" >&nbsp;Have all localised inserts been checked for text content / Graphics / Spelling / Grammar:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  class="section-detail" >&nbsp;Codec:</td>
	  <td  >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("Codec")) Then
			   Response.Write  rsChecklistWarner.Fields("Codec")
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
     <td class="section-detail" >&nbsp;First and last cut been checked / logged as reference:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("FirstAndLastCutBeenCheckedOrloggedAsReference")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("FirstAndLastCutBeenCheckedOrloggedAsReference"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  class="section-detail" >&nbsp;Standard / Frame rate:</td>
	  <td  >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("StandardOrFrameRate")) Then
			   Response.Write  rsChecklistWarner.Fields("StandardOrFrameRate") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
     <td class="section-detail" >&nbsp;Is Dub Card Normal Video Range:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsDubCardNormalVideoRange")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("IsDubCardNormalVideoRange"), "Yes", "No") 
			  End If
		 %>
	  </td>
	   
	  <td  class="section-detail" >&nbsp;Resolution:</td>
	  <td  >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("Resolution")) Then
			   Response.Write  rsChecklistWarner.Fields("Resolution")
			  End If
		 %>
	  
	  </td>

	  
  </tr>
  
   <tr>
    
	    <td class="section-detail" >&nbsp;Has the Dub Card been checked for text content / Graphics / Spelling / Grammar:</td>
		  <td >&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistWarner.Fields("HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar")) Then
				   Response.Write  IIf(rsChecklistWarner.Fields("HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar"), "Yes", "No") 
				  End If
			 %>
		  </td>
	   
	      <td  class="section-detail" >&nbsp;Progressive:</td>
		  <td  >&nbsp;
				  
		   <%
				  If Not IsNull(rsChecklistWarner.Fields("Progressive")) Then
				   Response.Write  IIf(rsChecklistWarner.Fields("Progressive"), "Yes", "No") 
				  End If
			 %>
		  
		  </td>
  
  
  </tr>
  
   <tr>
         <td class="section-detail" >&nbsp;Has all texted content been listed in Localised language in report and checked:</td>
		  <td >&nbsp;
		
		   <%
				  If Not IsNull(rsChecklistWarner.Fields("HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked")) Then
				   Response.Write  IIf(rsChecklistWarner.Fields("HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked"), "Yes", "No") 
				  End If
			 %>
		  </td>
	   
	   <td  class="section-detail" >&nbsp;CLAP Present:</td>
	  <td  >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("CLAPPresent")) Then
			   Response.Write  IIf(rsChecklistWarner.Fields("CLAPPresent"), "Yes", "No") 
			  End If
		 %>
	  
	  </td>
  
  </tr>
  
   <tr>
      <td class="section-detail" >&nbsp;Is the New Warner Bros Blue Shield Logo Present Top / Tail:</td>
	  <td >&nbsp;
	
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail")) Then
			   Response.Write  rsChecklistWarner.Fields("IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail")
			  End If
		 %>
	  </td>
	   	   
	 <td  class="section-detail" >&nbsp;Audio Bit Depth / Rate:</td>
	  <td  >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("AudioBitDepthOrRate")) Then
			   Response.Write  rsChecklistWarner.Fields("AudioBitDepthOrRate") 
			  End If
		 %>
	  
	  </td>
	    
  </tr>
  
  
  <tr>
  
   <td  class="section-detail" >&nbsp;Is Audio Discrete:</td>
	<td  >&nbsp;
			  
	   <%
			  If Not IsNull(rsChecklistWarner.Fields("IsAudioDiscreate")) Then
			   Response.Write  rsChecklistWarner.Fields("IsAudioDiscreate")
			  End If
		 %>
	  
	  </td>
		  
     <td class="section-detail" >&nbsp;</td>
	 <td >&nbsp;</td>
	 
		  
  
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
 