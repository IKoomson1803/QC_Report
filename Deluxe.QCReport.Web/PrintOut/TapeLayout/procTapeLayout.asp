<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sItem, sDesc, sLength, sTC, sItemOld
dim sQCNum, sRev, sJobNum
dim sSQL
'********************

sItem = Request.Form("txtItem")
sDesc = Request.Form("txtDesc")
sLength = replace(replace(Request.Form("txtLength"), "'", "''"), chr(34), chr(34))
sTC = Request.Form("txtTC")
sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")

select case Request.Form("subUpdate")
case " Add "
sSQL = "INSERT INTO qcTapeFormat (QCNum, subQCNum, item_num, Description, Length, Time_code) VALUES (" & clng(sQCNum) & ", " & cint(sRev) & "," & cint(sItem) & ", '" & replace(sDesc, "'", "''") & "', '" & sLength & "', '" & trim(sTC) & "')"

case "Save"
	sSQL = "Update qcTapeFormat " & _
				"SET item_num = " & cint(sItem) & ", " & _
					 "Description = '" & replace(sDesc, "'", "''") & "', " & _
					 "Length = '" & replace(replace(sLength, "'", "''"), chr(34), chr(34)) & "', " & _
					 "Time_code = '" & trim(sTC) & "' " & _
				"WHERE QCNum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " AND TapeFormatID = " & clng(Request.Form("hdnTFID"))
end select
cnQCS.Execute sSQL
cnQCS.close
set cnQCS = nothing

Response.Redirect("frmtapelayout.asp?frm=TapeLayout&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev & "&#tcFrm")

%>