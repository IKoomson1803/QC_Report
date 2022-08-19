<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
 ''Added to escape single quotes - Isaac Koomson 18/01/2012
'********************
dim sJobNum, sQCNum, sRev, sTimeID
dim sPartNum, sTC, sType, sDesc, sGrade
dim sSect, sDuratn, sMaster
dim sqlEdit
'********************

sTC = Request.Form("txtTC")
sType = Request.Form("selType")
sDesc = Request.Form("txtDesc")
sGrade = Request.Form("selGrade")
sSect = Request.Form("selSect")
sDuratn = Request.Form("txtDuratn")
sMaster = Request.Form("cbxMaster")
if sMaster <> "1" then sMaster = "0"

sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")
sTimeID = Request.Form("hdnTimeID")

	sqlEdit = "Update qcTime " & _
				"SET Time_code = '" & sTC & "', " & _
					 "QC_Code = '" & sType & "', " & _
					 "Note = '" & replace(sDesc, "'", "''") & "', " & _
					 "QC_Grade = " & cint(sGrade) & ", " & _
					 "Action = '" & sSect & "', " & _
					 "item_Duratn = '" & replace(sDuratn, "'", "''") & "', " & _
					 "in_Master = " & cint(sMaster) & " " & _
				"WHERE QCNum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " AND TimeID = " & clng(sTimeID)


cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>