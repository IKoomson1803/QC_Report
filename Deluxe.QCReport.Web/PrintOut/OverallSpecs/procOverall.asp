<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'**************************************************************
'Declarations
''Updated - Isaac Koomson 05/09/2012

''Updated to include File Measurements - Isaac Koomson 05/09/2012
'************************************************************8
dim sJobNum, sQCNum, sRev
dim sLum_Peak, sChroma_Peak, sBar_Vid, sLum_Avg, sChroma_Avg
dim sCtl_Track, sBar_Chr, sBlack, sIre_MV, sBar_Set
dim sVideoCodec, sVideoBitRate, sVideoBitDepth, sBitRateMode
dim sAudioCodec, sAudioBitRate, sAudioBitDepth, sSampleRate
dim sGOPStructure, sGamut, sColourEncoding, sFileSize, sActivePicture, sFrameSize

dim updtOverallSpecs
'********************

sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")

sLum_Peak = Request.Form("txtLum_Peak")
sChroma_Peak = Request.Form("txtChroma_Peak")
sBar_Vid = Request.Form("txtBar_Vid")
sLum_Avg = Request.Form("txtLum_Avg")
sChroma_Avg = Request.Form("txtChroma_Avg")
sCtl_Track = Request.Form("txtCtl_Track")
sBar_Chr = Request.Form("txtBar_Chr")
sBlack = Request.Form("txtBlack")
sIre_MV = Request.Form("radIre_MV")
sBar_Set = Request.Form("txtBar_Set")

'' File Measurements
sVideoCodec = Request.Form("selVideoCodec")
sVideoBitRate = Request.Form("txtVideoBitRate")
sVideoBitDepth = Request.Form("selVideoBitDepth")
sBitRateMode = Request.Form("selBitRateMode")
sAudioCodec = Request.Form("selAudioCodec")
sAudioBitRate = Request.Form("txtAudioBitRate")
sAudioBitDepth = Request.Form("selAudioBitDepth")
sSampleRate = Request.Form("txtSampleRate")
sGOPStructure = Request.Form("selGOPStructure")
sGamut = Request.Form("selGamut")
sColourEncoding = Request.Form("selColourEncoding")
sFileSize = Request.Form("txtFileSize")
sActivePicture = Request.Form("txtActivePicture")
sFrameSize = Request.Form("txtFrameSize")

'''response.write "FrameSize:" & sFrameSize
''response.end

updtOverallSpecs = "UPDATE qcHeader " & _
			     "SET Lum_Peak = '" & sLum_Peak & "', " & _
				"Chroma_Peak = '" & sChroma_Peak & "', " & _
				"Bar_Vid = '" & sBar_Vid & "', " & _
				"Lum_Avg = '" & sLum_Avg & "', " & _
				"Chroma_Avg = '" & sChroma_Avg & "', " & _
				"Bar_Chr = '" & sBar_Chr & "', " & _
				"Black = '" & sBlack & "', " & _
				"IRE_MV = '" & sIRE_MV & "', " & _
				"Bar_Set = '" & sBar_Set & "', " & _
				"Video_Codec = '" & sVideoCodec & "', " & _
				"Video_Bit_Rate = '" & cstr(sVideoBitRate) & "', " & _
				"Video_Bit_Depth = '" & cstr(sVideoBitDepth) & "', " & _
				"Bit_Rate_Mode = '" & sBitRateMode & "', " & _
				"Audio_Codec = '" & sAudioCodec & "', " & _
				"Audio_Bit_Rate = '" & cstr(sAudioBitRate) & "', " & _
				"Audio_Bit_Depth = '" & cstr(sAudioBitDepth) & "', " & _
				"Sample_Rate = '" & cstr(sSampleRate) & "', " & _
				"GOP_Structure = '" & sGOPStructure & "', " & _
				"Gamut = '" & sGamut & "', " & _
				"Colour_Encoding = '" & sColourEncoding & "', " & _
				"File_Size= '" & cstr(sFileSize) & "', " & _
				"Active_Picture = '" & sActivePicture & "', " & _
				"Frame_Size = '" & sFrameSize & "' " & _
				"WHERE qcNum = " & clng(sQCNum) & " " & _
				"AND subQCNum = " & cint(sRev)

cnQCS.Execute updtOverallSpecs

cnQCS.Close
Set cnQCS = Nothing

Response.Redirect("frmOverallSpecs.asp?frm=OverallSpecs&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev)

%>
