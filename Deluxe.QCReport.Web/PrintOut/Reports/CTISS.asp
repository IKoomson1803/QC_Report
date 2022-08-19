
<table width="97%" cellspacing="4" cellpadding="0" border="0">
  <tr>
		
    <td width="21%" height="27"> 
      <table width="100%" cellspacing="0" border="0">
        <tr> 
          <td align="center" width="500"> 
            <div align="left"><font size="6">CTISS</font></div>
          </td>
        </tr>
      </table>
		</td>
		
    <td width="79%" height="27"> 
      <table width=100% cellspacing=0 border=0>
				<tr>
					
          <td width="59%">Technical Evaluation Report</td>
          <td width="41%">Page 1</td>
				</tr>
				<tr>
					
          <td width="59%">&nbsp; </td>
					
          <td width="41%">Main Details</td>
				</tr>
			</table>
		</td>	
	</tr>
</table>
<table width="97%" border="0" height="781">
  <tr>
    <td height="788"> 
      <table width="100%" border="1" height="26" cellspacing="0" bordercolor="black">
        <tr> 
          <td height="142"> 
            <table width="100%" border="1" cellspacing="0" bordercolor="black" height="171">
              <tr> 
                <td width="37%">Title:<%=rsHeader.fields("Show")%></td>
                <td width="33%">Subtitle:</td>
                <td width="30%"> 
                  <table width="75%" border="0">
                    <tr> 
                      <td>Tape number:</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td width="37%">Job Number: <%=rsHeader.Fields("wonum")%></td>
                <td width="33%">Client order number:</td>
                <td width="30%"> 
                  <table width="75%" border="0">
                    <tr> 
                      <td>Language: <%=rsHeader.Fields("HLanguage")%></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td width="37%">Version: <%=rsHeader.Fields("Version")%></td>
                <td width="33%">Format: <%=rsHeader.Fields("Format")%></td>
                <td width="30%"> 
                  <table width="75%" border="0">
                    <tr> 
                      <td>Timecode: <%=rsHeader.Fields("Time_Code")%></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td width="37%" height="25">Aspect Ratio: <%=rsHeader.Fields("Aspect")%></td>
                <td width="33%" height="25">Standard: <%=rsHeader.Fields("Standard")%></td>
                <td width="30%" height="25"> 
                  <table width="75%" border="0">
                    <tr> 
                      <td>tape:</td>
                      <td>of:</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td width="37%">Subtitles:</td>
                <td width="33%">Surround Sound Logo Pres</td>
                <td width="30%"> 
                  <table width="75%" border="0">
                    <tr> 
                      <td>Part Duration: </td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td width="37%">Subtitles language:</td>
                <td width="33%">Audio Language:</td>
                <td width="30%"> 
                  <table width="75%" border="0">
                    <tr> 
                      <td>Total prog. duration: </td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td width="37%">Date recorded:  <%=replace(rsHeader.Fields("Rec_Date"),"1/1/1900", "")%></td>
                <td width="33%">VITC Lines:</td>
                <td width="30%"> 
                  <table width="75%" border="0">
                    <tr> 
                      <td>LTC VITC Match: </td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td width="37%">Logo details:</td>
                <td width="33%">Textless Elements:</td>
                <td width="30%"> 
                  <table width="75%" border="0">
                    <tr> 
                      <td>TER Status: </td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <table width="100%" border="0">
        <tr>
          <td height="2">&nbsp;</td>
        </tr>
      </table>
      <table width="100%" border="1" height="123" cellspacing="0" bordercolor="black">
        <tr> 
          <td width="50%"> 
            <table width="100%" border="1" cellspacing="0" bordercolor="black" height="106">
              <tr> 
                <td>Video Information</td>
                <td>Peak</td>
                <td>Average</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>Luminance:</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>mV</td>
              </tr>
              <tr> 
                <td>Chrominance</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>%</td>
              </tr>
              <tr> 
                <td>Black level:</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>%</td>
              </tr>
              <tr> 
                <td>Vert blanking:</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>H</td>
              </tr>
              <tr> 
                <td>Horizontal blanking:</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>uS</td>
              </tr>
            </table>
          </td>
          <td width="50%"> 
            <table width="100%" border="0">
              <tr> 
                <td height="36"> 
                  <div align="left"><font size="1">TER INFO.</font></div>
                </td>
              </tr>
            </table>
            <table width="100%" border="1" cellspacing="0" bordercolor="black" height="77">
              <tr> 
                <td width="28%">Time taken:</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td width="28%">VTR No.:</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td width="28%">VTR Make:</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td width="28%">VTR Model:</td>
                <td>&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <table width="100%" border="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="100%" border="1" height="96" cellspacing="0" bordercolor="black">
        <tr> 
          <td width="157">Motion Jitter:</td>
          <td>&nbsp;</td>
          <td width="188">Enhancement:</td>
          <td>&nbsp;</td>
          <td width="162">BlackCrush:</td>
          <td>&nbsp;</td>
          <td width="166">ColourBalance:</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td width="157">DVNR Artefacts:</td>
          <td>&nbsp;</td>
          <td width="188">Dubbed-In Concealment</td>
          <td>&nbsp;</td>
          <td width="162">WhiteCrush:</td>
          <td>&nbsp;</td>
          <td width="166">Ringing:</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td width="157">Resolution:</td>
          <td>&nbsp;</td>
          <td width="188">MoirePattern:</td>
          <td>&nbsp;</td>
          <td width="162">Transients:</td>
          <td>&nbsp;</td>
          <td width="166">Interpolation:</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td width="157">Noise:</td>
          <td width="31">&nbsp;</td>
          <td width="188">Weave/Movement:</td>
          <td width="31">&nbsp;</td>
          <td width="162">Dropouts:</td>
          <td width="31">&nbsp;</td>
          <td width="166">Aliasing:</td>
          <td width="30">&nbsp;</td>
        </tr>
      </table>
      <table width="100%" border="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="100%" border="1" height="107" cellspacing="0" bordercolor="black">
        <tr> 
          <td> 
            <table width="100%" border="1" height="27" cellspacing="0" bordercolor="black">
              <tr> 
                <td width="72%">Audio Information</td>
                <td width="28%">TER'd in Unity:</td>
              </tr>
            </table>
            <table width="100%" border="1" cellspacing="0" bordercolor="black" height="100">
              <tr> 
                <td width="9%">&nbsp;</td>
                <td width="23%"> 
                  <div align="center">Content</div>
                </td>
                <td width="16%"> 
                  <div align="center">Unity Digital Ref.</div>
                </td>
                <td width="12%"> 
                  <div align="center">Avg. db WRT L/U</div>
                </td>
                <td width="12%"> 
                  <div align="center">Peak db WRT L/U</div>
                </td>
                <td width="28%"> 
                  <div align="center">Comment</div>
                </td>
              </tr>
              <tr> 
                <td width="9%">Ch1</td>
                <td width="23%">&nbsp;</td>
                <td width="16%"> 
                  <table width="98%" border="0">
                    <tr> 
                      <td width="66%">&nbsp;</td>
                      <td width="34%"> 
                        <div align="right">dbfs</div>
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="12%">&nbsp;</td>
                <td width="12%">&nbsp;</td>
                <td width="28%">&nbsp;</td>
              </tr>
              <tr> 
                <td width="9%">Ch2</td>
                <td width="23%">&nbsp;</td>
                <td width="16%"> 
                  <table width="98%" border="0">
                    <tr> 
                      <td width="66%">&nbsp;</td>
                      <td width="34%"> 
                        <div align="right">dbfs</div>
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="12%">&nbsp;</td>
                <td width="12%">&nbsp;</td>
                <td width="28%">&nbsp;</td>
              </tr>
              <tr> 
                <td width="9%">Ch3</td>
                <td width="23%">&nbsp;</td>
                <td width="16%"> 
                  <table width="98%" border="0">
                    <tr> 
                      <td width="66%">&nbsp;</td>
                      <td width="34%"> 
                        <div align="right">dbfs</div>
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="12%">&nbsp;</td>
                <td width="12%">&nbsp;</td>
                <td width="28%">&nbsp;</td>
              </tr>
              <tr> 
                <td width="9%" height="4">Ch4</td>
                <td width="23%" height="4">&nbsp;</td>
                <td width="16%" height="4"> 
                  <table width="98%" border="0">
                    <tr> 
                      <td width="66%">&nbsp;</td>
                      <td width="34%"> 
                        <div align="right">dbfs</div>
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="12%" height="4">&nbsp;</td>
                <td width="12%" height="4">&nbsp;</td>
                <td width="28%" height="4">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <table width="100%" border="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="100%" border="0" height="60">
        <tr> 
          <td height="48"> 
            <table width="100%" border="1" cellspacing="0" bordercolor="black">
              <tr> 
                <td width="234" height="13">Intelligibilty:</td>
                <td width="31" height="13">&nbsp;</td>
                <td width="252" height="13">Sync:</td>
                <td width="31" height="13">&nbsp;</td>
                <td width="264" height="13">Sibilant/Boomy:</td>
                <td width="34" height="13">&nbsp;</td>
              </tr>
              <tr> 
                <td width="234" height="15">Noise/Hum:</td>
                <td width="31" height="15">&nbsp;</td>
                <td width="252" height="15">Stereo Phase:</td>
                <td width="31" height="15">&nbsp;</td>
                <td width="264" height="15">Sync FX Levels:</td>
                <td width="34" height="15">&nbsp;</td>
              </tr>
              <tr> 
                <td width="234" height="16">Distortion:</td>
                <td width="31" height="16">&nbsp;</td>
                <td width="252" height="16">FX Sync:</td>
                <td width="31" height="16">&nbsp;</td>
                <td width="264" height="16">Compression Artifacts:</td>
                <td width="34" height="16">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <table width="100%" border="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="100%" border="1" cellspacing="0" bordercolor="black">
        <tr> 
          <td height="65"> 
            <table width="100%" border="0">
              <tr> 
                <td height="8"> 
                  <div align="left">Comments:</div>
                </td>
              </tr>
              <tr> 
                <td height="43">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <table width="100%" border="0" height="21">
        <tr> 
          <td> 
            <div align="center">1=Standard/Non Detectable 2=Acceptable 3=Marginal/Intrusive 
              4=Unacceptable</div>
          </td>
        </tr>
      </table>
      <table width="100%" border="0" height="18">
        <tr> 
          <td>Evaluated By:</td>
          <td>Date:</td>
        </tr>
      </table>
      
    </td>
  </tr>
