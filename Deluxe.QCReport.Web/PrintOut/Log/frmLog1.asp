<%@ Language=VBScript %>
<%Option Explicit%>
<HTML>
<HEAD>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<meta NAME="robots" CONTENT="noindex">
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<LINK rel="stylesheet" type="text/css" href="../css/qcs.css">
<script Language="javascript">
	function checkKey()  //adds a time code to txtTC by 
						//pressing the spacebar
	{
		var sTemp
		sTemp = "" + frmLog.txtTC.value + ""; 
		if (sTemp.length == 2){
			frmLog.txtTC.value = sTemp + ":";
		}
		if (sTemp.length == 5){
			frmLog.txtTC.value = sTemp + ":";
		}
		if (sTemp.length == 8){
			frmLog.txtTC.value = sTemp + ":";
		}
	if (window.event.keyCode == 32)                         
	   {
	   frmLog.txtTC.value = TimeCodeControl1.TimeCode;                          
	   }
    }
    function confirmdel(url)
	{
		if (confirm("Are you sure you want to delete this record?"))
			{
				self.navigate(url)
			}
		else
			{ }
	}
</script>
<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->

<BODY topmargin=0 leftmargin=0 rightmargin=0 class="bodyForm">
<SCRIPT language="javascript">
	self.focus();
</SCRIPT>
<table ID="tblForm" border="0" CELLPADDING="0" CELLSPACING="0" width="100%">
	<tr>
		
<%
'********************
'Declarations
'********************
Dim rsCombo, rsClient, rsScale, nGradeScale
Dim sJobNum, sQCNum, sRev, sFrm, sItemNum, sClient
Dim sBGColor, sqlClient, sqlScale, i
'********************

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<td><font size=2><b>" & sQCNum & " - " & sRev & ":  " & sFrm & "</b></font></td>"

Set rsClient = server.CreateObject("ADODB.Recordset")
sqlClient = "Select CustID From qcHeader WHERE qcnum = " & CLng(sQCNum) & " AND subQCNum = " & CInt(sRev)
rsClient.ActiveConnection = cnQCS
rsClient.Open sqlClient
sClient = rsClient.Fields(0)
rsClient.Close
Set rsClient = Nothing


Set rsCombo = server.CreateObject("ADODB.Recordset")

 %>
 		<TD width=40% align=right>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" tabindex="10" target="main">Reports&nbsp;</a>
		</TD>
		<td>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" tabindex="10" target="main">			
 			<IMG HSPACE="1" HEIGHT="19" WIDTH="18" BORDER="0" SRC="../images/reports_off.gif" ALT="Reports"></a>
		</TD>
	</tr>
</table>
<!--#include file="../include/frmToolBar.asp"-->

<iframe width="100%" height="60%" name="LogDetails" id="LogDetails" src="LogDetails.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>&sJobNum=<%=sJobNum%>">
</iframe>
<table width="100%" cellpadding=0 cellspacing=0 id="tblTapeFormat" name="tblTapeFormat">

	<form method="post" name="frmLog" id="frmLog" action="procLog.asp">
	<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
	<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
	<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">
	<input type=hidden id=hdnItemNum name=hdnItemNum value="<%=sItemNum%>">
	<tr>
		<td valign="bottom" align="center">
			<b>T.C.</b>
		</td>
		<td valign="bottom" align="center">
			<b>Type</b>
		</td>
		<td valign="bottom" align="center">
			<b>Fault Description</b>
		</td>
		<td valign="bottom" align="center">
			<b>Grd</b>
		</td>
		<td valign="bottom" align="center">
			<b>Sctr</b>
		</td>
		<td valign="bottom" align="center">
			<b>Drtn</b>
		</td>
		<td valign="bottom" align="center">
			<b>Master</b>
		</td>
	</tr>
	</tr>
	<tr bgcolor=#f5f5dc>
		<td align="center" width="15%">
		<input class="TextboxWidth" type=textbox name="txtTC" id="txtTC" value="" TABINDEX="0" onkeypress="checkKey()">
		</td>
		<td align="center" width="9%">
			<select name="selType" id="selType">
					<option></option>
					<option value="A">A</option>
					<option value="V">V</option>
					<option value="F">F</option>
			</select>
		</td>
		<td align="center" width="37%"><input class="TextboxWidth" type=textbox name="txtDesc" id="txtDesc"></td>
		<td align="center" width="6%">
			<%
				Set rsScale = server.CreateObject("ADODB.Recordset")
				sqlScale = "SELECT GradingScale FROM qcClients WHERE CustID = " & sClient
				rsScale.ActiveConnection = cnQCS
				rsScale.Open sqlScale
				nGradeScale = rsScale.Fields("GradingScale")
			%>
			<select id=selGrade name=selGrade>
					<option></option>
				<%For i = 1 To rsScale.Fields("GradingScale") %>
					<option value=<%=i%>><%=i%></option>
				<%Next
				rsScale.Close
				Set rsScale = Nothing%>
			</select>
		</td>
		<td align="center" width="10%">
			<select id=selSect name=selSect>
					<option></option>
					<option value="ALL">ALL</option>
					<option value="U-L">U-L</option>
					<option value="U-C">U-C</option>
					<option value="U-R">U-R</option>
					<option value="M-L">M-L</option>
					<option value="M-C">M-C</option>
					<option value="M-R">M-R</option>
					<option value="L-L">L-L</option>
					<option value="L-C">L-C</option>
					<option value="L-R">L-R</option>
			</select>
		</td>
		<td align="center" width="8%"><input class="TextboxWidth" type=textbox name=txtDuratn id=txtDuratn value=></td>
		<td align="center" width="15%"><input type=checkbox name=cbxMaster id=cbxMaster value=1></td>
	</tr>
