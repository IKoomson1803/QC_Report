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
       <%=rsHeader.Fields("CustName")%></h2>
    </td>
   <!--<td>
		Page:&nbsp;<%=thisPage%>&nbsp;of&nbsp;<span id="totalPage<%=thisPage%>"></span>
    </td>  -->
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
