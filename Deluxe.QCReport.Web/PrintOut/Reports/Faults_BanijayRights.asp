
<%

rsBVMastLog.Open sqlBVIMastLog,,3,3

%>

 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>

  
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>

<div class="PageBreak"></div>

  <!--  Header -->
  <!-- #include file="Header_BanijayRights.asp" -->

<table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-top:none; border-bottom:none; background-color:#BFBFBF">
	   <tr>
          <td>&nbsp;</td>
      </tr> 
	 </table>
	 	  
      <table width="100%" border="1" cellspacing="0" cellpadding="1" style="border-bottom:none; background-color:#FF4370">
	   <tr>
          <td style="font-size:14px; font-weight: bold; text-align:center;padding: 5px 5px 5px 5px;">FAULTS</td>
      </tr> 
	 </table>
	 <table width="100%" border="0" cellspacing="0" cellpadding="1" style="border-bottom:none; background-color:#BFBFBF">
	   <tr>
          <td>&nbsp;</td>
      </tr> 
 </table>


  
  <!--
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
-->

  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<!--<tr style="line-height:20px;">
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
	  <tr style="line-height:20px;">
		   <td class="blackSquare" style="font-weight:bold;font-size:16px; text-align:center;">
				<span>Status:&nbsp;&nbsp;</span>
				<span><%=rsHeader.Fields("Eval_Stat")%></span>
				
			</td>
		
	  </tr>
    -->
    
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="1">
          <tr> 
		 		  
			
            <td width="7%" align="center" class="left_top_border BanijayRightsProgrammeLayout"><b>TIME CODE</b></td>
            <td width="6%" align="center" class="left_top_border BanijayRightsProgrammeLayout"><b>TYPE</b></td>
            <td width="62%" align="center" class="left_top_border BanijayRightsProgrammeLayout"><b>FAULT DESCRIPTION</b></td>
            <td width="3%" align="center" class="left_top_border BanijayRightsProgrammeLayout"><b>GRD</b></td>
			
            <td width="7%" align="center" class="left_top_border BanijayRightsProgrammeLayout"><b>SECTOR</b></td>
		     <td width="7%" align="center" class=" left_top_border BanijayRightsProgrammeLayout" ><b>SAME AS MASTER</b></td>
			 <td width="7%" align="center" class="left_right_top_border BanijayRightsProgrammeLayout"  ><b>ITEM DURATION</b></td>
			
            
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
		 
			
            <td  style="vertical-align:middle;" class="left_top_border BanijayRightsText">
			
			  &nbsp;<%=rsBVMastLog.Fields("Time_Code")%>&nbsp;&nbsp;
		
			</td>
            <td  style="vertical-align:middle;"  class="left_top_border BanijayRightsText">&nbsp;
			<%
			
			      If IsNull(rsBVMastLog.Fields("QC_Codename").Value) Then
				  
				        If rsBVMastLog.Fields("QC_Code").Value = "Audio" Then
						   Response.write("A")
						ElseIf rsBVMastLog.Fields("QC_Code").Value = "Film" Then
						   Response.write("F")    
						ElseIf rsBVMastLog.Fields("QC_Code").Value = "Video" Then
						   Response.write("V")  
				    	End If
				  Else
				    Response.write(rsBVMastLog.Fields("QC_Codename"))
			      End If
			
			%>
			
			&nbsp;&nbsp;</td>
            <td  style="vertical-align:middle;"  class="left_top_border BanijayRightsText">&nbsp;<%=rsBVMastLog.Fields("Note")%>&nbsp;</td>
            <td  style="vertical-align:middle;"  class="left_top_border BanijayRightsText">&nbsp;<%=rsBVMastLog.Fields("QC_Grade")%>&nbsp;</td>
			
            <td  style="vertical-align:middle;"  class="left_top_border BanijayRightsText">&nbsp;
			
			      <%
				  
				   If IsNull(rsBVMastLog.Fields("ActionsForDisplay").Value) Then
			           Response.write(rsBVMastLog.Fields("Action"))
				  Else
				    Response.write("<span style=white-space: pre;>" &  rsBVMastLog.Fields("ActionsForDisplay") &  "</span>")
			      End If
				  
				  
				  %>
			
			
			&nbsp;</td>
					
					<td  style="vertical-align:middle;"  class="left_top_border BanijayRightsText">&nbsp;
															<%
															if rsBVMastLog.Fields("in_master") = -1 then
																Response.write("Yes")
															else
																Response.Write("")
															end if
															%>&nbsp;
				</td>
				
				<td  style="vertical-align:middle;"  class="left_right_top_border  BanijayRightsText" >&nbsp;<%=rsBVMastLog.Fields("item_duratn")%>&nbsp;</td>
				
            
          </tr>
          <%	
		            itemNo = itemNo + 1  
		            rsBVMastLog.MoveNext 
		         end if
				 
                 ''if rsBVMastLog.EOF = false then rsBVMastLog.MoveNext 
				 
             loop%>
	 
			
        </table>
      </td>
    </tr>
	<tr style="line-height:40px;" >
	     <td class="left_right_top_border">
			<table width="100%" border="0" cellspacing="0" cellpadding="1">
			   <tr> 
		
				   <td  class="BanijayRightsText" style="color:#A6A6A6">
						<span>&nbsp;Type:&nbsp;</span>
						<span> V = VIDEO </span>
						 &nbsp;&nbsp;
						<span>A = AUDIO</span>
						 &nbsp;&nbsp;
						
					</td>
			
			   </tr>
			</table>
     
	   </td>
	
	</tr>
	
	<tr  style="line-height:40px;">
	    <td class="left_right_border">
			<table width="100%" border="0" cellspacing="0" cellpadding="1">
			  <tr> 
	              <td colspan="7" class="BanijayRightsText" style="color:#A6A6A6">
						<span>&nbsp;Severity Grades:&nbsp;</span>
						<span>1=Very Annoying</span>
						 &nbsp;
						<span>2=Annoying</span>
						 &nbsp;
						<span>3=Slightly Annoying</span>
						 &nbsp;
						 <span>4=Perceptible but not Annoying</span>
						 &nbsp;
						 <span>5=Imperceptible</span>
						 &nbsp;&nbsp;
						
			     </td>
	        </tr>
			</table>
     
	   </td>
	</tr>
	
	<tr style="line-height:30px;">
	     <td>
			<table width="100%" border="1" cellspacing="0" cellpadding="1">
			  <tr> 
				 <td style="width:20%" class="BanijayRightsProgrammeLayout" style="text-align:right;">
				 Pass or Fail:&nbsp;									 
				</td>
				<td colspan="6" class="BanijayRightsText" style="font-weight:bold;font-size:25px; text-align:center; color:red;">
				&nbsp;<%=rsHeader.Fields("Eval_Stat")%>	
				</td>
			  </tr>
			</table>
	   </td>   
	</tr>
	
	
  </table>
  
  
  