</table>
<!-- ******************************************************* -->
<DIV class=PageBreak><!-- Pages >= 4 -->
<!-- ******************************************************* -->

<table width="94%" cellspacing="4" cellpadding="0" border="0">
  <tr>
		
    <td width="21%" height="27"> 
      <table width="100%" cellspacing="0" border="0">
        <tr> 
          <td align="center" width="500"> 
            <div align="left"><font size="6">CTISS</font></div>
          </td>
        </tr>
      </table>
		</td>
		
    <td width="79%" height="27"> 
      <table width=100% cellspacing=0 border=0>
				<tr>
					
          <td width="79%" height="30"> 
            <div align="right">Technical Evaluation Report</div>
          </td>
          <td width="21%" height="30"> - Page 2</td>
				</tr>
				<tr>
					
          <td width="79%">&nbsp; </td>
					
          <td width="21%">&nbsp; </td>
				</tr>
			</table>
		</td>	
	</tr>
</table>
<table width="94%" border="0" height="15">
  <tr>
    <td width="13%">Tape</td>
    <td width="87%">of</td>
  </tr>
</table>
<table width="94%" border="1" height="368" cellspacing="0" bordercolor="black">
  <tr>
    <td width="47%">Content Description</td>
    <td width="53%">Timecode</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td width="47%">&nbsp;</td>
    <td width="53%">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" width="47%">&nbsp;</td>
    <td height="20" width="53%">&nbsp;</td>
  </tr>
