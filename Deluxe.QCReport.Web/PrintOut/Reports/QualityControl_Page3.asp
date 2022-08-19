

<%
j=0
'thisPage = thisPage + 1
if rsTextInfo.BOF = true and rsTextInfo.EOF =true then j=1
do while not rsTextInfo.EOF or j=1
%> 

<!-- ******************************************************* -->
<div class="PageBreak"><!-- Pages > Log Pages -->
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
	 <div id="divTapeInfoPage3" style="display:none;" >
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
	<div id="divFileInfoPage3" style="display:none;" >
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
	var divFileInfoPage3 = document.getElementById("divFileInfoPage3")
	var divTapeInfoPage3 = document.getElementById("divTapeInfoPage3")
		
	if(assetType == "File")
	{
	  divFileInfoPage3.style.display = "block";
	}
	else
	{
      divTapeInfoPage3.style.display = "block";	
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
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr height=30> 
			<td width="64%" align="center" class="left_top_border"><b>Text</b></td>
            <td width="13%" align="center" class="left_top_border"><b>Time Code In</b></td>
            <td width="13%" align="center" class="left_right_top_border"><b>Time Code Out</b></td>

          </tr>
          <% nTotalLines = 0
             do while nTotalLines < 520
              nLines = 0
				if rsTextInfo.EOF = false then 
					nLines = GetLines(rsTextInfo.Fields("TextInfo"))
					nTotalLines = nTotalLines + nLines
				else 
				nTotalLines = nTotalLines + 13	 
				end if
				
				if nTotalLines > 520 Then
					exit do           
				
				else
			
		  %>
          <tr>
			<td width="4%" align="center" class="left_top_border"><%if rsTextInfo.EOF = false then Response.Write(rsTextInfo.Fields("TextInfo"))%>&nbsp</td>
            <td width="11%" align="center" class="left_top_border"><%if rsTextInfo.EOF = false then Response.write(rsTextInfo.Fields("TimecodeIn"))%>&nbsp;</td>
            <td width="5%" align="center" class="left_right_top_border"><%if rsTextInfo.EOF = false then Response.write(rsTextInfo.Fields("TimecodeOut"))%>&nbsp;</td>
          </tr>
          <%	end if
             if rsTextInfo.EOF = false then rsTextInfo.MoveNext 
             loop%>
          <tr>
			<td colspan=3 class="top_border">&nbsp;</td>
		  </tr>
        </table>
      </td>
    </tr>
  </table>
</div>

<% j=0
   
	Response.Write("<SCRIPT>")
	for i = 1 to thisPage
	Response.Write("totalPage" & i & ".innerText = '" & thisPage & "';")
	next
	Response.Write("</SCRIPT>")
	
	thisPage = thisPage + 1 
	loop

%>









