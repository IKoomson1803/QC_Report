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
			popupWindow = window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=0,width=250,height=120');
		}
	 
	}

	function parent_disable() {
	   if(popupWindow && !popupWindow.closed)
		  popupWindow.focus();
    }

	
</SCRIPT>

<BODY class="bodyForm" onFocus="parent_disable();" onclick="parent_disable();" topmargin=0 leftmargin=0 rightmargin=0>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim rsFrm
dim sql
dim sBGColor, intItem_num
'********************


Set rsFrm = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Tape Format Screen
'*******************************************************************************************************
		sql="SELECT * FROM optLanguage " & _
		"ORDER BY Language"
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>
 <b>Language Drop-Down Contents</b>
<CENTER>
<BR>
<table id="tblForm" width=100%>
	<tr>
		<td>
			<table align="center" id="tblForm">
			<form method="post" name="frmLanguage" action="procLang.asp">
				<tr>
					<td>
						Language:</td>
					<td>				
						<input type="text" id="txtLanguage" name="txtLanguage" size="20">
					</td>
				</tr>
				<tr>
					<td>&nbsp</td>
				</tr>
				<tr>
					<td align="Center" colspan="6">
						<input type=submit name=subUpdate value="Add Language"></td>
				</tr>
				</form>
			</table>
		</td>
		<td>
			<table align=center id="tblTapeFormat" border=0 width=200 cellpadding=0 cellspacing=0>
						<tr bgcolor=#999900>
							<td align="center">Language</td>
						</tr>
				<%sBGColor = "trBeige"%>
				<%	if rsFrm.EOF = true then %>
						<tr class=<%=sBGColor%>>
							<td colspan="6" align="center"><b>No Data to be listed</b></td>
						</tr>
				<%	else %>
				<%		do while not rsFrm.EOF %>
							<tr class=<%=sBGColor%> onmouseover="this.className='trWhite'" onmouseout="this.className='<%=sBGColor%>'" onclick="javascript:OpenEditFrm('UpdateLang.asp?LangID=<%=rsFrm.Fields("LangID")%>');">
								<td align="center"><%=rsFrm.Fields("Language")%></td>
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
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>