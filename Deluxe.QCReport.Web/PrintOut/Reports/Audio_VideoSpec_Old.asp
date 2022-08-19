<!-- Updated to include channels 9-16 Isaac Koomson 04/01/2012 -->
<table width="100%" border="0">
  <tr> 
      <td width="66%" valign="top"> 
       <!-- Audio Channels checks was moved to the include file AudioChannelsCheck.asp since it's repeated in all the reports . Isaac Koomson 04/01/2012    -->
       <!--#include file="AudioChannelsCheck.asp" -->
    </td>
    
    <td rowspan="2" width="34%" valign=top> 
      <table width="100%" border="1" cellspacing="0" bordercolor="#000000">
        <tr>
          <td>H. Blanking: <b><%=rsHeader.Fields("HBlank")%></b></td>
          <td>Chn Cond: <b><%=rsHeader.Fields("channel_cond")%></b></td>
        </tr>
        <tr>
          <td>V. Blanking: <b><%=rsHeader.Fields("VBlank")%></b></td>
          <td>RF: <b><%=rsHeader.Fields("RF")%></b></td>
        </tr>
        <tr>
          <td>Front Porch: <b><%=rsHeader.Fields("Front_por")%></b></td>
          <td>CTL Track: <b><%=rsHeader.Fields("ctl_track")%></b></td>
        </tr>
        <tr>
          <td>Sync Levl: <b><%=rsHeader.Fields("Sync_Levl")%></b></td>
          <td>Label: <b><%=rsHeader.Fields("Labels_QC")%></b></td>
        </tr>
        <tr>
          <td>Burst Levl: <b><%=rsHeader.Fields("Burst_Levl")%></b></td>
          <td>Slate: <b><%=rsHeader.Fields("Slate_qc")%></b></td>
        </tr>
        <tr>
          <td>Tracking: <b><%=rsHeader.Fields("Tracking_qc")%></b></td>
          <td>Subtitle: <b><%=rsHeader.Fields("Subtitle_QC")%></b></td>
        </tr>
        <tr>
          <td>Closed Capt: <b><%=rsHeader.Fields("CloseCap")%></b></td>
          <td>Tape Wrap: <b><%=rsHeader.Fields("Tape_Wrap_QC")%></b></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="left_bottom_border">VITS: <b><%=rsHeader.Fields("VITS")%></b></td>
                <td class="left_bottom_border">VIRS: <b><%=rsHeader.Fields("VIRS")%></b></td>
                <td class="left_right_bottom_border">VITC: <b><%=rsHeader.Fields("VITC")%></b></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td width="66%" valign="bottom"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="34%"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <%if rsHeader.Fields("IRE_MV") = "M" then
					siremv = "mv"
				else
					siremv = "ire"
				end if %>
              <tr>
                <td align="center" class="left_top_Border">
              <b>Bars in Demod/Unity </b>
               </td>
              </tr>
              <tr>
                <td> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="left" class="left_top_border">Video Gain: </td>
                      <td align="right" class="top_border"> 
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
                      <td align="left" class="left_top_border">Chroma Gain: </td>
                      <td align="right" class="top_border"> 
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
                      <td align="left" class="left_top_bottom_border">Set up:</td>
                      <td align="right" class="top_bottom_border"> 
                        <b><%=rsHeader.Fields("Bar_Set")%></b>&nbsp;&nbsp;<%=siremv%></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td width="66%"> 
            <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000">
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
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td width="57%" valign=top> 
      <table width="98%" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000">
        <tr>
          <td align="center"> 
            <font class="txt_italic" size="3"><b>Audio Specifications&nbsp;(F/S QC = Full or Spot Check QC)</b></font>
			
          </td>
        </tr>
		
        <tr>
          <td>
             <!--#include file="AudioSpecificationsHeader.asp" -->
          </td>
        </tr>
        <tr>
          <td >
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
            
                <!-- Audio Specifications was moved to the include file AudioSpecifications.asp since it's repeated in all the reports . Isaac Koomson 04/01/2012    -->
              
              <!--#include file="AudioSpecifications.asp" -->
             
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
    <td width="43%" valign=top> 
      <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000">
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
          <td height="172" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <%while not rsTapeFormat.EOF%>
              <tr>
                <td width="62%"><%=rsTapeFormat.Fields("description")%></td>
                <td width="26%"><%=rsTapeFormat.Fields("Time_Code")%></td>
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