</table>
<table width="94%" border="0" height="18">
  <tr>
    <td>Recording Information</td>
  </tr>
</table>
<table width="94%" border="1" height="56" cellspacing="0" bordercolor="black">
  <tr>
    <td width="39%"> 
      <table width="100%" border="0" height="100%">
        <tr>
          <td height="15">
            <div align="right">Tape:</div>
          </td>
        </tr>
        <tr>
          <td height="15">
            <div align="right">Type:</div>
          </td>
        </tr>
        <tr>
          <td height="16">
            <div align="right">Supplier facility house:</div>
          </td>
        </tr>
      </table>
    </td>
    <td width="61%">&nbsp;</td>
  </tr>
</table>
<table width="94%" border="0" height="15">
  <tr>
    <td>Channel Conditions</td>
  </tr>
</table>
<table width="94%" border="1" height="199" cellspacing="0" bordercolor="black">
  <tr>
    <td width="22%">Time Code:</td>
    <td width="19%">A</td>
    <td width="19%">B</td>
    <td width="19%">C</td>
    <td width="19%">D</td>
  </tr>
  <tr>
    <td width="22%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
  </tr>
  <tr>
    <td width="22%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
  </tr>
  <tr>
    <td width="22%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
  </tr>
  <tr>
    <td width="22%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
  </tr>
  <tr>
    <td width="22%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
  </tr>
  <tr>
    <td width="22%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
  </tr>
