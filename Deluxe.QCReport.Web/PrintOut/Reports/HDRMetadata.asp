
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak {break-after: always; page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; height:30px }
</style>


<%
If rsHDRMetadata.BOF  = False Then
			If rsHDRMetadata.Fields("NotRequired") = False Then	
				
				
%>					
				
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="1" cellspacing="0" cellpadding="1">
		      <tr> 
	            <td colspan="3" align="center"><b>HDR METADATA</b></td>
	          </tr>	
             <tr> 
				  <td width="33%" >HDR Metadata Supplied: <b>&nbsp; <b><%=rsHDRMetadata.Fields("HDRMetadataSupplied")%></b></td>
				  <td width="33%" >HDR Metadata Type:<b>&nbsp; <b><%=rsHDRMetadata.Fields("HDRMetadataType")%></b></td>
				  <td width="34%" >Does xml Metadata match the Base file Metadata:<b>&nbsp; <b><%=rsHDRMetadata.Fields("XmlAndBaseFileMetadataMatch")%></b></td>
			</tr>	
            <tr> 
	            <td colspan="3">MaxCLL:<b>&nbsp; <b><%=rsHDRMetadata.Fields("MaxCLL")%></b></td>
	          </tr>			
			<tr> 
	            <td colspan="3">MaxFALL:<b>&nbsp; <b><%=rsHDRMetadata.Fields("MaxFALL")%></b></td>
	          </tr>	
				
</table>				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			
				
<% End If	
				
Set rsHDRMetadata = Nothing				

				
End If				
%>				