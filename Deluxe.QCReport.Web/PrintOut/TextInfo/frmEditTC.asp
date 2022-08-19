<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<Title>Edit Tape Layout Entries</title>
</HEAD>
<LINK rel="stylesheet" type="text/css" href="../css/qcs.css">
<script language="javascript">
	function CloseEdit()
	{ close(); }
  
	function checkKey()  //adds a time code to txtTC by 
						//pressing the spacebar
	{
		
	if (window.event.keyCode == 32)                         
	   {
	   frmTapeLayout.txtTC.value = TimeCodeControl1.TimeCode;                          
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
<BODY topmargin=0>
<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->
<%
'********************
'Declarations
'********************
dim rsFrm
dim sItemNum, sQCNum, sRev, sFrm
dim sql
'********************

sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<font size=2><b>" & sQCNum & " - " & sRev & "</b></font>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
'Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Editing Log Record
'*******************************************************************************************************
		sql="SELECT TextInfoID, TextInfo, TimeCodeIn, TimeCodeOut " & _
		"FROM qcTextInfo " & _
		"WHERE qcnum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " " & _
		"AND TextInfoID = " & clng(Request.QueryString("sID"))
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>

		<table align=center class="tblEdit" border=0 width=99% cellpadding=0 cellspacing=0>
					<tr bgcolor=#999900>
						<td width=300>Text Info</td>
						<td>Time Code In</td>
						<td>Time Code Out</td>
					</tr>
				<form method="post" name=frmEditTC id=frmEditTC action="procEditTC.asp">
				<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
				<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
				<input type=hidden id=hdnTextInfoID name=hdnTextInfoID value="<%=rsFrm.Fields("TextinfoID")%>">
				<tr bgcolor=#ffffff>
					<td><input size=46 type=textbox name="txtText" id="txtText" value="<%=rsFrm.Fields("TextInfo")%>"></td>
					<td><input size=15 type=textbox name="txtTCIn" id="txtTCIn" value="<%=rsFrm.Fields("TimeCodeIn")%>"></td>
					<td><input size=15 type=textbox id="txtTCOut" name="txtTCOut" onkeypress="javascript:checkkey();" value="<%=rsFrm.Fields("TimeCodeOut")%>"></td>
				</tr>
		</table>
		<br>
		<table id=tblFrm size=98%>
				<tr>
					<td>				
					<!-- Load Sony Time Control Here -->
<OBJECT 
id=TimeCodeControl1 
style="LEFT: 0px; TOP: 0px" 
classid="clsid:D9A2317C-B0E3-4A19-950D-C299141B1126" 
codebase="../controls/sonytimecontrol.ocx" 
VIEWASTEXT>
	<PARAM NAME="_ExtentX" VALUE="5927">
	<PARAM NAME="_ExtentY" VALUE="1085">
	<PARAM NAME="vBackColor" VALUE="-2147483633">
</OBJECT>



					<script language="vbscript">
					
						'TimeCodeControl1.Mode = 2 'set only for testing
						function GetTimecodeIn  'retrieves Time Code
							frmTapeLayout.txtTCIn.value = "" & TimeCodeControl1.TimeCode & ""
						end function

						function GetTimecodeOut  'retrieves Time Code
							frmTapeLayout.txtTCOut.value = "" & TimeCodeControl1.TimeCode & ""
						end function
					</script>
				</td>
				<td>
					<input type=button name=btnLoadTC value=" TC In " onclick="vbscript:GetTimecodeIn">
				</td>
				<td>
					<input type=button name=btnLoadTC value="TC Out" onclick="vbscript:GetTimecodeOut">
				</td>
				<%if sLevel >= 1 then%>
				<td width=500 align=right><input type=submit name=action id=action value="Save"></td>
				<td align="right">
					<input type=button name=action id=action value="Delete" onclick="Javascript:confirmdel('deltc.asp?sQCNum=<%=sQcNum%>&sRev=<%=sRev%>&TextInfoID=<%=rsFrm.Fields("TextinfoID")%>')">
				<td>
				<%end if%>
				</tr>
		</form>
		</table>
		<table>
			<tr>
				<td>
				<input type=button name=btnCancel id=btnCancel value="Cancel" onclick="Javascript:CloseEdit()">
				</td>

			</tr>
		</table>
<%
rsFrm.Close
set rsFrm = Nothing
cnQCS.Close
set cnQCS = Nothing
%>

</BODY>
</HTML>
