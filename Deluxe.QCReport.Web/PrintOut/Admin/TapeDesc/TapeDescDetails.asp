<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
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
			popupWindow = window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=0,width=580,height=140');
		}
	 
	}

	function parent_disable() {
	   if(popupWindow && !popupWindow.closed)
		  popupWindow.focus();
    }

		function setVariables()
		{
			if (navigator.appName == "Netscape")
			{
				v=".top=";
				dS="document.";
				sD="";
				y="window.pageYOffset";
				if (parseInt(navigator.appVersion) >= 4)
				{
					domove = "T"
				}
				else
				{
					domove = "F"
				}
			}
			else
			{
				if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.indexOf("MSIE 5") != -1)
				{
					domove = "T"
				}
				else
				{
					domove = "F"
				}
				v=".pixelTop=";
				dS="";
				sD=".style";
				y="document.body.scrollTop";
			}
		}
		function checkLocation() {
			if (domove == "T")
			{
				Aobject="object1";
				yy=eval(y);
				eval(dS+Aobject+sD+v+yy);
				setTimeout("checkLocation()",10);
			}
		}	
</SCRIPT>

<BODY class="bodyForm" onFocus="parent_disable();" onclick="parent_disable();" topmargin=0 leftmargin=0 rightmargin=0 bgcolor=#f5f5dc OnLoad="setVariables();checkLocation()">
<!--#include file="../../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim rsFrm, rsCombo
dim sTapeDescID, sTapeDesc
dim sql
dim sBGColor, intItem_num
'********************

sTapeDescID = Request.QueryString("sTapeDescID")
sTapeDesc = Request.QueryString("sTapeDesc")

Response.Write "<font size=2><b>" & sTapeDescID & "</b></font>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Tape Format Screen
'*******************************************************************************************************
		sql="SELECT TapeDescID, TapeDesc FROM optTapeDesc " & _
		"ORDER BY TapeDescID"
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>

			<table align=center ID="tblTapeFormat" border=0 width=350 cellpadding=0 cellspacing=0>
						<tr bgcolor=#999900>
							<th valign="bottom">
							<div id="object1" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
							<font face=tahoma size="1" color="black">
							Tape Description
							</font></div></th>
						</tr>
				<%sBGColor = "trBeige"%>
				<%	if rsFrm.EOF = true then %>
						<tr class=<%=sBGColor%>>
							<td colspan="6" align="center"><b>No Data to be listed</b></td>
						</tr>
				<%	else %>
				<%		do while not rsFrm.EOF %>
							<tr class=<%=sBGColor%> onmouseover="this.className='trWhite'" onmouseout="this.className='<%=sBGColor%>'" onclick="javascript:OpenEditFrm('UpdateTapeDesc.asp?TapeDescID=<%=rsFrm.Fields("TapeDescID")%>');">
								<td align="left"><%=rsFrm.Fields("TapeDesc")%></td>
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
<%
rsFrm.Close
Set rsFrm = Nothing
Set rsCombo = Nothing
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>
