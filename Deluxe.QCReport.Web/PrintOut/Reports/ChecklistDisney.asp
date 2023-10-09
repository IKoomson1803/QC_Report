 
  
 <% If Not rsChecklist.BOF = True And Not rsChecklist.EOF = True Then %>
    <% If Not IsNull(rsChecklist.Fields("ChecklistCompleted"))  And rsChecklist.Fields("ChecklistCompleted") = true Then %> 
	
	 <table width="100%" border="0" cellspacing="0" cellpadding="1">
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
	   <td colspan="2"  class="section-label" >Video to Spec</td>
	   <td colspan="2"  class="section-label" >Audio to Spec</td>
	   <td colspan="2"  class="section-label" >Programme Layout to Spec</td>
	 </tr>
	  <tr>
	     <td class="section-label checklist-label" >File Type:</td>
			   <td class="section-text checklist-text" >		  
				   <%
					  If Not IsNull(rsChecklist.Fields("FileType")) Then
					   Response.Write  rsChecklist.Fields("FileType") 
					  End If
				  %>
		        </td>
	   
	   

       <td class="section-label checklist-label" >24 Tracks Present:</td>
					  <td class="section-text checklist-text">
					
					   <%
							  If Not IsNull(rsChecklist.Fields("Audio24TracksPresent")) Then
							   Response.Write  IIf(rsChecklist.Fields("Audio24TracksPresent"), "Yes", "No") 
							  End If
						 %>
					  </td>
					  
	   <td class="section-label checklist-label" >Timecode:00:00:00:00:</td>
				  <td  class="section-text checklist-text">
						  
				   <%
						  If Not IsNull(rsChecklist.Fields("VideoTimecode")) Then
						   Response.Write  IIf(rsChecklist.Fields("VideoTimecode"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	 
	 </tr>
	
	
	 <tr>
	   <td class="section-label" >Standard Definition:</td>
			   <td class="section-text">		  
				   <%
					  If Not IsNull(rsChecklist.Fields("StandardDefinition")) Then
					   Response.Write  rsChecklist.Fields("StandardDefinition") 
					  End If
				  %>
		        </td>

       <td class="section-label" >Audio Track Layout:</td>
					  <td class="section-text">
					
					   <%
							If Not IsNull(rsChecklist.Fields("AudioTrackLayout")) Then
							   Response.Write  IIf(rsChecklist.Fields("AudioTrackLayout"), "Yes", "No") 
							  End If
						 %>
					  </td>
	   
	   <td class="section-label" >Head Build Present:</td>
				  <td  class="section-text">
						  
				   <%
						 If Not IsNull(rsChecklist.Fields("ProgrammeHeadBuild")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeHeadBuild"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	 
	 </tr>
	   
	  <tr>
	   <td class="section-label" >File Name to Spec:</td>
			   <td class="section-text">		  
				   <%
					  If Not IsNull(rsChecklist.Fields("FileName")) Then
						   Response.Write  IIf(rsChecklist.Fields("FileName"), "Yes", "No") 
						  End If
				  %>
		        </td>

       <td class="section-label" >Codec:</td>
				 <td class="section-text">
					
					   <%
							  If Not IsNull(rsChecklist.Fields("AudioCodec")) Then
							   Response.Write  rsChecklist.Fields("AudioCodec") 
							  End If
						 %>
					  </td>
	   
	   <td class="section-label" >Slate Present:</td>
				  <td  class="section-text">
						  
				   <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeSlatePresent")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeSlatePresent"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	 
	 </tr>
	
	  <tr>
	   <td class="section-label" >File Jes: (Quick Time):</td>
			   <td class="section-text">		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoJesExtensifier")) Then
								   Response.Write  IIf(rsChecklist.Fields("VideoJesExtensifier"), "Yes", "No") 
								  End If
				  %>
		        </td>

       <td class="section-label" >Sample Rate:</td>
					  <td class="section-text">
					
					   <%
						 If Not IsNull(rsChecklist.Fields("AudioSampleRate")) Then
						     Response.Write  rsChecklist.Fields("AudioSampleRate")
						  End If
						 %>
					  </td>
	   
	   <td class="section-label" >Programme start: (1s Black - Video and Audio):</td>
				  <td  class="section-text">
						  
				   <%
						   If Not IsNull(rsChecklist.Fields("ProgrammeStart1stBlackVideoAndAudio")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeStart1stBlackVideoAndAudio"), "Yes", "No") 
							  End If
					 %>
				  
				  </td>
	 
	 </tr>
	   <tr>
	   <td class="section-label" >Container / Wrapper:</td>
			   <td class="section-text">		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoContainerOrWrapper")) Then
					   Response.Write  rsChecklist.Fields("VideoContainerOrWrapper") 
					  End If
				  %>
		        </td>

       <td class="section-label" >Bit Rate:</td>
					  <td >
					
					   <%
							  If Not IsNull(rsChecklist.Fields("AudioBitRate")) Then
							   Response.Write  rsChecklist.Fields("AudioBitRate")
							  End If
						 %>
					  </td>
	   
	   <td class="section-label" >Textless Elements Present:</td>
				  <td  class="section-text">
						  
				   <%
						   If Not IsNull(rsChecklist.Fields("ProgrammeTextlessElementsPresent")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeTextlessElementsPresent"), "Yes", "No") 
							  End If
					 %>
				  
				  </td>
	   
	 
	 </tr>
	 
	   <tr>
              <td class="section-label" >Codec:</td>
			   <td class="section-text">		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoCodec")) Then
					   Response.Write  rsChecklist.Fields("VideoCodec") 
					  End If
				  %>
		        </td>

       <td class="section-label" >Bit Depth:</td>
       <td class="section-text">
					
					   <%
							  If Not IsNull(rsChecklist.Fields("AudioBitDepth")) Then
						        Response.Write  rsChecklist.Fields("AudioBitDepth")
						       End If
						 %>
					  </td>
	   
	   <td class="section-label" >Black Between Programme And Textless Elements to spec:</td>
					  <td class="section-text" >
							  
					   <%
							  If Not IsNull(rsChecklist.Fields("ProgrammeBlackBetweenProgrammeAndTextlessElements")) Then
						         Response.Write  IIf(rsChecklist.Fields("ProgrammeBlackBetweenProgrammeAndTextlessElements"), "Yes", "No") 
						      End If
						 %>
					  
					  </td>
					  
		
	 
	 </tr>
	 
	   <tr>
	     
         <td class="section-label" >Resolution:</td>
	     <td class="section-text">		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoResolution")) Then
					   Response.Write  rsChecklist.Fields("VideoResolution") 
					  End If
				  %>
		        </td>

         <td class="section-label" >Channels Discrete:</td>
					  <td class="section-text">
					
					   <%
							 If Not IsNull(rsChecklist.Fields("AudioChannelsDiscrete")) Then
						       Response.Write  IIf(rsChecklist.Fields("AudioChannelsDiscrete"), "Yes", "No") 
						    End If
						 %>
					  </td>
	   
			 <td class="section-label" >Full Textless Covers For Texted Shots Present:</td>
				  <td class="section-text" >
						  
				   <%
						 If Not IsNull(rsChecklist.Fields("ProgrammeFullTextlessCoversForTextedShotsPresent")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeFullTextlessCoversForTextedShotsPresent"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
				  
			
			 
	 </tr>
	 
	   <tr>
	     <td class="section-label" >Frame Rate / Standard:</td>
			   <td class="section-text">		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoFrameRateOrStandard")) Then
					   Response.Write  rsChecklist.Fields("VideoFrameRateOrStandard") 
					  End If
				  %>
		        </td>

         <td class="section-label" >Audio Tracks Labelled / Tagged In QT:</td>
				  <td class="section-text">
					
					   <%
							  If Not IsNull(rsChecklist.Fields("AudioTracksLabelledOrtTaggedInQT")) Then
						        Response.Write  IIf(rsChecklist.Fields("AudioTracksLabelledOrtTaggedInQT"), "Yes", "No") 
						      End If
						 %>
					  </td>
	   
	     <td class="section-label" >Does Textless Aspect Ratio match programme:</td>
				  <td class="section-text" >
						  
				   <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	 </tr>
	 
	   <tr>
	       <td class="section-label">Display Aspect Ratio:</td>
			   <td class="section-text">		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoDisplayAspectRatio")) Then
					   Response.Write  rsChecklist.Fields("VideoDisplayAspectRatio") 
					  End If
				  %>
		        </td>
	   
	         <td class="section-label">Textless Gaps (1-2s):</td>
	        <td class="section-text">
						  
				   <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeTextlessGaps1Or2s")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeTextlessGaps1Or2s"), "Yes", "No") 
							  End If
					 %>
				  
				  </td>
	       
           <td class="section-label" >Progressive:</td>
			   <td class="section-text">		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoProgressive")) Then
				     Response.Write  IIf(rsChecklist.Fields("VideoProgressive"), "Yes", "No") 
					 End If
				  %>
		        </td>
	   
	   
	 
	 </tr>
	 
	   <tr>
	   
	       <td class="section-label" >Programme end: (1s Black - Video and Audio):</td>
				  <td class="section-text">
						  
				   <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeEnd1stBlackVideoAndAudio")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeEnd1stBlackVideoAndAudio"), "Yes", "No") 
							  End If
					 %>
				  
				  </td>
	   
		  
		   <td class="section-label" >CLAP Present:</td>
				   <td class="section-text">		  
					   <%
						   If Not IsNull(rsChecklist.Fields("VideoCLAP")) Then
							   Response.Write  IIf(rsChecklist.Fields("VideoCLAP"), "Yes", "No") 
							  End If
					  %>
					</td>
	   
	   

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