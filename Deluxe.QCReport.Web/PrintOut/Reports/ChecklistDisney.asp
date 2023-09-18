 <div class="div-frame-border-3">
  
 <% If Not rsChecklist.BOF = True And Not rsChecklist.EOF = True Then %>
    <% If Not IsNull(rsChecklist.Fields("ChecklistCompleted"))  And rsChecklist.Fields("ChecklistCompleted") = true Then %> 
   
  <table width="100%" border="0" cellspacing="0" cellpadding="0" >
    <tr>
	    <td class="header bottom_border"  colspan="5">
		<table width="100%" border="0" cellspacing="0" cellpadding="1" >
			   <tr>
			     <td class="header  bottom_border" >&nbsp;CHECKLIST - DISNEY INVENTORY SPEC&nbsp;|&nbsp;File to Spec: 
				       <%
							  If Not IsNull(rsChecklist.Fields("IsFile")) Then
							    Response.Write  IIf(rsChecklist.Fields("IsFile"), "Yes", "No") 
							  End If
					  %>
				 </td>
			   
			   </tr>
		  </table>	   
		</td>
	</tr>
	 <tr>
	   <td   class="right_bottom_border" style="font-weight:bold;text-align:center;width:33.3%">&nbsp;Video to Spec</td>
	   <td   class="right_bottom_border"   style="font-weight:bold;text-align:center;width:33.3%">&nbsp;Audio to Spec</td>
	   <td    class="bottom_border" style="font-weight:bold;text-align:center;width:33.3%">&nbsp;Programme Layout to Spec</td>
	 </tr>
	  <tr>
	   <td class="right_bottom_border" >
	       
             <table  style="width:100%" cellspacing="0">
			   <tr>
			   <td  style="width:60%;">&nbsp;File Type:</td>
			   <td  style="width:40%">&nbsp;		  
				   <%
					  If Not IsNull(rsChecklist.Fields("FileType")) Then
					   Response.Write  rsChecklist.Fields("FileType") 
					  End If
				  %>
		        </td>
			   </tr>
			 </table>
		  
       </td>

       <td class="right_bottom_border">
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;24 Tracks Present:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklist.Fields("Audio24TracksPresent")) Then
							   Response.Write  IIf(rsChecklist.Fields("Audio24TracksPresent"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td class="bottom_border">
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:80%;">&nbsp;Timecode:00:00:00:00:</td>
				  <td  style="width:20%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklist.Fields("VideoTimecode")) Then
						   Response.Write  IIf(rsChecklist.Fields("VideoTimecode"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	 
	 </tr>
	<!--  -->
	
	
	    <tr>
	   <td class="right_bottom_border">
	       
             <table style="width:100%" cellspacing="0">
			   <tr>
			   <td style="width:60%;">&nbsp;Standard Definition:</td>
			   <td style="width:40%">&nbsp;		  
				   <%
					  If Not IsNull(rsChecklist.Fields("StandardDefinition")) Then
					   Response.Write  rsChecklist.Fields("StandardDefinition") 
					  End If
				  %>
		        </td>
			   </tr>
			 </table>
		  
       </td>

       <td class="right_bottom_border">
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;Audio Track Layout:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							If Not IsNull(rsChecklist.Fields("AudioTrackLayout")) Then
							   Response.Write  IIf(rsChecklist.Fields("AudioTrackLayout"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td >
		   <table style="width:100%" cellspacing="0" class="bottom_border">
		      <tr>
			      <td  style="width:80%;">&nbsp;Head Build Present:</td>
				  <td  style="width:20%">&nbsp;
						  
				   <%
						 If Not IsNull(rsChecklist.Fields("ProgrammeHeadBuild")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeHeadBuild"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	 
	 </tr>
	   
	  <tr>
	   <td>
	       
             <table style="width:100%" cellspacing="0" class="right_bottom_border">
			   <tr>
			   <td style="width:60%;">&nbsp;File Name to Spec:</td>
			   <td style="width:40%">&nbsp;		  
				   <%
					  If Not IsNull(rsChecklist.Fields("FileName")) Then
						   Response.Write  IIf(rsChecklist.Fields("FileName"), "Yes", "No") 
						  End If
				  %>
		        </td>
			   </tr>
			 </table>
		  
       </td>

       <td >
		    <table style="width:100%" cellspacing="0" class="right_bottom_border">
			   <tr>
			      <td style="width:70%;">&nbsp;Codec:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklist.Fields("AudioCodec")) Then
							   Response.Write  rsChecklist.Fields("AudioCodec") 
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td class="bottom_border">
		   <table style="width:100%" cellspacing="0" >
		      <tr>
			      <td  style="width:80%;">&nbsp;Slate Present:</td>
				  <td  style="width:20%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeSlatePresent")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeSlatePresent"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	 
	 </tr>
	
	  <tr>
	   <td class="right_bottom_border">
	       
             <table style="width:100%" cellspacing="0">
			   <tr>
			   <td style="width:60%;">&nbsp;File Jes: (Quick Time):</td>
			   <td style="width:40%">&nbsp;		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoJesExtensifier")) Then
								   Response.Write  IIf(rsChecklist.Fields("VideoJesExtensifier"), "Yes", "No") 
								  End If
				  %>
		        </td>
			   </tr>
			 </table>
		  
       </td>

       <td class="right_bottom_border">
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;Sample Rate:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
						 If Not IsNull(rsChecklist.Fields("AudioSampleRate")) Then
						     Response.Write  rsChecklist.Fields("AudioSampleRate")
						  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td class="bottom_border">
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:80%;">&nbsp;Programme start: (1s Black - Video and Audio):</td>
				  <td  style="width:20%">&nbsp;
						  
				   <%
						   If Not IsNull(rsChecklist.Fields("ProgrammeStart1stBlackVideoAndAudio")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeStart1stBlackVideoAndAudio"), "Yes", "No") 
							  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	 
	 </tr>
	   <tr>
	   <td class="right_bottom_border">
	       
             <table style="width:100%" cellspacing="0">
			   <tr>
			   <td style="width:60%;">&nbsp;Container / Wrapper:</td>
			   <td style="width:40%">&nbsp;		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoContainerOrWrapper")) Then
					   Response.Write  rsChecklist.Fields("VideoContainerOrWrapper") 
					  End If
				  %>
		        </td>
			   </tr>
			 </table>
		  
       </td>

       <td class="right_bottom_border">
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;Bit Rate:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklist.Fields("AudioBitRate")) Then
							   Response.Write  rsChecklist.Fields("AudioBitRate")
							  End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td class="bottom_border" >
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:80%;">&nbsp;Textless Elements Present:</td>
				  <td  style="width:20%">&nbsp;
						  
				   <%
						   If Not IsNull(rsChecklist.Fields("ProgrammeTextlessElementsPresent")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeTextlessElementsPresent"), "Yes", "No") 
							  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	 
	 </tr>
	 
	   <tr>
	   <td class="right_bottom_border">
	       
             <table style="width:100%" cellspacing="0">
			   <tr>
			   <td style="width:60%;">&nbsp;Codec:</td>
			   <td style="width:40%">&nbsp;		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoCodec")) Then
					   Response.Write  rsChecklist.Fields("VideoCodec") 
					  End If
				  %>
		        </td>
			   </tr>
			 </table>
		  
       </td>

       <td class="right_bottom_border">
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;Bit Depth:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklist.Fields("AudioBitDepth")) Then
						        Response.Write  rsChecklist.Fields("AudioBitDepth")
						       End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td class="bottom_border">
		   <table style="width:100%" cellspacing="0">
		      <tr>
			  
			     	  <td  style="width:80%;">&nbsp;Black Between Programme And Textless Elements to spec:</td>
					  <td  style="width:20%">&nbsp;
							  
					   <%
							  If Not IsNull(rsChecklist.Fields("ProgrammeBlackBetweenProgrammeAndTextlessElements")) Then
						         Response.Write  IIf(rsChecklist.Fields("ProgrammeBlackBetweenProgrammeAndTextlessElements"), "Yes", "No") 
						      End If
						 %>
					  
					  </td>
				    
	   
			   </tr>
	  	   </table>
		  </td>
	 
	 </tr>
	 
	   <tr>
	   <td class="right_bottom_border">
	       
             <table style="width:100%" cellspacing="0">
			   <tr>
			   <td style="width:60%;">&nbsp;Resolution:</td>
			   <td style="width:40%">&nbsp;		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoResolution")) Then
					   Response.Write  rsChecklist.Fields("VideoResolution") 
					  End If
				  %>
		        </td>
			   </tr>
			 </table>
		  
       </td>

       <td class="right_bottom_border">
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;Channels Discrete:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							 If Not IsNull(rsChecklist.Fields("AudioChannelsDiscrete")) Then
						       Response.Write  IIf(rsChecklist.Fields("AudioChannelsDiscrete"), "Yes", "No") 
						    End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td class="bottom_border">
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:80%;">&nbsp;Full Textless Covers For Texted Shots Present:</td>
				  <td  style="width:20%">&nbsp;
						  
				   <%
						 If Not IsNull(rsChecklist.Fields("ProgrammeFullTextlessCoversForTextedShotsPresent")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeFullTextlessCoversForTextedShotsPresent"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	 
	 </tr>
	 
	   <tr>
	   <td class="right_bottom_border">
	       
             <table style="width:100%" cellspacing="0">
			   <tr>
			   <td style="width:60%;">&nbsp;Frame Rate / Standard:</td>
			   <td style="width:40%">&nbsp;		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoFrameRateOrStandard")) Then
					   Response.Write  rsChecklist.Fields("VideoFrameRateOrStandard") 
					  End If
				  %>
		        </td>
			   </tr>
			 </table>
		  
       </td>

       <td class="right_bottom_border">
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;Audio Tracks Labelled / Tagged In QT:</td>
					  <td style="width:30%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklist.Fields("AudioTracksLabelledOrtTaggedInQT")) Then
						        Response.Write  IIf(rsChecklist.Fields("AudioTracksLabelledOrtTaggedInQT"), "Yes", "No") 
						      End If
						 %>
					  </td>
			   </tr>
		
			</table>
	   </td>
	   
	   <td class="bottom_border">
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:80%;">&nbsp;Does Textless Aspect Ratio match programme:</td>
				  <td  style="width:20%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
	 
	 </tr>
	 
	   <tr>
	   <td class="right_bottom_border">
	       
             <table style="width:100%" cellspacing="0">
			   <tr>
			   <td style="width:60%;">&nbsp;Display Aspect Ratio:</td>
			   <td style="width:40%">&nbsp;		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoDisplayAspectRatio")) Then
					   Response.Write  rsChecklist.Fields("VideoDisplayAspectRatio") 
					  End If
				  %>
		        </td>
			   </tr>
			 </table>
		  
       </td>
	   
	   <td class="right_bottom_border">
		   <table style="width:100%" cellspacing="0">
		      <tr>
			      <td  style="width:70%;">&nbsp;Textless Gaps 1 Or 2s:</td>
				  <td  style="width:30%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeTextlessGaps1Or2s")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeTextlessGaps1Or2s"), "Yes", "No") 
							  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>

      <td class="bottom_border">
	       
             <table style="width:100%" cellspacing="0">
			   <tr>
			   <td style="width:80%;">&nbsp;Progressive:</td>
			   <td style="width:20%">&nbsp;		  
				   <%
					  If Not IsNull(rsChecklist.Fields("VideoProgressive")) Then
				     Response.Write  IIf(rsChecklist.Fields("VideoProgressive"), "Yes", "No") 
					 End If
				  %>
		        </td>
			   </tr>
			 </table>
		  
       </td>
	   
	   
	 
	 </tr>
	 
	   <tr>
	   
	   <td class="right_border">
		   <table style="width:100%" cellspacing="0" >
		      <tr>
			      <td  style="width:60%;">&nbsp;Programme end: (1s Black - Video and Audio):</td>
				  <td  style="width:40%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeEnd1stBlackVideoAndAudio")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeEnd1stBlackVideoAndAudio"), "Yes", "No") 
							  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  	   </table>
		  </td>
		  
		   <td class="right_border">
			   
				 <table style="width:100%" cellspacing="0">
				   <tr>
				   <td style="width:70%;">&nbsp;CLAP Present:</td>
				   <td style="width:30%">&nbsp;		  
					   <%
						   If Not IsNull(rsChecklist.Fields("VideoCLAP")) Then
							   Response.Write  IIf(rsChecklist.Fields("VideoCLAP"), "Yes", "No") 
							  End If
					  %>
					</td>
				   </tr>
				 </table>
			  
		   </td>
	   
	   

       <td class="right_border">
		    <table style="width:100%" cellspacing="0">
			   <tr>
			      <td style="width:70%;">&nbsp;</td>
				  <td style="width:30%">&nbsp;</td>	
					
			   </tr>
		
			</table>
	   </td>
	   
	   
	 </tr>
	 
	    
   </table>
   
   </div>
   
   <% End If %>
   
   <% End If %>
	
	
  <%
   If Not rsChecklist Is Nothing Then
     rsChecklist.Close
	 set rsChecklist = Nothing
	End If 
  %>