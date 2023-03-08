﻿
USE [QCSUK]
GO

ALTER TABLE [bward].[qcHeader] ADD DecodeCheck VARCHAR(10) NULL
ALTER TABLE [bward].[qcHeader] ADD MaxCLL VARCHAR(50) NULL
ALTER TABLE [bward].[qcHeader] ADD MaxFALL VARCHAR(50) NULL
ALTER TABLE [bward].[BanijahRightsTapeLayout] ALTER COLUMN PartDurationExcludingHolds VARCHAR(100) NULL

GO

ALTER PROCEDURE [bward].[sp_SelectOverallSpecs]
	@_QCNum int,
	@_Rev int
AS
BEGIN
	
	SELECT	
			Lum_Peak, Chroma_Peak, Bar_Vid, Lum_Avg,
			Chroma_Avg, Bar_Chr, Black, IRE_MV, Bar_Set,
			Video_Codec,Video_Bit_Rate,Video_Bit_Depth,Bit_Rate_Mode,
			Audio_Codec,Audio_Bit_Rate,Audio_Bit_Depth,Sample_Rate,
			GOP_Structure,Gamut,Colour_Encoding,File_Size,
			Active_Picture,AssetType,Frame_Size,
			Timecode, HBlanking, VBlanking, PSEResult,
			DecodeCheck, MaxCLL, MaxFALL
	FROM 
			[bward].qcHeader
	WHERE 
			Qcnum= @_QCNum AND subQcnum = @_Rev

END

GO

ALTER PROCEDURE [bward].[sp_UpdateOverallSpecs]
	@_QCNum int,
	@_Rev int,
	@_lumPeak VARCHAR(15) = NULL,
	@_chPeak VARCHAR(15) = NULL,
	@_barVid VARCHAR(15) = NULL,
	@_lumAvg VARCHAR(15) = NULL,
	@_chAvg VARCHAR(15) = NULL,
	@_barChr VARCHAR(15) = NULL,
	@_black VARCHAR(15) = NULL,
	@_ireMv CHAR(1) = NULL,
	@_barSet VARCHAR(15) = NULL,
	@_vidCodec VARCHAR(100) = NULL,
	@_vidRate VARCHAR(100) = NULL,
	@_vidDepth VARCHAR(100) = NULL,
	@_bitRateMode VARCHAR(100) = NULL,
	@_auCodec VARCHAR(100) = NULL,
	@_auRate VARCHAR(100) = NULL,
	@_auDepth VARCHAR(100) = NULL,
	@_sampleRate VARCHAR(100) = NULL,
	@_gop VARCHAR(100) = NULL,
	@_gamut VARCHAR(100) = NULL,
	@_colEnc VARCHAR(100) = NULL,
	@_fileSize VARCHAR(100) = NULL,
	@_actPic VARCHAR(100) = NULL,
	@_frSize VARCHAR(100) = NULL,

    @_timecode VARCHAR(11) = NULL,
	@_hblanking VARCHAR(50) = NULL,
	@_vblanking VARCHAR(50) = NULL,
	@_pseresult VARCHAR(10) = NULL,
	@_decodecheck VARCHAR(10) = NULL,
	@_maxcll VARCHAR(50) = NULL,
	@_maxfall VARCHAR(50) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	
	UPDATE 
		[bward].qcHeader
	SET 
		Lum_Peak = @_lumPeak,
		Chroma_Peak = @_chPeak,
		Bar_Vid = @_barVid,
		Lum_Avg = @_lumAvg,
		Chroma_Avg = @_chAvg,
		Bar_Chr = @_barChr,
		Black = @_black,
		IRE_MV = @_ireMv,
		Bar_Set = @_barSet,
		Video_Codec = @_vidCodec,
		Video_Bit_Rate = @_vidRate,
		Video_Bit_Depth = @_vidDepth,
		Bit_Rate_Mode = @_bitRateMode,
		Audio_Codec = @_auCodec,
		Audio_Bit_Rate = @_auRate,
		Audio_Bit_Depth = @_auDepth,
		Sample_Rate = @_sampleRate,
		GOP_Structure = @_gop,
		Gamut = @_gamut,
		Colour_Encoding = @_colEnc,
		File_Size = @_fileSize,
		Active_Picture = @_actPic,
		Frame_Size = @_frSize,
		--Timecode = @_timecode,
		HBlanking = @_hblanking,
		VBlanking = @_vblanking,
		PSEResult = @_pseresult,
		DecodeCheck = @_decodecheck, 
		MaxCLL = @_maxcll, 
		MaxFALL  = @_maxfall
		
	WHERE 
		Qcnum= @_QCNum AND subQcnum = @_Rev

	
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcHeader (sp_UpdateHeaderDetails)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO

/****** Object:  StoredProcedure [bward].[sp_CopyQCReport]    Script Date: 07/03/2023 11:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****************Copy QC**********************************************/
-- =============================================
-- Author:		Isaac Koomson
-- Create date: 06/01/2012
-- Description:	Creates a new QC Report with new QC number but same or new Job Number by copying existing QC Report 

-- Modified Date: 27/01/2012 Isaac Koomson
--Modification Notes: Modified to include LKFS fields

-- Modified Date: 09/11/2012 Isaac Koomson
--Modification Notes: Modified to include Asset Type, Filename and Channels 17-24


-- Modified By:	Isaac Koomson
-- Modification Date: 08/06/2016
-- Description:	Modified to Endemol Extensions

-- Modified By:	Isaac Koomson
-- Modification Date: 08/02/2023
-- Description:	Modified for Banijay Rights ( frormally ESI) new template