</table>

<table width=100% id="tblTapeFormat">
	<tr>
		<td width=10>
<!--******* Load Sony Time Control Here ******-->

<!--<OBJECT 
id=TimeCodeControl1 
style="LEFT: 0px; TOP: 0px" 
classid="clsid:D9A2317C-B0E3-4A19-950D-C299141B1126" 
codebase="../controls/sonytimecontrol1.ocx" 
VIEWASTEXT>
	<PARAM NAME="_ExtentX" VALUE="5927">
	<PARAM NAME="_ExtentY" VALUE="1085">
	<PARAM NAME="vBackColor" VALUE="-2147483633">
</OBJECT>-->
<OBJECT ID="TimeCodeControl1"
CLASSID="CLSID:C84AE4BB-BE0B-42A0-A85D-6E4526A5C78B"
CODEBASE="SonyTimeControl.CAB#version=1,0,0,0">
</OBJECT>

<!--******************************************-->
		</td>
			<script language="vbscript">
				'TimeCodeControl1.Mode = 2 'set only for testing
				function gettimecode  'retrieves Time Code
					frmLog.txtTC.value = frmlog.TimeCodeControl1.TimeCode
				end function
			</script>
		<td align="left">
			<input type=button name=btnLoadTC value="Load TC" onclick="vbscript:gettimecode">
		</td>
		<td>
			<table cellspacing=0 border=1 bordercolor="#000000" width=90 id="tblTapeFormat">
				<tr>
					<td width=30 align="center" valign="middle">U-L</td>
					<td width=30 align="center" valign="middle">U-C</td>
					<td width=30 align="center" valign="middle">U-R</td>
				</tr>
				<tr>
					<td width=30 align="center" valign="middle">M-L</td>
					<td width=30 align="center" valign="middle">M-C</td>
					<td width=30 align="center" valign="middle">M-R</td>
				</tr>
				<tr>
					<td width=30 align="center" valign="middle">L-L</td>
					<td width=30 align="center" valign="middle">L-C</td>
					<td width=30 align="center" valign="middle">L-R</td>
				</tr>
			</table>
		</td>
		<% if sLevel >= 1 then %>
		<td align="left">
			<input type="submit" name="subUpdate" id="subUpdate" value=" Add ">&nbsp;&nbsp;
			<input type="reset" name="resetForm" id="resetForm" value="Reset" onclick="javascript:frmLog.subUpdate.value = ' Add ';frmLog.btnDel.disabled = true;"><br><br>
			<input type=button name=btnDel id=btnDel value="Delete" onclick="Javascript:confirmdel('deltc.asp?sQCNum=' + frmLog.hdnQCNum.value + '&sRev=' + frmLog.hdnRev.value + '&sJobNum=' + frmLog.hdnJobNum.value + '&sTimeID=' + frmLog.hdnTimeID.value)">
		<td>	
		<%end if%>
	</tr>
	<input type="hidden" name="hdnTimeID" id="hdnTimeID">
	</form>
	</table>
	<Table width="100%" id="tblTapeFormat">
	<%if nGradeScale = 3 then %>
    <tr> 
      <td>Grades:</td>
      <td>1=Acceptable</td>
      <td>2=Marginal</td>
      <td>3=Unacceptable</td>
      <td colspan=2>&nbsp;</td>
    </tr>
    <%end if%>
    <%if nGradeScale = 4 then %>
    <tr> 
      <td>Grades:</td>
      <td>1=Standard/Non Detectable</td>
      <td>2=Acceptable</td>
      <td>3=Marginal/Intrusive</td>
      <td>4=Unacceptable</td>
      <td>&nbsp;</td>
    </tr>
    <%end if%>
    <%if nGradeScale = 5 then %>
    <tr> 
      <td>Grades:</td>
      <td>1=Very Annoying</td>
      <td>2=Annoying</td>
      <td>3=Slightly Annoying</td>
      <td>4=Perceptible but not Annoying</td>
      <td>5=Imperceptible</td>
    </tr>
    <%end if%>
</table>
<%
Set rsCombo = Nothing
cnQCS.Close
set cnQCS = Nothing%>
<script language="javascript">
	frmLog.btnDel.disabled = true;
</script>
</BODY>
</HTML>