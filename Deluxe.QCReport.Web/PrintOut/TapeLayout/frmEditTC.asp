<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<Title>Edit Tape Layout Entries</title>
</HEAD>
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
<BODY>
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
sItemNum = Request.QueryString("sItem")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<font size=2><b>" & sQCNum & " - " & sRev & "</b></font>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
'Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Editing Log Record
'*******************************************************************************************************
		sql="SELECT Item_num, Description, length, Time_Code " & _
		"FROM qcTapeFormat " & _
		"WHERE qcnum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " " & _
		"AND item_num = " & cint(sItemNum)
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>
 <LINK rel="stylesheet" type="text/css" href="../css/cssForms.css">
		<table align=center ID="tblTapeFormat" border=0 width=99% cellpadding=0 cellspacing=0>
					<tr bgcolor=#999900>
						<td>Item</td>
						<td width=300>Description</td>
						<td>Length</td>
						<td>Time Code</td>
					</tr>
				<form method="post" name=frmEditTC id=frmEditTC action="procEditTC.asp">
				<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
				<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
				<input type=hidden id=hdnItemNum name=hdnItemNum value="<%=sItemNum%>">
				<tr bgcolor=#f5f5dc>
					<td><input size=2 type=textbox name="txtItem" id=txtItem value="<%=rsFrm.Fields("item_num")%>"></td>
					<td><input size=55 type=textbox name="txtDesc" id=txtDesc value="<%=rsFrm.Fields("Description")%>"></td>
					<td><input size=3 type=textbox name="txtLength" id=txtLength value="<%=rsFrm.Fields("Length")%>"></td>
					<td><input size=15 type=textbox id=txtTC name=txtTC onkeypress="javascript:checkkey();" value="<%=rsFrm.Fields("time_code")%>"></td>
				</tr>
		</table>
		<br>
		<table id=tblFrm size=98%>
				<tr>
					<td>				
					<!-- Load Sony Time Control Here -->
<OBJECT id=TimeCodeControl1 
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
						function gettimecode  'retrieves Time Code
							frmEditTC.txtTC.value = "" & frmEditTC.TimeCodeControl1.TimeCode & ""
						end function
					
					</script>
				</td>
				<td>
					<input type=button name=btnLoadTC value="Load TC" onclick="vbscript:gettimecode">
				</td>
				<%if sLevel >= 1 then%>
				<td width=500 align=right><input type=submit name=action id=action value="Save"></td>
				<td align="right">
					<input type=button name=action id=action value="Delete" onclick="Javascript:confirmdel('deltc.asp?sQCNum=<%=sQcNum%>&sRev=<%=sRev%>&sItem=<%=sItemNum%>')">
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