-- =============================================
ALTER PROCEDURE [bward].[sp_CopyQCReport]
	-- Add the parameters for the stored procedure here
	@qcWONumber VARCHAR(10),
	@qcNumber INT,
	@subQCNumber INT, -- Revision Number
	@operator INT = NULL -- The user that copied the QC
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @ErrorMsg VARCHAR(300)
    DECLARE @lastQCNumber INT
    DECLARE @newQCNumber INT
    DECLARE @newSubQCNumber INT -- Revision Number
	DECLARE @qcType VARCHAR(4)
    
	 --Wrap in transaction
     BEGIN TRAN
     
     SELECT @lastQCNumber = LastQCNum FROM bward.qcConfig  -- Get the Last QC Number
     SET @newQCNumber = @lastQCNumber + 1
     SET @newSubQCNumber = 1  -- New Revison Number is awlays 1
	 SELECT @qcType = qc_type FROM bward.qcHeader WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber

	 -- Copy Old Banijay Rights Template to the New Template
	  IF @qcType = 'E'  -- Old Banijay Rights or ESI Template
	   BEGIN
	    SET @qcType = 'BNJR' -- New Banijay Rights Template
	   END

	 IF @operator IS NULL   
	   BEGIN
	    SELECT @operator = Operator from bward.qcHeader WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber -- Use the original QC Opearator
	   END
     
     -- ********************** Insert QC Header **************************************************
     INSERT INTO bward.qcHeader  
		(QCNum, subQCNum, wonum, CustID, Show, Epis_no,  
		Epis_name, Comments, Tot_Part, TapeDesc1, Standard,  
		Format, Version, Aspect, Textless,  
		Client_trk, TRT, bay_num, supervise, qc_type,  
		in_house, DVNR, TelecineOp,  addinfo, src_standard,  
		src_desc, Input_Date, pono,  QC_date, eval_stat, 
		FullQC_vid, FullQC_Ch1, FullQC_ch2,  
		FullQC_ch3, FullQC_ch4, FullQC_ch5, FullQC_ch6, FullQC_ch7,  
		FullQC_ch8, FullQC_ch9,FullQC_ch10,FullQC_ch11,FullQC_ch12,
		FullQC_ch13, FullQC_ch14,FullQC_ch15,FullQC_ch16,
		FullQC_Ch17, FullQC_Ch18, FullQC_Ch19, FullQC_Ch20,
	    FullQC_Ch21, FullQC_Ch22, FullQC_Ch23, FullQC_ch24,
		FullQC_cue, SpotQC_vid, SpotQC_ch1, SpotQC_ch2,  
		SpotQC_ch3, SpotQC_ch4, SpotQC_ch5, SpotQC_ch6, SpotQC_ch7,  
		SpotQC_ch8,SpotQC_ch9, SpotQC_ch10, SpotQC_ch11, SpotQC_ch12,
		SpotQC_ch13,SpotQC_ch14, SpotQC_ch15, SpotQC_ch16,
		SpotQC_Ch17, SpotQC_Ch18, SpotQC_Ch19, SpotQC_Ch20, SpotQC_Ch21, 
	    SpotQC_Ch22, SpotQC_Ch23, SpotQC_Ch24,
		SpotQC_cue, QC_VTR, Operator, 
    	Video_Codec,Video_Bit_Rate,Video_Bit_Depth,Bit_Rate_Mode,
		Audio_Codec,Audio_Bit_Rate,Audio_Bit_Depth,Sample_Rate,
		GOP_Structure,Gamut,Colour_Encoding,File_Size,Active_Picture, 
		Stock_mfg, Stock_batch, src_format, Rec_Date, Rec_Vtr,  
		Rec_fac, Bar_Vid, Bar_chr, Bar_set, Black, Chroma_avg,  
		Lum_Avg, Chroma_peak, format_qc, IRE_MV, This_part,
		Subtitle,HLanguage,TapeNumber,HeadLogo,TailLogo,TapeDesc2,
		RecommendationComments,VideoComments,AssetType,Filename,
		Lum_Peak, Timecode, HBlanking, VBlanking,Frame_Size,   
		OTPercent, OTVer, CTPercent, CTVer, CapPercent, CapVer, grdVideo, grdAudio, grdOverall,
		Duration, [ProgrammeDetails], [ProductionNumber], [ProgrammeTitleAndNumber], [ProductionCompany],
        [ContactPhoneNumber], [PostCompany], [ProductPlacementLogoPresentAndInSafeArea],
		[SponsorshipHeadAndTailPresent],[TAndCsWithinSafeArea],
        [FileWrapper],[SDROrHDR], [FrameRate], [VideoLines], 
        [TypeOfHDR], [CaptionSafe], [EmbeddedCCTrack], BitRate, PSEResult,
		QCActionType, QCVendor,
		DecodeCheck, MaxCLL, MaxFALL
		 
		 )  
	SELECT @newQCNumber, @newSubQCNumber,@qcWONumber, CustID, Show, Epis_no,  
		Epis_name, Comments, Tot_Part, TapeDesc1, Standard,  
		Format, Version, Aspect, Textless,  
		Client_trk, TRT, bay_num, supervise, qc_type,  
		in_house, DVNR, TelecineOp,  addinfo, src_standard,  
		src_desc, Input_Date, pono,  CURRENT_TIMESTAMP, eval_stat,  
		FullQC_vid, FullQC_Ch1, FullQC_ch2,  
		FullQC_ch3, FullQC_ch4, FullQC_ch5, FullQC_ch6, FullQC_ch7,  
		FullQC_ch8, FullQC_ch9,FullQC_ch10,FullQC_ch11,FullQC_ch12,
		FullQC_ch13, FullQC_ch14,FullQC_ch15,FullQC_ch16, 
		FullQC_Ch17, FullQC_Ch18, FullQC_Ch19, FullQC_Ch20,
	    FullQC_Ch21, FullQC_Ch22, FullQC_Ch23, FullQC_ch24,
		FullQC_cue, SpotQC_vid, SpotQC_ch1, SpotQC_ch2,  
		SpotQC_ch3, SpotQC_ch4, SpotQC_ch5, SpotQC_ch6, SpotQC_ch7,  
		SpotQC_ch8,SpotQC_ch9, SpotQC_ch10, SpotQC_ch11, SpotQC_ch12,
		SpotQC_ch13,SpotQC_ch14, SpotQC_ch15, SpotQC_ch16, 
		SpotQC_Ch17, SpotQC_Ch18, SpotQC_Ch19, SpotQC_Ch20, SpotQC_Ch21, 
	    SpotQC_Ch22, SpotQC_Ch23, SpotQC_Ch24,
		SpotQC_cue, QC_VTR, @operator, 
		Video_Codec,Video_Bit_Rate,Video_Bit_Depth,Bit_Rate_Mode,
		Audio_Codec,Audio_Bit_Rate,Audio_Bit_Depth,Sample_Rate,
		GOP_Structure,Gamut,Colour_Encoding,File_Size,Active_Picture, 
		Stock_mfg, Stock_batch, src_format, Rec_Date, Rec_Vtr,  
		Rec_fac, Bar_Vid, Bar_chr, Bar_set, Black, Chroma_avg,  
		Lum_Avg, Chroma_peak, format_qc, IRE_MV, This_part,
		Subtitle,HLanguage,TapeNumber,HeadLogo,TailLogo,TapeDesc2,
		RecommendationComments,VideoComments,AssetType,Filename,
		Lum_Peak, Timecode, HBlanking, VBlanking,Frame_Size,
		OTPercent, OTVer, CTPercent, CTVer, CapPercent, CapVer, grdVideo, grdAudio, grdOverall,
		Duration, [ProgrammeDetails], [ProductionNumber], [ProgrammeTitleAndNumber], [ProductionCompany],
        [ContactPhoneNumber], [PostCompany], [ProductPlacementLogoPresentAndInSafeArea],
		[SponsorshipHeadAndTailPresent],[TAndCsWithinSafeArea],
       [FileWrapper],[SDROrHDR], [FrameRate], [VideoLines], 
        [TypeOfHDR], [CaptionSafe], [EmbeddedCCTrack], BitRate, PSEResult,
		QCActionType, QCVendor,
		DecodeCheck, MaxCLL, MaxFALL
	FROM bward.qcHeader  
	WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber
	
	IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcHeader'
	   GOTO Error
	END


	
	
	-- ********************Insert QC AudioTC **********************************************************
	
	INSERT INTO bward.qcAudioTC  
			(qcNum, subQCNum, Language,  
			ch1_Desc, ch1_LKFS, ch1_Tone, ch1_avg, ch1_Peak, ch1_TruePeak,  
			ch2_Desc, ch2_LKFS,  ch2_Tone, ch2_avg, ch2_Peak, ch2_TruePeak,  
			ch3_Desc, ch3_LKFS, ch3_Tone, ch3_avg, ch3_Peak, ch3_TruePeak,  
			ch4_Desc, ch4_LKFS,  ch4_Tone, ch4_avg, ch4_Peak, ch4_TruePeak,  
			ch5_Desc, ch5_LKFS,  ch5_Tone, ch5_avg, ch5_Peak, ch5_TruePeak,  
			ch6_Desc, ch6_LKFS,  ch6_Tone, ch6_avg, ch6_Peak, ch6_TruePeak,  
			ch7_Desc, ch7_LKFS,  ch7_Tone, ch7_avg, ch7_Peak, ch7_TruePeak,  
			ch8_Desc, ch8_LKFS,  ch8_Tone, ch8_avg, ch8_Peak, ch8_TruePeak,  
			ch9_Desc, ch9_LKFS,  ch9_Tone, ch9_avg, ch9_Peak, ch9_TruePeak,  
			ch10_Desc, ch10_LKFS,  ch10_Tone, ch10_avg, ch10_Peak, ch10_TruePeak,  
			ch11_Desc, ch11_LKFS,  ch11_Tone, ch11_avg, ch11_Peak, ch11_TruePeak,  
			ch12_Desc, ch12_LKFS,  ch12_Tone, ch12_avg, ch12_Peak, ch12_TruePeak,  
			ch13_Desc, ch13_LKFS,  ch13_Tone, ch13_avg, ch13_Peak, ch13_TruePeak,  
			ch14_Desc, ch14_LKFS,  ch14_Tone, ch14_avg, ch14_Peak, ch14_TruePeak,  
			ch15_Desc, ch15_LKFS,  ch15_Tone, ch15_avg, ch15_Peak, ch15_TruePeak,  
			ch16_Desc, ch16_LKFS, ch16_Tone, ch16_avg, ch16_Peak, ch16_TruePeak,  
			ch17_desc, ch17_LKFS,  ch17_tone, ch17_avg, ch17_peak, ch17_TruePeak, 
			ch18_desc, ch18_LKFS,  ch18_tone, ch18_avg, ch18_peak, ch18_TruePeak, 
			ch19_desc, ch19_LKFS,  ch19_tone, ch19_avg, ch19_peak, ch19_TruePeak, 
			ch20_desc, ch20_LKFS,  ch20_tone, ch20_avg, ch20_peak, ch20_TruePeak, 
			ch21_desc, ch21_LKFS,  ch21_tone, ch21_avg, ch21_peak, ch21_TruePeak, 
			ch22_desc, ch22_LKFS,  ch22_tone, ch22_avg, ch22_peak, ch22_TruePeak,
			ch23_desc, ch23_LKFS,  ch23_tone, ch23_avg, ch23_peak, ch23_TruePeak, 
			ch24_desc, ch24_LKFS,  ch24_tone, ch24_avg, ch24_peak, ch24_TruePeak, 
			cue_Desc,  cue_LKFS, cue_Tone, cue_avg, cue_Peak, cue_TruePeak,  
			Time_code, NR, TCInteg, Comp_Sync, ch12_phase,  
			Tone_phase, ch34_phase,
			Language1,Language2,Language3,Language4,Language5,Language6,Language7,Language8,Language9,Language10,Language11,Language12,
			Language13,Language14,Language15,Language16,Language17,Language18,Language19,Language20,Language21,Language22,Language23,Language24,
            InPhase1,InPhase2,InPhase3,InPhase4,InPhase5,InPhase6,InPhase7,InPhase8,InPhase9,InPhase10,InPhase11,InPhase12,
			InPhase13,InPhase14,InPhase15,InPhase16,InPhase17,InPhase18,InPhase19,InPhase20,InPhase21,InPhase22,InPhase23,InPhase24,
            Discreate1,Discreate2,Discreate3,Discreate4,Discreate5,Discreate6,Discreate7,Discreate8,Discreate9,Discreate10,Discreate11,Discreate12,
			Discreate13,Discreate14,Discreate15,Discreate16,Discreate17,Discreate18,Discreate19,Discreate20,Discreate21,Discreate22,Discreate23,Discreate24,
			QCinUnity, SurroundSound, 
			TrackContent1, TrackContent2,TrackContent3,TrackContent4,TrackContent5,TrackContent6,
			TrackContent7,TrackContent8,TrackContent9,TrackContent10,TrackContent11,TrackContent12,
			TrackContent13,TrackContent14,TrackContent15,TrackContent16,TrackContent17,TrackContent18,
			TrackContent19,TrackContent20,TrackContent21,TrackContent22,TrackContent23,TrackContent24


			)

		SELECT @newQCNumber, @newSubQCNumber, Language,  
			ch1_Desc,  ch1_LKFS,  ch1_Tone, ch1_avg, ch1_Peak, ch1_TruePeak,  
			ch2_Desc, ch2_LKFS,  ch2_Tone, ch2_avg, ch2_Peak, ch2_TruePeak,  
			ch3_Desc, ch3_LKFS, ch3_Tone, ch3_avg, ch3_Peak, ch3_TruePeak,  
			ch4_Desc, ch4_LKFS, ch4_Tone, ch4_avg, ch4_Peak, ch4_TruePeak,  
			ch5_Desc, ch5_LKFS,  ch5_Tone, ch5_avg, ch5_Peak, ch5_TruePeak,  
			ch6_Desc, ch6_LKFS,  ch6_Tone, ch6_avg, ch6_Peak, ch6_TruePeak,  
			ch7_Desc, ch7_LKFS,  ch7_Tone, ch7_avg, ch7_Peak, ch7_TruePeak,  
			ch8_Desc, ch8_LKFS,  ch8_Tone, ch8_avg, ch8_Peak, ch8_TruePeak,  
			ch9_Desc, ch9_LKFS,  ch9_Tone, ch9_avg, ch9_Peak, ch9_TruePeak,  
			ch10_Desc, ch10_LKFS,  ch10_Tone, ch10_avg, ch10_Peak, ch10_TruePeak,  
			ch11_Desc, ch11_LKFS,  ch11_Tone, ch11_avg, ch11_Peak, ch11_TruePeak,  
			ch12_Desc, ch12_LKFS,  ch12_Tone, ch12_avg, ch12_Peak, ch12_TruePeak,  
			ch13_Desc, ch13_LKFS,  ch13_Tone, ch13_avg, ch13_Peak, ch13_TruePeak,  
			ch14_Desc, ch14_LKFS,  ch14_Tone, ch14_avg, ch14_Peak, ch14_TruePeak,  
			ch15_Desc, ch15_LKFS,  ch15_Tone, ch15_avg, ch15_Peak, ch15_TruePeak,  
			ch16_Desc, ch16_LKFS,  ch16_Tone, ch16_avg, ch16_Peak, ch16_TruePeak, 
			ch17_desc, ch17_LKFS,  ch17_tone, ch17_avg, ch17_peak, ch17_TruePeak, 
			ch18_desc, ch18_LKFS,  ch18_tone, ch18_avg, ch18_peak, ch18_TruePeak, 
			ch19_desc, ch19_LKFS,  ch19_tone, ch19_avg, ch19_peak, ch19_TruePeak, 
			ch20_desc, ch20_LKFS,  ch20_tone, ch20_avg, ch20_peak, ch20_TruePeak, 
			ch21_desc, ch21_LKFS,  ch21_tone, ch21_avg, ch21_peak, ch21_TruePeak, 
			ch22_desc, ch22_LKFS,  ch22_tone, ch22_avg, ch22_peak, ch22_TruePeak,
			ch23_desc, ch23_LKFS,  ch23_tone, ch23_avg, ch23_peak, ch23_TruePeak, 
			ch24_desc, ch24_LKFS,  ch24_tone, ch24_avg, ch24_peak, ch24_TruePeak,  
			cue_Desc, cue_LKFS,  cue_Tone, cue_avg, cue_Peak, cue_TruePeak,  
			Time_code, NR, TCInteg, Comp_Sync, ch12_phase,  
			Tone_phase, ch34_phase,
			Language1,Language2,Language3,Language4,Language5,Language6,Language7,Language8,Language9,Language10,Language11,Language12,
			Language13,Language14,Language15,Language16,Language17,Language18,Language19,Language20,Language21,Language22,Language23,Language24,
            InPhase1,InPhase2,InPhase3,InPhase4,InPhase5,InPhase6,InPhase7,InPhase8,InPhase9,InPhase10,InPhase11,InPhase12,
			InPhase13,InPhase14,InPhase15,InPhase16,InPhase17,InPhase18,InPhase19,InPhase20,InPhase21,InPhase22,InPhase23,InPhase24,
            Discreate1,Discreate2,Discreate3,Discreate4,Discreate5,Discreate6,Discreate7,Discreate8,Discreate9,Discreate10,Discreate11,Discreate12,
			Discreate13,Discreate14,Discreate15,Discreate16,Discreate17,Discreate18,Discreate19,Discreate20,Discreate21,Discreate22,Discreate23,Discreate24,
			QCinUnity, SurroundSound,
			TrackContent1, TrackContent2,TrackContent3,TrackContent4,TrackContent5,TrackContent6,
			TrackContent7,TrackContent8,TrackContent9,TrackContent10,TrackContent11,TrackContent12,
			TrackContent13,TrackContent14,TrackContent15,TrackContent16,TrackContent17,TrackContent18,
			TrackContent19,TrackContent20,TrackContent21,TrackContent22,TrackContent23,TrackContent24 
  		FROM bward.qcAudioTC  
		WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber
		
		IF @@ERROR <> 0
	      BEGIN
	       SET @errorMsg = 'Could not insert into qcAudioTC'
	       GOTO Error
	      END
	
	-- ********************Insert QC BVHE **********************************************************
     INSERT INTO bward.qcBVHE  
			(qcnum, subqcnum, DVVidLevel, DVChromaLevel, DVBlackLevel,  
			DVVBlank, DVHBlank, DVFrontPor, DVHSync, DVBurstCycle,  
			DVBackPor, DVBurstAmp, DVVidRF, DVPCMRF, DVCtlTrk,  
			DVTimeBase, DVMotionJit, TSShred, TSDropOut, TSScratch,  
			TSEdgeDam, TSTapeTension, TSCreasing, FScratchesDirt,  
			FColorBal, FFraming, SCColourimetry, SCFlicker, MVRes,  
			MVSignalNoise, MVColorBal, MVReg, MVEnt, MVCSM, MVChrLvT,  
			MVPGMPvT, MVPGMLvT, MVPedLvT, MVSS, MVLagBoom, MVMoire,  
			MVChrTearing, MVRinging, MVMicrophonics, MVBlackComp,  
			MVWhiteComp, MVTransGlitch, MVBRi, MVVERi, MVDROi, APGMLvT,  
			AIntellig, ADist, ADistLo, ADistMed, ADistHi, AHHN, ASib,  
			ALipSync, AStereoPhase, AUpcuts, ATestTones, OQPrelim, OQFinal)  
		SELECT @newQCNumber, @newSubQCNumber,  
			DVVidLevel, DVChromaLevel, DVBlackLevel,  
			DVVBlank, DVHBlank, DVFrontPor, DVHSync, DVBurstCycle,  
			DVBackPor, DVBurstAmp, DVVidRF, DVPCMRF, DVCtlTrk,  
			DVTimeBase, DVMotionJit, TSShred, TSDropOut, TSScratch,  
			TSEdgeDam, TSTapeTension, TSCreasing, FScratchesDirt,  
			FColorBal, FFraming, SCColourimetry, SCFlicker, MVRes,  
			MVSignalNoise, MVColorBal, MVReg, MVEnt, MVCSM, MVChrLvT,  
			MVPGMPvT, MVPGMLvT, MVPedLvT, MVSS, MVLagBoom, MVMoire,  
			MVChrTearing, MVRinging, MVMicrophonics, MVBlackComp,  
			MVWhiteComp, MVTransGlitch, MVBRi, MVVERi, MVDROi, APGMLvT,  
			AIntellig, ADist, ADistLo, ADistMed, ADistHi, AHHN, ASib,  
			ALipSync, AStereoPhase, AUpcuts, ATestTones, OQPrelim, OQFinal  
		FROM bward.qcBVHE  
		WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber
          
     IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcBVHE'
	   GOTO Error
	END
     
	-- ********************Insert QC Element**********************************************************
		INSERT INTO bward.qcElement  
			(qcnum, subQCNum, Part_num, Barcode, length, slate_QC,  
			Labels_QC, Shipper_QC, Src_barcode, Serrations, Tracking_QC,  
			Tape_Wrap_QC, HBlank, VBlank, RF, CloseCap, VITS, VIRS,  
			Front_Por, Burst_Levl, Sync_Levl, StartTC, SubTitle_QC,  
			Channel_cond, ctl_track, VITC)  
		SELECT @newQCNumber, @newSubQCNumber, 
			Part_num, Barcode, length, slate_QC,  
			Labels_QC, Shipper_QC, Src_barcode, Serrations, Tracking_QC,  
			Tape_Wrap_QC, HBlank, VBlank, RF, CloseCap, VITS, VIRS,  
			Front_Por, Burst_Levl, Sync_Levl, StartTC, SubTitle_QC,  
			Channel_cond, ctl_track, VITC  
		FROM bward.qcElement  
		WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber
	
	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcElement'
	   GOTO Error
	END
	
	-- ********************Insert QC TapeFormat **********************************************************
	
	INSERT INTO bward.qcTapeFormat  
			(qcnum, subQCNum,  
			Item_Num, description, length, Time_code)  
		SELECT @newQCNumber, @newSubQCNumber, 
			Item_Num, description, length, Time_code  
		FROM bward.qcTapeFormat  
		WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber
	
	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcTapeFormat'
	   GOTO Error
	END
	
	
	-- ********************Insert QC CTISS **********************************************************
	INSERT INTO  bward.qcCTISS
	(QCNum,subQCNum,Audio8dB,Audio16dB,Video102,Video105,SubBlanking0,SubBlanking4)
	SELECT @newQCNumber, @newSubQCNumber,
	Audio8dB,Audio16dB,Video102,Video105,SubBlanking0,SubBlanking4
	FROM bward.qcCTISS
	WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber
	
	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcCTISS'
	   GOTO Error
	END
	
	-- ********************Insert QC Text Info **********************************************************
	INSERT INTO bward.qcTextInfo(QCNum,subQCNum,TimeCodeIn,TimeCodeOut,TextInfo)
	SELECT   @newQCNumber, @newSubQCNumber,TimeCodeIn,TimeCodeOut,TextInfo
	FROM	bward.qcTextInfo 
	WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber
	
	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcTextInfo'
	   GOTO Error
	END
	
    -- ********************Insert QC Time (Log) Info **********************************************************
    INSERT INTO bward.qcTime(Qcnum,subQcnum,
       Part_num,Time_code,QC_Code,Note,QC_Grade,
       Action,item_duratn,in_master,deleted, item_num, ActionsForDisplay, QC_Codename)
    SELECT @newQCNumber, @newSubQCNumber,
      Part_num,Time_code,QC_Code,Note,QC_Grade,
       Action,item_duratn,in_master,deleted, item_num, ActionsForDisplay, QC_Codename
     FROM   bward.qcTime
     WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber
	
	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcTime'
	   GOTO Error
	END


	-- ********************Insert Endemol Extensions **********************************************************

	IF @qcType = 'E'
	   BEGIN


	        -- ESI Specifics
			INSERT INTO bward.qcEndemolSpecifics
			 (
			 QCNum,
			 subQCNum,
			[ESIEndCreditOrLogo],
			[SeamlessOrParted],
			[IsTextlessPresent],
			[ContentCensoredBleepedOrBlurred],
			[FlashingLightsOrEpilepsyWarningPresent],
			[TimeSpecificTextOrAudioPresent],
			[ExtremeLanguagePresent],
			[NudityPresent],
			[IsMandEComplete],
			IsMixMinusNarrationPresentandComplete
			)
			SELECT
			@newQCNumber,
			@newSubQCNumber,
			[ESIEndCreditOrLogo],
			[SeamlessOrParted],
			[IsTextlessPresent],
			[ContentCensoredBleepedOrBlurred],
			[FlashingLightsOrEpilepsyWarningPresent],
			[TimeSpecificTextOrAudioPresent],
			[ExtremeLanguagePresent],
			[NudityPresent],
			[IsMandEComplete],
			IsMixMinusNarrationPresentandComplete
			FROM bward.qcEndemolSpecifics
			 WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber

			 IF @@ERROR <> 0
			 BEGIN
			   SET @errorMsg = 'Could not insert into qcEndemolSpecifics'
			   GOTO Error
			END
			
			 -- ESI Final
			INSERT INTO bward.qcEndemolVideoAndAudio
			(
			QCNum,
			SubQCNum,
			[LuminanceLevelsRating],
			[LuminanceLevelsDetails],
			[BlackLevelsRating],
			[BlackLevelsDetails],
			[ChrominanceLevelsRating],
			[ChrominanceLevelsDetails],
			[AudioPeaksAndLoudnessRating],
			[AudioPeaksAndLoudnessDetails],
			[TitleSafeRating],
			[TitleSafeDetails],
			[QCResult]
			)
			SELECT
			@newQCNumber,
			@newSubQCNumber,
			[LuminanceLevelsRating],
			[LuminanceLevelsDetails],
			[BlackLevelsRating],
			[BlackLevelsDetails],
			[ChrominanceLevelsRating],
			[ChrominanceLevelsDetails],
			[AudioPeaksAndLoudnessRating],
			[AudioPeaksAndLoudnessDetails],
			[TitleSafeRating],
			[TitleSafeDetails],
			[QCResult]
			FROM bward.qcEndemolVideoAndAudio
			WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber

			 IF @@ERROR <> 0
			 BEGIN
			   SET @errorMsg = 'Could not insert into qcEndemolVideoAudio'
			   GOTO Error
			END

			-- Banijay Rights Checklist - Replacement for Specifics and Measurements
			 INSERT INTO [bward].[ChecklistBanijayRights]
			   (
				[Qcnum],
				[subQcnum],
				[CustId],
				[ChecklistCompleted],
				[IsFile],
				[FileToSpec],
				[DecodeCheckPass],
                [ConfirmVideoFormat],
				[VideoCodec],
				[Format],
				[Standard],
				[FrameRate],
				[VideoBitRate],
				[FrameSizeOrResolution],
				[AspectRatio],
				[AudioCodec],
				[AudioBitDepth],
				[AudioBitRate],
				[SampleRate],
				[Discrete],
				[IsTheFileMetadataCorrect],
				[InterlacedOrProgressiveCorrectlyFlagged],
				[InterlacedOrProgressiveCorrectlyNotFlaggedReason],
				[CLAPPresent],
				[ColourPrimariesPresent],
				[TransferCharacteristicsPresent],
				[MatrixCoefficientsPresent],
				[DisplayAspectRatioCorrect],
				[InterlacedVsProgressiveCheckedAndCorrect],
				[DoesTheFileContainLineup],
				[SlateInformationCorrect],
				[DoesTheProgrammeStartOnTheHour],
				[IsTheProgrammeSeamlessOrParted],
				[PartedBreaksLogged],
				[IfPartedSpecifyIfOneSecondBlackBetweenParts],
				[BumpersPresentAndLogged],
				[InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments],
				[DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram],
				[AreTextlessElementsPresent],
				[AreThereTextlessCoversForAllTextedShots],
				[AreTheTextlessCoversTheSameTimingAsTextedShots],
				[IsTheGradeAndAspectRatioTheSameAsTextedShots],
				[IsThere10SecondsOfBlackBetweenProgrammeAndTextless],
				[IsThere10SecondsOfBlackBeforeEndOfFile],
				[IsAudioLlayoutCorrect],
				[IsLineupToneCorrect],
				[IsLoudnessR128APass],
				[IsMAndEPresentAndComplete],
				[IsMixMinusNarrationPresentAndComplete],
				[MonoVsStereoChecked],
				[AudioInSync],
				[WAVSSupplied],
				[AllAssociatedWAVSPresent],
				[AllAssociatedWAVSNotPresentReason],
				[VideoComplianceCheckedAndLogged],
				[FlashingLightsOrEpilepsyWarningPresent],
				[VideoContentCensoredBleepedOrBlurred],
				[NudityPresent],
				[TimeSpecificTextPresent],
				[ProductPlacementPresent],
				[CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags],
				[AudioComplianceCheckedAndLogged],
				[AudioContentCensoredBleepedOrBlurred],
				[ExtremeLanguagePresent],
				[TimeSpecificAudioPresent]
				) 
             SELECT
			    @newQCNumber,
			    @newSubQCNumber,
				[CustId],
				[ChecklistCompleted],
				[IsFile],
				[FileToSpec],
				[DecodeCheckPass],
                [ConfirmVideoFormat],
				[VideoCodec],
				[Format],
				[Standard],
				[FrameRate],
				[VideoBitRate],
				[FrameSizeOrResolution],
				[AspectRatio],
				[AudioCodec],
				[AudioBitDepth],
				[AudioBitRate],
				[SampleRate],
				[Discrete],
				[IsTheFileMetadataCorrect],
				[InterlacedOrProgressiveCorrectlyFlagged],
				[InterlacedOrProgressiveCorrectlyNotFlaggedReason],
				[CLAPPresent],
				[ColourPrimariesPresent],
				[TransferCharacteristicsPresent],
				[MatrixCoefficientsPresent],
				[DisplayAspectRatioCorrect],
				[InterlacedVsProgressiveCheckedAndCorrect],
				[DoesTheFileContainLineup],
				[SlateInformationCorrect],
				[DoesTheProgrammeStartOnTheHour],
				[IsTheProgrammeSeamlessOrParted],
				[PartedBreaksLogged],
				[IfPartedSpecifyIfOneSecondBlackBetweenParts],
				[BumpersPresentAndLogged],
				[InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments],
				[DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram],
				[AreTextlessElementsPresent],
				[AreThereTextlessCoversForAllTextedShots],
				[AreTheTextlessCoversTheSameTimingAsTextedShots],
				[IsTheGradeAndAspectRatioTheSameAsTextedShots],
				[IsThere10SecondsOfBlackBetweenProgrammeAndTextless],
				[IsThere10SecondsOfBlackBeforeEndOfFile],
				[IsAudioLlayoutCorrect],
				[IsLineupToneCorrect],
				[IsLoudnessR128APass],
				[IsMAndEPresentAndComplete],
				[IsMixMinusNarrationPresentAndComplete],
				[MonoVsStereoChecked],
				[AudioInSync],
				[WAVSSupplied],
				[AllAssociatedWAVSPresent],
				[AllAssociatedWAVSNotPresentReason],
				[VideoComplianceCheckedAndLogged],
				[FlashingLightsOrEpilepsyWarningPresent],
				[VideoContentCensoredBleepedOrBlurred],
				[NudityPresent],
				[TimeSpecificTextPresent],
				[ProductPlacementPresent],
				[CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags],
				[AudioComplianceCheckedAndLogged],
				[AudioContentCensoredBleepedOrBlurred],
				[ExtremeLanguagePresent],
				[TimeSpecificAudioPresent] 
                FROM [bward].[ChecklistBanijayRights] 
			   	WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber

		-- ********************************************************************************************

	    IF @@ERROR <> 0
			 BEGIN
			   SET @errorMsg = 'Could not insert into ChecklistBanijayRights'
			   GOTO Error
			END
	
	  END

	  --  ***************** TO DO :: Copy New Banijay Rights Template  ******************* ------
	  IF @qcType = 'BNJR'
	    BEGIN
		      -- Banijay Rights Programme Layout
		     INSERT INTO  [bward].[BanijahRightsProgrammeLayout]
			 (
			 QCNum,
			 subQCNum,
			 [ProgrammeIn],
			[ProgrammeOut],
            [TotalLengthIncludingBreaks],
            [ProgrammeDuration],
            [NumberOfParts],
            [SlateAccurate],
            [NextWeekOrTrailerPresent]
			)
			SELECT
			@newQCNumber,
			@newSubQCNumber,
			[ProgrammeIn],
			[ProgrammeOut],
            [TotalLengthIncludingBreaks],
            [ProgrammeDuration],
            [NumberOfParts],
            [SlateAccurate],
            [NextWeekOrTrailerPresent]
			FROM [bward].[BanijahRightsProgrammeLayout]
			 WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber

			 IF @@ERROR <> 0
			 BEGIN
			   SET @errorMsg = 'Could not insert into BanijahRightsProgrammeLayout'
			   GOTO Error
			END

			-- Banijay Rights Tape Layout
			  INSERT INTO  [bward].[BanijahRightsTapeLayout]
			 (
			 QCNum,
			 subQCNum,
			 [Type],
             [TimecodeIn],
             [TimecodeOut],
             [PartDurationExcludingHolds],
             [CountAsShow]
			)
			SELECT
			@newQCNumber,
			@newSubQCNumber,
			[Type],
            [TimecodeIn],
            [TimecodeOut],
            [PartDurationExcludingHolds],
            [CountAsShow]
			FROM [bward].[BanijahRightsTapeLayout]
			 WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber

			 IF @@ERROR <> 0
			 BEGIN
			   SET @errorMsg = 'Could not insert into BanijahRightsTapeLayout'
			   GOTO Error
			END

			-- Banijay Rights Text Details
			INSERT INTO [bward].[BanijayRightsTextDetails](
			 QCNum,
			 subQCNum,
			TitleBoardInShow,
			[TitleBoardAfterProg],
			InAndOutOfPartInShow,
			InAndOutOfPartAfterProg,
			EndCreditsInShow,
			EndCreditsAfterProg,
			AstonsNamestrapsEtcInShow,
			AstonsNamestrapsEtcAfterProg,
			SubtitlesOrClosedCaptionsInShow,
			SubtitlesOrClosedCaptionsAfterProg,
			IsThereASecondTextedOrTextlessVersionInShow,
			IsThereASecondTextedOrTextlessVersionAfterProg,
			BurntInSubtitlesOrCC,
			Violence,
			Nudity,
			Swearing,
			BleepedOrUnBleeped,
			UnbleepedSplitTrackAvailable,
			SponsorshipOrProductPlacement
			)
			SELECT 
			@newQCNumber,
			@newSubQCNumber,
			TitleBoardInShow,
			[TitleBoardAfterProg],
			InAndOutOfPartInShow,
			InAndOutOfPartAfterProg,
			EndCreditsInShow,
			EndCreditsAfterProg,
			AstonsNamestrapsEtcInShow,
			AstonsNamestrapsEtcAfterProg,
			SubtitlesOrClosedCaptionsInShow,
			SubtitlesOrClosedCaptionsAfterProg,
			IsThereASecondTextedOrTextlessVersionInShow,
			IsThereASecondTextedOrTextlessVersionAfterProg,
			BurntInSubtitlesOrCC,
			Violence,
			Nudity,
			Swearing,
			BleepedOrUnBleeped,
			UnbleepedSplitTrackAvailable,
			SponsorshipOrProductPlacement
			FROM [bward].[BanijayRightsTextDetails]
			WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber

			 IF @@ERROR <> 0
			 BEGIN
			   SET @errorMsg = 'Could not insert into BanijayRightsTextDetails'
			   GOTO Error
			END

			/***** Update the QC Type to Banijay Rights new temlate*****************************/
			UPDATE bward.qcHeader
			SET qc_type = 'BNJR'
			WHERE QCNum = @newQCNumber AND subQCNum = @newSubQCNumber
			
			 IF @@ERROR <> 0
			 BEGIN
			   SET @errorMsg = 'Could not update QC Type in bward.qcHeader'
			   GOTO Error
			END

		END

	-- ********************Update the Last QC Number **********************************************************
	
	UPDATE bward.qcConfig SET LastQCNum = @newQCNumber, Flag = 'Saved'
	
	
	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcConfig'
	   GOTO Error
	END
     
	-- ********************************************************************************************************
	
	
	IF (@errorMsg IS NULL)--Everything worked fine, commit transaction
	 BEGIN
		 COMMIT
	 END
	 
	 
