<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<LINK rel="stylesheet" type="text/css" href="../css/qcs.css">
<script language="JavaScript" type="text/javascript">
	<!-- Begin
		function OpenEditFrm(url)
		{
			window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=1,width=630,height=180');
		}
		
		function PopForm(nTimeID, nQCNum, nRev, sJobNum, sTC, sType, sFaultDesc, sGrade, sSector, sDuration, sMaster)
		{
			parent.frmLog.hdnTimeID.value = nTimeID;
			parent.frmLog.hdnQCNum.value = nQCNum;
			parent.frmLog.hdnRev.value = nRev;
			parent.frmLog.hdnJobNum.value = sJobNum;
			parent.frmLog.txtTC.value = sTC;
			parent.frmLog.selType.value = sType;
			parent.frmLog.txtDesc.value = sFaultDesc;
			parent.frmLog.selGrade.value = sGrade;
			parent.frmLog.selSect.value = sSector;
			parent.frmLog.txtDuratn.value = sDuration;
			//alert(sMaster);
			if (sMaster == "True"){
				parent.frmLog.cbxMaster.checked = true;
			}
			if (sMaster == "False"){
				parent.frmLog.cbxMaster.checked = false;
			}
			parent.frmLog.subUpdate.value = "Save";
			parent.frmLog.btnDel.disabled = false;
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
				Fobject="object6";
				Gobject="object7";
				yy=eval(y);
				eval(dS+Aobject+sD+v+yy);
				eval(dS+Bobject+sD+v+yy);
				eval(dS+Cobject+sD+v+yy);
				eval(dS+Dobject+sD+v+yy);
				eval(dS+Eobject+sD+v+yy);
				eval(dS+Fobject+sD+v+yy);
				eval(dS+Gobject+sD+v+yy);
				setTimeout("checkLocation()",10);
			}
		}
	//  End -->
	</script>
<!--#include file="../include/connect.asp"-->
<%
dim rsFrm, sql, sJobNum, sQCNum, sRev, sFrm, sSortOrder, sOrderBy
dim sBGColor, sNotes
sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")
sSortOrder = Request.QueryString("sSortOrder")

'select sSortOrder
'	case ""
'	case "Part"
'	case "TC"
'	case "Type"
'	case "Desc"
'	case "Grade"
'	case "Sector"
'	case "duratn"
'	case "master"
'end select

Set rsFrm = server.CreateObject("ADODB.Recordset")
'*******************************************************************************************************
'SELECT for Tape Format Screen
'*******************************************************************************************************
		sql="SELECT Part_num, Time_Code, QC_Code, Note, QC_Grade, Action, " & _
		"item_duratn, in_master, TimeID " & _
		"FROM qcTime " & _
		"WHERE qcnum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " " & _
		"ORDER BY Time_Code"
'*******************************************************************************************************
		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql
%>
<BODY topmargin=0 leftmargin=0 rightmargin=0 class="bodyForm" OnLoad="setVariables();checkLocation()">
<SCRIPT language="javascript">
	self.focus();
</SCRIPT>

		<table align=center ID="tblTapeFormat" border=0 width=100% cellpadding=0 cellspacing=0>
					<tr bgcolor="#f5f5dc">
						<td valign="bottom" align="center">
						<div id="object1" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>T.C.</b>
						</font></div></td>
						<td valign="bottom" align="center">
						<div id="object2" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Type</b>
						</font></div></td>
						<td valign="bottom" align="center">
						<div id="object3" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Fault Description</b>
						</font></div></td>
						<td valign="bottom" align="center">
						<div id="object4" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Grd</b>
						</font></div></td>
						<td valign="bottom" align="center">
						<div id="object5" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Sctr</b>
						</font></div></td>
						<td valign="bottom" align="center">
						<div id="object6" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Drtn</b>
						</font></div></td>
						<td valign="bottom" align="center">
						<div id="object7" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Master</b>
						</font></div></td>
					</tr>
			<%sBGColor = "trBeige"%>
			<%	if rsFrm.BOF = true and rsFrm.EOF = true then %>
					<tr class=<%=sBGColor%>>
						<td colspan=7>No Time Codes for this Revision</td>
					</tr>
			<%	else %>
			<%		do while not rsFrm.EOF
			
			        ''Added to escape single and double quotes - Isaac Koomson 18/01/2012
			        sNotes =  Replace(Replace(rsFrm.Fields("Note"), "'", "\'"),chr(34), "\'\'" ) 
			 %>
						<tr class=<%=sBGColor%> onmouseover="this.className='trWhite'" onmouseout="this.className='<%=sBGColor%>'" 
						onclick="javascript:PopForm(<%=rsFrm.Fields("TimeID")%>, <%=sQCNum%>, <%=sRev%>, '<%=sJobNum%>', '<%=rsFrm.Fields("Time_Code")%>', '<%=trim(rsFrm.Fields("QC_Code"))%>', '<%= sNotes %>', '<%=trim(rsFrm.Fields("QC_Grade"))%>', '<%=rsFrm.Fields("Action")%>', 
						'<%if not isNull(rsFrm.Fields("Item_Duratn")) then
							 Response.write(replace(replace(rsFrm.Fields("Item_duratn"), "'", "\'"), chr(34), "\'\'"))
						   else
							 Response.Write(rsFrm.Fields("Item_Duratn"))
						   end if%>', '<%=rsFrm.Fields("in_master")%>')" TABINDEX="1">
							<td align="center" width="15%"><%=rsFrm.Fields("Time_Code")%></td>
							<td align="center" width="9%"><%=rsFrm.Fields("QC_Code")%></td>
							<td align="left" width="37%"><%=rsFrm.Fields("Note")%></td>
							<td align="center" width="6%"><%=rsFrm.Fields("QC_Grade")%></td>
							<td align="center" width="10%"><%=rsFrm.Fields("Action")%></td>
							<td align="center" width="8%"><%=rsFrm.Fields("Item_duratn")%></td>
							<td align="center" width="15%"><%
								If rsFrm.Fields("in_master") = -1 Then
									Response.Write "Yes"
								else
									Response.Write "-"
								end if
								%>
							</td>
						</tr>
			<%			
						rsFrm.MoveNext
						If sBGColor = "trBeige" Then
							sBGColor = "trBrown"
						Else
							sBGColor = "trBeige"
						End If
					loop
					
				end if			
			%>

</BODY>
</HTML>
<%
rsFrm.Close
Set rsFrm = Nothing
cnQCS.Close
set cnQCS = nothing
%>