</table>

<!-- ******************************************************* -->
<DIV class=PageBreak><!-- Pages >= 4 -->
<!-- ******************************************************* -->

<table width="94%" cellspacing="4" cellpadding="0" border="0">
  <tr>
		
    <td width="21%" height="27"> 
      <table width="100%" cellspacing="0" border="0">
        <tr> 
          <td align="center" width="500"> 
            <div align="left"><font size="6">CTISS</font></div>
          </td>
        </tr>
      </table>
		</td>
		
    <td width="79%" height="27"> 
      <table width=100% cellspacing=0 border=0>
				<tr>
					
          <td width="79%" height="30"> 
            <div align="right">Technical Evaluation Report</div>
          </td>
          <td width="21%" height="30"> - Page 3</td>
				</tr>
				<tr>
					
          <td width="79%">&nbsp; </td>
					
          <td width="21%">&nbsp; </td>
				</tr>
			</table>
		</td>	
	</tr>
</table>
<table width="94%" border="0" height="14">
  <tr>
    <td height="15" width="72%">&nbsp;</td>
    <td height="15" width="28%">Error Details</td>
  </tr>
</table>
<table width="94%" border="0" height="15">
  <tr>
    <td width="13%">Tape</td>
    <td width="87%">of</td>
  </tr>
</table>
<table width="94%" border="1" height="592" cellspacing="0" bordercolor="black">
  <tr>
    <td width="14%">Timecode</td>
    <td width="5%">A/V/F</td>
    <td width="28%">Fault</td>
    <td width="9%">Scale</td>
    <td width="14%">Sector</td>
    <td width="14%">Audio</td>
    <td width="16%">Content</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="28%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
</table>
<table width="94%" border="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="94%" border="0" height="49">
  <tr>
    <td>
      <table width="86%" border="0">
        <tr>
          <td>1 = Standard/Non Detectable</td>
        </tr>
        <tr>
          <td>2 = Acceptable</td>
        </tr>
        <tr>
          <td>3 = Marginal/Intrusive</td>
        </tr>
        <tr>
          <td>4 = Unacceptable</td>
        </tr>
      </table>
    </td>
    <td>
      <table width="44%" border="1" height="52" cellspacing="0" bordercolor="black" align="right">
        <tr>
          <td width="35%">&nbsp;</td>
          <td width="29%"> 
            <div align="center">SECTORS</div>
          </td>
          <td width="36%">&nbsp;</td>
        </tr>
        <tr>
          <td width="35%">U - L</td>
          <td width="29%">U - C</td>
          <td width="36%">U - R</td>
        </tr>
        <tr>
          <td width="35%">M - L</td>
          <td width="29%">M - C</td>
          <td width="36%">M - R</td>
        </tr>
        <tr>
          <td width="35%">L - L</td>
          <td width="29%">L - C</td>
          <td width="36%">L - R</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<!-- ******************************************************* -->
<DIV class=PageBreak><!-- Pages >= 4 -->
<!-- ******************************************************* -->

<table width="94%" cellspacing="4" cellpadding="0" border="0">
  <tr>
		
    <td width="21%" height="27"> 
      <table width="100%" cellspacing="0" border="0">
        <tr> 
          <td align="center" width="500"> 
            <div align="left"><font size="6">CTISS</font></div>
          </td>
        </tr>
      </table>
		</td>
		
    <td width="79%" height="27"> 
      <table width=100% cellspacing=0 border=0>
				<tr>
					
          <td width="79%" height="30"> 
            <div align="right">Technical Evaluation Report</div>
          </td>
          <td width="21%" height="30"> - Page 4</td>
				</tr>
				<tr>
					
          <td width="79%">&nbsp; </td>
					
          <td width="21%">&nbsp; </td>
				</tr>
			</table>
		</td>	
	</tr>
</table>
<table width="94%" border="0" height="14">
  <tr>
    <td height="15" width="72%">&nbsp;</td>
    <td height="15" width="28%">Subtitle Details</td>
  </tr>
</table>
<table width="94%" border="0" height="15">
  <tr>
    <td width="13%">Part</td>
    <td width="87%">of</td>
  </tr>
</table>
<table width="94%" border="1" height="705" cellspacing="0" bordercolor="black">
  <tr>
    <td width="20%">Time Code In</td>
    <td width="20%">Time Code Out</td>
    <td width="58%">
      <div align="center">Subtitle Text</div>
    </td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="58%">&nbsp;</td>
  </tr>
</table>

