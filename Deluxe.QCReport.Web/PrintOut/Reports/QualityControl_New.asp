<!-- Updated to include channels 9-16 Isaac Koomson 04/01/2012 -->
<!-- Updated to include channels 17-24 Isaac Koomson 11/09/2012 -->
<link REL="stylesheet" TYPE="text/css" HREF="../css/qcs.css">
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak { page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt;  }
</style>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td width="180"><img SRC="../images/Logos/Deluxe142Logo100x80.jpg" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype2">QUALITY CONTROL REPORT FOR<br>
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
    <td align="right">
		Page:&nbsp;1&nbsp;of&nbsp;<span id="totalPage1"></span>
    </td>
  </tr>
  <tr>
	<td colspan="3" align="center"><b><%=rsHeader.Fields("Address")%></b>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000" height="36">
  <tr>
  <td>
       <table width="100%" border="0" cellspacing="0" cellpadding="1" >
	       <tr>
             <td >Title:&nbsp; <b><%=rsHeader.Fields("Show")%></b></td>
             <td>Part#:&nbsp;<b><%=rsHeader.Fields("This_part")%></b></td>
             <td>QC#:&nbsp;<b><%=rsHeader.Fields("QCNum")%></b></td>
			</tr> 
			<tr>
             <td >Episode:&nbsp; <b><%=rsHeader.Fields("Epis_name")%></b></td>
             <td>Episode#:&nbsp;<b><%=rsHeader.Fields("Epis_no")%></b></b></td>
             <td>WO#:&nbsp;<b><%=rsHeader.Fields("wonum")%></b></td>
			</tr> 
			<tr>
             <td >Running Time:&nbsp; <b><%=rsHeader.Fields("Duration")%></b></td>
             <td>Language:&nbsp;<b><%=rsHeader.Fields("HLanguage")%></b></b></td>
             <td>PO#:&nbsp; <b><%=rsHeader.Fields("Pono")%></b></b></td>
			</tr> 
			<tr>
             <td >Version:&nbsp; <b><%=rsHeader.Fields("Version")%></b></td>
             <td>TRT:&nbsp;<b><%=rsHeader.Fields("TRT")%></b></b></td>
			 
             <%
		           If Not IsNull(sAssetType) And sAssetType = "Tape"   Then
                      Response.Write "<td>Tape #: <b>" & rsHeader.Fields("TapeNumber") & "</b></td>"
		            Else
                      Response.Write "<td>Filename: <b>" & rsHeader.Fields("Filename") & "</b></td>" 
                   End If		   
		      %>
			  
			</tr> 
			<tr>
             <td >Status:&nbsp; <font size=3><b><%=rsHeader.Fields("Eval_Stat")%></b></font></td>
             <td>Head Logo:&nbsp;<b><%=rsHeader.Fields("HeadLogo")%></b></td>
             <td>Tail Logo:&nbsp; <b><%=rsHeader.Fields("TailLogo")%></b></td>
			</tr> 
			<tr>
             <td >Video Grade:&nbsp; <b><%=rsHeader.Fields("grdVideo")%></b></td>
             <td>Audio Grade:&nbsp;<b><%=rsHeader.Fields("grdAudio")%></b></td>
             <td>Overall Grade:&nbsp; <b><%=rsHeader.Fields("grdOverall")%></b></td>
			</tr> 
			
        </table>
	</td>
  </tr>
  
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000">
  <tr>
    <td>
	 <div id="divTapeInfoPage1" style="display:none;" >
		  <table width="100%" border="0" cellspacing="0" cellpadding="1">
			<tr> 
			  <td width="25%">Format:&nbsp; <b><%=rsHeader.Fields("Format")%></b></td>
			  <td width="25%">Standard:&nbsp; <b><%=rsHeader.Fields("Standard")%></b></td>
			  <td width="25%">Aspect Ratio:&nbsp; <b><%=rsHeader.Fields("Aspect")%></b></td>
			  <td width="25%">Display Ratio: </td>
			</tr>
			<tr> 
			  <td width="25%">Tape Desc.:&nbsp; <b><%=rsHeader.Fields("TapeDesc1")%></b></td>
			  <td width="25%">&nbsp;</td>
			  <td width="25%">Time Code:&nbsp; <b><%=rsHeader.Fields("Time_Code")%></b></td>
			   <td width="25%">Chroma:&nbsp; <b><%=rsHeader.Fields("Chroma_Avg")%></b></td>
			</tr>
		</table>
	</div>
	<div id="divFileInfoPage1" style="display:none;" >
		  <table width="100%" border="0" cellspacing="0" cellpadding="1">
			<tr> 
			  <td width="25%">Format:&nbsp; <b><%=rsHeader.Fields("Format")%></b></td>
			  <td width="25%">Standard:&nbsp; <b><%=rsHeader.Fields("Standard")%></b></td>
			  <td width="25%">Aspect Ratio:&nbsp; <b><%=rsHeader.Fields("Aspect")%></b></td>
			  <td width="25%">Display Ratio: </td>
			</tr>
		    <tr> 
			  <td width="25%">Tape Desc.:&nbsp; <b><%=rsHeader.Fields("TapeDesc1")%></b></td>
			  <td width="25%">&nbsp;</td>
			  <td width="25%">Time Code:&nbsp; <b><%=rsHeader.Fields("Time_Code")%></b></td>
			   <td width="25%">Chroma:&nbsp; <b><%=rsHeader.Fields("Chroma_Avg")%></b></td>
			</tr>
			<tr> 
			  <td width="25%">Video Codec:&nbsp; <b><%=rsHeader.Fields("Video_Codec")%></b></td>
			  <td width="25%">Video Bit Rate:&nbsp;<b><%=rsHeader.Fields("Video_Bit_Rate")%> </td>
			  <td width="25%">Video Bit Depth:&nbsp; <b><%=rsHeader.Fields("Video_Bit_Depth")%></b></td>
			  <td width="25%">Bit Rate Mode:&nbsp; <b><%=rsHeader.Fields("Bit_Rate_Mode")%></b></td>
			</tr>
			<tr> 
			  <td width="25%">Audio Codec:&nbsp; <b><%=rsHeader.Fields("Audio_Codec")%></b></td>
			  <td width="25%">Audio Bit Rate:&nbsp;<b><%=rsHeader.Fields("Audio_Bit_Rate")%> </td>
			  <td width="25%">Audio Bit Depth:&nbsp; <b><%=rsHeader.Fields("Audio_Bit_Depth")%></b></td>
			  <td width="25%">Sample Rate:&nbsp; <b><%=rsHeader.Fields("Sample_Rate")%></b></td>
			</tr>
			<tr> 
			  <td width="25%">GOP Structure:&nbsp; <b><%=rsHeader.Fields("GOP_Structure")%></b></td>
			  <td width="25%">Gamut:&nbsp;<b><%=rsHeader.Fields("Gamut")%> </td>
			  <td width="25%">Colour Encoding:&nbsp; <b><%=rsHeader.Fields("Colour_Encoding")%></b></td>
			  <td width="25%">File Size:&nbsp; <b><%=rsHeader.Fields("File_Size")%></b></td>
			</tr>
			
		</table>
	</div>
    </td>
  </tr>
