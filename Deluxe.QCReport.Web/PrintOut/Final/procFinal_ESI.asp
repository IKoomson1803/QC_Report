<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sQCNum, sRev, sJobNum,updtFinal
dim sStatus, sComments 
dim  sLumLevelsDetails, sBlackLevelsDetails
dim  sChromLevelsDetails, sAudPeaksAndLoudDetails
dim  sTitleSafeDetails, sQCResult, sQCResultDate

''response.write Cstr(Now)
''response.end



'********************

sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")

sStatus = Request.Form("hdnStatus")

If sStatus <> ""  then

    sQCResultDate = CStr(Now)

    Select case sStatus
       case "PASSED"
	      sQCResult = "PASS"
	   case "FAILED"
          sQCResult = "FAIL"
       case  "HOLD"
          sQCResult = "HOLD"	   
 	End Select

    '' If sStatus = "PASSED"  then
	   '' sQCResult = "PASS"
	 ''ElseIf sStatus = "FAILED"  then	
		''sQCResult = "FAIL"
	''ElseIf sStatus = "HOLD"  then
	  '' sQCResult = "HOLD"
	'' End If
	
End If


sComments = Request.Form("txtComments")
If sComments <> "" Then
   sComments = Replace(Trim(sComments), "'", "''")
End If



sLumLevelsDetails = Request.Form("txtLuminanceLevelsDetails")
If sLumLevelsDetails <> "" Then
   sLumLevelsDetails = Replace(Trim(sLumLevelsDetails), "'", "''")
End If

sBlackLevelsDetails = Request.Form("txtBlackLevelsDetails")
If sBlackLevelsDetails <> "" Then
   sBlackLevelsDetails = Replace(Trim(sBlackLevelsDetails), "'", "''")
End If

sChromLevelsDetails = Request.Form("txtChrominanceLevelsDetails")
If sChromLevelsDetails <> "" Then
   sChromLevelsDetails = Replace(Trim(sChromLevelsDetails), "'", "''")
End If

sAudPeaksAndLoudDetails = Request.Form("txtAudioPeaksAndLoudnessDetails")
If sAudPeaksAndLoudDetails <> "" Then
   sAudPeaksAndLoudDetails = Replace(Trim(sAudPeaksAndLoudDetails), "'", "''")
End If

sTitleSafeDetails = Request.Form("txtTitleSafeDetails")
If sTitleSafeDetails <> "" Then
   sTitleSafeDetails = Replace(Trim(sTitleSafeDetails), "'", "''")
End If

''Response.write "cboLuminanceLevelsRating: " & Request.Form("cboLuminanceLevelsRating")
''response.end

updtFinal = " UPDATE qcHeader " & _
			" SET Eval_Stat = '" & sStatus & "', " & _
			" Comments = '" & sComments & "' " & _
			" WHERE qcNum = " & clng(sQCNum) & " " & _
			" AND subQCNum = " & cint(sRev) & "; " & _
			" UPDATE qcEndemolVideoAndAudio " & _	
			" SET LuminanceLevelsRating = '" & Request.Form("cboLuminanceLevelsRating") & "', " & _
			" LuminanceLevelsDetails = '" & sLumLevelsDetails & "', " & _
			" BlackLevelsRating = '" & Request.Form("cboBlackLevelsRating") & "', " & _
			" BlackLevelsDetails = '" & sBlackLevelsDetails & "', " & _
			" ChrominanceLevelsRating = '" & Request.Form("cboChrominanceLevelsRating") & "', " & _
			" ChrominanceLevelsDetails = '" & sChromLevelsDetails & "', " & _
			" AudioPeaksAndLoudnessRating = '" & Request.Form("cboAudioPeaksAndLoudnessRating") & "', " & _
			" AudioPeaksAndLoudnessDetails = '" & sAudPeaksAndLoudDetails & "', " & _
			" TitleSafeRating = '" & Request.Form("cboTitleSafeRating") & "', " & _
			" TitleSafeDetails = '" & sTitleSafeDetails & "', " & _
			" QCResult = '" & sQCResult & "', " & _
			" QCResultDate=  '" & sQCResultDate & "' " & _
			" WHERE QCNum = " & clng(sQCNum) & " " & _
			" AND SubQCNum = " & cint(sRev) 
			
cnQCS.Execute updtFinal

cnQCS.Close
Set cnQCS = Nothing

Response.Redirect("frmFinal_ESI.asp?frm=Final&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev)


%>
