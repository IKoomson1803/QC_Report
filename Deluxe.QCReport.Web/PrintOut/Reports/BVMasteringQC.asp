<style type="text/css">
<!--
.underline { border-color: black black #000000; border-style: solid; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px }
-->
</style>

<table width="100%" cellspacing="4" cellpadding="0" border="0">
	<tr>
		<td width="66%">
			<table width="100%" cellspacing="0" border="1" bordercolor="black">
				<tr>
					<td width=55 align=center>
						<img SRC="../images/Buena.gif" WIDTH="53" HEIGHT="36">
					</td>
					<td align="center" class=header_type>
						BUENA VISTA INTERNATIONAL TELEVISION
						<br>
						Mastering QC Report
					</td>
				</tr>
			</table>
		</td>
		<td width="34%">
			<table width=100% cellspacing=0 border=0>
				<tr>
					<td>
						WO#: <%=rsHeader.fields("wonum")%>
					</td>
					<td>
						Date: <%=rsHeader.fields("QC_Date")%><!--&nbsp;&nbsp;/&nbsp;&nbsp;/&nbsp;&nbsp;-->
					</td>
				</tr>
				<tr>
					<td>
						PO#:  <%=rsHeader.fields("pono")%>
					</td>
					<%dim thisPage%>
					<td>
						Page:&nbsp;1&nbsp;of&nbsp;<span id="totPage1"></span>
					</td>
				</tr>
			</table>
		</td>	
	</tr>
</table>
<table width=100%>
  <tr>
    <td width=3%>Title:</td>
    <td width=75% class=underline>&nbsp;<%=rsHeader.fields("Show")%> </td>
    <td width="4%">&nbsp; </td>
    <td width="6%"> TV Series </td>
    <td width="3%">&nbsp; </td>
    <td width="9%" class=txt_italic> Feature </td>
  </tr>
</table>
<table width=100%>
  <tr> 
    <td width=3%>Eps#</td>
    <td width=20% class=underline>&nbsp;<%=rsHeader.fields("Epis_no")%> </td>
    <td width=2%>&nbsp;</td>
    <td width=7%>Eps. Title:</td>
    <td width=50% class=underline>&nbsp;<%=rsHeader.fields("Epis_Name")%> </td>
    <td align=right width="8%"> Part &nbsp;<%=rsHeader.fields("This_part")%></td>
    <td width="6%"> of &nbsp;<%=rsHeader.fields("Tot_part")%></td>
    <td width="4%">&nbsp; </td>
  </tr>
</table>
<table width="100%" border="0" height="62">
  <tr> 
    <td width="46%" height="23">&nbsp;</td>
    <td width="54%" height="23"> 
      <table width="100%" border="0">
        <tr>
          <td width="19%">STEREO PHASE</td>
          <%'dim sSPGood, sSPNG
          'if trim(rsHeader.Fields("")) = "OK" then
			'	sSPGood = "CHECKED"
		 ' else
			'	sSPNG = "CHECKED"
		 'end if %>
          <td width="14%"> 
            <input type="radio" name="radSP" id="radSP" value="radStereoGood" <%'=sSPGood%>>
            Good </td>
          <td width="14%"> 
            <input type="radio" name="radSP" id="radSP" value="radStereoNG" <%'=sSPNG%>>
            N/G</td>
          <td width="4%">&nbsp;</td>
          <td width="20%">COM/M&amp;E SYNC:</td>
          <%dim sComMEGood, sComMENG
          if (trim(rsHeader.Fields("Comp_Sync")) = "OK") or (trim(rsHeader.Fields("Comp_Sync")) = "NA") or (trim(rsHeader.Fields("Comp_Sync")) = "Marginal") then
				sComMEGood = "CHECKED"
		  else
				sComMENG = "CHECKED"
		  end if %>
          <td width="14%">
            <input type="radio" name="radCom" id="radCom" value="radComGood" <%=sComMEGood%>>
            Good</td>
          <td width="15%"> 
            <input type="radio" name="radCom" id="radCom" value="radComNG" <%=sComMENG%>>
            N/G</td>
        </tr>
      </table>
      <table width="100%" border="0">
        <tr>
          <td width="18%">LANGUAGE:</td>
          <td width="82%" class=underline>&nbsp;<%=rsHeader.fields("Language")%></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0">
  <tr> 
    <td width="46%"> 
      <table width="100%" border="1" bordercolor="#000000" cellspacing="0">
        <tr>
          <td>
            <div align="center">ELEMENT DESCRIPTION</div>
          </td>
        </tr>
      </table>
      <table width="100%" border="1" bordercolor="#000000" cellspacing="0">
        <tr> 
          <td width="55%"> 
            <div align="center">Barcode ID#</div>
          </td>
          <td width="45%">&nbsp;<%=rsHeader.fields("TapeNumber")%></td>
        </tr>
        <tr> 
          <td width="55%"> 
            <div align="center">Type</div>
          </td>
          <td width="45%">&nbsp;</td>
        </tr>
        <tr> 
          <td width="55%"> 
            <div align="center">Format</div>
          </td>
          <td width="45%">&nbsp;<%=rsHeader.Fields("Format")%></td>
        </tr>
        <tr> 
          <td width="55%"> 
            <div align="center">Standard</div>
          </td>
          <td width="45%"><%=rsHeader.fields("Standard")%>&nbsp;</td>
        </tr>
        <tr> 
          <td width="55%"> 
            <div align="center">Conversion:</div>
          </td>
          <td width="45%"><%=rsHeader.fields("Aspect")%>&nbsp;</td>
        </tr>
        <tr> 
          <td width="55%"> 
            <div align="center">Timecode:</div>
          </td>
          <td width="45%"><%=rsHeader.fields("Time_Code")%>&nbsp;</td>
        </tr>
      </table>
    </td>
    <td width="54%">
      <table width="100%" border="0">
        <tr> 
          <td width="6%">&nbsp;</td>
          <td width="23%">CONTENT</td>
          <td width="2%">&nbsp;</td>
          <td width="12%">1K</td>
          <td width="2%">&nbsp;</td>
          <td width="12%">PEAK</td>
          <td width="2%">&nbsp;</td>
          <td width="12%">AVG</td>
          <td width="2%">&nbsp;</td>
          <td width="14%">A/SR</td>
          <td width="13%">&nbsp;</td>
        </tr>
        <tr> 
          <td width="6%">CH1</td>
          <td width="23%" class=underline>&nbsp;<%=rsHeader.fields("ch1_desc")%></td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;<%=rsHeader.fields("ch1_peak")%></td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;<%=rsHeader.fields("ch1_avg")%></td>
          <td width="2%">&nbsp;</td>
          <td width="14%" class=underline>&nbsp;</td>
          <td width="13%">&nbsp;</td>
        </tr>
        <tr> 
          <td width="6%">CH2</td>
          <td width="23%" class=underline>&nbsp;<%=rsHeader.fields("ch2_desc")%></td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;<%=rsHeader.fields("ch2_peak")%></td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;<%=rsHeader.fields("ch2_avg")%></td>
          <td width="2%">&nbsp;</td>
          <td width="14%" class=underline>&nbsp;</td>
          <td width="13%">&nbsp;</td>
        </tr>
        <tr> 
          <td width="6%">CH3</td>
          <td width="23%" class=underline>&nbsp;<%=rsHeader.fields("ch3_desc")%></td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;<%=rsHeader.fields("ch3_peak")%></td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;<%=rsHeader.fields("ch3_avg")%></td>
          <td width="2%">&nbsp;</td>
          <td width="14%" class=underline>&nbsp;</td>
          <td width="13%">&nbsp;</td>
        </tr>
        <tr> 
          <td width="6%">CH4</td>
          <td width="23%" class=underline>&nbsp;<%=rsHeader.fields("ch4_desc")%></td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;<%=rsHeader.fields("ch4_peak")%></td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;<%=rsHeader.fields("ch4_avg")%></td>
          <td width="2%">&nbsp;</td>
          <td width="14%" class=underline>&nbsp;</td>
          <td width="13%">&nbsp;</td>
        </tr>
        <tr> 
          <td width="6%">CUE</td>
          <td width="23%" class=underline>&nbsp;<%=rsHeader.fields("cue_desc")%></td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;<%=rsHeader.fields("cue_peak")%></td>
          <td width="2%">&nbsp;</td>
          <td width="12%" class=underline>&nbsp;<%=rsHeader.fields("cue_avg")%></td>
          <td width="2%">&nbsp;</td>
          <td width="14%" class=underline>&nbsp;</td>
          <td width="13%">&nbsp;</td>
        </tr>
      </table>  
      <table width="100%" border="1" cellspacing="0" bordercolor="#000000" height="34">
        <tr>
          <td height="22">SOURCE MASTER/ELEMENT:</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width=100% border=0 cellspacing=0 height="17">
  <tr>
    <td valign=middle height="35"> 
      <table width=99% cellspacing="0">
        <tr> 
          <td valign=middle width="32%" class=underline> QC VENDOR: 4MC</td>
          <td valign=middle width="24%" class=underline> QC VTR: <%=rsHeader.fields("QC_VTR")%></td>
          <td valign=middle width="10%" class=underline>&nbsp; </td>
          <td valign=middle width="27%" class=underline> OPERATOR NAME: <%=rsHeader.fields("FullName")%></td>
          <td valign=middle width="7%" class=underline>&nbsp; </td>
        </tr>
      </table>
      <table width=99% cellspacing="0">
        <tr> 
          <td valign=middle width="32%" class=underline> RECORD VENDOR:</td>
          <td valign=middle width="24%" class=underline> REC. VTR: <%=rsHeader.fields("Rec_VTR")%></td>
          <td valign=middle width="10%" class=underline>&nbsp; </td>
          <td valign=middle width="27%" class=underline> RECORD DATE: <%if isnull(rsHeader.Fields("Rec_Date")) then
																			Response.Write(rsHeader.Fields("Rec_Date"))
																		else
																			Response.Write(replace(rsHeader.Fields("Rec_Date"), "1/1/1900", ""))
																		end if%></td>
          <td valign=middle width="7%" class=underline>&nbsp; </td>
        </tr>
      </table>
      
    </td>
  </tr>
</table>
<table width="100%" border="1" bordercolor="black" cellspacing="0" height="99">
  <tr>
    <td height="15"> 
      <div align="center">
        <font class=txt_boldtype><b>TECHNICAL SPECIFICATIONS</b></font>
      </div>
    </td>
  </tr>
  <tr>
    <td height="86"> 
      <table width="100%" border="1" bordercolor="black" cellspacing="0">
        <tr>
          <td height="17">VIDEO AVG:</td>
          <td height="17">VIDEO/BARS: <%=rsHeader.fields("Bar_Vid")%></td>
          <td height="17">SET-UP: <%=rsHeader.fields("Bar_Set")%></td>
          <td height="17"> 
            <table width="100%" border="0" cellspacing="0">
              <tr> 
                <td height="10">HORIZONTAL BLANKING: <%=rsHeader.fields("HBlank")%></td>
                <td height="10">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="17">VIDEO PEAK: </td>
          <td height="17">CHROMA/BARS: <%=rsHeader.fields("Bar_Chr")%></td>
          <td height="17">FRONT PORCH: <%=rsHeader.fields("Front_Por")%></td>
          <td height="17"> 
            <table width="100%" border="0" cellspacing="0">
              <tr> 
                <td height="12">VERTICAL BLANKING: <%=rsHeader.fields("VBlank")%></td>
                <td height="12">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="20">CHROMA AVG: <%=rsHeader.fields("Chroma_Avg")%></td>
          <td height="20">SYNC AMPLITUDE: </td>
          <td height="20">SYNC DURATION:</td>
          <td height="20"> 
            <table width="100%" border="1" cellspacing="0" bordercolor="black" height="17">
              <tr>
                <td height="11">VITC <%=rsHeader.fields("VITC")%></td>
                <td height="11">VITS <%=rsHeader.fields("VITS")%></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="2">CHROMA PEAK: <%=rsHeader.fields("Chroma_Peak")%></td>
          <td height="2">BURST AMPLITUDE: </td>
          <td height="2">BURST DURATION:</td>
          <td height="2"> 
            <table width="100%" border="1" cellspacing="0" bordercolor="black">
              <tr> 
                <td width="51%" height="10">CC <%=rsHeader.fields("Channel_cond")%></td>
                <td width="49%" height="10">VIRS <%=rsHeader.fields("VIRS")%></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" height="189">
  <tr>
    <td width="54%" height="203"> 
      <table width="100%" border="1" cellspacing="0" bordercolor="#000000">
        <tr>
          <td width="34%" height="46"> 
            <table width="100%" border="0">
              <tr> 
                <td height="11"> 
                  <p align="center">CONTROL TRACK</p>
                  
                </td>
              </tr>
              <tr> 
                <td> 
                  <table width="100%" border="0">
                    <tr> 
                      <td height="2">
                        <input type="radio" name="radiobutton" value="radCntlTrackGood">
                        Good </td>
                      <td height="2">
                        <input type="radio" name="radiobutton" value="radCntlTrackNG">
                        N/G </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td width="34%" height="46"> 
            <table width="100%" border="0">
              <tr> 
                <td height="7"> 
                  <div align="center">VIDEO RF </div>
                </td>
              </tr>
              <tr> 
                <td> 
                  <table width="100%" border="0">
                    <tr> 
                      <td height="19" width="53%"> 
                        <input type="radio" name="radiobutton" value="radVideoRFGood">
                        Good </td>
                      <td height="19" width="47%">
                        <input type="radio" name="radiobutton" value="radVideoRFNG">
                        N/G </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td width="32%" height="46"> 
            <table width="100%" border="0">
              <tr> 
                <td height="4"> 
                  <div align="center">TAPE WRAP</div>
                </td>
              </tr>
              <tr> 
                <td> 
                  <table width="100%" border="0">
                    <tr> 
                      <td height="2">
                        <input type="radio" name="radiobutton" value="radTapeWrapGood">
                        Good </td>
                      <td height="2">
                        <input type="radio" name="radiobutton" value="radTapeWrapNG">
                        N/G </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <table width="100%" border="1" cellspacing="0" bordercolor="black">
        <tr>
          <td height="12"> 
            <div align="center">DIGITAL RF CHANNEL CONDITION</div>
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="1" cellspacing="0" bordercolor="black">
              <tr>
                <td>&nbsp;</td>
                <td>INT 1</td>
                <td>INT 2</td>
                <td>INT 3</td>
                <td>INT 4</td>
                <td>INT 5</td>
                <td>INT 6</td>
              </tr>
              <tr>
                <td>A</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>B</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>C</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>D</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>LIST CONCEALMENT RATE (FROM 1-4) AT TEN MINUTE INTERVALS</td>
        </tr>
      </table>
    </td>
    <td width="46%" height="203"> 
      <table width="100%" border="1" cellspacing="0" bordercolor="black">
        <tr>
          <td> 
            <div align="center">FORMAT </div>
            <table width="100%" border="0">
              <tr>
                <td width="11%" height="17">&nbsp;</td>
                <td width="43%" height="17">DESCRIPTION</td>
                <td width="46%" height="17">LENGTH</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="54">
            <table width="100%" border="1" cellspacing="0" bordercolor="black">
            <%do while not rsTapeFormat.eof%>
              <tr>
                <td width="11%">&nbsp;<%=rsTapeFormat.Fields("item_num")%></td>
                <td width="43%">&nbsp;<%=rsTapeFormat.Fields("Description")%></td>
                <td width="46%">&nbsp;<%=rsTapeFormat.Fields("Length")%></td>
              </tr>
              <%rsTapeFormat.movenext
              loop%>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width=100%>
  <tr> 
    <td width=80%> GENERAL COMMENTS (PLEASE ITEMISE SPECIFIC PROBLEMS ON PAGE 
      2): </td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td height="84"> 
      <table width="100%" border="0" cellspacing="0">
        <tr> 
          <td class=underline>&nbsp;</td>
        </tr>
        <tr> 
          <td class=underline>&nbsp;</td>
        </tr>
        <tr> 
          <td class=underline>&nbsp;</td>
        </tr>
        <tr> 
          <td class=underline>&nbsp;</td>
        </tr>
        <tr> 
          <td class=underline>&nbsp;</td>
        </tr>
        <tr> 
          <td class=underline>&nbsp;</td>
        </tr>
        <tr> 
          <td class=underline>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0">
        <tr>
          <td width="53%" class=underline>HEAD LOGOS:</td>
          <td width="47%" class=underline>TAIL LOGO</td>
        </tr>
        <tr>
          <td width="53%" class=underline>VENDOR APPROVAL</td>
          <td width="47%" class=underline>DATE:</td>
        </tr>
        <tr>
          <td width="53%" class=underline>BVI - QA APPROVAL:</td>
          <td width="47%" class=underline>DATE:</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<%dim j
j=0
rsBVMastLog.Open sqlBVIMastLog
thisPage = 2
if rsBVMastLog.BOF = true and rsBVMastLog.EOF =true then j=1
do while not rsBVMastLog.EOF or j=1
     %> 

<!-- ******************************************************* -->
<DIV class=PageBreak><!-- Pages >= 2 -->
<!-- ******************************************************* -->

  <table width="100%" cellspacing="4" cellpadding="0" border="0">
    <tr> 
      <td width="66%"> 
        <table width="100%" cellspacing="0" border="1" bordercolor="black">
          <tr> 
            <td width=55 align=center> <img src="../images/Buena.gif" width="53" height="36"> 
            </td>
            <td align="center" class=header_type> BUENA VISTA INTERNATIONAL TELEVISION <br>
              Mastering QC Report </td>
          </tr>
        </table>
      </td>
      <td width="34%"> 
        <table width=100% cellspacing=0 border=0>
          <tr> 
            <td width="13%">W.O.#:</td>
            <td width="27%" class=underline>&nbsp;<%=rsHeader.fields("wonum")%></td>
            <td width="8%">&nbsp;</td>
            <td width="12%">Date:</td>
            <td width="40%" class=underline>&nbsp;<%=rsHeader.fields("QC_Date")%><!--&nbsp;&nbsp;/&nbsp;&nbsp;/&nbsp;&nbsp;--> 
            </td>
          </tr>
          <tr> 
            <td width="13%">P.O.#:</td>
            <td width="27%" class=underline>&nbsp;<%=rsHeader.fields("pono")%></td>
            <td width="8%">&nbsp;</td>
            <td width="12%">Page:</td>
            <td width="40%" class=underline>&nbsp;<%=thisPage%>&nbsp;of&nbsp;<span id="totPage<%=thisPage%>"></span></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width=100%>
    <tr>
      <td width=4%>Title:</td>
      <td width=79% class=underline>&nbsp;<%=rsHeader.fields("Show")%></td>
      <td width="7%">&nbsp; </td>
      <td width="4%">&nbsp; </td>
      <td width="1%">&nbsp; </td>
      <td width="5%">&nbsp; </td>
    </tr>
  </table>
  <table width=100%>
    <tr> 
      <td width=4%>Eps#</td>
      <td width=21% class=underline>&nbsp;<%=rsHeader.fields("Epis_no")%></td>
      <td width=6%> 
        <div align="right">Eps title: </div>
      </td>
      <td width=53% class=underline>&nbsp;<%=rsHeader.fields("Epis_Name")%></td>
      <td width="5%"> Part: </td>
      <td width="3%"> of </td>
      <td width="8%">&nbsp; </td>
    </tr>
  </table>
  <table width=100% border=0 cellspacing=0>
    <tr>
      <td valign=middle>
        <table width=99%>
          <tr> 
            <td valign=middle width="26%"> 
              <table width="100%" border="1" cellspacing="0" bordercolor="#000000">
                <tr>
                  <td>PROGRAM NOTES</td>
                </tr>
              </table>
            </td>
            <td valign=middle width="26%">&nbsp; </td>
            <td valign=middle width="17%"> 1=MINOR</td>
            <td valign=middle width="16%"> 2=MARGINAL</td>
            <td valign=middle width="15%"> 3=SEVERE</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width=100% border=1 bordercolor=black cellpadding=1 cellspacing=0>
    <tr> 
      <td> 
        <table width=100% border=1 bordercolor=black cellpadding=1 cellspacing=0>
          <tr> 
            <td align=center> TIME<br>
              CODE </td>
            <td align=center> DESCRIPTION </td>
            <td align=center> DURATION </td>
            <td align=center class=txt_italic> A </td>
            <td align=center class=txt_italic> V </td>
            <td align=center class=txt_italic> F </td>
            <td align=center> SCALE </td>
            <td align=center> CHANNEL<br>
              SECTOR </td>
            <td align=center> IN<br>
              SOURCE </td>
            <td align=center> SIGN<br>
              OFF </td>
          </tr>
          <% nTotalLines = 0
             do while nTotalLines < 400
              nLines = 0
				if rsBVMastLog.EOF = false then 
					nLines = GetLines(rsBVMastLog.Fields("Note"))
					nTotalLines = nTotalLines + nLines
				else 
				nTotalLines = nTotalLines + 13	 
				end if
				
				if nTotalLines > 400 Then
					exit do           
				
				else
		  %>
				<tr> 
				  <td align=center><% if rsBVMastLog.EOF = false then Response.write(rsBVMastLog.Fields("Time_Code")) else Response.Write "&nbsp;"%></td>
				  <td align=center width="400"><% if rsBVMastLog.EOF = false then 
										if Response.write(rsBVMastLog.Fields("Note")) = 0 then
											Response.Write "&nbsp"
										else 
											Response.write(rsBVMastLog.Fields("Note"))
									    end if
									  else 
										 Response.Write "&nbsp"
									  end if%></td>
				  <td align=center><% if rsBVMastLog.EOF = false then 
										if Response.write(rsBVMastLog.Fields("Item_Duratn")) = 0 then
											Response.Write "&nbsp"
										else 
											Response.Write(rsBVMastLog.Fields("Item_Duratn"))
										end if 
									  else 
										Response.Write "&nbsp"
									  end if %></td>
				  <td align=center><% if rsBVMastLog.EOF = false then
										if rsBVMastLog.Fields("QC_Code") = "A" then 
										Response.Write "X" 
										else 
											Response.Write "&nbsp"
										end if  
									  else 
										Response.Write "&nbsp"
									  end if %></td>
				  <td align=center><%  if rsBVMastLog.EOF = false then
											if rsBVMastLog.Fields("QC_Code") = "V" then 
												Response.Write "X" 
											else 
												Response.Write "&nbsp"
											end if
									    else 
											Response.Write "&nbsp"
										end if%></td>
				  <td align=center><%  if rsBVMastLog.EOF = false then
											if rsBVMastLog.Fields("QC_Code") = "F" then 
												Response.Write "X" 
											else 
												Response.Write "&nbsp"
											end if
										else 
											Response.Write "&nbsp"
									    end if%></td>						 
				  <td align=center><%	if rsBVMastLog.EOF = false then 
											if Response.write(rsBVMastLog.Fields("QC_Grade")) = 0 then
												Response.Write "&nbsp;" 
											else 
												Response.write(rsBVMastLog.Fields("QC_Grade")) 
											end if
										else 
											Response.Write "&nbsp;"
										end if%></td>
				  <td align=center><%	if rsBVMastLog.EOF = false then 
											if Response.write(rsBVMastLog.Fields("Action")) = 0 then
												Response.Write "&nbsp;" 
											else 
												Response.write(rsBVMastLog.Fields("Action"))
											end if
										else 
											Response.Write "&nbsp"
										end if%></td>
				  <td align=center><%	if rsBVMastLog.EOF = false then 
											if rsBVMastLog.Fields("In_Master") = -1 then
												Response.Write "Yes" 
											else 
												Response.write "No"
											end if
										else 
											Response.Write "&nbsp"
										end if%></td>
				  <td align=center>&nbsp;</td>
				</tr>
		<%
				end if 
				if rsBVMastLog.EOF = false then rsBVMastLog.MoveNext 
			loop%>

        </table>
      </td>
    </tr>
  </table>
  <table width="100%" border="0">
    <tr> 
      <td>&nbsp;</td>
    </tr>
  </table>
  <table width="100%" border="0" height="87">
    <tr> 
      <td width="59%"> 
        <table width="100%" border="1" cellspacing="1" bordercolor="#000000">
          <tr>
            <td>
              <table width="100%" border="1" height="87" cellspacing="0" bordercolor="black">
                <tr> 
                  <td width="24%"> 
                    <div align="center">TIMECODE</div>
                  </td>
                  <td width="56%"> 
                    <div align="center">TEXTLESS</div>
                  </td>
                  <td width="20%">DURATION</td>
                </tr>
                <tr> 
                  <td width="24%">&nbsp;</td>
                  <td width="56%">&nbsp;</td>
                  <td width="20%">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="24%">&nbsp;</td>
                  <td width="56%">&nbsp;</td>
                  <td width="20%">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="24%">&nbsp;</td>
                  <td width="56%">&nbsp;</td>
                  <td width="20%">&nbsp;</td>
                </tr>
                <tr>
                  <td width="24%">&nbsp;</td>
                  <td width="56%">&nbsp;</td>
                  <td width="20%">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="24%">&nbsp;</td>
                  <td width="56%">&nbsp;</td>
                  <td width="20%">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="24%">&nbsp;</td>
                  <td width="56%">&nbsp;</td>
                  <td width="20%">&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td width="41%"> 
        <table width="61%" border="0" cellspacing="0" align="center">
          <tr>
            <td height="90"> 
              <div align="center">SECTOR KEY </div>
              <table width="94%" border="1" height="51" cellspacing="1" bordercolor="black" align="center">
                <tr> 
                  <td width="30%" height="23"> 
                    <div align="center">U-L</div>
                  </td>
                  <td width="35%" height="23"> 
                    <div align="center">U-C</div>
                  </td>
                  <td width="35%" height="23"> 
                    <div align="center">U-R</div>
                  </td>
                </tr>
                <tr> 
                  <td width="30%" height="22"> 
                    <div align="center">M-L</div>
                  </td>
                  <td width="35%" height="22"> 
                    <div align="center">M-C</div>
                  </td>
                  <td width="35%" height="22"> 
                    <div align="center">M-R</div>
                  </td>
                </tr>
                <tr> 
                  <td height="24" width="30%"> 
                    <div align="center">L-L</div>
                  </td>
                  <td height="24" width="35%"> 
                    <div align="center">L-C</div>
                  </td>
                  <td height="24" width="35%"> 
                    <div align="center">L-R</div>
                  </td>
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
      <td>&nbsp;</td>
    </tr>
  </table>
  <table width="100%" border="0">
    <tr> 
      <td>CORRECTIVE ACTION</td>
    </tr>
  </table>
  <table width="100%" border="1" height="112" cellspacing="0" bordercolor="#000000">
    <tr> 
      <td width="68%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="68%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="68%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="68%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="68%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="68%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="68%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
  </table>
  </DIV>
  <script>
	    
  </script>
<% j=0
   
	Response.Write("<SCRIPT>")
	for i = 1 to thisPage
	Response.Write("totPage" & i & ".innerText = '" & thisPage & "';")
	next
	Response.Write("</SCRIPT>")
	
	thisPage = thisPage + 1 
	loop
	rsBVMastLog.Close
%>

