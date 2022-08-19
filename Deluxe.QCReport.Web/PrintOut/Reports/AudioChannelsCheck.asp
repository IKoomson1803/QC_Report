<!-- Include file by Isaac Koomson 04/01/2012 -->

<table width="100%" border="1" cellspacing="0" bordercolor="#000000">
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
              
               <tr>
                <td width="11%">&nbsp;</td>
                <td width="6%">&nbsp;</td>
                <td width="8%">Ch9:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch9") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch10:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch10") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch11:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch11") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch12:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch12") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch13:</td>
                <td width="11%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch13") = -1 then Response.Write("<b>X</b>")%></td>
              </tr>
              
              <tr>
                <td width="11%">&nbsp;</td>
                <td width="6%">&nbsp;</td>
                <td width="8%">Ch14:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch14") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch15:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch15") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch16:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("FullQC_Ch16") = -1 then Response.Write("<b>X</b>")%></td>
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
              
              <tr> 
                <td width="13%">&nbsp;</td>
                <td width="4%">&nbsp;</td>
                <td width="8%">Ch9:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch9") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch10:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch10") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch11:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch11") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch12:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch12") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch13:</td>
                <td width="11%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch13") = -1 then Response.Write("<b>X</b>")%></td>
              </tr>
               <tr> 
                <td width="13%">&nbsp;</td>
                <td width="4%">&nbsp;</td>
                <td width="8%">Ch14:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch14") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch15:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch15") = -1 then Response.Write("<b>X</b>")%></td>
                <td width="8%">Ch16:</td>
                <td width="8%">&nbsp;<%if rsFullSpot.Fields("SpotQC_Ch16") = -1 then Response.Write("<b>X</b>")%></td>
               
              </tr>
            </table>
          </td>
        </tr>
      </table>
      