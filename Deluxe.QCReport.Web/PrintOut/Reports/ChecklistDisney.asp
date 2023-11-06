 
  
 <% If Not rsChecklist.BOF = True And Not rsChecklist.EOF = True Then %>
    <% If Not IsNull(rsChecklist.Fields("ChecklistCompleted"))  And rsChecklist.Fields("ChecklistCompleted") = true Then %> 
	
	 <table class="section-table" border="0" cellspacing="0" cellpadding="1">
			  <tr>
			     <td class="section-header" >Checklist - Disney Inventory Spec&nbsp;&nbsp;|&nbsp;&nbsp;File to Spec: 
				
				 &nbsp;
				       <%
							  If Not IsNull(rsChecklist.Fields("IsFile")) Then
							    Response.Write  IIf(rsChecklist.Fields("IsFile"), "Yes", "No") 
							  End If
					  %>
				 </td>
			   </tr>
		  </table>

			<p></p>

  <table class="section-table" border="1" cellspacing="0" cellpadding="0" >
   
	 <tr>
	   <td colspan="2"  class="section-sub-header" >Video to Spec</td>
	   <td colspan="2"  class="section-sub-header" >Audio to Spec</td>
	   <td colspan="2"  class="section-sub-header">Programme Layout to Spec</td>
	 </tr>
	  <tr>
	     <td class="section-label checklist-label" >File Type:</td>
		  <% SetChecklistText(rsChecklist.Fields("FileType") )  %>
		  
	   

       <td class="section-label checklist-label" >24 Tracks Present:</td>
	   <% SetChecklistText(rsChecklist.Fields("Audio24TracksPresent") )  %>
	   
							  
	   <td class="section-label checklist-label" >Timecode:00:00:00:00:</td>
	   <% SetChecklistText( rsChecklist.Fields("VideoTimecode") )  %>
	   
	
	 
	 </tr>
	
	
	 <tr>
	   <td class="section-label" >Standard Definition:</td>
	   <% SetChecklistText( rsChecklist.Fields("StandardDefinition") )  %>
	   
	
       <td class="section-label" >Audio Track Layout:</td>
	   <% SetChecklistText( rsChecklist.Fields("AudioTrackLayout") )  %>
	   
	
	   <td class="section-label" >Head Build Present:</td>
	   <% SetChecklistText( rsChecklist.Fields("ProgrammeHeadBuild") )  %>
	   
		
	 </tr>
	   
	  <tr>
	   <td class="section-label" >File Name to Spec:</td>
	   <% SetChecklistText(rsChecklist.Fields("FileName") )  %>
	   
	  <td class="section-label" >Codec:</td>
       <% SetChecklistText( rsChecklist.Fields("AudioCodec") )  %>
	   
	   <td class="section-label" >Slate Present:</td>
	    <% SetChecklistText( rsChecklist.Fields("ProgrammeSlatePresent") )  %>
	   
		 
	 </tr>
	
	  <tr>
	   <td class="section-label" >File Jes: (Quick Time):</td>
	   <% SetChecklistText(rsChecklist.Fields("VideoJesExtensifier")) %>
		

       <td class="section-label" >Sample Rate:</td>
	     <% SetChecklistText( rsChecklist.Fields("AudioSampleRate") )  %>
	   	   
	   <td class="section-label" >Programme start: (1s Black - Video and Audio):</td>
	    <% SetChecklistText( rsChecklist.Fields("ProgrammeStart1stBlackVideoAndAudio") )  %>
	   
			 
	 </tr>
	   <tr>
	   <td class="section-label" >Container / Wrapper:</td>
	    <% SetChecklistText( rsChecklist.Fields("VideoContainerOrWrapper") )  %>
	   
	   <td class="section-label" >Bit Rate:</td>
	    <% SetChecklistText( rsChecklist.Fields("AudioBitRate") )  %>
	   	  
	   <td class="section-label" >Textless Elements Present:</td>
	    <% SetChecklistText( rsChecklist.Fields("ProgrammeTextlessElementsPresent") )  %>
	  
	 </tr>
	 
	   <tr>
              <td class="section-label" >Codec:</td>
			   <% SetChecklistText( rsChecklist.Fields("VideoCodec")  )  %>
			  
			 
       <td class="section-label" >Bit Depth:</td>
	   <% SetChecklistText( rsChecklist.Fields("AudioBitDepth")  )  %>
   
      
	   <td class="section-label" >Black Between Programme And Textless Elements to spec:</td>
	   <% SetChecklistText( rsChecklist.Fields("ProgrammeBlackBetweenProgrammeAndTextlessElements")  )  %>
	
	 </tr>
	 
	   <tr>
	     
         <td class="section-label" >Resolution:</td>
		 <% SetChecklistText( rsChecklist.Fields("VideoResolution")  )  %>
		 	    
         <td class="section-label" >Channels Discrete:</td>
		 <% SetChecklistText( rsChecklist.Fields("AudioChannelsDiscrete" ) ) %>
		 
		 <td class="section-label" >Full Textless Covers For Texted Shots Present:</td>
		 <% SetChecklistText( rsChecklist.Fields("ProgrammeFullTextlessCoversForTextedShotsPresent") ) %>
		 
					 
	 </tr>
	 
	   <tr>
	     <td class="section-label" >Frame Rate / Standard:</td>
		 <% SetChecklistText( rsChecklist.Fields("ProgrammeFullTextlessCoversForTextedShotsPresent") ) %>
		
         <td class="section-label" >Audio Tracks Labelled / Tagged In QT:</td>
		  <% SetChecklistText( rsChecklist.Fields("AudioTracksLabelledOrtTaggedInQT") ) %>
		 
		 <td class="section-label" >Does Textless Aspect Ratio match programme:</td>
		  <% SetChecklistText( rsChecklist.Fields("ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot") ) %>
		 
	 
	   <tr>
	       <td class="section-label">Display Aspect Ratio:</td>
		     <% SetChecklistText( rsChecklist.Fields("VideoDisplayAspectRatio")  ) %>
		   
			<td class="section-label">Textless Gaps (1-2s):</td>
			  <% SetChecklistText( rsChecklist.Fields("ProgrammeTextlessGaps1Or2s")  ) %>
			
	      <td class="section-label" >Progressive:</td>
		    <% SetChecklistText( rsChecklist.Fields("VideoProgressive") ) %>
	
	 </tr>
	 
	   <tr>
	   
	       <td class="section-label" >Programme end: (1s Black - Video and Audio):</td>
		     <% SetChecklistText( rsChecklist.Fields("ProgrammeEnd1stBlackVideoAndAudio")  ) %>
			  
		   <td class="section-label" >CLAP Present:</td>
		     <% SetChecklistText( rsChecklist.Fields("VideoCLAP") ) %>

            <td class="checklist-empty-label">&nbsp;</td>
			<td class="section-text checklist-empty-text">&nbsp;</td>	
	   
	   
	 </tr>
	 
	    
   </table>
   

   
   <% End If %>
   
   <% End If %>
	
	
  <%
   If Not rsChecklist Is Nothing Then
     rsChecklist.Close
	 set rsChecklist = Nothing
	End If 
  %>