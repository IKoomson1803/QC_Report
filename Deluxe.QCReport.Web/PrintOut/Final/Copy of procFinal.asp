<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sQCNum, sRev, sJobNum
dim sStatus, sComments, sGrdVideo, sGrdAudio, sGrdOverall
dim updtFinal
'********************

sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")

sStatus = Request.Form("hdnStatus")
sComments = Request.Form("txtComments")


	sGrdVideo = cint(Request.form("sGrdVideo"))
	sGrdAudio = cint(Request.Form("sGrdAudio"))
	sGrdOverall = cint(Request.Form("sGrdOverall"))


updtFinal = "UPDATE qcHeader " & _
			"SET Eval_Stat = '" & sStatus & "', " & _
				"Comments = '" & replace(sComments, "'", "''") & "', " & _
				"OTPercent = '" & trim(Request.Form("radOTPercent")) & "', " & _
				"OTVer = '" & trim(Request.Form("radOTVer")) & "', " & _
				"CTPercent = '" & trim(Request.Form("radCTPercent")) & "', " & _
				"CTVer = '" & trim(Request.Form("radCTVer")) & "', " & _
				"CapPercent = '" & trim(Request.Form("radCapPercent")) & "', " & _
				"CapVer = '" & trim(Request.Form("radCapVer")) & "', " & _
				"grdVideo = " & sGrdVideo & ", " & _
				"grdAudio = " & sGrdAudio & ", " & _
				"grdOverall = " & sGrdOverall & " " & _
			"WHERE qcNum = " & clng(sQCNum) & " " & _
					"AND subQCNum = " & cint(sRev)

cnQCS.Execute updtFinal

cnQCS.Close
Set cnQCS = Nothing

Response.Redirect("frmFinal.asp?frm=Final&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev)

%>
