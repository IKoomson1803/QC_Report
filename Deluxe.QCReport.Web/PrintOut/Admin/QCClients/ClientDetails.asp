<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<meta NAME="robots" CONTENT="noindex">
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK rel="stylesheet" type="text/css" href="../../css/qcs.css">
</HEAD>
<script Language="javascript">
	function OpenEditFrm(url)  //opens forms for editing
	{
		window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=0,width=630,height=170');
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
				Bobject="object2";
				Cobject="object3";
				Dobject="object4";
				Eobject="object5";
				yy=eval(y);
				eval(dS+Aobject+sD+v+yy);
				eval(dS+Bobject+sD+v+yy);
				eval(dS+Cobject+sD+v+yy);
				eval(dS+Dobject+sD+v+yy);
				eval(dS+Eobject+sD+v+yy);
				setTimeout("checkLocation()",10);
			}
		}
</SCRIPT>
<BODY topmargin=0 leftmargin=0 rightmargin=0 bgcolor=#f5f5dc OnLoad="setVariables();checkLocation()">
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
'********************
dim rsFrm, rsCombo
dim sCustID, sCustCode, sCustName, sCustAddress, sCustPhone, sGradingScale
dim sql
dim sBGColor, intItem_num
'********************

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Tape Format Screen
'*******************************************************************************************************
		sql="SELECT CustID, CustCode, CustName, CustAddress, CustPhone, GradingScale FROM qcClients " & _
		"ORDER BY CustName"
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>
		<table align=center ID="tblTapeFormat" border=0 width=100% cellpadding=0 cellspacing=0>
					<tr bgcolor=#999900>
						<th valign="bottom">
						<div id="object1" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						Customer Code
						</font></div></th>
						<th valign="bottom">
						<div id="object2" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						Customer Name
						</font></div></th>
						<th valign="bottom">
						<div id="object3" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						Address
						</font></div></th>
						<th valign="bottom">
						<div id="object4" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						Phone #
						</font></div></th>
						<th valign="bottom">
						<div id="object5" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						Grading Scale
						</font></div></th>
					</tr>
			<%sBGColor = "trBeige"%>
			<%	if rsFrm.EOF = true then %>
					<tr class=<%=sBGColor%>>
						<td colspan="6" align="center"><b>No Customers to be listed</b></td>
					</tr>
			<%	else %>
			<%		do while not rsFrm.EOF %>
						<tr class=<%=sBGColor%> onmouseover="this.className='trWhite'" onmouseout="this.className='<%=sBGColor%>'" onclick="parent.navigate('frmEditClient.asp?nCustID=<%=rsFrm.Fields("CustID")%>');">
							<td><%=rsFrm.Fields("CustCode")%></td>
							<td><%=rsFrm.Fields("CustName")%></td>
							<td><%=rsFrm.Fields("CustAddress")%></td>
							<td><%=rsFrm.Fields("CustPhone")%></td>
							<td><%=rsFrm.Fields("GradingScale")%></td>
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
