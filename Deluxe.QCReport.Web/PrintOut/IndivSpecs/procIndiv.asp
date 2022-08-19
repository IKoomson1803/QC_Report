<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sQCNum, sRev, sJobNum
dim sBarcode, sHBlank, sCloseCap, sSrcBarcode, sVBlank
dim sSyncLevel, sRF, sBurst_Level, sSerrations, sFrontPor
dim sChannelCond, sSlate, sVITS, sTracking, sLabel, sVIRS
dim sCtl_Track, sShipper, sVITC, STape_Wrap, sSubTitles
dim updtIndivSpecs
'********************
sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")

sHBlank = Request.Form("txtHBlank")
sCloseCap = Request.Form("selCloseCap")
sSrcBarcode = Request.Form("txtSrcBarcode")
sVBlank = Request.Form("txtVBlank")
sSyncLevel = Request.Form("txtSyncLevel")
sRF = Request.Form("selRF")
sBurst_Level = Request.Form("txtBurst_Level")
sFrontPor = Request.Form("txtFrontPor")
sChannelCond = Request.Form("txtChannelCond")
sSlate = Request.Form("txtSlate")
sVITS = Request.Form("txtVITS")
sTracking = Request.Form("txtTracking")
sLabel = Request.Form("txtLabel")
sVIRS = Request.Form("txtVIRS")
sCtl_Track = Request.Form("txtCtl_Track")
sShipper = Request.Form("txtShipper")
sVITC = Request.Form("txtVITC")
sTape_Wrap = Request.Form("txtTape_Wrap")
sSubTitles = Request.Form("txtSubTitles")

updtIndivSpecs = "UPDATE qcElement " & _
			"SET HBlank = '" & sHBlank & "', " & _
				"CloseCap = '" & sCloseCap & "', " & _
				"src_Barcode = '" & sSrcBarcode & "', " & _
				"VBlank = '" & sVBlank & "', " & _
				"Sync_Levl = '" & sSyncLevel & "', " & _
				"RF = '" & sRF & "', " & _
				"Burst_Levl = '" & sBurst_Level & "', " & _
				"Front_Por = '" & sFrontPor & "', " & _
				"Channel_Cond = '" & sChannelCond & "', " & _
				"Slate_QC = '" & sSlate & "', " & _
				"VITS = '" & sVITS & "', " & _
				"Tracking_qc = '" & sTracking & "', " & _
				"Labels_qc = '" & sLabel & "', " & _
				"VIRS = '" & sVIRS & "', " & _
				"ctl_track = '" & sCtl_Track & "', " & _
				"shipper_qc = '" & sShipper & "', " & _
				"VITC = '" & sVITC & "', " & _
				"Tape_wrap_qc = '" & sTape_Wrap & "', " & _
				"Subtitle_QC = '" & sSubtitles & "' " & _
			"WHERE qcNum = " & clng(sQCNum) & " " & _
					"AND subQCNum = " & cint(sRev)

cnQCS.Execute updtIndivSpecs

cnQCS.Close
Set cnQCS = Nothing

Response.Redirect("frmIndivSpecs.asp?frm=IndividualSpecs&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev)

%>
