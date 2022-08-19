<link REL="stylesheet" TYPE="text/css" HREF="../css/qcs.css">
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak { page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; }
</style>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <!--<td><img SRC="../images/Logos/4mc.gif" WIDTH="60" HEIGHT="75"></td>-->
    <td width="180"><img SRC="../images/Logos/Deluxe142Logo100x80.jpg" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype_header">100% QUALITY CONTROL REPORT FOR<br>
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

<!--#include file="Header.asp" -->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
    <p align="center"><b>&nbsp;1 = </b>Poor<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 = </b>Average<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    3 = </b>Good<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4 =</b> Very Good&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>5 = </b>
    Excellent</td>
  </tr>
</table>
<br/>

<!--#include file="Operations.asp" -->


<!--#include file="Measurements.asp" -->


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>  <!--
    <td width="66%" valign="top"> 
   
      <table width="100%" border="1" cellspacing="0" bordercolor="#999999">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0">
              <tr>
                <td width="11%">Full QC:</td>
                <td width="6%">&nbsp;</td>
                <td width="8%">Video:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_vid") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch1:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch1") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch2:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch2") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch3:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch3") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch4:</td>
                <td width="11%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch4") = -1 then Response.Write("<b>X</b>")%></td>
              </tr>
              <tr>
                <td width="11%">&nbsp;</td>
                <td width="6%">&nbsp;</td>
                <td width="8%">Ch5:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch5") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch6:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch6") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch7:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch7") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch8:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch8") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Cue:</td>
                <td width="11%">&nbsp;<%if rsFullSpot.Fields("FullQC_Cue") = -1 then Response.Write("<b>X</b>")%></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0">
              <tr> 
                <td width="13%">Spot Chk:</td>
                <td width="4%">&nbsp;</td>
                <td width="8%">Video:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_vid") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch1:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch1") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch2:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch2") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch3:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch3") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch4:</td>
                <td width="11%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch4") = -1 then Response.Write("<b>X</b>")%></td>
              </tr>
              <tr> 
                <td width="13%">&nbsp;</td>
                <td width="4%">&nbsp;</td>
                <td width="8%">Ch5:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch5") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch6:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch6") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch7:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch7") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch8:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch8") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Cue:</td>
                <td width="11%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Cue") = -1 then Response.Write("<b>X</b>")%></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      
    </td>-->
    <td width="34%"> 
      <table width="100%" height="137" border="1" cellspacing="0" bordercolor="#999999">
        <tr>
		
          <td>
		     <% If rsHeader.Fields("HBlank") Is Not Nothing Then %>
			   H Blanking:&nbsp;<b><%=rsHeader.Fields("HBlank")%></b>&nbsp;
			<% Else %>
			    H Blanking:&nbsp;<b><%=rsHeader.Fields("HBlanking")%></b>&nbsp;
			<% End If %>
		 </td>
		  		  
          <td>Chn Cond: <b><%=rsHeader.Fields("channel_cond")%></b></td>
        </tr>
        <tr>
		
          <td>
		     <% If rsHeader.Fields("VBlank") Is Not Nothing Then %>
			   V Blanking:&nbsp;<b><%=rsHeader.Fields("VBlank")%></b>&nbsp;
			<% Else %>
			    V Blanking:&nbsp;<b><%=rsHeader.Fields("VBlanking")%></b>&nbsp;
			<% End If %>
		 </td>
		  		  
          <td>RF: <b><%=rsHeader.Fields("RF")%></b></td>
        </tr>
        <tr>
          <td>CTL Track: <b><%=rsHeader.Fields("ctl_track")%></b></td>
          <td>Label: <b><%=rsHeader.Fields("Labels_QC")%></b></td>
        </tr>
        <tr>
		  <td>Slate: <b><%=rsHeader.Fields("Slate_qc")%></b></td>
		  <td>Tracking: <b><%=rsHeader.Fields("Tracking_qc")%></b></td>
        </tr>
        <tr>
          <td>Subtitle: <b><%=rsHeader.Fields("Subtitle_QC")%></b></td>
          <td>Tape Wrap: <b><%=rsHeader.Fields("Tape_Wrap_QC")%></b></td>
        </tr>
        <tr>
          <td colspan="2">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center">VITC: <b><%=rsHeader.Fields("VITC")%></b></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
 <!-- </tr>
  <tr>-->
    <td width="66%" valign="bottom"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="34%"> 
            <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#999999">
                <%if rsHeader.Fields("IRE_MV") = "M" then
					siremv = "mv"
				else
					siremv = "ire"
				end if %>
              <tr>
                <td align="center" bordercolor="#999999">
              <b>Bars in Demod/Unity </b>
               </td>
              </tr>
              <tr>
                <td> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="left">Video Gain: </td>
                      <td align="right"> 
                        <b><%=rsHeader.Fields("Bar_Vid")%></b>&nbsp;&nbsp;<%=siremv%>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="left">Chroma Gain: </td>
                      <td align="right"> 
                        <b><%=rsHeader.Fields("Bar_Chr")%></b>&nbsp;&nbsp;<%=siremv%></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="left">Set up:</td>
                      <td align="right"> 
                        <b><%=rsHeader.Fields("Bar_Set")%></b>&nbsp;&nbsp;<%=siremv%></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
       <tr>
          <td>&nbsp;</td>
       </tr>
          <td width="66%"> 
            <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#999999">
              <tr> 
                <td align="center" colspan="2">
                  <b>Program Overall Technical Specifications</b>
                </td>
              </tr>
              <tr> 
                <td width="50%"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>Lum. Peak: </td>
                      <td align="right"> 
                        <b><%=rsHeader.Fields("Lum_Peak")%></b>&nbsp;&nbsp;<%=siremv%>
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="50%"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>Chroma Peak: </td>
                      <td align="right"> 
                        <b><%=rsHeader.Fields("Chroma_Peak")%></b>&nbsp;&nbsp;<%=siremv%>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td width="50%"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>Lum. Avg: </td>
                      <td align="right"> 
                        <b><%=rsHeader.Fields("Lum_Avg")%></b>&nbsp;&nbsp;<%=siremv%>
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="50%"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>Chroma Avg: </td>
                      <td align="right"> 
                        <b><%=rsHeader.Fields("Chroma_Avg")%></b>&nbsp;&nbsp;<%=siremv%>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td width="50%"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>Black Level: </td>
                      <td align="right"> 
                        <b><%=rsHeader.Fields("Black")%></b>&nbsp;&nbsp;<%=siremv%>
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="50%"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>&nbsp;</td>
                      <td align="right"> 
                       &nbsp;
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="57%"> 
      <table width="98%" border="1" cellspacing="0" cellpadding="0" bordercolor="#999999">
        <tr>
          <td align="center"> 
            <font class="txt_italic" size="3"><b>Audio Specifications</b></font>
          </td>
        </tr>
        <tr>
          <td>
           <!--#include file="AudioSpecificationsHeader.asp" -->
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%"><b>Ch1</b></td>
                <td width="42%"><%=rsHeader.Fields("Ch1_Desc")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch1_Tone")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch1_Avg")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch1_Peak")%>&nbsp;</td>
                <td><%=rsHeader.Fields("CH1_TruePeak")%>&nbsp;</td>
              </tr>
              <tr>
                <td width="6%"><b>Ch2</b></td>
                <td width="42%"><%=rsHeader.Fields("Ch2_Desc")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch2_Tone")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch2_Avg")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch2_Peak")%>&nbsp;</td>
                <td><%=rsHeader.Fields("CH2_TruePeak")%>&nbsp;</td>
              </tr>
              <tr>
                <td width="6%"><b>Ch3</b></td>
                <td width="42%"><%=rsHeader.Fields("Ch3_Desc")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch3_Tone")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch3_Avg")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch3_Peak")%>&nbsp;</td>
                <td><%=rsHeader.Fields("CH3_TruePeak")%>&nbsp;</td>
              </tr>
              <tr>
                <td width="6%"><b>Ch4</b></td>
                <td width="42%"><%=rsHeader.Fields("Ch4_Desc")%></b>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch4_Tone")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch4_Avg")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch4_Peak")%>&nbsp;</td>
                <td><%=rsHeader.Fields("CH4_TruePeak")%>&nbsp;</td>
              </tr>
              <!--
              <tr>
                <td width="6%"><b>Ch5</b></td>
                <td width="42%"><%=rsHeader.Fields("Ch5_Desc")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch5_Tone")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch5_Avg")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch5_Peak")%>&nbsp;</td>
                <td><%=rsHeader.Fields("CH5_TruePeak")%>&nbsp;</td>
              </tr>
              <tr>
                <td width="6%"><b>Ch6</b></td>
                <td width="42%"><%=rsHeader.Fields("Ch6_Desc")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch6_Tone")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch6_Avg")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch6_Peak")%>&nbsp;</td>
                <td><%=rsHeader.Fields("CH6_TruePeak")%>&nbsp;</td>
              </tr>
              <tr>
                <td width="6%"><b>Ch7</b></td>
                <td width="42%"><%=rsHeader.Fields("Ch7_Desc")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch7_Tone")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch7_Avg")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch7_Peak")%>&nbsp;</td>
                <td><%=rsHeader.Fields("CH7_TruePeak")%>&nbsp;</td>
              </tr>
              <tr>
                <td width="6%"><b>Ch8</b></td>
                <td width="42%"><%=rsHeader.Fields("Ch8_Desc")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch8_Tone")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch8_Avg")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Ch8_Peak")%>&nbsp;</td>
                <td><%=rsHeader.Fields("CH8_TruePeak")%>&nbsp;</td>
              </tr>
              <tr>
                <td width="6%"><b>Cue</b></td>
                <td width="42%"><%=rsHeader.Fields("Cue_Desc")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Cue_Tone")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Cue_Avg")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Cue_Peak")%>&nbsp;</td>
                <td><%=rsHeader.Fields("Cue_TruePeak")%>&nbsp;</td>
              </tr>
              -->
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>Comp/M&E Sync: </td>
                <td><b><%=rsHeader.Fields("Comp_Sync")%></b>&nbsp;</td>
                <td>Noise Reduction: </td>
                <td><b><%=rsHeader.Fields("NR")%></b>&nbsp;</td>
                <td>Audio QC'd in Unity: </td>
                <td><b><%=rsHeader.Fields("QCinUnity")%></b>&nbsp;</td>                
              </tr>
              <tr>
                <td>CH.1 & 2 Phase: </td>
                <td><b><%=rsHeader.Fields("Ch12_Phase")%></b>&nbsp;</td>
                <td>Tone Phase: </td>
                <td><b><%=rsHeader.Fields("Tone_Phase")%></b>&nbsp;</td>
                <td>Surround Sound: </td>
                <td><b><%=rsHeader.Fields("SurroundSound")%></b>&nbsp;</td>
              </tr>
              <tr>
                <td>CH.3 & 4 Phase: </td>
                <td><b><%=rsHeader.Fields("Ch34_Phase")%></b>&nbsp;</td>
                <td>TC Integrity: </td>
                <td><b><%=rsHeader.Fields("TCInteg")%></b>&nbsp;</td>
                <td>LTC & VITC Match: </td>
                <td><b><%=rsHeader.Fields("LTC_VITC_Match")%></b>&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td width="43%"> 
      <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#999999">
        <tr>
          <td align="center"> 
            <font class="txt_italic" size="3"><b>Program Format</b></font>
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="11%">&nbsp;</td>
                <td width="51%" class="txt_boldtype2">Description</td>
                <td width="26%" class="txt_boldtype2">Time Code</td>
                <td width="12%" class="txt_boldtype2">Length</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="108" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <%while not rsTapeFormat.EOF%>
              <tr>
                <td width="62%"><%=rsTapeFormat.Fields("description")%></td>
                <td width="26%">
				
				<%
			    If Not IsNull(rsHeader.Fields("Time_Code")) Then
				  Response.Write rsHeader.Fields("Time_Code")
				Else
				  Response.Write rsHeader.Fields("Timecode")
				End If
			  
			      %>
				
				</td>
                <td width="12%"><%=rsTapeFormat.Fields("Length")%></td>
              </tr>
            <%rsTapeFormat.MoveNext
            wend%>
            </table>
          </td>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#999999">
				<tr>
					<td align="center" colspan="3"><b><i>SAFE AREA CHECK</i></b></td>
				</tr>
				<tr>
					<td align="center">&nbsp;</td>
					<td align="center"><b>All Display Formats</b></td>
					<td align="center"><b>16:9 (when aspect ratio converted to 4:3)</b>
				</tr>
				<tr>
					<td align="center"><b>Opening Titles</b></td>
					<td align="center"><%=rsHeader.Fields("OTPercent")%> Safe</td>
					<td align="center">Safe for: <%=rsHeader.Fields("OTVer")%></td>
				</tr>
				<tr>
					<td align="center"><b>Closing Titles</b></td>
					<td align="center"><%=rsHeader.Fields("CTPercent")%> Safe</td>
					<td align="center">Safe for: <%=rsHeader.Fields("CTVer")%></td>
				</tr>
				<tr>
					<td align="center"><b>Captions</b></td>
					<td align="center"><%=rsHeader.Fields("CapPercent")%> Safe</td>
					<td align="center">Safe for: <%=rsHeader.Fields("CapVer")%></td>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
      <font class="txt_italic" size="2"><b>COMMENTS</b></font>
    </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="2" cellspacing="0" cellpadding="0" bordercolor="#000000">
        <tr>
          <td height="80" valign="top" class="txt_10Font"><%=rsFullSpot.Fields("Comments")%>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<%
