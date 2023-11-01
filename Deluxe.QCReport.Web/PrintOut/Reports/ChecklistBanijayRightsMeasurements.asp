 <%  If Not rsChecklistBanijayRights.BOF= True And Not rsChecklistBanijayRights.EOF= True Then %> 
  
   
    <!--   **************** FILE DETAILS ********************************   
       <table width="100%" border="1" cellspacing="0" cellpadding="2" >	 
	        <tr >
			    <td align="center" colspan="4" style="font-weight:bold;font-size:14px;text-align:center;" ><b>FILE</b></td>
	      </tr>
	       <tr>
	     	 <td colspan="2" style="padding-left:2px;font-size:14px;font-weight:bold; ">Filename:&nbsp;<%=rsHeader.Fields("Filename")%></td>
	      </tr>
		   <tr>
		     <td style="width:70%;padding-left:2px;">Banijay file to Spec:&nbsp;
			  <b>
			       <%
					  If rsChecklistBanijayRights.Fields("FileToSpec") <> "" Then
					   Response.Write  IIf(rsChecklistBanijayRights.Fields("FileToSpec"), "Yes", "No") 
					  End If
				  %>
			 
			 </b>
	 
			 </td>
		      
			  <td style="width:30%; padding-left:2px;" >Decode check pass:
					   	  <b>
						   <%
							  If rsChecklistBanijayRights.Fields("DecodeCheckPass") <> "" Then
							   Response.Write  IIf(rsChecklistBanijayRights.Fields("DecodeCheckPass"), "Yes", "No") 
							  End If
						  %>
						</b>
					
	          </td>
		   </tr>
     </table>
	  -->

	   
    <table class="section-table" border="0" cellspacing="0" cellpadding="1">
		  <tr>
			<td class="section-header">MEASUREMENTS</td>
		  </tr>
   </table>

  <p></p>
	 
	 
	 <!-- *********************** MEASUREMENTS ******************************   -->
      <table class="section-table"  border="1" cellspacing="0" cellpadding="1">
	    
	   <tr> 
			  <td width="25%" ><span style="font-size:14px; font-weight:bold;">Format:<b>&nbsp; <b>   <%=rsHeader.Fields("Format")%></b></td>
			  <td width="25%" ><span style="font-size:14px; font-weight:bold;">Standard:<b>&nbsp; <b>   <%=rsHeader.Fields("Standard")%></b></td>
			  <td width="25%" ><span style="font-size:14px; font-weight:bold;">Aspect Ratio:<b>&nbsp; <b>   <%=rsHeader.Fields("Aspect")%></b></td>
			   <td width="25%"><span style="font-size:14px; font-weight:bold;">Frame Size:<b>&nbsp; <b>   <%=rsChecklistBanijayRights.Fields("FrameSizeOrResolution")%></b></td>
			</tr>
	  
	         <tr> 
			   <td width="25%">Video Codec:&nbsp; <b><b>   <%=rsChecklistBanijayRights.Fields("VideoCodec")%></b></td>
			    <td width="25%">Video Bit Depth:&nbsp; <b><b>   <%=rsChecklistBanijayRights.Fields("VideoBitDepth")%></b></td>
			  <td width="25%">Video Bit Rate:&nbsp;<b><b>   <%=rsChecklistBanijayRights.Fields("VideoBitRate")%></b> </td>
			   <td width="25%">Frame Rate:&nbsp; <b><b>   <%=rsChecklistBanijayRights.Fields("FrameRate")%></b></td>
			</tr>
	  
           <tr> 
			   <td width="25%">Audio Codec:&nbsp; <b><b>   <%=rsChecklistBanijayRights.Fields("AudioCodec")%></b></td>
			    <td width="25%">Audio Bit Depth:&nbsp;<b><b>   <%=rsChecklistBanijayRights.Fields("AudioBitDepth")%></b> </td>
			  <td width="25%">Audio Bit Rate:&nbsp;<b><b>   <%=rsChecklistBanijayRights.Fields("AudioBitRate")%></b> </td>
			  <td width="25%">Sample Rate:&nbsp; <b><b>   <%=rsChecklistBanijayRights.Fields("SampleRate")%></b></td>
				
			</tr>
	  
 
        <tr> 
		       <td width="25%">Discrete:&nbsp; <b><b>   <%=rsChecklistBanijayRights.Fields("Discrete")%></b></td>
		 	   <td width="25%">&nbsp;</td>
			  <td width="25%">&nbsp;</td>
			  <td width="25%">&nbsp;</td>
			 	
			</tr>
 
     </table>
   
    <!--       *************** METADATA *****************************      -->
   
   <table width="100%" border="0" cellspacing="0" cellpadding="0" >	 
	        <tr>
			<td>&nbsp; </td>
	    </tr>
	 </table>
	 
	
	 
	 
	 <table width="100%" border="1" cellspacing="0" cellpadding="2" >
	   <tr >
			    <td align="center" colspan="3" style="font-weight:bold;font-size:14px;text-align:center;" ><b>METADATA</b></td>
	      </tr>
	        <tr>
			    <td  style="width:33%; padding-left:2px" >
		 
					   Is the file Metadata correct:
					   		  
						   <b>   <% 
							   If Not IsNull(rsChecklistBanijayRights.Fields("IsTheFileMetadataCorrect")) Then
				                    Response.Write  rsChecklistBanijayRights.Fields("IsTheFileMetadataCorrect") 
				               End If
						  %> </b>
			              
		        </td>
				<td  style="width:33%; padding-left:2px" >
		 
					   Interlaced / Progressive correctly flagged:
					   		  
						   <b>   <% 
							   If Not IsNull(rsChecklistBanijayRights.Fields("InterlacedOrProgressiveCorrectlyFlagged")) Then
				                    Response.Write  rsChecklistBanijayRights.Fields("InterlacedOrProgressiveCorrectlyFlagged") 
				               End If
						  %> </b>
			  
		        </td>
				
				<td  style="width:33%; padding-left:2px" >
		 
					   CLAP Present:
					   		  
						   <b>   <% 
							   If Not IsNull(rsChecklistBanijayRights.Fields("CLAPPresent")) Then
				                    Response.Write  rsChecklistBanijayRights.Fields("CLAPPresent") 
				               End If
						  %> </b>
			  
		        </td>
				
					

	      </tr>
		  
		  <tr>
		  
		      <td  style="width:33%; padding-left:2px" >
		 
					   Colour Primaries Present:
					   		  
						   <b>   <% 
							   If Not IsNull(rsChecklistBanijayRights.Fields("ColourPrimariesPresent")) Then
				                    Response.Write  rsChecklistBanijayRights.Fields("ColourPrimariesPresent") 
				               End If
						  %> </b>
			  
		        </td>
		  
		   <td  style="width:33%; padding-left:2px" >
		 
					   Transfer Characteristics Present:
					   		  
						   <b>   <% 
							   If Not IsNull(rsChecklistBanijayRights.Fields("TransferCharacteristicsPresent")) Then
				                    Response.Write  rsChecklistBanijayRights.Fields("TransferCharacteristicsPresent") 
				               End If
						  %> </b>
			  
		        </td>
		 
		   <td  style="width:33%; padding-left:2px" >
		 
					   Matrix Coefficients Present:
					   		  
						   <b>   <% 
							   If Not IsNull(rsChecklistBanijayRights.Fields("MatrixCoefficientsPresent")) Then
				                    Response.Write  rsChecklistBanijayRights.Fields("MatrixCoefficientsPresent") 
				               End If
						  %> </b>
			  
		        </td>
		  
	
		  
		  </tr>
		  
		  
		  
	 </table>
 
<%    End If  %> 	  
 
 