</table>

<SCRIPT language="javascript">
	var assetType = "<%= sAssetType %>"
	var divFileInfoPage1 = document.getElementById("divFileInfoPage1")
	var divTapeInfoPage1 = document.getElementById("divTapeInfoPage1")
		
	if(assetType == "File")
	{
	  divFileInfoPage1.style.display = "block";
	}
	else
	{
      divTapeInfoPage1.style.display = "block";	
	}
</SCRIPT>	

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000" height="90">
  <tr>
    <td valign="top" > 
      <table width="100%" border="0" cellspacing="0" cellpadding="1" >
       <tr>
	     <td>QC Date:&nbsp; <b><%=rsHeader.Fields("QC_Date")%></b></td>
		 <td>QC Operator:&nbsp; <b><%=rsHeader.Fields("FullName")%></b></td>
		 <td>QC VTR:&nbsp; <b><%=rsHeader.Fields("QC_VTR")%></b></td>
		 <td>Control Room #:&nbsp; <b><%=rsHeader.Fields("Bay_Num")%></b></td>
	   </tr>
	   <tr>
	   <td>Record Date:&nbsp; <b><%if isnull(rsHeader.Fields("Rec_Date")) then
									Response.Write(rsHeader.Fields("Rec_Date"))
								  else
									Response.Write(replace(rsHeader.Fields("Rec_Date"), "01/01/1900", ""))
		
						  end if%></b></td>
		<td>				  
	   <%
	     If sAssetType = "Tape" Then
		    Response.Write "Record VTR:&nbsp;<b>" & rsHeader.Fields("Rec_Vtr") & "</b>"
		  Else
            Response.Write "&nbsp;"		  
		  End If
	  %>
	  </td>
	  <td>Record Facility: <b><%=rsHeader.Fields("Rec_fac")%></b></td>
	  <td>Textless @ Tail: <b><%if rsHeader.Fields("textless") = "Y" Then
                                       Response.Write("Yes")
                                    else
										Response.Write("No")
									end if%></b></td>
	   
	   </tr>
	   <tr>
	   <td>Text Duration: <b><%=rsHeader.Fields("duration")%></b></td>
	   <td>				  
	   <%
	     If sAssetType = "Tape" Then
		    Response.Write "Stock Mfg:&nbsp;<b>" & rsHeader.Fields("Stock_mfg") & "</b>"
		  Else
            Response.Write "&nbsp;"		  
		  End If
	  %>
	  </td>
	   <td>				  
	   <%
	     If sAssetType = "Tape" Then
		    Response.Write "Stock Batch #:&nbsp;<b>" & rsHeader.Fields("Stock_Batch") & "</b>"
		  Else
            Response.Write "&nbsp;"		  
		  End If
	  %>
	  </td>
	   <td>				  
	   <%
	     If sAssetType = "Tape" Then
		    Response.Write "Stock Lenght #:&nbsp;<b></b>"
		  Else
            Response.Write "&nbsp;"		  
		  End If
	  %>
	  </td>
	   </tr>
	   <tr>
	   <td>Source Standard:&nbsp; <b><%=rsHeader.Fields("Src_standard")%></b></td>
	   <td>Source Format:&nbsp; <b><%=rsHeader.Fields("src_format")%></b></td>
	   <td>Source Desc:&nbsp; <b><%=rsHeader.Fields("src_desc")%></b></td>
	   <td>&nbsp;</td>
	   </tr>
	   <tr>
	   <td >Additional Info: <b><%=rsHeader.Fields("addinfo")%></b></td>
	   <td>&nbsp;</td>
	   <td>Revised Date: <b><%=rsHeader.Fields("revised_date")%></b></td>
	   <td>Revised By: <b><%=rsHeader.Fields("Revised_By")%></b></td>
	   </tr>
      </table>
    </td>
  </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<% If sAssetType = "Tape" Then %>
     <!--#include file="TapeAudioSpecifications.asp" -->
 <% Else %>
    <!--#include file="FileAudioSpecifications.asp" -->
 <% End If %>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="left_right_top_border" align="center"><b><i>SAFE AREA CHECK</i></b></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center" class="left_top_border">&nbsp</td>
					<td align="center" class="left_top_border"><b>All Display Formats</b></td>
					<td align="center" class="left_right_top_border"><b>16:9 (when aspect ratio converted to 4:3)</b>
				</tr>
				<tr>
					<td align="center" class="left_top_border"><b>Opening Titles</b></td>
					<td align="center" class="left_top_border"><%=rsHeader.Fields("OTPercent")%> Safe</td>
					<td align="center" class="left_right_top_border">Safe for: <%=rsHeader.Fields("OTVer")%></td>
				</tr>
				<tr>
					<td align="center" class="left_top_border"><b>Closing Titles</b></td>
					<td align="center" class="left_top_border"><%=rsHeader.Fields("CTPercent")%> Safe</td>
					<td align="center" class="left_right_top_border">Safe for: <%=rsHeader.Fields("CTVer")%></td>
				</tr>
				<tr>
					<td align="center" class="left_top_bottom_border"><b>Captions</b></td>
					<td align="center" class="left_top_bottom_border"><%=rsHeader.Fields("CapPercent")%> Safe</td>
					<td align="center" class="blackSquare">Safe for: <%=rsHeader.Fields("CapVer")%></td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%> colspan="3"<%End If%>>
      <font class="txt_italic" size="2"><b>COMMENTS</b></font>
    </td>
    <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%>
    <td align="center" width="5">
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
    <td align="center">
      <font class="txt_italic" size="2"><b>RECOMMENDATIONS FOR CORRECTIVE ACTION</b></font>
    </td>
    <%End If%>
  </tr>
  <tr>
    <td <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%> colspan="3"<%Else%> width="49%"<%End If%>>
      <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000">
        <tr>
          <td height="80" valign="top"><%=rsFullSpot.Fields("Comments")%>&nbsp;</td>
        </tr>
      </table>
    </td>
    <%If rsHeader.Fields("Eval_Stat") <> "PASSED" Then%>
    <td align="center" width="5">
      <font class="txt_italic" size="2">&nbsp;</font>
    </td>
    <td width="49%">
      <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000">
        <tr>
          <td height="80" valign="top"><%=rsFullSpot.Fields("RecommendationComments")%>&nbsp;</td>
        </tr>
      </table>
    </td>
    <%End If%>
  </tr>
