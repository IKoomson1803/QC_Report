<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************

dim nDVVidLevel, nDVChromaLevel, nDVBlackLevel, nDVVBlank, nDVHBlank
dim nDVFrontPor, nDVHSync, nDVBurstCycle, nDVBackPor, nDVBurstAmp
dim nDVVidRF, nDVPCMRF, nDVCtlTrk, nDVTimeBase, nDVMotionJit
dim nTSShred, nTSDropOut, nTSScratch, nTSEdgeDam, nTSTapeTension
dim nTSCreasing, nFScratchesDirt, nFColorBal, nFFraming
dim nSCColourimetry, nSCFlicker, nMVRes, nMVSignalNoise, nMVColorBal
dim nMVReg, nMVEnt, nMVCSM, nMVChrLvT, nMVPGMPvT, nMVPGMLvT
dim nMVPedLvt, nMVSS, nMVLagBoom, nMVMoire, nMVChrTearing, nMVRinging
dim nMVMicrophonics, nMVBlackComp, nMVWhiteComp, nMVTransGlitch, nMVBRi, nMVVERi
dim nMVDROi, nAPGMLvT, nAIntellig, nADist, bADistLo, bADistMed, bADistHi, nAHHN
dim nASib, nALipSync, nAStereoPhase, nAUpcuts, nATestTones, nOQPrelim, nOQFinal
dim sQCNum, sRev, sJobNum
dim sql, updtHeader
'********************
nDVVidLevel = Request.Form("radDVVidLevel")
nDVChromaLevel = Request.Form("radDVChromaLevel")
nDVBlackLevel = Request.Form("radDVBlackLevel")
nDVVBlank = Request.Form("radDVVBlank")
nDVHBlank = Request.Form("radDVHBlank")
nDVFrontPor = Request.Form("radDVFrontPor")
nDVHSync = Request.Form("radDVHSync")
nDVBurstCycle = Request.Form("radDVBurstCycle")
nDVBackPor = Request.Form("radDVBackPor")
nDVBurstAmp = Request.Form("radDVBurstAmp")
nDVVidRF = Request.Form("radDVVidRF")
nDVPCMRF = Request.Form("radDVPCMRF")
nDVCtlTrk = Request.Form("radDVCtlTrk")
nDVTimeBase = Request.Form("radDVTimeBase")
nDVMotionJit = Request.Form("radDVMotionJit")
nTSShred = Request.Form("radTSShred")
nTSDropOut = Request.Form("radTSDropOut")
nTSScratch = Request.Form("radTSScratch")
nTSEdgeDam = Request.Form("radTSEdgeDam")
nTSTapeTension = Request.Form("radTSTapeTension")
nTSCreasing = Request.Form("radTSCreasing")
nFScratchesDirt = Request.Form("radFScratchesDirt")
nFColorBal = Request.Form("radFColorBal")
nFFraming = Request.Form("radFFraming")
nSCColourimetry = Request.Form("radSCColourimetry")
nSCFlicker = Request.Form("radSCFlicker")
nMVRes = Request.Form("radMVRes")
nMVSignalNoise = Request.Form("radMVSignalNoise")
nMVColorBal = Request.Form("radMVColorBal")
nMVReg = Request.Form("radMVReg")
nMVEnt = Request.Form("radMVEnt")
nMVCSM = Request.Form("radMVCSM")
nMVChrLvT = Request.Form("radMVChrLvT")
nMVPGMPvT = Request.Form("radMVPGMPvT")
nMVPGMLvT = Request.Form("radMVPGMLvT")
nMVPedLvt = Request.Form("radMVPedLvt")
nMVSS = Request.Form("radMVSS")
nMVLagBoom = Request.Form("radMVLagBoom")
nMVMoire = Request.Form("radMVMoire")
nMVChrTearing = Request.Form("radMVChrTearing")
nMVRinging = Request.Form("radMVRinging")
nMVMicrophonics = Request.Form("radMVMicrophonics")
nMVBlackComp = Request.Form("radMVBlackComp")
nMVWhiteComp = Request.Form("radMVWhiteComp")
nMVTransGlitch = Request.Form("radMVTransGlitch")
nMVBRi = Request.Form("radMVBRi")
nMVVERi = Request.Form("radMVVERi")
nMVDROi = Request.Form("radMVDROi")
nAPGMLvT = Request.Form("radAPGMLvT")
nAIntellig = Request.Form("radAIntellig")
nADist = Request.Form("radADist")
if Request.Form("Dist") = "L" Then bADistLo = 1
if Request.Form("Dist") = "M" Then bADistMed = 1
if Request.Form("Dist") = "H" Then bADistHi = 1
nAHHN = Request.Form("radAHHN")
nASib = Request.Form("radASib")
nALipSync = Request.Form("radALipSync")
nAStereoPhase = Request.Form("radAStereoPhase")
nAUpcuts = Request.Form("radAUpcuts")
nATestTones = Request.Form("radATestTones")
nOQPrelim = Request.Form("radOQPrelim")
nOQFinal = Request.Form("radOQFinal")


sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")


updtHeader = "UPDATE qcBVHE " & _
			"SET DVVidLevel = '" & nDVVidLevel & "', " & _
			"DVChromaLevel = '" & nDVChromaLevel & "', " & _
			"DVBlackLevel = '" & nDVBlackLevel & "', " & _
			"DVVBlank = '" & nDVVBlank & "', " & _
			"DVHBlank = '" & nDVHBlank & "', " & _
			"DVFrontPor = '" & nDVFrontPor & "', " & _
			"DVHSync = '" & nDVHSync & "', " & _
			"DVBurstCycle = '" & nDVBurstCycle & "', " & _
			"DVBackPor = '" & nDVBackPor & "', " & _
			"DVBurstAmp = '" & nDVBurstAmp & "', " & _
			"DVVidRF = '" & nDVVidRF & "', " & _
			"DVPCMRF = '" & nDVPCMRF & "', " & _
			"DVCtlTrk = '" & nDVCtlTrk & "', " & _
			"DVTimeBase = '" & nDVTimeBase & "', " & _
			"DVMotionJit = '" & nDVMotionJit & "', " & _
			"TSShred = '" & nTSShred & "', " & _
			"TSDropOut = '" & nTSDropOut & "', " & _
			"TSScratch = '" & nTSScratch & "', " & _
			"TSEdgeDam = '" & nTSEdgeDam & "', " & _
			"TSTapeTension = '" & nTSTapeTension & "', " & _
			"TSCreasing = '" & nTSCreasing & "', " & _
			"FScratchesDirt = '" & nFScratchesDirt & "', " & _
			"FColorBal = '" & nFColorBal & "', " & _
			"FFraming = '" & nFFraming & "', " & _
			"SCColourimetry = '" & nSCColourimetry & "', " & _
			"SCFlicker = '" & nSCFlicker & "', " & _
			"MVRes = '" & nMVRes & "', " & _
			"MVSignalNoise = '" & nMVSignalNoise & "', " & _
			"MVColorBal = '" & nMVColorBal & "', " & _
			"MVReg = '" & nMVReg & "', " & _
			"MVEnt = '" & nMVEnt & "', " & _
			"MVCSM = '" & nMVCSM & "', " & _
			"MVChrLvT = '" & nMVChrLvT & "', " & _
			"MVPGMPvT = '" & nMVPGMPvT & "', " & _
			"MVPGMLvT = '" & nMVPGMLvT & "', " & _
			"MVPedLvT = '" & nMVPedLvT & "', " & _
			"MVSS = '" & nMVSS & "', " & _
			"MVLagBoom = '" & nMVLagBoom & "', " & _
			"MVMoire = '" & nMVMoire & "', " & _
			"MVChrTearing = '" & nMVChrTearing & "', " & _
			"MVRinging = '" & nMVRinging & "', " & _
			"MVMicrophonics = '" & nMVMicrophonics & "', " & _
			"MVBlackComp = '" & nMVBlackComp & "', " & _
			"MVWhiteComp = '" & nMVWhiteComp & "', " & _
			"MVTransGlitch = '" & nMVTransGlitch & "', " & _
			"MVBRi = '" & nMVBRi & "', " & _
			"MVVERi = '" & nMVVERi & "', " & _
			"MVDROi = '" & nMVDROi & "', " & _
			"APGMLvT = '" & nAPGMLvT & "', " & _
			"AIntellig = '" & nAIntellig & "', " & _
			"ADist = '" & nADist & "', " & _
			"ADistLo = " & cint(bADistLo) & ", " & _
			"ADistMed = " & cint(bADistMed) & ", " & _
			"ADistHi = " & cint(bADistHi) & ", " & _
			"AHHN = '" & nAHHN & "', " & _
			"ASib = '" & nASib & "', " & _
			"ALipSync = '" & nALipSync & "', " & _
			"AStereoPhase = '" & nAStereoPhase & "', " & _
			"AUpcuts = '" & nAUpcuts & "', " & _
			"ATestTones = '" & nATestTones & "', " & _
			"OQPrelim = '" & nOQPrelim & "', " & _
			"OQFinal = '" & nOQFinal & "' " & _
		"WHERE qcNum = " & clng(sQCNum) & " " & _
		"AND subQCNum = " & cint(sRev)
			

cnQCS.Execute updtHeader

cnQCS.Close
Set cnQCS = Nothing

Response.Redirect("frmBVHESpecs.asp?frm=BVHESpecs&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev)

%>
