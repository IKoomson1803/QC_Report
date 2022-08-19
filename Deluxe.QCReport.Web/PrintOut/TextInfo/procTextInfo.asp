<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sQCNum, sRev, sJobNum
dim insTextInfo
'********************

sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")

select case Request.Form("subUpdate")
	case " Add "
	insTextInfo = "INSERT INTO qcTextInfo (QCNum, subQCNum, TextInfo, TimeCodeIn, TimeCodeOut) VALUES (" & clng(sQCNum) & ", " & cint(sRev) & ", '" & replace(Request.Form("txtText"), "'", "''") & "', '" & Request.Form("txtTCIn") & "', '" & Request.Form("txtTCOut") & "')"
	case "Save"
	insTextInfo = "Update qcTextInfo " & _
				"SET TextInfo = '" & replace(Request.Form("txtText"), "'", "''") & "', " & _
					 "TimeCodeIn = '" & Request.Form("txtTCIn") & "', " & _
					 "TimeCodeOut = '" & Request.Form("txtTCOut") & "' " & _
				"WHERE QCNum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " AND TextInfoID = " & clng(Request.Form("hdnID"))
end select

cnQCS.Execute insTextInfo
cnQCS.close
set cnQCS = nothing

Response.Redirect("frmTextInfo.asp?frm=TextInfo&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev & "&#tcFrm")

%>