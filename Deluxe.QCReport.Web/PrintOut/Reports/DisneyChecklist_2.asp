 <%
 Function IIf(bClause, sTrue, sFalse)
    If CBool(bClause) Then
        IIf = sTrue
    Else 
        IIf = sFalse
    End If
End Function
 
 %>
 
  <% If Not rsChecklist.BOF = True And Not rsChecklist.EOF = True Then %>
  
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
	    <td style="text-align:center;font-weight: bold;border-left: 2px solid;border-top: 2px solid;border-bottom: 1px solid;border-right: 2px solid"  colspan="5">
		<table width="100%" border="0" cellspacing="0" cellpadding="1" >
			   <tr>
			     <td style="text-align:center;font-weight:bold;" >&nbsp;CHECKLIST - DISNEY INVENTORY SPEC&nbsp;|&nbsp;File to Spec: 
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
      <td valign="top" style="height:100%;width:33.3%">
	      <table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000" style="height:100%" >
	         <tr >
			   <td colspan="2" style="text-align:center;font-weight:bold;">&nbsp;Video to Spec</td>
		   </tr> 
	      <tr>
			      <td  style="width:50%">&nbsp;File Type</td>
					  <td  style="width:50%">&nbsp;
					  
					  <%
							  If Not IsNull(rsChecklist.Fields("FileType")) Then
							   Response.Write  rsChecklist.Fields("FileType") 
							  End If
					  %>
					  
					  </td>
			   </tr>
			   <tr>
			       <td >&nbsp;Standard Definition</td>
					  <td >&nbsp;
							   
					   <%
							  If Not IsNull(rsChecklist.Fields("StandardDefinition")) Then
							   Response.Write  rsChecklist.Fields("StandardDefinition") 
							  End If
					  %>
					  
					  </td>
			   </tr>
				<tr>
				<td>&nbsp;File Name to Spec</td>
				  <td >&nbsp;
						  
					 <%
						  If Not IsNull(rsChecklist.Fields("FileName")) Then
						   Response.Write  IIf(rsChecklist.Fields("FileName"), "Yes", "No") 
						  End If
					 %>
				  
				  
				  </td>
	   
				</tr>
	             <tr>
				      <td >&nbsp;File Jes: (Quick Time)</td>
						  <td >&nbsp;
								  
						   <%
								  If Not IsNull(rsChecklist.Fields("VideoJesExtensifier")) Then
								   Response.Write  IIf(rsChecklist.Fields("VideoJesExtensifier"), "Yes", "No") 
								  End If
							 %>
						  </td>
				</tr>
				 <tr>
				      <td >&nbsp;Container / Wrapper</td>
					  <td >&nbsp;
							  
						<%
							  If Not IsNull(rsChecklist.Fields("VideoContainerOrWrapper")) Then
							   Response.Write  rsChecklist.Fields("VideoContainerOrWrapper")
							  End If
						 %>
					  </td>
		  
				 </tr>
	  
	          <tr>
			        <td >&nbsp;Video Codec</td>
					  <td >&nbsp;
							  
					   <%
							  If Not IsNull(rsChecklist.Fields("VideoCodec")) Then
							   Response.Write  rsChecklist.Fields("VideoCodec")
							  End If
						 %>
					  
					  </td>
			   </tr>
	  
	          <tr>
				      <td >&nbsp;Resolution</td>
					  <td >&nbsp;
					  
					  <%
							  If Not IsNull(rsChecklist.Fields("VideoResolution")) Then
							   Response.Write  rsChecklist.Fields("VideoResolution")
							  End If
						 %>
					  
					  </td>
				</tr>
	            <tr>
			       <td >&nbsp;Frame Rate / Standard</td>
				  <td >&nbsp;
				 
				   <%
						  If Not IsNull(rsChecklist.Fields("VideoFrameRateOrStandard")) Then
						   Response.Write  rsChecklist.Fields("VideoFrameRateOrStandard")
						  End If
					 %>
				  </td>
			   </tr>
				 <tr>
				     <td >&nbsp;Display Aspect Ratio</td>
						  <td >&nbsp;
						  
						  <%
								  If Not IsNull(rsChecklist.Fields("VideoDisplayAspectRatio")) Then
								   Response.Write  rsChecklist.Fields("VideoDisplayAspectRatio") 
								  End If
							 %>
						  </td>
				</tr>
	 
			       <td >&nbsp;Progressive</td>
					  <td >&nbsp;
					  
					  <%
							  If Not IsNull(rsChecklist.Fields("VideoProgressive")) Then
							   Response.Write  IIf(rsChecklist.Fields("VideoProgressive"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   <tr>
			   <tr>
			        <td >&nbsp;CLAP Present</td>
				  <td >&nbsp;

				   <%
						  If Not IsNull(rsChecklist.Fields("VideoCLAP")) Then
						   Response.Write  IIf(rsChecklist.Fields("VideoCLAP"), "Yes", "No") 
						  End If
					 %>
				  </td>
			   </tr>
				<tr>
				      <td >&nbsp;Colour Primaries Present</td>
					  <td >&nbsp;
					  
					  <%
							  If Not IsNull(rsChecklist.Fields("VideoColourPrimaries")) Then
							   Response.Write  rsChecklist.Fields("VideoColourPrimaries") ''IIf(rsChecklist.Fields("VideoColourPrimaries"), "Yes", "No") 
							  End If
						 %>
					  </td>
				</tr>
			    <tr>
				   <td >&nbsp;Transfer Characteristics Present</td>
					  <td >&nbsp;
					  
					   <%
							  If Not IsNull(rsChecklist.Fields("VideoTransferCharacteristics")) Then
							   Response.Write rsChecklist.Fields("VideoTransferCharacteristics") '' IIf(rsChecklist.Fields("VideoTransferCharacteristics"), "Yes", "No") 
							  End If
						 %>
					  </td>
				</tr>
				 <tr>
				 <td >&nbsp;Matrix Coefficients Present</td>
				  <td >&nbsp;
				  
				   <%
						  If Not IsNull(rsChecklist.Fields("VideoMatrixCoefficients")) Then
						   Response.Write  rsChecklist.Fields("VideoMatrixCoefficients") '' IIf(rsChecklist.Fields("VideoMatrixCoefficients"), "Yes", "No") 
						  End If
					 %>
				  </td>
				 </tr>
	  
	  
	      </table>
	  </td>
	  
	  <td>&nbsp;</td>
  
      <td valign="top" style="height:100%;width:33.3%">
	      <table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000" style="height:100%">
	          <tr >
			    <td colspan="2" style="text-align:center;font-weight:bold;">&nbsp;Audio to Spec</td>
		    </tr> 
	  
	            <tr>
			      <td style="width:50%">&nbsp;24 Tracks Present</td>
					  <td style="width:50%">&nbsp;
					
					   <%
							  If Not IsNull(rsChecklist.Fields("Audio24TracksPresent")) Then
							   Response.Write  IIf(rsChecklist.Fields("Audio24TracksPresent"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
			   <tr>
			    <td >&nbsp;Audio Track Layout</td>
					  <td >&nbsp;
					  
					   <%
							  If Not IsNull(rsChecklist.Fields("AudioTrackLayout")) Then
							   Response.Write  IIf(rsChecklist.Fields("AudioTrackLayout"), "Yes", "No") 
							  End If
						 %>
					  </td>
			   </tr>
			   <tr>
			      <td >&nbsp;Audio Codec</td>
					  <td >&nbsp;
					  
					  <%
							  If Not IsNull(rsChecklist.Fields("AudioCodec")) Then
							   Response.Write  rsChecklist.Fields("AudioCodec") 
							  End If
						 %>
					  </td>
			   </tr>
				<tr>
				     <td >&nbsp;Sample Rate</td>
				  <td >&nbsp;
				
				  <%
						  If Not IsNull(rsChecklist.Fields("AudioSampleRate")) Then
						   Response.Write  rsChecklist.Fields("AudioSampleRate")
						  End If
					 %>
				  </td>
				</tr>
			    <tr>
				     <td >&nbsp;Bit Rate</td>
					  <td >&nbsp;
					  
					  <%
							  If Not IsNull(rsChecklist.Fields("AudioBitRate")) Then
							   Response.Write  rsChecklist.Fields("AudioBitRate")
							  End If
						 %>
					  </td>
				</tr>
				<tr>
				<td >&nbsp;Bit Depth</td>
				  <td >&nbsp;
				 
				   <%
						  If Not IsNull(rsChecklist.Fields("AudioBitDepth")) Then
						   Response.Write  rsChecklist.Fields("AudioBitDepth")
						  End If
					 %>
				  </td>
	   
				</tr>
	          <tr>
			        <td >&nbsp;Channels Discrete</td>
				  <td >&nbsp;
				  
				   <%
						  If Not IsNull(rsChecklist.Fields("AudioChannelsDiscrete")) Then
						   Response.Write  IIf(rsChecklist.Fields("AudioChannelsDiscrete"), "Yes", "No") 
						  End If
					 %>
				  </td>
			   <tr>
			 <tr>
			     
				 <td >&nbsp;Audio Tracks Labelled / Tagged In QT</td>
				  <td >&nbsp;
				  <%
					   If Not IsNull(rsChecklist.Fields("AudioTracksLabelledOrtTaggedInQT")) Then
						   Response.Write  IIf(rsChecklist.Fields("AudioChannelsDiscrete"), "Yes", "No") 
						  End If
						  
				 %>
				  </td>
			 </tr>
	       <!--<tr>
			     
				 <td >&nbsp;</td>
				  <td >&nbsp; </td>
			 </tr>
	        <tr>
			     
				 <td >&nbsp;</td>
				  <td >&nbsp; </td>
			 </tr>
	         <tr>
			     
				 <td >&nbsp;</td>
				  <td >&nbsp; </td>
			 </tr>
	        <tr>
			     
				 <td >&nbsp;</td>
				  <td >&nbsp; </td>
			 </tr>
	        <tr>
			     
				 <td >&nbsp;</td>
				  <td >&nbsp; </td>
			 </tr>
	         <tr>
			     
				 <td >&nbsp;</td>
				  <td >&nbsp; </td>
			 </tr>-->
			 
	      </table>
	  
	  
	  </td>
	  
	  <td>&nbsp;</td>
  
      <td valign="top" style="height:100%;width:33.3%">
	    <table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000" style="height:100%">
	      <tr >
			   <td colspan="2" style="text-align:center;font-weight:bold;">&nbsp;Programme Layout to Spec</td>
		   </tr> 
		   
		   <tr>
			      <td  style="width:50%">&nbsp;Timecode:00:00:00:00</td>
				  <td  style="width:50%">&nbsp;
						  
				   <%
						  If Not IsNull(rsChecklist.Fields("VideoTimecode")) Then
						   Response.Write  IIf(rsChecklist.Fields("VideoTimecode"), "Yes", "No") 
						  End If
					 %>
				  
				  </td>
	   
			   </tr>
	  
	     <tr>
			        <td >&nbsp;Head Build Present</td>
				  <td >&nbsp;
				 
				  <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeHeadBuild")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeHeadBuild"), "Yes", "No") 
						  End If
					 %>
				  </td>
			   </tr>
				<tr>
				  <td >&nbsp;Slate Present</td>
				  <td >&nbsp;
				 
				   <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeSlatePresent")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeSlatePresent"), "Yes", "No") 
						  End If
					 %>
				  </td>
				</tr>
				
				 <tr>
				     <td >&nbsp;Programme start: (1s Black - Video and Audio)</td>
					  <td >&nbsp;
					  
					  <%
							  If Not IsNull(rsChecklist.Fields("ProgrammeStart1stBlackVideoAndAudio")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeStart1stBlackVideoAndAudio"), "Yes", "No") 
							  End If
						 %>
					  </td>
				</tr>
				
				<tr>
				   <td >&nbsp;Textless Elements Present</td>
					  <td >&nbsp;
					  
						<%
							  If Not IsNull(rsChecklist.Fields("ProgrammeTextlessElementsPresent")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeTextlessElementsPresent"), "Yes", "No") 
							  End If
						 %>
					  
					  </td>
		
				 </tr>
				 
			 <% If Not IsNull(rsChecklist.Fields("ProgrammeTextlessElementsPresent")) And rsChecklist.Fields("ProgrammeTextlessElementsPresent") = True Then %>
			   <tr>
			     <td >&nbsp;Black Between Programme And Textless Elements to spec</td>
				  <td >&nbsp;
				   <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeBlackBetweenProgrammeAndTextlessElements")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeBlackBetweenProgrammeAndTextlessElements"), "Yes", "No") 
						  End If
					 %>
				  </td>
			   </tr>
			   <tr>
			       <td >&nbsp;Full Textless Covers For Texted Shots Present</td>
				  <td >&nbsp;
				  
				  <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeFullTextlessCoversForTextedShotsPresent")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeFullTextlessCoversForTextedShotsPresent"), "Yes", "No") 
						  End If
					 %>
				  </td>
			   </tr>
			   <tr>
			       <td >&nbsp;Does Textless Aspect Ratio match programme</td>
				  <td >&nbsp;
				  
				  <%
						  If Not IsNull(rsChecklist.Fields("ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot")) Then
						   Response.Write  IIf(rsChecklist.Fields("ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot"), "Yes", "No") 
						  End If
					 %>
				  </td>
			   </tr>
				<tr>
				     <td >&nbsp;Textless Gaps 1 Or 2s</td>
					  <td >&nbsp;
					  
					  <%
							  If Not IsNull(rsChecklist.Fields("ProgrammeTextlessGaps1Or2s")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeTextlessGaps1Or2s"), "Yes", "No") 
							  End If
						 %>
					  </td>
				</tr>
				<%End If%>
				
				
				
			    <tr>
				     <td >&nbsp;Programme end: (1s Black - Video and Audio)</td>
					  <td >&nbsp;
					  
					  <%
							  If Not IsNull(rsChecklist.Fields("ProgrammeEnd1stBlackVideoAndAudio")) Then
							   Response.Write  IIf(rsChecklist.Fields("ProgrammeEnd1stBlackVideoAndAudio"), "Yes", "No") 
							  End If
						 %>
					  </td>
				</tr>
	   <!--
	           <tr>
			     
				 <td >&nbsp;</td>
				  <td >&nbsp; </td>
			 </tr>
	         <tr>
			     
				 <td >&nbsp; N/A</td>
				  <td >&nbsp; N/A</td>
			 </tr>
	        <tr>
			     
				 <td >&nbsp;N/A</td>
				  <td >&nbsp;N/A </td>
			 </tr>
			 <tr>
			     
				 <td >&nbsp;N/A</td>
				  <td >&nbsp; N/A</td>
			 </tr>
	         --> 
	         <% If Not IsNull(rsChecklist.Fields("ProgrammeTextlessElementsPresent")) And rsChecklist.Fields("ProgrammeTextlessElementsPresent") = False Then %>
	          <!-- <tr>
			     
				 <td >&nbsp;N/A</td>
				  <td >&nbsp;N/A </td>
			 </tr>
	         <tr>
			     
				 <td >&nbsp;N/A</td>
				  <td >&nbsp;N/A </td>
			 </tr>
			 <tr>
			     
				 <td >&nbsp;N/A</td>
				  <td >&nbsp; N/A</td>
			 </tr>
	         <tr>
			     
				 <td >&nbsp;N/A</td>
				  <td >&nbsp; N/A</td>
			 </tr>
	           -->
	  
	         <%End If%>
	      </table>
	   </td>
  
  
  
  
  </tr>
   </table>
  
   <% End If %>
  
  <%
   If Not rsChecklist Is Nothing Then
     rsChecklist.Close
	 set rsChecklist = Nothing
	End If 
  %>