 <% If Not rsChecklistBanijayRights.BOF = True And Not rsChecklistBanijayRights.EOF = True Then %>
      <% If Not IsNull(rsChecklistBanijayRights.Fields("ChecklistCompleted"))  And rsChecklistBanijayRights.Fields("ChecklistCompleted") = true Then %> 
	  
  <table width="100%" border="1" cellspacing="0" cellpadding="0" >	  
	    <tr >
			<td style="text-align:center;font-weight: bold;"  colspan="10">
			&nbsp;CHECKLIST - Banijay Rights&nbsp; 
			</td>
	 </tr>
	   <tr>
	       <td style="font-weight:bold;text-align:center;width:40%" colspan="4" >&nbsp;FILE & MEASUREMENTS</td>
	       <td  style="font-weight:bold;text-align:center;width:60%" colspan="6">&nbsp;SPECIFICS</td>
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
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
	       <td style="width:10%" >
		         <table style="width:100%" cellspacing="0">
			   <tr>
			   <td style="width:60%;padding-left:3px">Decode check pass:</td>
			   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("InterlacedOrProgressiveCorrectlyFlagged")) Then
				                    Response.Write  IIf(rsChecklistBanijayRights.Fields("InterlacedOrProgressiveCorrectlyFlagged"), "Yes", "No") 
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
					   <td style="width:40%;padding-left:3px">		  
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
	       <td style="width:10%" >
		     <table style="width:100%" cellspacing="0">
			     <tr>
					   <td style="width:60%;padding-left:3px">Confirm the video format:</td>
					   <td style="width:40%;padding-left:3px">		  
						   <%
							   If Not IsNull(rsChecklistBanijayRights.Fields("Format")) Then
								  Response.Write  rsChecklistBanijayRights.Fields("Format") 
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
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
	       <td  style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Bit Rate Video:</td>
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
	       <td  style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Frame size / Resolution:</td>
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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
	       <td  style="width:10%" >
		     <table style="width:100%" cellspacing="0">
				     <tr>
					   <td style="width:60%;padding-left:3px">Aspect Ratio:</td>
					   <td style="width:40%;padding-left:3px">		  
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
					   <td style="width:40%;padding-left:3px">		  
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