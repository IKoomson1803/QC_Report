
<%

rsBVMastLog.Open sqlBVIMastLog,,3,3

%>

<div class="PageBreak"></div>

 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>

  <!--  Header -->
  <!-- #include file="Header_BanijayRights.asp" -->
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  
  
 <table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr style="line-height:20px;">
   	<td class="blackSquare" style="font-weight:bold;text-align:center;">
	<span>Severity Grades:&nbsp;&nbsp;</span>
	<span>1 = Very Annoying</span>
     &nbsp;&nbsp;
	<span>2 = Annoying</span>
	 &nbsp;&nbsp;
	<span>3 = Slightly Annoying</span>
	 &nbsp;&nbsp;
	 <span>4 = Perceptible but not Annoying</span>
	 &nbsp;&nbsp;
	 <span>5 = Imperceptible</span>
	 &nbsp;&nbsp;
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
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="1">
          <tr> 
		 		  
			
            <td width="9%" align="center" class="left_top_border"><b>Time Code</b></td>
            <td width="6%" align="center" class="left_top_border"><b>Type</b></td>
            <td width="64%" align="center" class="left_top_border"><b>Fault Description</b></td>
            <td width="3%" align="center" class="left_top_border"><b>Grade</b></td>
			<td width="8%" align="center" class="left_top_border" ><b>Item Duration</b></td>
            <td width="7%" align="center" class="left_top_border"><b>Sector</b></td>
		     <td width="3%" align="center" class="left_right_top_border" ><b>Signed Off</b></td>
			
            
          </tr>
          <% nTotalLines = 0
		     ''Dim faultsCount
			 faultsCount = (rsBVMastLog.RecordCount * 13) + 420
             			 
             do while nTotalLines < faultsCount '' Changed increased magic number 420  by Isaac Koomson 13/02/2002
              nLines = 0
			  
				if rsBVMastLog.EOF = false then 
					nLines = GetLines(rsBVMastLog.Fields("Note"))
					nTotalLines = nTotalLines + nLines
				else 
				     nTotalLines = nTotalLines + 13	 
				end if
				
				if nTotalLines > faultsCount Then '' Changed increased magic number 420 by Isaac Koomson 13/02/2002
					exit do           
			    elseif rsBVMastLog.EOF = false then 
			    
		  %>
          <tr style="line-height:20px;">
		 
			
            <td  style="vertical-align:middle;" class="left_top_border">
			
			  &nbsp;<%=rsBVMastLog.Fields("Time_Code")%>&nbsp;&nbsp;
		
			</td>
            <td  style="vertical-align:middle;"  class="left_top_border">&nbsp;
			<%
			
			      If IsNull(rsBVMastLog.Fields("QC_Codename").Value) Then
				  
				        If rsBVMastLog.Fields("QC_Code").Value = "A" Then
						   Response.write("Audio")
						ElseIf rsBVMastLog.Fields("QC_Code").Value = "F" Then
						   Response.write("Film")    
						ElseIf rsBVMastLog.Fields("QC_Code").Value = "V" Then
						   Response.write("Video")  
				    	End If
				  Else
				    Response.write(rsBVMastLog.Fields("QC_Codename"))
			      End If
			
			%>
			
			&nbsp;&nbsp;</td>
            <td  style="vertical-align:middle;"  class="left_top_border">&nbsp;<%=rsBVMastLog.Fields("Note")%>&nbsp;</td>
            <td  style="vertical-align:middle;"  class="left_top_border">&nbsp;<%=rsBVMastLog.Fields("QC_Grade")%>&nbsp;</td>
			<td  style="vertical-align:middle;"  class="left_top_border" >&nbsp;<%=rsBVMastLog.Fields("item_duratn")%>&nbsp;</td>
            <td  style="vertical-align:middle;"  class="left_top_border">&nbsp;
			
			      <%
				  
				   If IsNull(rsBVMastLog.Fields("ActionsForDisplay").Value) Then
			           Response.write(rsBVMastLog.Fields("Action"))
				  Else
				    Response.write("<span style=white-space: pre;>" &  rsBVMastLog.Fields("ActionsForDisplay") &  "</span>")
			      End If
				  
				  
				  %>
			
			
			&nbsp;</td>
			
            <td  style="vertical-align:middle;"  class="left_right_top_border">&nbsp;
			                                        <%
													if rsBVMastLog.Fields("in_master") = -1 then
														Response.write("Yes")
													else
														Response.Write("")
													end if
												    %>&nbsp;
		</td>
            
          </tr>
          <%	
		            itemNo = itemNo + 1  
		            rsBVMastLog.MoveNext 
		         end if
				 
                 ''if rsBVMastLog.EOF = false then rsBVMastLog.MoveNext 
				 
             loop%>
			 
			<tr> 
			   <td colspan=7 class="top_border">&nbsp;</td>
			 
			  <!--
			   <% If itemNumberCount >  0 Then %>
					<td colspan=8 class="top_border">&nbsp;</td>
				 <% Else %>
					<td colspan=7 class="top_border">&nbsp;</td>
				<% End If %>
			 -->
		  </tr>
        </table>
      </td>
    </tr>
  </table>