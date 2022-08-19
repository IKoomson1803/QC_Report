<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<meta NAME="robots" CONTENT="noindex">
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<LINK rel="stylesheet" type="text/css" href="../../css/qcs.css">
<script Language="javascript">

   
var popupWindow=null;
  	    
	function OpenEditFrm(url)  //opens forms for editing
	{

       if(popupWindow && !popupWindow.closed)
       {
           popupWindow.focus();
	   }
       else
		{
			popupWindow = window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=0,width=500,height=120');
		}
	 
	}

	function parent_disable() {
	   if(popupWindow && !popupWindow.closed)
		  popupWindow.focus();
    }

	
	function IsNumericBeforeSubmit()
	{ 
	    var inputValue = document.getElementById('txtVideoBitDepth').value;
        var isNumeric = ( (inputValue - 0) == inputValue && inputValue.length > 0 );
     		
		 if(!isUnsignedInteger)
		 {
		   alert('Video Bit Depth must be a positive integer') ;
		 }
		 else
		 {
		   frmVideoBitDepth.action = 'procInsertVideoBitDepth.asp';
		   frmVideoBitDepth.submit();
		 }
	} 
	
	function IsUnsignedIntegerBeforeSubmit()
	{
	    var inputValue = document.getElementById('txtVideoBitDepth').value;
        var isUnsignedInteger = (inputValue.toString().search(/^[0-9]+$/) == 0);
	
		 if(!isUnsignedInteger)
		 {
		   alert('Video Bit Depth must be a positive integer') ;
		 }
		 else
		 {
		   frmVideoBitDepth.action = 'procInsertVideoBitDepth.asp';
		   frmVideoBitDepth.submit();
		 }
	
    }

	
</SCRIPT>

<BODY class="bodyForm"  onFocus="parent_disable();" onclick="parent_disable();" topmargin=0 leftmargin=0 rightmargin=0>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'' Isaac Koomson = 16/01/2012
'Declarations
'********************
dim rsFrm, rsCombo
dim sVideoDescID, sVideoDesc
dim sql
dim sBGColor, intItem_num
'********************

''Response.write "Video Bit Depth"


Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Video Bit Depth Screen
'*******************************************************************************************************
		sql="SELECT VideoBitDepthID,VideoBitDepth FROM optVideoBitDepth ORDER BY VideoBitDepth"
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>
 <b>Video Bit Depth Drop-Down Contents</b>
<CENTER>
<BR>
<table id="tblForm" width=100%>
	<tr>
		<td>
			<table align="center" id="tblForm">
			<form method="post" name="frmVideoBitDepth" action="procInsertVideoBitDepth.asp">
				<tr>
					<td>
						Video Bit Depth:</td>
					<td>				
						<input type="text" id="txtVideoBitDepth" name="txtVideoBitDepth" size="50">
					</td>
				</tr>
				<tr>
					<td>&nbsp</td>
				</tr>
				<tr>
					<td align="Center" colspan="6">
						<input type="button" name="subUpdate" value="Add Video Bit Depth" onclick="javascript:IsUnsignedIntegerBeforeSubmit();"></td>
				</tr>
				</form>
			</table>
		</td>
		<td>
			<table align=center id="tblTapeFormat" border=0 width=200 cellpadding=0 cellspacing=0>
						<tr bgcolor=#999900>
							<td align="center">Video Bit Depth</td>
						</tr>
				<%sBGColor = "trBeige"%>
				<%	if rsFrm.EOF = true then %>
						<tr class=<%=sBGColor%>>
							<td colspan="6" align="center"><b>No Data to be listed</b></td>
						</tr>
				<%	else %>
				<%		do while not rsFrm.EOF %>
							<tr class=<%=sBGColor%> onmouseover="this.className='trWhite'" onmouseout="this.className='<%=sBGColor%>'" onclick="javascript:OpenEditFrm('frmUpdateVideoBitDepth.asp?VideoBitDepthID=<%=rsFrm.Fields("VideoBitDepthID")%>');">
								<td align="center"><%=rsFrm.Fields("VideoBitDepth")%></td>
							</tr>
				<%			rsFrm.MoveNext
							If sBGColor = "trBeige" Then
								sBGColor = "trBrown"
							Else
								sBGColor = "trBeige"
							End If
						loop
					end if			
				%>
			</table>
		</td>
	</tr>
</table>
</CENTER>
<%
rsFrm.Close
Set rsFrm = Nothing
Set rsCombo = Nothing
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>