</table>


<%

j=0
thisPage = 2
rsBVMastLog.Open sqlBVIMastLog
if rsBVMastLog.BOF = true and rsBVMastLog.EOF =true then j=1
''do while not rsBVMastLog.EOF or j=1
%> 



<!-- ******************************************************* -->
<div class="PageBreak"><!-- Pages >= 2 -->
<!-- ******************************************************* -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180"><img SRC="../images/Logos/Deluxe142Logo100x80.jpg" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype2">QUALITY CONTROL REPORT FOR<br>
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
    <td>
		Page:&nbsp;<%=thisPage%>&nbsp;of&nbsp;<span id="totalPage<%=thisPage%>"></span> 
    </td>
  </tr>
  <tr>
	<td colspan="3" align="center"><b><%=rsHeader.Fields("Address")%></b>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000" height="36">
  <tr>
  <td>
       <table width="100%" border="0" cellspacing="0" cellpadding="1" >
	       <tr>
             <td >Title:&nbsp; <b><%=rsHeader.Fields("Show")%></b></td>
             <td>Part#:&nbsp;<b><%=rsHeader.Fields("This_part")%></b></td>
             <td>QC#:&nbsp;<b><%=rsHeader.Fields("QCNum")%></b></td>
			</tr> 
			<tr>
             <td >Episode:&nbsp; <b><%=rsHeader.Fields("Epis_name")%></b></td>
             <td>Episode#:&nbsp;<b><%=rsHeader.Fields("Epis_no")%></b></b></td>
             <td>WO#:&nbsp;<b><%=rsHeader.Fields("wonum")%></b></td>
			</tr> 
			<tr>
             <td >Running Time:&nbsp; <b><%=rsHeader.Fields("Duration")%></b></td>
             <td>Language:&nbsp;<b><%=rsHeader.Fields("HLanguage")%></b></b></td>
             <td>PO#:&nbsp; <b><%=rsHeader.Fields("Pono")%></b></b></td>
			</tr> 
			<tr>
             <td >Version:&nbsp; <b><%=rsHeader.Fields("Version")%></b></td>
             <td>TRT:&nbsp;<b><%=rsHeader.Fields("TRT")%></b></b></td>
			 
             <%
		           If Not IsNull(sAssetType) And sAssetType = "Tape"   Then
                      Response.Write "<td>Tape #: <b>" & rsHeader.Fields("TapeNumber") & "</b></td>"
		            Else
                      Response.Write "<td>Filename: <b>" & rsHeader.Fields("Filename") & "</b></td>" 
                   End If		   
		      %>
			  
			</tr> 
			<tr>
             <td >Status:&nbsp; <font size=3><b><%=rsHeader.Fields("Eval_Stat")%></b></font></td>
             <td>Head Logo:&nbsp;<b><%=rsHeader.Fields("HeadLogo")%></b></td>
             <td>Tail Logo:&nbsp; <b><%=rsHeader.Fields("TailLogo")%></b></td>
			</tr> 
			<tr>
             <td >Video Grade:&nbsp; <b><%=rsHeader.Fields("grdVideo")%></b></td>
             <td>Audio Grade:&nbsp;<b><%=rsHeader.Fields("grdAudio")%></b></td>
             <td>Overall Grade:&nbsp; <b><%=rsHeader.Fields("grdOverall")%></b></td>
			</tr> 
			
        </table>
	</td>
  </tr>
  
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000">
  <tr>
    <td>
	 <div id="divTapeInfoPage2" style="display:none;" >
		  <table width="100%" border="0" cellspacing="0" cellpadding="1">
			<tr> 
			  <td width="25%">Format:&nbsp; <b><%=rsHeader.Fields("Format")%></b></td>
			  <td width="25%">Standard:&nbsp; <b><%=rsHeader.Fields("Standard")%></b></td>
			  <td width="25%">Aspect Ratio:&nbsp; <b><%=rsHeader.Fields("Aspect")%></b></td>
			  <td width="25%">Display Ratio: </td>
			</tr>
			<tr> 
			  <td width="25%">Tape Desc.:&nbsp; <b><%=rsHeader.Fields("TapeDesc1")%></b></td>
			  <td width="25%">&nbsp;</td>
			  <td width="25%">Time Code:&nbsp; <b><%=rsHeader.Fields("Time_Code")%></b></td>
			   <td width="25%">Chroma:&nbsp; <b><%=rsHeader.Fields("Chroma_Avg")%></b></td>
			</tr>
		</table>
	</div>
	<div id="divFileInfoPage2" style="display:none;" >
		  <table width="100%" border="0" cellspacing="0" cellpadding="1">
			<tr> 
			  <td width="25%">Format:&nbsp; <b><%=rsHeader.Fields("Format")%></b></td>
			  <td width="25%">Standard:&nbsp; <b><%=rsHeader.Fields("Standard")%></b></td>
			  <td width="25%">Aspect Ratio:&nbsp; <b><%=rsHeader.Fields("Aspect")%></b></td>
			  <td width="25%">Display Ratio: </td>
			</tr>
		    <tr> 
			  <td width="25%">Tape Desc.:&nbsp; <b><%=rsHeader.Fields("TapeDesc1")%></b></td>
			  <td width="25%">&nbsp;</td>
			  <td width="25%">Time Code:&nbsp; <b><%=rsHeader.Fields("Time_Code")%></b></td>
			   <td width="25%">Chroma:&nbsp; <b><%=rsHeader.Fields("Chroma_Avg")%></b></td>
			</tr>
			<tr> 
			  <td width="25%">Video Codec:&nbsp; <b><%=rsHeader.Fields("Video_Codec")%></b></td>
			  <td width="25%">Video Bit Rate:&nbsp;<b><%=rsHeader.Fields("Video_Bit_Rate")%> </td>
			  <td width="25%">Video Bit Depth:&nbsp; <b><%=rsHeader.Fields("Video_Bit_Depth")%></b></td>
			  <td width="25%">Bit Rate Mode:&nbsp; <b><%=rsHeader.Fields("Bit_Rate_Mode")%></b></td>
			</tr>
			<tr> 
			  <td width="25%">Audio Codec:&nbsp; <b><%=rsHeader.Fields("Audio_Codec")%></b></td>
			  <td width="25%">Audio Bit Rate:&nbsp;<b><%=rsHeader.Fields("Audio_Bit_Rate")%> </td>
			  <td width="25%">Audio Bit Depth:&nbsp; <b><%=rsHeader.Fields("Audio_Bit_Depth")%></b></td>
			  <td width="25%">Sample Rate:&nbsp; <b><%=rsHeader.Fields("Sample_Rate")%></b></td>
			</tr>
			<tr> 
			  <td width="25%">GOP Structure:&nbsp; <b><%=rsHeader.Fields("GOP_Structure")%></b></td>
			  <td width="25%">Gamut:&nbsp;<b><%=rsHeader.Fields("Gamut")%> </td>
			  <td width="25%">Colour Encoding:&nbsp; <b><%=rsHeader.Fields("Colour_Encoding")%></b></td>
			  <td width="25%">File Size:&nbsp; <b><%=rsHeader.Fields("File_Size")%></b></td>
			</tr>
			
		</table>
	</div>
    </td>
  </tr>
