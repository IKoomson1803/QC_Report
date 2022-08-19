<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'**************************************************************
'Declarations
''Created - Isaac Koomson 25/05/2016

'************************************************************
dim sJobNum, sQCNum, sRev
dim updt
'********************

sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")

updt = "UPDATE qcEndemolSpecifics " & _
			     " SET ESIEndCreditOrLogo = '" & Request.Form("cboESIEndCreditOrLogo") & "', " & _
				 " SeamlessOrParted = '" & Request.Form("cboSeamlessOrParted") & "', " & _
				 " IsTextlessPresent = '" & Request.Form("cboIsTextlessPresent") & "', " & _
				 " ContentCensoredBleepedOrBlurred= '" & Request.Form("cboContentCensoredBleepedOrBlurred") & "', " & _
				 " FlashingLightsOrEpilepsyWarningPresent= '" & Request.Form("cboFlashingLightsOrEpilepsyWarningPresent") & "', " & _
				 " TimeSpecificTextOrAudioPresent= '" & Request.Form("cboTimeSpecificTextOrAudioPresent") & "', " & _
				 " ExtremeLanguagePresent= '" & Request.Form("cboExtremeLanguagePresent") & "', " & _
				 " NudityPresent= '" & Request.Form("cboNudityPresent") & "', " & _
				" IsMandEComplete= '" & Request.Form("cboIsMandEComplete") & "' " & _
				" WHERE qcNum = " & clng(sQCNum) & " " & _
				" AND subQCNum = " & cint(sRev)

cnQCS.Execute updt

cnQCS.Close
Set cnQCS = Nothing

Response.Redirect("frmSpecifics.asp?frm=Specifics&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev)

%>
