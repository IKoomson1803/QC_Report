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

<script Language="javascript">
	function OpenEditFrm(url)  //opens forms for editing
	{
		window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=0,width=600,height=170');
	}

	function PopForm(nQCNum, nRev, nID, sDesc, sTCIn, sTCOut)
	{
		frmTextInfo.txtText.value = sDesc;
		frmTextInfo.txtTCIn.value = sTCIn;
		frmTextInfo.txtTCOut.value = sTCOut;
		frmTextInfo.hdnID.value = nID;
		frmTextInfo.subUpdate.value = "Save";
		frmTextInfo.btnDel.disabled = false;
	}

	function checkKeyTCin()  //adds a time code to txtTC by 
						//pressing the spacebar
	{
		var sTemp
		sTemp = "" + frmTextInfo.txtTCIn.value + ""; 
		if (sTemp.length == 2){
			frmTextInfo.txtTCIn.value = sTemp + ":";
		}
		if (sTemp.length == 5){
			frmTextInfo.txtTCIn.value = sTemp + ":";
		}
		if (sTemp.length == 8){
			frmTextInfo.txtTCIn.value = sTemp + ":";
		}
	if (window.event.keyCode == 32)                         
	   {
	   frmTextInfo.txtTCIn.value = TimeCodeControl1.TimeCode;                          
	   }
    }
	function checkKeyTCout()  //adds a time code to txtTC by 
						//pressing the spacebar
	{
	var sTemp
	sTemp = "" + frmTextInfo.txtTCOut.value + ""; 
	if (sTemp.length == 2){
		frmTextInfo.txtTCOut.value = sTemp + ":";
	}
	if (sTemp.length == 5){
		frmTextInfo.txtTCOut.value = sTemp + ":";
	}
	if (sTemp.length == 8){
		frmTextInfo.txtTCOut.value = sTemp + ":";
	}
	if (window.event.keyCode == 32)                         
	   {
	   frmTextInfo.txtTCOut.value = TimeCodeControl1.TimeCode;                          
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
</SCRIPT>

<BODY class="bodyForm">
<SCRIPT language="javascript">
	self.focus();
</SCRIPT>
<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->
<table ID="tblForm" border="0" CELLPADDING="0" CELLSPACING="0" width="100%">
	<tr>
		<td>
<%
'********************
'Declarations
'********************
dim rsFrm, rsCombo
dim sJobNum, sQCNum, sRev, sFrm
dim sql
dim sBGColor, intItem_num
'********************

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<td><font size=2><b>" & sQCNum & " - " & sRev & ":  " & sFrm & "</b></font></td>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Tape Format Screen
'*******************************************************************************************************
		sql="SELECT TextInfoID, TextInfo, TimeCodeIn, TimeCodeOut FROM qcTextInfo " & _
		"WHERE qcnum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " " & _
		"ORDER BY TimeCodeIn"
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

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
<CENTER>
<BR>
		<table align=center ID="tblTapeFormat" border=0 width=95% cellpadding=0 cellspacing=0>
					<tr bgcolor=#999900>
						<td width=300>Text</td>
						<td>Time Code In</td>
						<td>Time Code Out</td>
					</tr>
			<%sBGColor = "trBeige"%>
			<%	if rsFrm.BOF = true and rsFrm.EOF = true then %>
					<tr class=<%=sBGColor%>>
						<td colspan=3>No Text Information for this Revision</td>
					</tr>
			<%	else %>
			<%		do while not rsFrm.EOF %>
						<tr class="<%=sBGColor%>"  onmouseover="this.className='trWhite'" onmouseout="this.className='<%=sBGColor%>'" onclick="javascript:PopForm(<%=sQCNum%>, <%=sRev%>, <%=rsFrm.Fields("TextInfoID")%>, '<%=replace(replace(rsFrm.Fields("TextInfo"), "'", "\'"), chr(34), "\'\'")%>', '<%=rsFrm.Fields("TimeCodeIn")%>', '<%=rsFrm.Fields("TimeCodeOut")%>')" TABINDEX="1">
							<td width=300><%=rsFrm.Fields("TextInfo")%></td>
							<td><%=rsFrm.Fields("TimeCodeIn")%></td>
							<td><%=rsFrm.Fields("TimeCodeOut")%></td>
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
	
				<tr bgcolor=#f5f5dc>
					<td colspan=3>&nbsp;</td>

				</tr>
				<form method="post" name="frmTextInfo" id="frmTextInfo" action="procTextInfo.asp">
				<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
				<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
				<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">
				<input Type=hidden id="hdnID" name="hdnID" value="">
				<tr bgcolor=#f5f5dc>
					<td><input size=46 type=textbox name="txtText" id=txtText></td>
					<td><input size=15 type=textbox name="txtTCIn" id=txtTCIn onkeypress="checkKeyTCin()"></td>
					<td><input size=15 type=textbox id="txtTCOut" name="txtTCOut" onkeypress="checkKeyTCout()"></td>
				</tr>
				<%if sLevel >= 1 then%>
				<tr>
					<td align="right" colspan=3>
						<input type=submit name="subUpdate" id="subUpdate" value=" Add ">&nbsp;&nbsp;
						<input type="reset" name="resetForm" id="resetForm" value="Reset" onclick="javascript:frmTextInfo.subUpdate.value = ' Add ';frmTextInfo.btnDel.disabled = true;"><br><br>
						<input type=button name=btnDel id=btnDel value="Delete" onclick="Javascript:confirmdel('deltc.asp?sQCNum=' + frmTextInfo.hdnQCNum.value + '&sRev=' + frmTextInfo.hdnRev.value + '&sJobNum=' + frmTextInfo.hdnJobNum.value + '&sID=' + frmTextInfo.hdnID.value)">
					<td>
				</tr>
				<%end if%>
		</form>
		</table>
</CENTER>
		<table>
			<tr>
				<td>
				<!-- Load Sony Time Control Here -->
<OBJECT 
id=TimeCodeControl1 
style="LEFT: 0px; TOP: 0px" 
CLASSID="CLSID:C84AE4BB-BE0B-42A0-A85D-6E4526A5C78B"
CODEBASE="SonyTimeControl.CAB#version=1,0,0,0" 
VIEWASTEXT>
	<PARAM NAME="_ExtentX" VALUE="5927">
	<PARAM NAME="_ExtentY" VALUE="1085">
	<PARAM NAME="vBackColor" VALUE="-2147483633">
</OBJECT>

					<script language="vbscript">
					
						'TimeCodeControl1.Mode = 2 'set only for testing
						function GetTimecodeIn  'retrieves Time Code
							frmTextInfo.txtTCIn.value = "" & TimeCodeControl1.TimeCode & ""
						end function

						function GetTimecodeOut  'retrieves Time Code
							frmTextInfo.txtTCOut.value = "" & TimeCodeControl1.TimeCode & ""
						end function
					</script>
				</td>
				<td>
					<input type=button name=btnLoadTC value=" TC In " onclick="vbscript:GetTimecodeIn">
				</td>
				<td>
					<input type=button name=btnLoadTC value="TC Out" onclick="vbscript:GetTimecodeOut">
				</td>
			</tr>
		</table>
<a name="tcFrm"></a>
<script language="javascript">
	frmTextInfo.btnDel.disabled = true;
</script>
<%
rsFrm.Close
Set rsFrm = Nothing
Set rsCombo = Nothing
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>
