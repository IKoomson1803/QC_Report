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
		window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=0,width=630,height=170');
	}
	
	function checkKey()  //adds a time code to txtTC by 
						//pressing the spacebar and adds ":" if typing the TC
	{
		var sTemp
		sTemp = "" + frmTapeLayout.txtTC.value + ""; 
		if (sTemp.length == 2){
			frmTapeLayout.txtTC.value = sTemp + ":";
		}
		if (sTemp.length == 5){
			frmTapeLayout.txtTC.value = sTemp + ":";
		}
		if (sTemp.length == 8){
			frmTapeLayout.txtTC.value = sTemp + ":";
		}
	if (window.event.keyCode == 32)                         
	   {
	   frmTapeLayout.txtTC.value = TimeCodeControl1.TimeCode;                          
	   }
    }
	function PopForm(nQCNum, nRev, nItem, sDesc, sLength, sTC, nTFID)
	{
		frmTapeLayout.txtItem.value = nItem;
		frmTapeLayout.txtDesc.value = sDesc;
		frmTapeLayout.txtLength.value = sLength;
		frmTapeLayout.txtTC.value = sTC;
		frmTapeLayout.hdnTFID.value = nTFID;
		frmTapeLayout.subUpdate.value = "Save";
		frmTapeLayout.btnDel.disabled = false;
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
		sql="SELECT TapeFormatID, item_num, Description, Time_Code, Length FROM qcTapeFormat WHERE qcnum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " ORDER BY item_num"
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
						<td>Item</td>
						<td width=300>Description</td>
						<td>Duration</td>
						<td>Time Code</td>
					</tr>
			<%sBGColor = "trBeige"%>
			<%	if rsFrm.BOF = true and rsFrm.EOF = true then %>
					<tr class=<%=sBGColor%>>
						<td>&nbsp;</td>
						<td>No Tape Layouts for this Revision</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
			<%	else %>
			<%		do while not rsFrm.EOF %>
						<tr class="<%=sBGColor%>"  onmouseover="this.className='trWhite'" onmouseout="this.className='<%=sBGColor%>'" 
						onclick="javascript:PopForm(<%=sQCNum%>, <%=sRev%>, <%=rsFrm.Fields("Item_Num")%>, 
						'<%if not isNull(rsFrm.Fields("Description")) then
								Response.Write(replace(replace(rsFrm.Fields("Description"), "'", "\'"), chr(34), "\'\'"))
							else
								Response.Write(rsFrm.Fields("Description"))
							end if%>', 
						'<%if not isNull(rsFrm.Fields("Length")) then 
								Response.write(replace(replace(rsFrm.Fields("Length"), "'", "\'"), chr(34), "\'\'"))
							else
								Response.Write(rsFrm.Fields("Length"))
							end if%>', '<%=rsFrm.Fields("Time_Code")%>', <%=rsFrm.Fields("TapeFormatID")%>)" TABINDEX="1">
							<td><%=rsFrm.Fields("item_num")%></td>
							<td width=300><%=rsFrm.Fields("Description")%></td>
							<td><%=rsFrm.Fields("Length")%></td>
							<td><%=rsFrm.Fields("Time_Code")%></td>
						</tr>
			<%			intItem_num = rsFrm.Fields("item_num") + 1
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
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<form method="post" name="frmTapeLayout" id="frmTapeLayout" action="procTapeLayout.asp">
				<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
				<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
				<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">
				<input type=hidden id=hdnTFID name=hdnTFID value="">
				<tr bgcolor=#f5f5dc>
					<td><input size=2 type=textbox name="txtItem" id=txtItem value=<%=intItem_Num%>></td>
					<td><input size=55 type=textbox name="txtDesc" id=txtDesc></td>
					<td><input size=7 type=textbox name="txtLength" id=txtLength></td>
					<td><input size=13 type=textbox id=txtTC name=txtTC onkeypress="checkKey()"></td>
				</tr>
				<%if sLevel >= 1 then%>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td align="right">
						<input type=submit name="subUpdate" id="subUpdate" value=" Add ">&nbsp;&nbsp;
						<input type="reset" name="resetForm" id="resetForm" value="Reset" onclick="javascript:frmTapeLayout.subUpdate.value = ' Add ';frmTapeLayout.btnDel.disabled = true;"><br><br>
					<input type=button name=btnDel id=btnDel value="Delete" onclick="Javascript:confirmdel('deltc.asp?sQCNum=' + frmTapeLayout.hdnQCNum.value + '&sRev=' + frmTapeLayout.hdnRev.value + '&sJobNum=' + frmTapeLayout.hdnJobNum.value + '&sItem=' + frmTapeLayout.txtItem.value)">
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
						function gettimecode  'retrieves Time Code
							frmTapeLayout.txtTC.value = "" & TimeCodeControl1.TimeCode & ""
						end function
					
					</script>
				</td>
				<td>
					<input type=button name=btnLoadTC value="Load TC" onclick="vbscript:gettimecode">
				</td>

			</tr>
		</table>
<a name="tcFrm"></a>
<script language="javascript">
	frmTapeLayout.btnDel.disabled = true;
</script>
<%
rsFrm.Close
Set rsFrm = Nothing
Set rsCombo = Nothing
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>
