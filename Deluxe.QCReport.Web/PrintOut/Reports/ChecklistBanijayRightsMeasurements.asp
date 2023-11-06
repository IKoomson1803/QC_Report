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
			<td class="section-header">Measurements</td>
		  </tr>
   </table>

  <p></p>
	 
	 
	 <!-- *********************** MEASUREMENTS ******************************   -->
      <table class="section-table"  border="1" cellspacing="0" cellpadding="1">
	    
	   <tr> 
			    <td  class="section-label measurements-label" ><span style="font-size:14px; ">Format:</span></td>
			    <td class="section-text measurements-text" > <%=rsHeader.Fields("Format")%></td>
			  
			   <td  class="section-label measurements-label"><span style="font-size:14px;">Standard:</span></td>
			  <td class="section-text measurements-text" > <%=rsHeader.Fields("Standard")%></td>
			  
			  <td  class="section-label measurements-label"><span style="font-size:14px;">Aspect Ratio:</span></td>
			  <td class="section-text measurements-text" > <%=rsHeader.Fields("Aspect")%></td>
			  
			  <td  class="section-label measurements-label"><span style="font-size:14px;">Frame Size:</span></td>
			  <td class="section-text measurements-text" > <%=rsChecklistBanijayRights.Fields("FrameSizeOrResolution")%></td>
			  
			  
			</tr>
	  
	         <tr> 
			   <td  class="section-label measurements-label">Video Codec:</td>
			  <td class="section-text measurements-text" > <%=rsChecklistBanijayRights.Fields("VideoCodec")%></td>
			 
			 <td  class="section-label measurements-label">Video Bit Depth:</td>
			  <td class="section-text measurements-text" > <%=rsChecklistBanijayRights.Fields("VideoBitDepth")%></td>
			  
			 <td  class="section-label measurements-label">Video Bit Rate:</td>
			  <td class="section-text measurements-text" > <%=rsChecklistBanijayRights.Fields("VideoBitRate")%></td>
			  				
			   <td  class="section-label measurements-label">Frame Rate:</td>
			  <td class="section-text measurements-text" > <%=rsChecklistBanijayRights.Fields("FrameRate")%></td>
				  
			</tr>
	  
           <tr> 
		        <td  class="section-label measurements-label">Audio Codec:</td>
			  <td class="section-text measurements-text" > <%=rsChecklistBanijayRights.Fields("AudioCodec")%></td>
			  
			    <td  class="section-label measurements-label">Audio Bit Depth:</td>
			  <td class="section-text measurements-text" > <%=rsChecklistBanijayRights.Fields("AudioBitDepth")%></td>
			   
			 <td  class="section-label measurements-label">Audio Bit Rate:</td>
			  <td class="section-text measurements-text" > <%=rsChecklistBanijayRights.Fields("AudioBitRate")%></td>
			   
				 <td  class="section-label measurements-label">Sample Rate:</td>
			  <td class="section-text measurements-text" > <%=rsChecklistBanijayRights.Fields("SampleRate")%></td>
			 
							
			</tr>
	  
 
        <tr> 
		           
				 <td  class="section-label measurements-label">Discrete:</td>
			  <td class="section-text measurements-text" colspan="7"> <%=rsChecklistBanijayRights.Fields("Discrete")%></td>
		
		      
			 	
			</tr>
 
     </table>
   
    <!--       *************** METADATA *****************************      -->
   
   <table class="section-table" border="0" cellspacing="0" cellpadding="0" >	 
	        <tr>
			<td>&nbsp; </td>
	    </tr>
	 </table>
	 
	 <table class="section-table" border="0" cellspacing="0" cellpadding="1">
		  <tr>
			<td class="section-header">Metadata</td>
		  </tr>
   </table>

  <p></p>
	
	 
	 
	 <table width="100%" border="1" cellspacing="0" cellpadding="2" >
	 
	   <tr>
	          <td class="section-label checklist-label" >Is the file Metadata correct:</td>
			  <% SetChecklistText(rsChecklistBanijayRights.Fields("IsTheFileMetadataCorrect")  )  %>
			  
		     <td class="section-label checklist-label" >Interlaced / Progressive correctly flagged:</td>
		     <% SetChecklistText(rsChecklistBanijayRights.Fields("InterlacedOrProgressiveCorrectlyFlagged")  )  %>
									  
		     <td class="section-label checklist-label" >CLAP Present:</td>
		     <% SetChecklistText( rsChecklistBanijayRights.Fields("CLAPPresent")  )  %>
		   
	  </tr>
	 
	 <tr>
	          <td class="section-label checklist-label" >Colour Primaries Present:</td>
			  <% SetChecklistText(rsChecklistBanijayRights.Fields("ColourPrimariesPresent")   )  %>
			  
		     <td class="section-label checklist-label" > Transfer Characteristics Present:</td>
		     <% SetChecklistText(rsChecklistBanijayRights.Fields("TransferCharacteristicsPresent")  )  %>
									  
		     <td class="section-label checklist-label" >Matrix Coefficients Present:</td>
		     <% SetChecklistText( rsChecklistBanijayRights.Fields("MatrixCoefficientsPresent")  )  %>
		   
	  </tr>
		  
		  
		  
	 </table>
 
<%    End If  %> 	  
 
 