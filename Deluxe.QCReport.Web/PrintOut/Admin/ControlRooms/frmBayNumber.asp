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
			popupWindow = window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=0,width=250,height=70');
		}
	 
	}

	function parent_disable() {
	   if(popupWindow && !popupWindow.closed)
		  popupWindow.focus();
    }
	
</SCRIPT>

<BODY class="bodyForm" onFocus="parent_disable();" onclick="parent_disable();"  topmargin=0 leftmargin=0 rightmargin=0 bgcolor=#f5f5dc>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim rsFrm, rsCombo
dim sQCRoomID, sBayNumber
dim sql
dim sBGColor, intItem_num
'********************

sQCRoomID = Request.QueryString("sQCRoomID")
sBayNumber = Request.QueryString("sBayNumber")

Response.Write "<font size=2><b>" & sQCRoomID & "</b></font>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Tape Format Screen
'*******************************************************************************************************
		sql="SELECT QCRoomID, BayNumber FROM optQCRoom " & _
		"ORDER BY QCRoomID"
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>
 <b>Control Room Drop-Down Contents</b>
<CENTER>
<BR>
<table id="tblForm" width=100%>
	<tr>
		<td>
			<table align="center" id="tblForm">
			<form method="post" name="frmBayNum" action="procBayNumber.asp">
				<tr>
					<td>
						Control Room:</td>
					<td>				
						<input type="text" id="txtBayNum" name="txtBayNum" size="10">
					</td>
				</tr>
				<tr>
					<td>&nbsp</td>
				</tr>
				<tr>
					<td align="Center" colspan="6">
						<input type=submit name=subUpdate value="Add Control Room">
					</td>
				</tr>
				</form>
			</table>
		</td>
		<td>
			<table align=center ID="tblTapeFormat" border=0 width=200 cellpadding=0 cellspacing=0>
						<tr bgcolor=#999900>
							<td align="center">Bay Number</td>
						</tr>
				<%sBGColor = "trBeige"%>
				<%	if rsFrm.EOF = true then %>
						<tr class=<%=sBGColor%>>
							<td colspan="6" align="center"><b>No Data to be listed</b></td>
						</tr>
				<%	else %>
				<%		do while not rsFrm.EOF %>
							<tr class=<%=sBGColor%> onmouseover="this.className='trWhite'" onmouseout="this.className='<%=sBGColor%>'" onclick="javascript:OpenEditFrm('BayNumberUpdate.asp?QCRoomID=<%=rsFrm.Fields("QCRoomID")%>');">
								<td align="center"><%=rsFrm.Fields("BayNumber")%></td>
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