j=0
thisPage = 2
rsBVMastLog.Open sqlBVIMastLog
if rsBVMastLog.BOF = true and rsBVMastLog.EOF =true then j=1
do while not rsBVMastLog.EOF or j=1
%> 
<!-- ******************************************************* -->
<div class="PageBreak"><!-- Pages >= 2 -->
<!-- ******************************************************* -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <!--<td><img SRC="../images/Logos/4mc.gif" WIDTH="60" HEIGHT="75"></td>-->
    <td width="180"><img SRC="../images/Logos/Deluxe142Logo100x80.jpg" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype_header">QUALITY CONTROL REPORT FOR<br>
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

<!--#include file="Header.asp" -->


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
            <td width="9%" align="center" class="left_top_border"><b>Approved</b></td>
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
            <td width="12%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Time_Code"))%>&nbsp;</td>
            <td width="5%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("QC_Code"))%>&nbsp;</td>
            <td width="54%" align="left" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Note"))%>&nbsp;</td>
            <td width="5%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("QC_Grade"))%>&nbsp;</td>
            <td width="7%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Action"))%>&nbsp;</td>
            <td width="9%" align="center" class="left_top_border"><%if rsBVMastLog.EOF = false then 
													if rsBVMastLog.Fields("in_master") = -1 then
														Response.write("Yes")
													else
														Response.Write("No")
													end if
												 end if%>&nbsp;</td>
            <td width="8%" align="center" class="left_right_top_border"><%if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("item_duratn"))%>&nbsp;</td>
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
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td colspan=5>&nbsp;</td>
    </tr>
    <tr>
      <td>Type:</td>
      <td>F=Film</td>
      <td>V=Video</td>
      <td>A=Audio</td>
      <td colspan=2 align="center">
			<table cellspacing=0 border=1 bordercolor="#000000" width=90 id="tblTapeFormat">
				<tr>
					<td width=30 align="center" valign="middle">U-L</td>
					<td width=30 align="center" valign="middle">U-C</td>
					<td width=30 align="center" valign="middle">U-R</td>
				</tr>
				<tr>
					<td width=30 align="center" valign="middle">M-L</td>
					<td width=30 align="center" valign="middle">M-C</td>
					<td width=30 align="center" valign="middle">M-R</td>
				</tr>
				<tr>
					<td width=30 align="center" valign="middle">L-L</td>
					<td width=30 align="center" valign="middle">L-C</td>
					<td width=30 align="center" valign="middle">L-R</td>
				</tr>
			</table>	
      </td>
    </tr>
    <tr>
		<td colspan=5>&nbsp;</td>
    </tr>
    <%if rsHeader.Fields("GradingScale") = 3 then %>
    <tr> 
      <td>Severity Grades:</td>
      <td>1=Acceptable</td>
      <td>2=Marginal</td>
      <td>3=Unacceptable</td>
      <td colspan=2>&nbsp;</td>
    </tr>
    <%end if%>
    <%if rsHeader.Fields("GradingScale") = 4 then %>
    <tr> 
      <td>Severity Grades:</td>
      <td>1=Standard/Non Detectable</td>
      <td>2=Acceptable</td>
      <td>3=Marginal/Intrusive</td>
      <td>4=Unacceptable</td>
      <td>&nbsp;</td>
    </tr>
    <%end if%>
    <%if rsHeader.Fields("GradingScale") = 5 then %>
    <tr> 
      <td>Severity Grades:</td>
      <td>1=Very Annoying</td>
      <td>2=Annoying</td>
      <td>3=Slightly Annoying</td>
      <td>4=Perceptible but not Annoying</td>
      <td>5=Imperceptible</td>
    </tr>
    <%end if%>
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
	rsBVMastLog.Close
	set rsBVMastLog = Nothing
      
%>

              <% 
       
	           positionDisney = InStr(1, rsHeader.Fields("CustName"), "Disney")
			 	
			  If positionDisney > 0 Then
			  %>
			   <!--#include file="DisneyChecklist.asp" -->
			 <% Else %>
		   
			  <% End If %>

  