</table>


<SCRIPT language="javascript">
	var assetType = "<%= sAssetType %>"
	var divFileInfoPage2 = document.getElementById("divFileInfoPage2")
	var divTapeInfoPage2 = document.getElementById("divTapeInfoPage2")
		
	if(assetType == "File")
	{
	  divFileInfoPage2.style.display = "block";
	}
	else
	{
      divTapeInfoPage2.style.display = "block";	
	}
</SCRIPT>	



  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>&nbsp;</td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="1">
          <tr> 
            <td width="12%" align="center" class="left_top_border"><b>Time Code</b></td>
            <td width="5%" align="center" class="left_top_border"><b>Type</b></td>
            <td width="54%" align="center" class="left_top_border"><b>Fault Description</b></td>
            <td width="5%" align="center" class="left_top_border"><b>GRD</b></td>
            <td width="7%" align="center" class="left_top_border"><b>Sector</b></td>
            <td width="9%" align="center" class="left_top_border"><b>Same As Master</b></td>
            <td width="8%" align="center" class="left_right_top_border"><b>Item Duration</b></td>
          </tr>
          <% nTotalLines = 0
             do while nTotalLines < 420
              nLines = 0
				if rsBVMastLog.EOF = false then 
					nLines = GetLines(rsBVMastLog.Fields("Note"))
					nTotalLines = nTotalLines + nLines
				else 
				nTotalLines = nTotalLines + 13	 
				end if
				
				if nTotalLines > 420 Then
					exit do           
				
				else
			
		  %>
          <tr>
            <td width="12%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields

("Time_Code"))%>&nbsp;</td>
            <td width="5%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields

("QC_Code"))%>&nbsp;</td>
            <td width="54%" align="left" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Note"))%>&nbsp;</td>
            <td width="5%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields

("QC_Grade"))%>&nbsp;</td>
            <td width="7%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Action"))%>&nbsp;</td>
            <td width="9%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then 
													if rsBVMastLog.Fields("in_master") = -1 then
														Response.write("Yes")
													else
														Response.Write("No")
													end if
												 end if%>&nbsp;</td>
            <td width="8%" align="center" class="left_right_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields

("item_duratn"))%>&nbsp;</td>
          </tr>
          <%	end if
             if rsBVMastLog.EOF = false then rsBVMastLog.MoveNext 
             loop%>
          <tr>
			<td colspan=7 class="top_border">&nbsp;</td>
		  </tr>
        </table>
      </td>
    </tr>
  </table>







</div>


<%
   j=0
   
	Response.Write("<SCRIPT>")
	for i = 1 to thisPage
	  Response.Write("totalPage" & i & ".innerText = '" & thisPage & "';")
	next
	Response.Write("</SCRIPT>")
	
	thisPage = thisPage + 1 
	''loop
	rsBVMastLog.Close
	set rsBVMastLog = Nothing
%>





