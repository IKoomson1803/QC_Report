<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
dim sql1, sQCNum, sRev, sJobNum

sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")

sql1 = "UPDATE qcCTISS SET Audio8dB = '" & Request.Form("selAudio8dB") & "', " & _
						  "Audio16dB = '" & Request.Form("selAudio16dB") & "', " & _
						  "Video102 = '" & Request.Form("selVideo102") & "', " & _
						  "Video105 = '" & Request.Form("selVideo105") & "', " & _
						  "SubBlanking0 = '" & Request.Form("selSubBlank0") & "', " & _
						  "SubBlanking4 = '" & Request.Form("selSubBlank4") & "' " & _
		"WHERE QCNum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev)

cnQCS.Execute sql1

Response.Redirect("frmCTISSSpecs.asp?frm=AudioTC&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev)

%>
