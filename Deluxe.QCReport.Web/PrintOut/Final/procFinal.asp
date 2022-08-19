<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sQCNum, sRev, sJobNum
dim sStatus, sComments, sGrdVideo, sGrdAudio, sGrdOverall
dim updtFinal, sRecommendationComments, sVideoComments
dim sBroadcastSuitable,sBroadcastSuitableReason,sDVDBluRaySuitable,sDVDBluRaySuitableReason,sVODSuitable,sVODSuitableReason
'********************

sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")

sStatus = Request.Form("hdnStatus")
sComments = Request.Form("txtComments")
If sComments <> "" Then
   sComments = Replace(Trim(sComments), "'", "''")
End If

sRecommendationComments = Request.Form("txtRecommendationComments")
If sRecommendationComments <> "" Then
	sRecommendationComments = Replace(Trim(sRecommendationComments), "'", "''")
End If

sVideoComments = Request.Form("txtVideoComments")
If sVideoComments <> "" Then
 sVideoComments = Replace(Trim(sVideoComments), "'", "''")
End IF

	sGrdVideo = cint(Request.form("sGrdVideo"))
	sGrdAudio = cint(Request.Form("sGrdAudio"))
	sGrdOverall = cint(Request.Form("sGrdOverall"))
	
	sBroadcastSuitable = Request.Form("cmbBroadcastSuitable")
	sBroadcastSuitableReason = Request.Form("txtBroadcastSuitableReason")
	If sBroadcastSuitableReason <> "" Then
       sBroadcastSuitableReason = Replace(Trim(sBroadcastSuitableReason), "'", "''")
    End IF
		
	sDVDBluRaySuitable = Request.Form("cmbDVDBluRaySuitable")
	sDVDBluRaySuitableReason = Request.Form("txtDVDBluRaySuitableReason")
	If sDVDBluRaySuitableReason <> "" Then
       sDVDBluRaySuitableReason = Replace(Trim(sDVDBluRaySuitableReason), "'", "''")
    End IF
	
	sVODSuitable = Request.Form("cmbVODSuitable")
	sVODSuitableReason = Request.Form("txtVODSuitableReason")
    If sVODSuitableReason <> "" Then
       sVODSuitableReason = Replace(Trim(sVODSuitableReason), "'", "''")
    End IF
	
	''Response.write "sBroadcastSuitable:" & sBroadcastSuitable & "<br>"
	''Response.write "sDVDBluRaySuitable:" & sDVDBluRaySuitable & "<br>"
	''Response.write "sVODSuitable:" & sVODSuitable & "<br>"
	''response.end

updtFinal = "UPDATE qcHeader " & _
			"SET Eval_Stat = '" & sStatus & "', " & _
				"Comments = '" & sComments & "', " & _
				"OTPercent = '" & trim(Request.Form("radOTPercent")) & "', " & _
				"OTVer = '" & trim(Request.Form("radOTVer")) & "', " & _
				"CTPercent = '" & trim(Request.Form("radCTPercent")) & "', " & _
				"CTVer = '" & trim(Request.Form("radCTVer")) & "', " & _
				"CapPercent = '" & trim(Request.Form("radCapPercent")) & "', " & _
				"CapVer = '" & trim(Request.Form("radCapVer")) & "', " & _
				"grdVideo = " & sGrdVideo & ", " & _
				"grdAudio = " & sGrdAudio & ", " & _
				"grdOverall = " & sGrdOverall & ", " & _
				"RecommendationComments = '" & sRecommendationComments & "', " & _
				"VideoComments = '" & sVideoComments & "', " & _
				"Broadcast_Suitable = '" & sBroadcastSuitable & "', " & _
				"Broadcast_Suitable_Reason = '" & sBroadcastSuitableReason & "', " & _
				"DVD_Blu_Ray_Suitable = '" & sDVDBluRaySuitable & "', " & _
				"DVD_Blu_Ray_Suitable_Reason = '" & sDVDBluRaySuitableReason & "', " & _
				"VOD_Suitable = '" & sVODSuitable & "', " & _
				"VOD_Suitable_Reason = '" & sVODSuitableReason & "' " & _
			    "WHERE qcNum = " & clng(sQCNum) & " " & _
				"AND subQCNum = " & cint(sRev)

cnQCS.Execute updtFinal

cnQCS.Close
Set cnQCS = Nothing

Response.Redirect("frmFinal.asp?frm=Final&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev)

%>
