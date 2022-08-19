 <tr>
          <td>QC Date: <b><%=rsHeader.Fields("QC_Date")%></b></td>
          <td>Revised Date: <b><%=rsHeader.Fields("revised_date")%></b></td>
          <td>Record Date: <b><%if isnull(rsHeader.Fields("Rec_Date")) then
									Response.Write(rsHeader.Fields("Rec_Date"))
								  else
									Response.Write(replace(rsHeader.Fields("Rec_Date"), "1/1/1900", ""))
								  end if%></b></td>
          <td>Stock Mfg: <b><%=rsHeader.Fields("Stock_mfg")%></b></td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
          <td>QC VTR: <b><%=rsHeader.Fields("QC_VTR")%></b></td>
          <td>Revised By: <b><%=rsHeader.Fields("Revised_By")%></b></td>
          <td>Record VTR: <b><%=rsHeader.Fields("Rec_Vtr")%></b></td>
          <td>Stock Batch #: <b><%=rsHeader.Fields("Stock_Batch")%></b></td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
          <td>QC Operator: <b><%=rsHeader.Fields("FullName")%></b></td>
          <td>Source Standard: <b><%=rsHeader.Fields("Src_standard")%></b></td>
          <td>Record Facility: <b><%=rsHeader.Fields("Rec_fac")%></b></td>
          <td>Textless @ Tail: <b><%if rsHeader.Fields("textless") = "Y" Then
                                       Response.Write("Yes")
                                    else
										Response.Write("No")
									end if%></b></td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
          <td>Control Room #: <b><%=rsHeader.Fields("Bay_Num")%></b></td>
          <td>Source Format: <b><%=rsHeader.Fields("src_format")%></b></td>
          <td>&nbsp;</td>
          <td>Text Duration: <b><%=rsHeader.Fields("duration")%></b></td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
          <td colspan=2>Source Description: <b><%=rsHeader.Fields("src_desc")%></b></td>
          <td colspan=2>Additional Info: <b><%=rsHeader.Fields("addinfo")%></b></td>
        </tr>