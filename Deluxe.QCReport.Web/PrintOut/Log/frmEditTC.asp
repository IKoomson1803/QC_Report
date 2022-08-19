<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<Title>Edit Log Entries</title>
</HEAD>
<script language="javascript">
  function CloseEdit()
  { close(); }
  
    function confirmdel(url)
	{
		if (confirm("Are you sure you want to delete this record?"))
			{
				self.navigate(url)
			}
		else
			{ }
	}
	
	function checkKey()
	{
	if (window.event.keyCode == 32)                         
	   {
	   frmEditTC.txtTC.value = frmEditTC.TimeCodeControl1.TimeCode;                          
	   }
	}
</script>
<BODY>
<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->
<%
'********************
'Declarations
'********************
dim rsFrm, rsClient, rsScale
dim sQCNum, sRev, sFrm, sTimeID, sClient
dim sql, mstrCheck, sqlClient, sqlScale, i
'********************

sTimeID = Request.QueryString("sTimeID")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<font size=2><b>" & sQCNum & " - " & sRev & "</b></font>"

Set rsClient = server.CreateObject("ADODB.Recordset")
sqlClient = "Select CustID From qcHeader WHERE qcnum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev)
rsClient.ActiveConnection = cnQCS
rsClient.Open sqlClient
sClient = rsClient.Fields(0)
rsClient.Close
set rsClient = nothing

Set rsFrm = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Editing Log Record
'*******************************************************************************************************
		sql="SELECT Part_num, Time_Code, QC_Code, Note, QC_Grade, Action, " & _
		"item_duratn, in_master, TimeID " & _
		"FROM qcTime " & _
		"WHERE qcnum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " " & _
		"AND TimeID = " & clng(sTimeID)
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

 %>
 <LINK rel="stylesheet" type="text/css" href="../css/cssForms.css">
		<table align=center ID="tblTapeFormat" border=0 width=99% cellpadding=0 cellspacing=0>
					<tr bgcolor=#999900>
						<td valign="bottom">T.C.</td>
						<td valign="bottom">Type</td>
						<td valign="bottom">Fault Description</td>
						<td valign="bottom">Grd</td>
						<td valign="bottom">Sctr</td>
						<td valign="bottom">Drtn</td>
						<td valign="bottom">Master</td>
					</tr>
				<form method="post" name=frmEditTC id=frmEditTC action="procEditTC.asp">
				<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
				<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
				<input type=hidden id=hdnTimeID name=hdnTimeID value="<%=sTimeID%>">
				<tr bgcolor=#f5f5dc>
					<td><input size=10 type=textbox name=txtTC id=txtTC value="<%=rsFrm.Fields("time_code")%>" onkeypress="javascript:checkKey();"></td>
					<td>
						<select name=selType id=selType>
								<option><%=rsFrm.Fields("QC_code")%></option>
								<option>A</option>
								<option>V</option>
								<option>F</option>
						</select>
					</td>
					<td><input size=35 type=textbox name=txtDesc id=txtDesc value="<%=rsFrm.Fields("Note")%>"></td>
					<td>
						<%
							Set rsScale = server.CreateObject("ADODB.Recordset")
							sqlScale = "SELECT GradingScale FROM qcClients WHERE CustID = " & sClient
							rsScale.ActiveConnection = cnQCS
							rsScale.Open sqlScale
						%>
						<select id=selGrade name=selGrade>
								<option><%=rsFrm.Fields("qc_grade")%></option>
							<%for i = 1 to rsScale.Fields(0) %>
								<option><%=i%></option>
							<%next
							rsScale.Close
							set rsScale = nothing%>
						</select>
					</td>
					<td>
						<select id=selSect name=selSect>
								<option><%=rsFrm.Fields("Action")%></option>
								<option>ALL</option>
								<option>U-L</option>
								<option>U-C</option>
								<option>U-R</option>
								<option>M-L</option>
								<option>M-C</option>
								<option>M-R</option>
								<option>L-L</option>
								<option>L-C</option>
								<option>L-R</option>
						</select>
					</td>
					<td><input size=2 type=textbox name=txtDuratn id=txtDuratn value="<%=rsFrm.Fields("item_duratn")%>"></td>
					<%
						if rsFrm.Fields("in_master") = -1 then
							MstrCheck = "CHECKED"
						else
							MstrCheck = ""
						end if
					%>
					<td align=center><input size=2 type=checkbox name=cbxMaster id=cbxMaster value="1" <%=MstrCheck%>></td>
				</tr>
		</table>
		<br>
				<table>
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
						function gettimecode  'retrieves Time Code
							frmEditTC.txtTC.value = "" & TimeCodeControl1.TimeCode & ""
						end function
					
					</script>
				</td>
				<td>
					<input type=button name=btnLoadTC value="Load TC" onclick="vbscript:gettimecode">
				</td>
				<%if sLevel >= 1 then%>
				<td width=500 align=right><input type=submit name=action id=action value="Save"></td>
				<td align="right">
					<input type=button name=btnDel id=btnDel value="Delete" onclick="Javascript:confirmdel('deltc.asp?sQCNum=<%=sQcNum%>&sRev=<%=sRev%>&sTimeID=<%=sTimeID%>')">
				<td>
				<%end if%>
			</tr>
		</table>
		
		<table id=tblFrm size=98%>
				<tr>
					<td><input type=button name=btnCancel id=btnCancel value="Cancel" onclick="Javascript:CloseEdit()"></td>
				</tr>
		</form>
		</table>

<%
rsFrm.Close
set rsFrm = Nothing
cnQCS.Close
set cnQCS = Nothing
%>

</BODY>
</HTML>
