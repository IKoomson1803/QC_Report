<style>

.galimage[src=""] {
  display:none;
}


</style>

<%
On Error Resume Next
 If rsFaultImage.RecordCount  > 0 Then
 %>

<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<%
j=0
'thisPage = thisPage + 1
if rsFaultImage.BOF = true and rsFaultImage.EOF =true then j=1
''rsFaultImage.MoveFirst
do while not rsFaultImage.EOF or j=1
%> 


<div class="PageBreak"><!-- Pages >= 2 -->
<!-- ******************************************************* -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180"><img SRC="../images/Logos/End-Cred-Red-Logo_tran-100x100.png" border="0"></td>
    <td align="center"> 
      <h2 class="txt_boldtype_header">QUALITY CONTROL REPORT FOR<br>
       Banijay Rights</h2>
    </td>
	<!--
    <td align="right">
		Page:&nbsp;1&nbsp;of&nbsp;1
    </td>
	-->
  </tr>
  </table>

<table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolor="#000000" height="36">
  <tr>
  <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="1" >
	     <tr>
             <td >Title:&nbsp; <b><%=rsHeader.Fields("Show")%></b></td>
             <td>Part Number:&nbsp;<b>Part <%=rsHeader.Fields("This_part")%> of <%=rsHeader.Fields("tot_part")%></b></td>
             <td>QC Number:&nbsp;<b><%=rsHeader.Fields("QCNum")%></b></td>
		 </tr> 
		 <tr> 
                <td colspan="3">&nbsp;</td>
         </tr>
		<tr>
             <td >Series:&nbsp; <b><%=rsHeader.Fields("Epis_name")%></b></td>
             <td>Episode Number:&nbsp;<b><%=rsHeader.Fields("Epis_no")%></b></td>
             <td>WO Number:&nbsp;<b><%=rsHeader.Fields("wonum")%></b></td>
		</tr> 
		<tr> 
                <td colspan="3">&nbsp;</td>
         </tr>
         
	
	     <tr>
              <td >Description:&nbsp; <b><%=rsHeader.Fields("TapeDesc1")%></b></td>
              <td>TRT:&nbsp;<b><%=rsHeader.Fields("TRT")%></b></b></td>
			  <!-- <td >Subtitles:&nbsp; <b><%=rsHeader.Fields("Subtitle")%></b></td> -->
               <td>Time Code:&nbsp;<b><%=rsHeader.Fields("Timecode")%></b></td>
					  
			  
			  
			  
   		</tr> 
		<tr>
			 
                <td colspan="3">&nbsp;</td>
         </tr>
		 <tr>
              <td >Version:&nbsp; <b><%=rsHeader.Fields("Version")%></b></td>
              
			  
   		</tr> 
		
		 <tr>
			 
                <td colspan="3">&nbsp;</td>
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
				  <td align="center" class="blackSquare" colspan="2" > 
					<font class="txt_italic" size="3"><b>Reference Images</b></font>
				  </td>
				</tr>
<%
         nTotalImages = 0
             do while nTotalImages < 2
              nFaultImages = 0
				if rsFaultImage.EOF = false then 
					nFaultImages = 1 ''GetLines(rsFaultImage.Fields("Description"))
					nTotalImages = nTotalImages + nFaultImages
				else 
				''nTotalLines = nTotalLines + 13	 
				end if
				
				if nFaultImages > 520 Then
					exit do           
				
				else
	
%>


			   <tr class="txt_boldtype2 hideRow">
					<td style="padding:20px;" align="center"  class="txt_boldtype2 left_right_bottom_border" >
					   <div style="font-size:18px;padding:5px;"> <%=rsFaultImage.Fields("Description")%> </div> <br/>
					  <img  width="50%" src="<%=rsFaultImage.Fields("ImagePath")%>" class="galimage" onerror="hideRow()" /> 
				  </td>
			  </tr>
  
 <%	
             end if
			 
         If rsFaultImage.EOF=false Then
		    rsFaultImage.MoveNext 
		 else
		    Exit Do
		 End if
       loop
%>
 
 </table>
 

<% j=0
   
		''Response.Write("<SCRIPT>")
		''for i = 1 to thisPage
		''Response.Write("totalPage" & i & ".innerText = '" & thisPage & "';")
		''next
		''Response.Write("</SCRIPT>")
		
		''thisPage = thisPage + 1
		
		If rsFaultImage.EOF=True  Then
	       Exit do
	    End If 
	loop   

End If	

rsFaultImage.Close
set rsFaultImage = Nothing
%>

 

<script>
 function hideRow(){
 
    var images = document.getElementsByClassName('galimage');
	for (var i=0;i<images.length;i+=1){
	
	//alert(images[i].src)

	if(!images[i].src.includes('UploadedImages')){
	   // alert('found: ' + i )
	    document.getElementsByClassName("hideRow")[i].style.display = "none";
	  }
	
	}
 
 }

</script>
