<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
 ''Updated to escape single quotes - Isaac Koomson 18/01/2012
'********************
dim sJobNum, sQCNum, sRev, sItemNum
dim sPartNum, sTC, sType, sDesc, sGrade, sSect, sTimeID
dim sDuratn, sMaster
dim sqlLog
'********************
sTC = Request.Form("txtTC")
sType = Request.Form("selType")
sDesc = Request.Form("txtDesc")
sGrade = Request.Form("selGrade")
sSect = Request.Form("selSect")
sDuratn = Request.Form("txtDuratn")
sMaster = Request.Form("cbxMaster")
if sMaster <> "1" then sMaster = "0"
''if sGrade = "" then sGrade = "1"

sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")
sItemNum = Request.Form("hdnItemNum")
sTimeID = Request.Form("hdnTimeID")

select case Request.Form("subUpdate")
	case " Add "
	sqlLog = "INSERT INTO qcTime (QCNum, subQCNum, Time_code, QC_Code, Note, QC_Grade, Action, item_Duratn, in_Master) VALUES (" & clng(sQCNum) & ", " & cint(sRev) & ", '" & trim(sTC) & "', '" & sType & "', '" & replace(sDesc, "'", "''") & "', '" & sGrade & "', '" & sSect & "', '" & replace(sDuratn, "'", "''") & "', " & cint(sMaster) & ")"
	case "Save"
	sqlLog = "Update qcTime " & _
					"SET Time_code = '" & sTC & "', " & _
						 "QC_Code = '" & sType & "', " & _
						 "Note = '" & replace(sDesc, "'", "''") & "', " & _
						 "QC_Grade = '" & sGrade & "', " & _
						 "Action = '" & sSect & "', " & _
						 "item_Duratn = '" & replace(sDuratn, "'", "''") & "', " & _
						 "in_Master = " & cint(sMaster) & " " & _
				"WHERE QCNum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " AND TimeID = " & clng(sTimeID)
end select

cnQCS.Execute sqlLog
cnQCS.close
set cnQCS = nothing

Response.Redirect("frmLog.asp?frm=Log&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev & "&#tcFrm")

%>