Error:
	
	--If there is any error, then Roll back the Transaction
	IF (@errorMsg IS NOT NULL)
	BEGIN
		ROLLBACK TRAN
		SET @errorMsg = @errorMsg + ' in sp_CopyQCReport'
		RAISERROR(@errorMsg, 16, 1)
	END	
	
	
	
END

GO


/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateBanijayRightsTapeLayout]    Script Date: 08/03/2023 13:58:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [bward].[ins_up_InsertOrUpdateBanijayRightsTapeLayout]
	-- Add the parameters for the stored procedure here
    @Id INT = 0,
	@QCNum INT,
    @SubQCNum INT,
    @Type VARCHAR(50) = NULL,
    @TimecodeIn VARCHAR(11) = NULL,
	@TimecodeOut VARCHAR(11) = NULL,
	@PartDurationExcludingHolds VARCHAR(100) = NULL,
	@CountAsShow VARCHAR(3) = NULL
	
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
					
	BEGIN TRY
		 
	   IF @Id = 0
	     BEGIN
	        INSERT INTO [bward].[BanijahRightsTapeLayout](
			QCNum,
            SubQCNum,
            [Type],
            TimecodeIn,
	        TimecodeOut,
	        PartDurationExcludingHolds,
	        CountAsShow
			)
	        SELECT
			@QCNum,
            @subQCNum,
            @Type,
            @TimecodeIn,
	        @TimecodeOut,
	        @PartDurationExcludingHolds,
	        @CountAsShow

	     END
	   ELSE 
	     BEGIN
	     	       
	        UPDATE [bward].[BanijahRightsTapeLayout]
			SET 
			[Type] = @Type,
            TimecodeIn = @TimecodeIn,
	        TimecodeOut  =@TimecodeOut,
	        PartDurationExcludingHolds = @PartDurationExcludingHolds,
	        CountAsShow = @CountAsShow
       		WHERE Id =  @Id
     
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'ins_up_InsertOrUpdateBanijayRightsTapeLayout failed: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO