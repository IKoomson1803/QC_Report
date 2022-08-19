<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'***************************************************************************************
'Declarations
'' Updated to include Channels 9-16 Isaac Koomson 03/01/2012

''Updated : 27/01/2012 - Isaac Koomson
''Update Notes: Updated to include new field LKFS

''Updated : 03/09/2012 - Isaac Koomson
''Update Notes: Updated to increase the channels from 16 to 24
'*************************************************************************************
dim sQCNum, sRev, sJobNum
dim sCh1, sCh2, sCh3, sCh4, sCh5, sCh6, sCh7, sCh8, sCue
dim sCh9, sCh10, sCh11, sCh12, sCh13, sCh14, sCh15, sCh16
dim sCh17, sCh18, sCh19, sCh20, sCh21, sCh22, sCh23, sCh24

dim sCh1_Tone, sCh2_Tone, sCh3_Tone, sCh4_Tone, sCh5_Tone
dim sCh6_Tone, sCh7_Tone, sCh8_Tone,sCue_Tone 
dim sCh9_Tone, sCh10_Tone, sCh11_Tone,sCh12_Tone
dim sCh13_Tone,sCh14_Tone,sCh15_Tone,sCh16_Tone 
dim sCh17_Tone,sCh18_Tone,sCh19_Tone,sCh20_Tone
dim sCh21_Tone,sCh22_Tone,sCh23_Tone,sCh24_Tone  

dim sCh1_Avg, sCh2_Avg, sCh3_Avg, sCh4_Avg, sCh5_Avg, sCh6_Avg
dim sCh7_Avg, sCh8_Avg, sCue_Avg
dim sCh9_Avg, sCh10_Avg, sCh11_Avg, sCh12_Avg
dim sCh13_Avg, sCh14_Avg, sCh15_Avg, sCh16_Avg
dim sCh17_Avg, sCh18_Avg, sCh19_Avg, sCh20_Avg
dim sCh21_Avg, sCh22_Avg, sCh23_Avg, sCh24_Avg

dim sCh1_Peak, sCh2_Peak, sCh3_Peak, sCh4_Peak, sCh5_Peak
dim sCh6_Peak, sCh7_Peak, sCh8_Peak, sCue_Peak
dim sCh9_Peak, sCh10_Peak, sCh11_Peak, sCh12_Peak
dim sCh13_Peak, sCh14_Peak, sCh15_Peak, sCh16_Peak
dim sCh17_Peak, sCh18_Peak, sCh19_Peak, sCh20_Peak
dim sCh21_Peak, sCh22_Peak, sCh23_Peak, sCh24_Peak

dim sCh1_TruePeak, sCh2_TruePeak, sCh3_TruePeak, sCh4_TruePeak
dim sCh5_TruePeak, sCh6_TruePeak, sCh7_TruePeak, sCh8_TruePeak
dim sCh9_TruePeak, sCh10_TruePeak, sCh11_TruePeak, sCh12_TruePeak
dim sCh13_TruePeak, sCh14_TruePeak, sCh15_TruePeak, sCh16_TruePeak
dim sCh17_TruePeak, sCh18_TruePeak, sCh19_TruePeak, sCh20_TruePeak
dim sCh21_TruePeak, sCh22_TruePeak, sCh23_TruePeak, sCh24_TruePeak
dim sCue_TruePeak

dim sCh1_LKFS, sCh2_LKFS, sCh3_LKFS, sCh4_LKFS
dim sCh5_LKFS, sCh6_LKFS, sCh7_LKFS, sCh8_LKFS
dim sCh9_LKFS, sCh10_LKFS, sCh11_LKFS, sCh12_LKFS
dim sCh13_LKFS, sCh14_LKFS, sCh15_LKFS, sCh16_LKFS
dim sCh17_LKFS, sCh18_LKFS, sCh19_LKFS, sCh20_LKFS
dim sCh21_LKFS, sCh22_LKFS, sCh23_LKFS, sCh24_LKFS
dim sCue_LKFS

dim sFVid, sFCh1, sFCh2, sFCh3, sFCh4, sFCh5, sFCh6
dim sFCh7, sFCh8, sFCue
dim sFCh9, sFCh10, sFCh11, sFCh12, sFCh13, sFCh14,sFCh15, sFCh16
dim sFCh17, sFCh18, sFCh19, sFCh20, sFCh21, sFCh22,sFCh23, sFCh24

dim sSVid, sSCh1, sSCh2, sSCh3, sSCh4, sSCh5
dim sSCh6, sSCh7, sSCh8, sSCue
dim sSCh9, sSCh10, sSCh11, sSCh12, sSCh13,sSCh14, sSCh15, sSCh16
dim sSCh17, sSCh18, sSCh19, sSCh20, sSCh21,sSCh22, sSCh23, sSCh24

dim  sLanguage1, sLanguage2,sLanguage3, sLanguage4, sLanguage5, sLanguage6
dim sLanguage7, sLanguage8, sLanguage9, sLanguage10, sLanguage11, sLanguage12
dim sLanguage13, sLanguage14, sLanguage15, sLanguage16, sLanguage17, sLanguage18
dim sLanguage19, sLanguage20, sLanguage21, sLanguage22, sLanguage23, sLanguage24
dim sChannelCount 

dim sNR, sTC, sCH12Phase, sTCInteg, sCH34Phase, sCompSync
dim sTone_Phase, updtAudioTC, updtFullSpot

'********************
sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")

sLanguage1 = Request.Form("cmbLanguage1")
sLanguage2 = Request.Form("cmbLanguage2")
sLanguage3 = Request.Form("cmbLanguage3")
sLanguage4 = Request.Form("cmbLanguage4")
sLanguage5 = Request.Form("cmbLanguage5")
sLanguage6 = Request.Form("cmbLanguage6")
sLanguage7 = Request.Form("cmbLanguage7")
sLanguage8 = Request.Form("cmbLanguage8")
sLanguage9 = Request.Form("cmbLanguage9")
sLanguage10 = Request.Form("cmbLanguage10")
sLanguage11 = Request.Form("cmbLanguage11")
sLanguage12 = Request.Form("cmbLanguage12")
sLanguage13 = Request.Form("cmbLanguage13")
sLanguage14 = Request.Form("cmbLanguage14")
sLanguage15 = Request.Form("cmbLanguage15")
sLanguage16 = Request.Form("cmbLanguage16")
sLanguage17 = Request.Form("cmbLanguage17")
sLanguage18 = Request.Form("cmbLanguage18")
sLanguage19 = Request.Form("cmbLanguage19")
sLanguage20 = Request.Form("cmbLanguage20")
sLanguage21 = Request.Form("cmbLanguage21")
sLanguage22 = Request.Form("cmbLanguage22")
sLanguage23 = Request.Form("cmbLanguage23")
sLanguage24 = Request.Form("cmbLanguage24")

sChannelCount= Request.Form("cmbChannelCount")

sCh1 = Request.Form("cmbCh1")
sCh2 = Request.Form("cmbCh2")
sCh3 = Request.Form("cmbCh3")
sCh4 = Request.Form("cmbCh4")
sCh5 = Request.Form("cmbCH5")
sCh6 = Request.Form("cmbCh6")
sCh7 = Request.Form("cmbCh7")
sCh8 = Request.Form("cmbCh8")
sCh9 = Request.Form("cmbCh9")
sCh10 = Request.Form("cmbCh10")
sCh11 = Request.Form("cmbCh11")
sCh12 = Request.Form("cmbCh12")
sCh13 = Request.Form("cmbCh13")
sCh14 = Request.Form("cmbCh14")
sCh15 = Request.Form("cmbCh15")
sCh16 = Request.Form("cmbCh16")
sCh17 = Request.Form("cmbCh17")
sCh18 = Request.Form("cmbCh18")
sCh19 = Request.Form("cmbCh19")
sCh20 = Request.Form("cmbCh20")
sCh21 = Request.Form("cmbCh21")
sCh22 = Request.Form("cmbCh22")
sCh23 = Request.Form("cmbCh23")
sCh24 = Request.Form("cmbCh24")
sCue = Request.Form("cmbCue")

sCh1_LKFS = Request.Form("txtCH1_LKFS")
sCh2_LKFS = Request.Form("txtCH2_LKFS")
sCh3_LKFS = Request.Form("txtCH3_LKFS")
sCh4_LKFS = Request.Form("txtCH4_LKFS")
sCh5_LKFS = Request.Form("txtCH5_LKFS")
sCh6_LKFS = Request.Form("txtCH6_LKFS")
sCh7_LKFS = Request.Form("txtCH7_LKFS")
sCh8_LKFS = Request.Form("txtCH8_LKFS")
sCh9_LKFS = Request.Form("txtCH9_LKFS")
sCh10_LKFS = Request.Form("txtCH10_LKFS")
sCh11_LKFS = Request.Form("txtCH11_LKFS")
sCh12_LKFS = Request.Form("txtCH12_LKFS")
sCh13_LKFS = Request.Form("txtCH13_LKFS")
sCh14_LKFS = Request.Form("txtCH14_LKFS")
sCh15_LKFS = Request.Form("txtCH15_LKFS")
sCh16_LKFS = Request.Form("txtCH16_LKFS")
sCh17_LKFS = Request.Form("txtCH17_LKFS")
sCh18_LKFS = Request.Form("txtCH18_LKFS")
sCh19_LKFS = Request.Form("txtCH19_LKFS")
sCh20_LKFS = Request.Form("txtCH20_LKFS")
sCh21_LKFS = Request.Form("txtCH21_LKFS")
sCh22_LKFS = Request.Form("txtCH22_LKFS")
sCh23_LKFS = Request.Form("txtCH23_LKFS")
sCh24_LKFS = Request.Form("txtCH24_LKFS")
sCue_LKFS = Request.Form("txtCue_LKFS")

sCh1_Tone = Request.Form("cmbTone1")
sCh2_Tone = Request.Form("cmbTone2")
sCh3_Tone = Request.Form("cmbTone3")
sCh4_Tone = Request.Form("cmbTone4")
sCh5_Tone = Request.Form("cmbTone5")
sCh6_Tone = Request.Form("cmbTone6")
sCh7_Tone = Request.Form("cmbTone7")
sCh8_Tone = Request.Form("cmbTone8")
sCh9_Tone = Request.Form("cmbTone9")
sCh10_Tone = Request.Form("cmbTone10")
sCh11_Tone = Request.Form("cmbTone11")
sCh12_Tone = Request.Form("cmbTone12")
sCh13_Tone = Request.Form("cmbTone13")
sCh14_Tone = Request.Form("cmbTone14")
sCh15_Tone = Request.Form("cmbTone15")
sCh16_Tone = Request.Form("cmbTone16")
sCh17_Tone = Request.Form("cmbTone17")
sCh18_Tone = Request.Form("cmbTone18")
sCh19_Tone = Request.Form("cmbTone19")
sCh20_Tone = Request.Form("cmbTone20")
sCh21_Tone = Request.Form("cmbTone21")
sCh22_Tone = Request.Form("cmbTone22")
sCh23_Tone = Request.Form("cmbTone23")
sCh24_Tone = Request.Form("cmbTone24")
sCue_Tone = Request.Form("cmbCueTone")

sCh1_Avg = Request.Form("txtCH1_Avg")
sCh2_Avg = Request.Form("txtCH2_Avg")
sCh3_Avg = Request.Form("txtCH3_Avg")
sCh4_Avg = Request.Form("txtCH4_Avg")
sCh5_Avg = Request.Form("txtCH5_Avg")
sCh6_Avg = Request.Form("txtCH6_Avg")
sCh7_Avg = Request.Form("txtCH7_Avg")
sCh8_Avg = Request.Form("txtCH8_Avg")
sCh9_Avg = Request.Form("txtCH9_Avg")
sCh10_Avg = Request.Form("txtCH10_Avg")
sCh11_Avg = Request.Form("txtCH11_Avg")
sCh12_Avg = Request.Form("txtCH12_Avg")
sCh13_Avg = Request.Form("txtCH13_Avg")
sCh14_Avg = Request.Form("txtCH14_Avg")
sCh15_Avg = Request.Form("txtCH15_Avg")
sCh16_Avg = Request.Form("txtCH16_Avg")
sCh17_Avg = Request.Form("txtCH17_Avg")
sCh18_Avg = Request.Form("txtCH18_Avg")
sCh19_Avg = Request.Form("txtCH19_Avg")
sCh20_Avg = Request.Form("txtCH20_Avg")
sCh21_Avg = Request.Form("txtCH21_Avg")
sCh22_Avg = Request.Form("txtCH22_Avg")
sCh23_Avg = Request.Form("txtCH23_Avg")
sCh24_Avg = Request.Form("txtCH24_Avg")
sCue_Avg = Request.Form("txtCue_Avg")

sCh1_Peak = Request.Form("txtCH1_Peak")
sCh2_Peak = Request.Form("txtCH2_Peak")
sCh3_Peak = Request.Form("txtCH3_Peak")
sCh4_Peak = Request.Form("txtCH4_Peak")
sCh5_Peak = Request.Form("txtCH5_Peak")
sCh6_Peak = Request.Form("txtCH6_Peak")
sCh7_Peak = Request.Form("txtCH7_Peak")
sCh8_Peak = Request.Form("txtCH8_Peak")
sCh9_Peak = Request.Form("txtCH9_Peak")
sCh10_Peak = Request.Form("txtCH10_Peak")
sCh11_Peak = Request.Form("txtCH11_Peak")
sCh12_Peak = Request.Form("txtCH12_Peak")
sCh13_Peak = Request.Form("txtCH13_Peak")
sCh14_Peak = Request.Form("txtCH14_Peak")
sCh15_Peak = Request.Form("txtCH15_Peak")
sCh16_Peak = Request.Form("txtCH16_Peak")
sCh17_Peak = Request.Form("txtCH17_Peak")
sCh18_Peak = Request.Form("txtCH18_Peak")
sCh19_Peak = Request.Form("txtCH19_Peak")
sCh20_Peak = Request.Form("txtCH20_Peak")
sCh21_Peak = Request.Form("txtCH21_Peak")
sCh22_Peak = Request.Form("txtCH22_Peak")
sCh23_Peak = Request.Form("txtCH23_Peak")
sCh24_Peak = Request.Form("txtCH24_Peak")
sCue_Peak = Request.Form("txtCue_Peak")

sCh1_TruePeak = Request.Form("txtCH1_TruePeak")
sCh2_TruePeak = Request.Form("txtCH2_TruePeak")
sCh3_TruePeak = Request.Form("txtCH3_TruePeak")
sCh4_TruePeak = Request.Form("txtCH4_TruePeak")
sCh5_TruePeak = Request.Form("txtCH5_TruePeak")
sCh6_TruePeak = Request.Form("txtCH6_TruePeak")
sCh7_TruePeak = Request.Form("txtCH7_TruePeak")
sCh8_TruePeak = Request.Form("txtCH8_TruePeak")
sCh9_TruePeak = Request.Form("txtCH9_TruePeak")
sCh10_TruePeak = Request.Form("txtCH10_TruePeak")
sCh11_TruePeak = Request.Form("txtCH11_TruePeak")
sCh12_TruePeak = Request.Form("txtCH12_TruePeak")
sCh13_TruePeak = Request.Form("txtCH13_TruePeak")
sCh14_TruePeak = Request.Form("txtCH14_TruePeak")
sCh15_TruePeak = Request.Form("txtCH15_TruePeak")
sCh16_TruePeak = Request.Form("txtCH16_TruePeak")
sCh17_TruePeak = Request.Form("txtCH17_TruePeak")
sCh18_TruePeak = Request.Form("txtCH18_TruePeak")
sCh19_TruePeak = Request.Form("txtCH19_TruePeak")
sCh20_TruePeak = Request.Form("txtCH20_TruePeak")
sCh21_TruePeak = Request.Form("txtCH21_TruePeak")
sCh22_TruePeak = Request.Form("txtCH22_TruePeak")
sCh23_TruePeak = Request.Form("txtCH23_TruePeak")
sCh24_TruePeak = Request.Form("txtCH24_TruePeak")
sCue_TruePeak = Request.Form("txtCue_TruePeak")


'****** Full  / Spot checks were moved from OverSpecs. Isaac Koomson 04/09/2012 ******************************

If Trim(Request.Form("cmbFullSpot1")) <> "" Then
	if Request.Form("cmbFullSpot1") = "Full" then
		sFCh1 = -1
		sSCh1 = 0
	elseif Request.Form("cmbFullSpot1") = "Spot" then
		sFCh1 = 0
		sSCh1 = -1
	end if	
else
	sFCh1 = 0
    sSCh1 = 0
end if

If Trim(Request.Form("cmbFullSpot2")) <> "" Then
	if Request.Form("cmbFullSpot2") = "Full" then
		sFCh2 = -1
		sSCh2 = 0
	elseif Request.Form("cmbFullSpot2") = "Spot" then
		sFCh2 = 0
		sSCh2 = -1
	end if	
else
	sFCh2 = 0
    sSCh2 = 0
end if

If Trim(Request.Form("cmbFullSpot3")) <> "" Then
	if Request.Form("cmbFullSpot3") = "Full" then
		sFCh3 = -1
		sSCh3 = 0
	elseif Request.Form("cmbFullSpot3") = "Spot" then
		sFCh3 = 0
		sSCh3 = -1
	end if	
else
	sFCh3 = 0
    sSCh3 = 0
end if

If Trim(Request.Form("cmbFullSpot4")) <> "" Then
	if Request.Form("cmbFullSpot4") = "Full" then
		sFCh4 = -1
		sSCh4 = 0
	elseif Request.Form("cmbFullSpot4") = "Spot" then
		sFCh4 = 0
		sSCh4 = -1
	end if	
else
	sFCh4 = 0
    sSCh4 = 0
end if

If Trim(Request.Form("cmbFullSpot5")) <> "" Then
	if Request.Form("cmbFullSpot5") = "Full" then
		sFCh5 = -1
		sSCh5 = 0
	elseif Request.Form("cmbFullSpot5") = "Spot" then
		sFCh5 = 0
		sSCh5 = -1
	end if	
else
	sFCh5 = 0
    sSCh5 = 0
end if

If Trim(Request.Form("cmbFullSpot6")) <> "" Then
	if Request.Form("cmbFullSpot6") = "Full" then
		sFCh6 = -1
		sSCh6 = 0
	elseif Request.Form("cmbFullSpot6") = "Spot" then
		sFCh6 = 0
		sSCh6 = -1
	end if	
else
	sFCh6 = 0
    sSCh6 = 0
end if

If Trim(Request.Form("cmbFullSpot7")) <> "" Then
	if Request.Form("cmbFullSpot7") = "Full" then
		sFCh7 = -1
		sSCh7 = 0
	elseif Request.Form("cmbFullSpot7") = "Spot" then
		sFCh7 = 0
		sSCh7 = -1
	end if	
else
	sFCh7 = 0
    sSCh7 = 0
end if

If Trim(Request.Form("cmbFullSpot8")) <> "" Then
	if Request.Form("cmbFullSpot8") = "Full" then
		sFCh8 = -1
		sSCh8 = 0
	elseif Request.Form("cmbFullSpot8") = "Spot" then
		sFCh8 = 0
		sSCh8 = -1
	end if	
else
	sFCh8 = 0
    sSCh8 = 0
end if

If Trim(Request.Form("cmbFullSpot9")) <> "" Then
	if Request.Form("cmbFullSpot9") = "Full" then
		sFCh9 = -1
		sSCh9 = 0
	elseif Request.Form("cmbFullSpot9") = "Spot" then
		sFCh9 = 0
		sSCh9 = -1
	end if	
else
	sFCh9 = 0
    sSCh9 = 0
end if

If Trim(Request.Form("cmbFullSpot10")) <> "" Then
	if Request.Form("cmbFullSpot10") = "Full" then
		sFCh10 = -1
		sSCh10 = 0
	elseif Request.Form("cmbFullSpot10") = "Spot" then
		sFCh10 = 0
		sSCh10 = -1
	end if	
else
	sFCh10 = 0
    sSCh10 = 0
end if

If Trim(Request.Form("cmbFullSpot11")) <> "" Then
	if Request.Form("cmbFullSpot11") = "Full" then
		sFCh11 = -1
		sSCh11 = 0
	elseif Request.Form("cmbFullSpot11") = "Spot" then
		sFCh11 = 0
		sSCh11 = -1
	end if	
else
	sFCh11 = 0
    sSCh11 = 0
end if

If Trim(Request.Form("cmbFullSpot12")) <> "" Then
	if Request.Form("cmbFullSpot12") = "Full" then
		sFCh12 = -1
		sSCh12 = 0
	elseif Request.Form("cmbFullSpot12") = "Spot" then
		sFCh12 = 0
		sSCh12 = -1
	end if	
else
	sFCh12 = 0
    sSCh12 = 0
end if

If Trim(Request.Form("cmbFullSpot13")) <> "" Then
	if Request.Form("cmbFullSpot13") = "Full" then
		sFCh13 = -1
		sSCh13 = 0
	elseif Request.Form("cmbFullSpot13") = "Spot" then
		sFCh13 = 0
		sSCh13 = -1
	end if	
else
	sFCh13 = 0
    sSCh13 = 0
end if

If Trim(Request.Form("cmbFullSpot14")) <> "" Then
	if Request.Form("cmbFullSpot14") = "Full" then
		sFCh14 = -1
		sSCh14 = 0
	elseif Request.Form("cmbFullSpot14") = "Spot" then
		sFCh14 = 0
		sSCh14 = -1
	end if	
else
	sFCh14 = 0
    sSCh14 = 0
end if

If Trim(Request.Form("cmbFullSpot15")) <> "" Then
	if Request.Form("cmbFullSpot15") = "Full" then
		sFCh15 = -1
		sSCh15 = 0
	elseif Request.Form("cmbFullSpot15") = "Spot" then
		sFCh15 = 0
		sSCh15 = -1
	end if	
else
	sFCh15 = 0
    sSCh15 = 0
end if

If Trim(Request.Form("cmbFullSpot16")) <> "" Then
	if Request.Form("cmbFullSpot16") = "Full" then
		sFCh16 = -1
		sSCh16 = 0
	elseif Request.Form("cmbFullSpot16") = "Spot" then
		sFCh16 = 0
		sSCh16 = -1
	end if	
else
	sFCh16 = 0
    sSCh16 = 0
end if

If Trim(Request.Form("cmbFullSpot17")) <> "" Then
	if Request.Form("cmbFullSpot17") = "Full" then
		sFCh17 = -1
		sSCh17 = 0
	elseif Request.Form("cmbFullSpot17") = "Spot" then
		sFCh17 = 0
		sSCh17 = -1
	end if	
else
	sFCh17 = 0
    sSCh17 = 0
end if

If Trim(Request.Form("cmbFullSpot18")) <> "" Then
	if Request.Form("cmbFullSpot18") = "Full" then
		sFCh18 = -1
		sSCh18 = 0
	elseif Request.Form("cmbFullSpot19") = "Spot" then
		sFCh18 = 0
		sSCh18 = -1
	end if	
else
	sFCh18 = 0
    sSCh18 = 0
end if

If Trim(Request.Form("cmbFullSpot19")) <> "" Then
	if Request.Form("cmbFullSpot19") = "Full" then
		sFCh19 = -1
		sSCh19 = 0
	elseif Request.Form("cmbFullSpot19") = "Spot" then
		sFCh19 = 0
		sSCh19 = -1
	end if	
else
	sFCh19 = 0
    sSCh19 = 0
end if

If Trim(Request.Form("cmbFullSpot20")) <> "" Then
	if Request.Form("cmbFullSpot20") = "Full" then
		sFCh20 = -1
		sSCh20 = 0
	elseif Request.Form("cmbFullSpot20") = "Spot" then
		sFCh20 = 0
		sSCh20 = -1
	end if	
else
	sFCh20 = 0
    sSCh20 = 0
end if

If Trim(Request.Form("cmbFullSpot21")) <> "" Then
	if Request.Form("cmbFullSpot21") = "Full" then
		sFCh21 = -1
		sSCh21 = 0
	elseif Request.Form("cmbFullSpot21") = "Spot" then
		sFCh21 = 0
		sSCh21 = -1
	end if	
else
	sFCh21 = 0
    sSCh21 = 0
end if

If Trim(Request.Form("cmbFullSpot22")) <> "" Then
	if Request.Form("cmbFullSpot22") = "Full" then
		sFCh22 = -1
		sSCh22 = 0
	elseif Request.Form("cmbFullSpot22") = "Spot" then
		sFCh22 = 0
		sSCh22 = -1
	end if	
else
	sFCh22 = 0
    sSCh22 = 0
end if

If Trim(Request.Form("cmbFullSpot23")) <> "" Then
	if Request.Form("cmbFullSpot23") = "Full" then
		sFCh23 = -1
		sSCh23 = 0
	elseif Request.Form("cmbFullSpot23") = "Spot" then
		sFCh23 = 0
		sSCh23 = -1
	end if	
else
	sFCh23 = 0
    sSCh23 = 0
end if

If Trim(Request.Form("cmbFullSpot24")) <> "" Then
	if Request.Form("cmbFullSpot24") = "Full" then
		sFCh24 = -1
		sSCh24 = 0
	elseif Request.Form("cmbFullSpot24") = "Spot" then
		sFCh24 = 0
		sSCh24 = -1
	end if	
else
	sFCh24 = 0
    sSCh24 = 0
end if

If Trim(Request.Form("cmbFullSpotCue")) <> "" Then
	if Request.Form("cmbFullSpotCue") = "Full" then
		sFCue = -1
		sSCue = 0
	elseif Request.Form("cmbFullSpotCue") = "Spot" then
		sFCue = 0
		sSCue = -1
	end if	
else
	sFCue = 0
    sSCue = 0
end if


''Response.write "sFCh1:" & sFCh1 & "<br>"
''Response.write "sSCh1:" &sSCh1

''Response.end


'*********************************************************


sNR = Request.Form("selNR")
sTC = Request.Form("selTC")
sCH12Phase = Request.Form("selCH12Phase")
sTCInteg = Request.Form("selTCInteg")
sCH34Phase = Request.Form("selCH34Phase")
sCompSync = Request.Form("selCompSync")
sTone_Phase = Request.Form("txtTone_Phase")



'********* Update Audio TC************************************

updtAudioTC = "UPDATE qcAudioTC " & _
			"SET Language1 = '" & sLanguage1 & "'," & _
			"Language2 = '" & sLanguage2 & "'," & _
			"Language3 = '" & sLanguage3 & "'," & _
			"Language4 = '" & sLanguage4 & "'," & _
			"Language5 = '" & sLanguage5 & "'," & _
			"Language6 = '" & sLanguage6 & "'," & _
			"Language7 = '" & sLanguage7 & "'," & _
			"Language8 = '" & sLanguage8 & "'," & _
			"Language9 = '" & sLanguage9 & "'," & _
			"Language10 = '" & sLanguage10 & "'," & _
			"Language11 = '" & sLanguage11 & "'," & _
			"Language12 = '" & sLanguage12 & "'," & _
			"Language13 = '" & sLanguage13 & "'," & _
			"Language14 = '" & sLanguage14 & "'," & _
			"Language15 = '" & sLanguage15 & "'," & _
			"Language16 = '" & sLanguage16 & "'," & _
			"Language17 = '" & sLanguage17 & "'," & _
			"Language18 = '" & sLanguage18 & "'," & _
			"Language19 = '" & sLanguage19 & "'," & _
			"Language20 = '" & sLanguage20 & "'," & _
			"Language21 = '" & sLanguage21 & "'," & _
			"Language22 = '" & sLanguage22 & "'," & _
			"Language23 = '" & sLanguage23 & "'," & _
			"Language24 = '" & sLanguage24 & "'," & _
			"ChannelCount = '" & sChannelCount & "'," & _
			"Ch1_Desc = '" & sCh1 & "', " & _
				"Ch2_Desc = '" & sCh2 & "', " & _
				"Ch3_Desc = '" & sCh3 & "', " & _
				"Ch4_Desc = '" & sCh4 & "', " & _
				"Ch5_Desc = '" & sCh5 & "', " & _
				"Ch6_Desc = '" & sCh6 & "', " & _
				"Ch7_Desc = '" & sCh7 & "', " & _
				"Ch8_Desc = '" & sCh8 & "', " & _
				"Ch9_Desc = '" & sCh9 & "', " & _
				"Ch10_Desc = '" & sCh10 & "', " & _
				"Ch11_Desc = '" & sCh11 & "', " & _
				"Ch12_Desc = '" & sCh12 & "', " & _
				"Ch13_Desc = '" & sCh13 & "', " & _
				"Ch14_Desc = '" & sCh14 & "', " & _
				"Ch15_Desc = '" & sCh15 & "', " & _
				"Ch16_Desc = '" & sCh16 & "', " & _
				"Ch17_Desc = '" & sCh17 & "', " & _
				"Ch18_Desc = '" & sCh18 & "', " & _
				"Ch19_Desc = '" & sCh19 & "', " & _
				"Ch20_Desc = '" & sCh20 & "', " & _
				"Ch21_Desc = '" & sCh21 & "', " & _
				"Ch22_Desc = '" & sCh22 & "', " & _
				"Ch23_Desc = '" & sCh23 & "', " & _
				"Ch24_Desc = '" & sCh24 & "', " & _
				"Cue_Desc = '" & sCue & "', " & _
				"Ch1_LKFS = '" & sCh1_LKFS & "', " & _
				"Ch2_LKFS = '" & sCh2_LKFS & "', " & _
				"Ch3_LKFS = '" & sCh3_LKFS & "', " & _
				"Ch4_LKFS = '" & sCh4_LKFS & "', " & _
				"Ch5_LKFS = '" & sCh5_LKFS & "', " & _
				"Ch6_LKFS = '" & sCh6_LKFS & "', " & _
				"Ch7_LKFS = '" & sCh7_LKFS & "', " & _
				"Ch8_LKFS = '" & sCh8_LKFS & "', " & _
				"Ch9_LKFS = '" & sCh9_LKFS & "', " & _
				"Ch10_LKFS = '" & sCh10_LKFS & "', " & _
				"Ch11_LKFS = '" & sCh11_LKFS & "', " & _
				"Ch12_LKFS = '" & sCh12_LKFS & "', " & _
				"Ch13_LKFS = '" & sCh13_LKFS & "', " & _
				"Ch14_LKFS = '" & sCh14_LKFS & "', " & _
				"Ch15_LKFS = '" & sCh15_LKFS & "', " & _
				"Ch16_LKFS = '" & sCh16_LKFS & "', " & _
      			"Ch17_LKFS = '" & sCh17_LKFS & "', " & _
				"Ch18_LKFS = '" & sCh18_LKFS & "', " & _
				"Ch19_LKFS = '" & sCh19_LKFS & "', " & _
				"Ch20_LKFS = '" & sCh20_LKFS & "', " & _
				"Ch21_LKFS = '" & sCh21_LKFS & "', " & _
				"Ch22_LKFS = '" & sCh22_LKFS & "', " & _
				"Ch23_LKFS = '" & sCh23_LKFS & "', " & _
				"Ch24_LKFS = '" & sCh24_LKFS & "', " & _
				"Cue_LKFS = '" & sCue_LKFS & "', " & _
				"Ch1_Tone = '" & sCh1_Tone & "', " & _
				"Ch2_Tone = '" & sCh2_Tone & "', " & _
				"Ch3_Tone = '" & sCh3_Tone & "', " & _
				"Ch4_Tone = '" & sCh4_Tone & "', " & _
				"Ch5_Tone = '" & sCh5_Tone & "', " & _
				"Ch6_Tone = '" & sCh6_Tone & "', " & _
				"Ch7_Tone = '" & sCh7_Tone & "', " & _
				"Ch8_Tone = '" & sCh8_Tone & "', " & _
				"Ch9_Tone = '" & sCh9_Tone & "', " & _
				"Ch10_Tone = '" & sCh10_Tone & "', " & _
				"Ch11_Tone = '" & sCh11_Tone & "', " & _
				"Ch12_Tone = '" & sCh12_Tone & "', " & _
				"Ch13_Tone = '" & sCh13_Tone & "', " & _
				"Ch14_Tone = '" & sCh14_Tone & "', " & _
				"Ch15_Tone = '" & sCh15_Tone & "', " & _
				"Ch16_Tone = '" & sCh16_Tone & "', " & _
				"Ch17_Tone = '" & sCh17_Tone & "', " & _
				"Ch18_Tone = '" & sCh18_Tone & "', " & _
				"Ch19_Tone = '" & sCh19_Tone & "', " & _
				"Ch20_Tone = '" & sCh20_Tone & "', " & _
				"Ch21_Tone = '" & sCh21_Tone & "', " & _
				"Ch22_Tone = '" & sCh22_Tone & "', " & _
				"Ch23_Tone = '" & sCh23_Tone & "', " & _
				"Ch24_Tone = '" & sCh24_Tone & "', " & _
				"Cue_Tone = '" & sCue_Tone & "', " & _
				"Ch1_Avg = '" & sCh1_Avg & "', " & _
				"Ch2_Avg = '" & sCh2_Avg & "', " & _
				"Ch3_Avg = '" & sCh3_Avg & "', " & _
				"Ch4_Avg = '" & sCh4_Avg & "', " & _
				"Ch5_Avg = '" & sCh5_Avg & "', " & _
				"Ch6_Avg = '" & sCh6_Avg & "', " & _
				"Ch7_Avg = '" & sCh7_Avg & "', " & _
				"Ch8_Avg = '" & sCh8_Avg & "', " & _
				"Ch9_Avg = '" & sCh9_Avg & "', " & _
				"Ch10_Avg = '" & sCh10_Avg & "', " & _
				"Ch11_Avg = '" & sCh11_Avg & "', " & _
				"Ch12_Avg = '" & sCh12_Avg & "', " & _
				"Ch13_Avg = '" & sCh13_Avg & "', " & _
				"Ch14_Avg = '" & sCh14_Avg & "', " & _
				"Ch15_Avg = '" & sCh15_Avg & "', " & _
				"Ch16_Avg = '" & sCh16_Avg & "', " & _
				"Ch17_Avg = '" & sCh17_Avg & "', " & _
				"Ch18_Avg = '" & sCh18_Avg & "', " & _
				"Ch19_Avg = '" & sCh19_Avg & "', " & _
				"Ch20_Avg = '" & sCh20_Avg & "', " & _
				"Ch21_Avg = '" & sCh21_Avg & "', " & _
				"Ch22_Avg = '" & sCh22_Avg & "', " & _
				"Ch23_Avg = '" & sCh23_Avg & "', " & _
				"Ch24_Avg = '" & sCh24_Avg & "', " & _
				"Cue_Avg = '" & sCue_Avg & "', " & _
				"Ch1_Peak = '" & sCh1_Peak & "', " & _
				"Ch2_Peak = '" & sCh2_Peak & "', " & _
				"Ch3_Peak = '" & sCh3_Peak & "', " & _
				"Ch4_Peak = '" & sCh4_Peak & "', " & _
				"Ch5_Peak = '" & sCh5_Peak & "', " & _
				"Ch6_Peak = '" & sCh6_Peak & "', " & _
				"Ch7_Peak = '" & sCh7_Peak & "', " & _
				"Ch8_Peak = '" & sCh8_Peak & "', " & _
				"Ch9_Peak = '" & sCh9_Peak & "', " & _
				"Ch10_Peak = '" & sCh10_Peak & "', " & _
				"Ch11_Peak = '" & sCh11_Peak & "', " & _
				"Ch12_Peak = '" & sCh12_Peak & "', " & _
				"Ch13_Peak = '" & sCh13_Peak & "', " & _
				"Ch14_Peak = '" & sCh14_Peak & "', " & _
				"Ch15_Peak = '" & sCh15_Peak & "', " & _
				"Ch16_Peak = '" & sCh16_Peak & "', " & _
				"Ch17_Peak = '" & sCh17_Peak & "', " & _
				"Ch18_Peak = '" & sCh18_Peak & "', " & _
				"Ch19_Peak = '" & sCh19_Peak & "', " & _
				"Ch20_Peak = '" & sCh20_Peak & "', " & _
				"Ch21_Peak = '" & sCh21_Peak & "', " & _
				"Ch22_Peak = '" & sCh22_Peak & "', " & _
				"Ch23_Peak = '" & sCh23_Peak & "', " & _
				"Ch24_Peak = '" & sCh24_Peak & "', " & _
				"Cue_Peak = '" & sCue_Peak & "', " & _
				"Ch1_TruePeak = '" & sCh1_TruePeak & "', " & _
				"Ch2_TruePeak = '" & sCh2_TruePeak & "', " & _
				"Ch3_TruePeak = '" & sCh3_TruePeak & "', " & _
				"Ch4_TruePeak = '" & sCh4_TruePeak & "', " & _
				"Ch5_TruePeak = '" & sCh5_TruePeak & "', " & _
				"Ch6_TruePeak = '" & sCh6_TruePeak & "', " & _
				"Ch7_TruePeak = '" & sCh7_TruePeak & "', " & _
				"Ch8_TruePeak = '" & sCh8_TruePeak & "', " & _
				"Ch9_TruePeak = '" & sCh9_TruePeak & "', " & _
				"Ch10_TruePeak = '" & sCh10_TruePeak & "', " & _
				"Ch11_TruePeak = '" & sCh11_TruePeak & "', " & _
				"Ch12_TruePeak = '" & sCh12_TruePeak & "', " & _
				"Ch13_TruePeak = '" & sCh13_TruePeak & "', " & _
				"Ch14_TruePeak = '" & sCh14_TruePeak & "', " & _
				"Ch15_TruePeak = '" & sCh15_TruePeak & "', " & _
				"Ch16_TruePeak = '" & sCh16_TruePeak & "', " & _
				"Ch17_TruePeak = '" & sCh17_TruePeak & "', " & _
				"Ch18_TruePeak = '" & sCh18_TruePeak & "', " & _
				"Ch19_TruePeak = '" & sCh19_TruePeak & "', " & _
				"Ch20_TruePeak = '" & sCh20_TruePeak & "', " & _
				"Ch21_TruePeak = '" & sCh21_TruePeak & "', " & _
				"Ch22_TruePeak = '" & sCh22_TruePeak & "', " & _
				"Ch23_TruePeak = '" & sCh23_TruePeak & "', " & _
				"Ch24_TruePeak = '" & sCh24_TruePeak & "', " & _
				"Cue_TruePeak = '" & sCue_TruePeak & "', " & _
				"NR = '" & sNR & "', " & _
				"Ch12_Phase = '" & sCh12Phase & "', " & _
				"Ch34_Phase = '" & sCh34Phase & "', " & _
				"Tone_Phase = '" & sTone_Phase & "', " & _
				"Time_Code = '" & sTC & "', " & _
				"TCInteg = '" & sTCInteg & "', " & _
				"Comp_Sync = '" & sCompSync & "', " & _
				"QCinUnity = '" & Request.Form("selQCinUnity") & "', " & _
				"SurroundSound = '" & Request.Form("selSurroundSound") & "', " & _
				"LTC_VITC_Match = '" & Request.Form("selLTC_VITC_Match") & "' " & _ 
			"WHERE qcNum = " & clng(sQCNum) & " " & _
					"AND subQCNum = " & cint(sRev)
	

'********* Update Full/ Spot checks************************************

updtFullSpot = "UPDATE qcHeader " & _
			"SET FullQC_Ch1 = " & cint(sFCh1) & ", " & _
				"FullQC_Ch2 = " & cint(sFCh2) & ", " & _
				"FullQC_Ch3 = " & cint(sFCh3) & ", " & _
				"FullQC_Ch4 = " & cint(sFCh4) & ", " & _
				"FullQC_Ch5 = " & cint(sFCh5) & ", " & _
				"FullQC_Ch6 = " & cint(sFCh6) & ", " & _
				"FullQC_Ch7 = " & cint(sFCh7) & ", " & _
				"FullQC_Ch8 = " & cint(sFCh8) & ", " & _
				"FullQC_Ch9 = " & cint(sFCh9) & ", " & _
				"FullQC_Ch10 = " & cint(sFCh10) & ", " & _
				"FullQC_Ch11 = " & cint(sFCh11) & ", " & _
				"FullQC_Ch12 = " & cint(sFCh12) & ", " & _
				"FullQC_Ch13 = " & cint(sFCh13) & ", " & _
				"FullQC_Ch14 = " & cint(sFCh14) & ", " & _
				"FullQC_Ch15 = " & cint(sFCh15) & ", " & _
				"FullQC_Ch16 = " & cint(sFCh16) & ", " & _
				"FullQC_Ch17 = " & cint(sFCh17) & ", " & _
				"FullQC_Ch18 = " & cint(sFCh18) & ", " & _
				"FullQC_Ch19 = " & cint(sFCh19) & ", " & _
				"FullQC_Ch20 = " & cint(sFCh20) & ", " & _
				"FullQC_Ch21 = " & cint(sFCh21) & ", " & _
				"FullQC_Ch22 = " & cint(sFCh22) & ", " & _
				"FullQC_Ch23 = " & cint(sFCh23) & ", " & _
				"FullQC_Ch24 = " & cint(sFCh24) & ", " & _
				"FullQC_Cue = " & cint(sFCue) & ", " & _
				"SpotQC_Vid = " & cint(sSVid) & ", " & _
				"SpotQC_Ch1 = " & cint(sSCh1) & ", " & _
				"SpotQC_Ch2 = " & cint(sSCh2) & ", " & _
				"SpotQC_Ch3 = " & cint(sSCh3) & ", " & _
				"SpotQC_Ch4 = " & cint(sSCh4) & ", " & _
				"SpotQC_Ch5 = " & cint(sSCh5) & ", " & _
				"SpotQC_Ch6 = " & cint(sSCh6) & ", " & _
				"SpotQC_Ch7 = " & cint(sSCh7) & ", " & _
				"SpotQC_Ch8 = " & cint(sSCh8) & ", " & _
				"SpotQC_Ch9 = " & cint(sSCh9) & ", " & _
				"SpotQC_Ch10 = " & cint(sSCh10) & ", " & _
				"SpotQC_Ch11 = " & cint(sSCh11) & ", " & _
				"SpotQC_Ch12 = " & cint(sSCh12) & ", " & _
				"SpotQC_Ch13 = " & cint(sSCh13) & ", " & _
				"SpotQC_Ch14 = " & cint(sSCh14) & ", " & _
				"SpotQC_Ch15 = " & cint(sSCh15) & ", " & _
				"SpotQC_Ch16 = " & cint(sSCh16) & ", " & _ 
				"SpotQC_Ch17 = " & cint(sSCh17) & ", " & _
				"SpotQC_Ch18 = " & cint(sSCh18) & ", " & _
				"SpotQC_Ch19 = " & cint(sSCh19) & ", " & _
				"SpotQC_Ch20 = " & cint(sSCh20) & ", " & _
				"SpotQC_Ch21 = " & cint(sSCh21) & ", " & _
				"SpotQC_Ch22 = " & cint(sSCh22) & ", " & _
				"SpotQC_Ch23 = " & cint(sSCh23) & ", " & _
				"SpotQC_Ch24 = " & cint(sSCh24) & ", " & _ 
				"SpotQC_Cue = " & cint(sSCue) & " " & _
			    "WHERE qcNum = " & clng(sQCNum) & " " & _
				"AND subQCNum = " & cint(sRev)
	
'********* ************************************

cnQCS.Execute updtAudioTC
cnQCS.Execute updtFullSpot

cnQCS.Close
Set cnQCS = Nothing

Response.Redirect("frmAudioTC.asp?frm=AudioTC&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev)

%>
