 <%
'' Dim rsComments, sqlComments

set rsComments = Server.CreateObject("ADODB.Recordset")

sqlComments ="SELECT REPLACE(CONVERT(VARCHAR(8000), Comments) , CHAR(13), '<br/>') Comments FROM qcHeader " & _
			"WHERE QCNum = " & clng(sQCNum) & " AND SubQCnum = " & cint(sRev)
			
rsComments.ActiveConnection = cnQCS
rsComments.Open sqlComments

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
          <td style="font-size:14px; font-weight: bold; text-align:center;padding: 5px 5px 5px 5px;">NOTES</td>
      </tr> 
	 </table>
	 <table width="100%" border="0" cellspacing="0" cellpadding="1" style="border-bottom:none; background-color:#BFBFBF">
	   <tr>
          <td>&nbsp;</td>
      </tr> 
	 </table>
	 
<table width="100%" class="blacksquare" >
   <tr>
    <td style="padding:5px;" valign="top"><%=rsComments.Fields("Comments")%></td>
  </tr>
 </table>
 
 <table width="100%" border="1" cellspacing="0" cellpadding="1" >
   <tr>
    <td style="width:10%"  class="BanijayRightsProgrammeDetails">QC Date:&nbsp;</td>
	<td style="width:10%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("QC_Date")%></td>
		
	<td style="width:10%"  class="BanijayRightsProgrammeDetails">QC Type:&nbsp;</td>
	<td style="width:10%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("QCActionType")%></td>
	
	<td style="width:10%"  class="BanijayRightsProgrammeDetails">QC Vendor:&nbsp;</td>
	<td style="width:10%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("QCVendor")%></td>
	
	<td style="width:10%"  class="BanijayRightsProgrammeDetails">QC Operator:&nbsp;</td>
	<td style="width:10%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("Fullname")%></td>
	
	<td style="width:10%"  class="BanijayRightsProgrammeDetails">QC Kit:&nbsp;</td>
	<td style="width:10%"  class="BanijayRightsText">&nbsp;<%=rsHeader.Fields("QC_VTR")%></td>
	
	
	
  </tr>
 </table>
 
 
 
 <%
 
  rsComments.Close
  Set rsComments = Nothing
 
 
 %>