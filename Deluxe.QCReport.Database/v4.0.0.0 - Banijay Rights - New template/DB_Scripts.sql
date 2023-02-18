
USE [QCSUK]
GO

ALTER TABLE [bward].[qcHeader] ALTER COLUMN [qc_type] VARCHAR(4) NULL
ALTER TABLE [bward].[qcHeader] ALTER COLUMN [Aspect] VARCHAR(20) NULL
ALTER TABLE [bward].[qcHeader] ADD FileWrapper VARCHAR(15) NULL
ALTER TABLE [bward].[qcHeader] ADD SDROrHDR VARCHAR(10) NULL
ALTER TABLE [bward].[qcHeader] ADD FrameRate VARCHAR(15) NULL
ALTER TABLE [bward].[qcHeader] ADD VideoLines VARCHAR(20) NULL
ALTER TABLE [bward].[qcHeader] ADD TypeOfHDR VARCHAR(50) NULL
ALTER TABLE [bward].[qcHeader] ADD CaptionSafe VARCHAR(50) NULL
ALTER TABLE [bward].[qcHeader] ADD EmbeddedCCTrack VARCHAR(3) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent1 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent2 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent3 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent4 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent5 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent6 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent7 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent8 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent9 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent10 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent11 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent12 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent13 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent14 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent15 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent16 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent17 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent18 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent19 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent20 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent21 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent22 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent23 VARCHAR(50) NULL
ALTER TABLE [bward].qcAudioTC ADD TrackContent24 VARCHAR(50) NULL
ALTER TABLE [bward].[qcHeader] ADD BitRate VARCHAR(20) NULL
ALTER TABLE [bward].[qcHeader] ADD PSEResult VARCHAR(10) NULL

GO



CREATE PROCEDURE [bward].[sel_GetBanijayRightsProgrammeDetails]
    @QCNum INT,
	@SubQCNum INT
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT 
		QCNum,
		subQCNum ,
        [Show] 'ProgrammeTitle',
        [Filename],
        [Epis_Name] 'EpisodeTitle',
		Epis_No 'EpisodeNumber',
		FileWrapper,
		Video_Codec 'VideoCodec',
		SDROrHDR,
		FrameRate,
		Aspect 'AspectRatio',
		[Version],
		VideoLines,
		TypeOfHDR,
		Timecode,
		CaptionSafe,
		EmbeddedCCTrack
 
	FROM 
		[bward].[qcHeader]
	WHERE 
		qcNum = @QCNum
		AND subQCNum = @SubQCNum
	
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'sel_GetBanijayRightsProgrammeDetails Failed '
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO

CREATE PROCEDURE [bward].[up_UpdateBanijayRightsProgrammeDetails]
	@QCNum INT,
	@SubQCNum INT,			
	@ProgrammeTitle NVARCHAR(255) = NULL,
	@Filename NVARCHAR(255) = NULL,
    @EpisodeTitle NVARCHAR(255) = NULL,
    @EpisodeNumber VARCHAR(150) = NULL,
    @FileWrapper VARCHAR(15) = NULL,
    @VideoCodec VARCHAR(100) = NULL,
    @SDROrHDR VARCHAR(10) = NULL,
    @FrameRate VARCHAR(15) = NULL,
    @AspectRatio VARCHAR(20) = NULL,
    @Version VARCHAR(60) = NULL,
    @VideoLines VARCHAR(50) = NULL,
    @TypeOfHDR VARCHAR(50) = NULL,
    @Timecode VARCHAR(50) = NULL,
    @CaptionSafe VARCHAR(50) = NULL,
    @EmbeddedCCTrack VARCHAR(3) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].[qcHeader] 
	SET 
	    Show = @ProgrammeTitle,
		[Filename] = @Filename,
		Epis_Name = @EpisodeTitle,
		Epis_No = @EpisodeNumber,
		Aspect = @AspectRatio,
        [FileWrapper] = @FileWrapper,
		Video_Codec = @VideoCodec,
        [SDROrHDR] = @SDROrHDR,
        [FrameRate] = @FrameRate,
		[Version]  = @Version,
        [VideoLines] = @VideoLines,
        [TypeOfHDR] = @TypeOfHDR,
		Timecode = @Timecode,
        [CaptionSafe] = @CaptionSafe,
        [EmbeddedCCTrack] = @EmbeddedCCTrack,
		Aspect = @AspectRatio
		WHERE 
		Qcnum = @QCNum
		AND subQcnum = @SubQCNum
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'up_UpdateBanijayRightsProgrammeDetails Failed'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


GO

/****** Object:  StoredProcedure [bward].[sp_UpdateQCReport]    Script Date: 24/01/2023 15:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[sp_UpdateQCReport]
	@_QCNum int,
	@_rev int,
	
	@qcCustId INT,
	@qcWONumber VARCHAR(10),
	@customer VARCHAR(50),
	@qcType VARCHAR(4),
	@qcUserId INT,
	@qcFullName VARCHAR(50),
	@assetType VARCHAR(50)
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcHeader 
	SET 
		woNum = @qcWONumber, 
		CustID = @qcCustId, 
		Operator = @qcUserId, 
		Revised_By = @qcFullName, 
		qc_type = @qcType, 
		AssetType = @assetType
				
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcHeader (sp_UpdateQCReport)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO

/****** Object:  StoredProcedure [bward].[sp_NewQCReport]    Script Date: 24/01/2023 15:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Isaac Koomson
-- Create date: 13/01/2012
-- Description:	Creates a new QC Report 

-- Modified By:	Isaac Koomson
-- Modification date: 16/08/2012
-- Description:	Modified to include Asset Type - File/Tape 

-- =============================================
ALTER PROCEDURE [bward].[sp_NewQCReport]
	-- Add the parameters for the stored procedure here
	@qcWONumber VARCHAR(10),
	@customer VARCHAR(50),
	@qcType VARCHAR(4),
	@qcUserId INT,
	@qcFullName VARCHAR(50),
	@assetType VARCHAR(50),
	@result INT = NULL OUTPUT
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
    DECLARE @customerId INT
    DECLARE @tapeLayout1 VARCHAR(50)
    DECLARE @tapeLayout2 VARCHAR(50)
    DECLARE @tapeLayout3 VARCHAR(50)
    DECLARE @tapeLayout4 VARCHAR(50)
    DECLARE @tapeLayout5 VARCHAR(50)
    DECLARE @tapeLayout6 VARCHAR(50)
    DECLARE @tapeLayout7 VARCHAR(50)
    DECLARE @tapeLayout8 VARCHAR(50)
    DECLARE @tapeLayout9 VARCHAR(50)
        
	 --Wrap in transaction
     BEGIN TRAN
     
     SELECT @lastQCNumber = LastQCNum FROM bward.qcConfig  -- Get the Last QC Number
     SET @newQCNumber = @lastQCNumber + 1
     SET @newSubQCNumber = 1  -- New Revison Number is always 1
     SELECT @customerId = CustID FROM qcClients WHERE CustName = LTRIM(RTRIM(@customer))
     
     SET @tapeLayout1 = 'Roll Up'
     SET @tapeLayout2  = 'Bars & Tone'
     SET @tapeLayout3 = 'Black'
     SET @tapeLayout4 = 'Slate'
     SET @tapeLayout5 = 'Black'
     SET @tapeLayout6 = 'Program'
     SET @tapeLayout7 = 'Black'
     SET @tapeLayout8 = 'Textless'
     SET @tapeLayout9 = 'Black'
     
     -- ********************** Insert QC Header **************************************************
     INSERT INTO qcHeader(woNum, QCNum, subQCNum, QC_date, CustID,  Operator,  this_Part, tot_Part, qc_type, AssetType) 
	 VALUES ( @qcWONumber, @newQCNumber, @newSubQCNumber, CURRENT_TIMESTAMP, @customerId, @qcUserId,  1, 1, LTRIM(RTRIM(@qcType)), LTRIM(RTRIM(@assetType)))

	IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcHeader'
	   GOTO Error
	END
	
	-- ********************Insert QC AudioTC **********************************************************

		IF @qcType = 'BNJR' -- Banijay Rights new template
		  BEGIN
		       INSERT INTO qcAudioTC (qcNum, subQCNum,[Ch1_LKFS],[Ch2_LKFS]) VALUES (@newQCNumber, @newSubQCNumber,'-23.0','-23.0')
		  END
      ELSE
	    BEGIN
		   INSERT INTO qcAudioTC 
					(qcNum, subQCNum, [Language], Ch1_Desc,
					Ch2_Desc, 
					--Ch3_Desc, Ch4_Desc, 
					Cue_Desc, 
					Ch1_Tone, Ch2_Tone, 
					--Ch3_Tone, Ch4_Tone, 
					NR, Ch12_Phase, Ch34_Phase, Time_Code, 
					Tone_Phase, TCInteg, Comp_Sync) 
		    VALUES (@newQCNumber, @newSubQCNumber, 'English', 'English Stereo Left',
					'English Stereo Right', 
					--'Music & Effects Stereo Right', 'Music & Effects Stereo Left', 
					'MOS', '-18dbFS', '-18dbFS', 
					--'-18dbFS', '-18dbFS', 
					'None', 'OK', 'OK', 'EBU', 'OK', 'OK', 'OK')
		END
		
		IF @@ERROR <> 0
	      BEGIN
	          SET @errorMsg = 'Could not insert into qcAudioTC'
	          GOTO Error
	      END

	-- ********************Insert QC BVHE **********************************************************
     INSERT INTO qcBVHE (qcNum, subQCNum) VALUES ( @newQCNumber, @newSubQCNumber )
          
     IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcBVHE'
	   GOTO Error
	END
     
	-- ********************Insert QC Element**********************************************************
	INSERT INTO qcElement 
					(qcNum, subQCNum, part_num,
					HBlank, CloseCap, VBlank, Sync_levl, RF,
					Burst_levl, Serrations, front_por, Channel_Cond, Slate_QC, 
					VITS, Tracking_QC, Labels_QC, VIRS, ctl_track,
					Shipper_QC, VITC, Tape_Wrap_Qc, SubTitle_QC ) 
		VALUES (@newQCNumber, @newSubQCNumber, 1, 
				'11.8', 'No', '25', 'N/A', 'OK', 'N/A', 
				'N/A', 'N/A', 'OK', 'OK', 'N/A', 'OK', 'OK', 'N/A', 
				'OK', 'OK', '19/21', 'OK', 'NONE')
	
	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcElement'
	   GOTO Error
	END
	
	-- ********************Insert QC TapeFormat **********************************************************
	INSERT INTO qcTapeFormat (qcNum, subQCNum, Item_num, Description)
	SELECT @newQCNumber, @newSubQCNumber,1,@tapeLayout1 UNION 
	SELECT @newQCNumber, @newSubQCNumber,2,@tapeLayout2 UNION 
	SELECT @newQCNumber, @newSubQCNumber,3,@tapeLayout3 UNION
	SELECT @newQCNumber, @newSubQCNumber,4,@tapeLayout4 UNION  
	SELECT @newQCNumber, @newSubQCNumber,5,@tapeLayout5 UNION 
	SELECT @newQCNumber, @newSubQCNumber,6,@tapeLayout6 UNION 
	SELECT @newQCNumber, @newSubQCNumber,7,@tapeLayout7 UNION 
	SELECT @newQCNumber, @newSubQCNumber,8,@tapeLayout8 UNION 
	SELECT @newQCNumber, @newSubQCNumber,9,@tapeLayout9
	
	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcTapeFormat'
	   GOTO Error
	END
	
	
	-- ********************Insert QC CTISS **********************************************************
   INSERT INTO qcCTISS (qcNum, subQCNum) VALUES (@newQCNumber, @newSubQCNumber )

	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcCTISS'
	   GOTO Error
	END

	
	-- ********************Insert [bward].[qcEndemolSpecifics] **********************************************************
	IF @qcType = 'E'
	   BEGIN

		   INSERT INTO [bward].[qcEndemolSpecifics] (qcNum, subQCNum) VALUES (@newQCNumber, @newSubQCNumber )

			 IF @@ERROR <> 0
			 BEGIN
			   SET @errorMsg = 'Could not insert into [bward].[qcEndemolSpecifics]'
			   GOTO Error
			END

        END

		
	-- ********************Insert [bward].[qcEndemolVideoAndAudio] **********************************************************
	IF @qcType = 'E'
	   BEGIN

		   INSERT INTO  [bward].[qcEndemolVideoAndAudio](qcNum, subQCNum) VALUES (@newQCNumber, @newSubQCNumber )

			 IF @@ERROR <> 0
			 BEGIN
			   SET @errorMsg = 'Could not insert into [bward].[qcEndemolVideoAndAudio]'
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
	      SET @result = @newQCNumber
	 END
	 
Error:
	
	--If there is any error, then Roll back the Transaction
	IF (@errorMsg IS NOT NULL)
	BEGIN
		ROLLBACK TRAN
		SET @errorMsg = @errorMsg + ' in sp_NewQCReport'
		RAISERROR(@errorMsg, 16, 1)
	END	
	
END

GO

/****** Object:  StoredProcedure [bward].[sp_CopyQCReport]    Script Date: 24/01/2023 15:37:53 ******/
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
        [TypeOfHDR], [CaptionSafe], [EmbeddedCCTrack],BitRate,PSEResult
		 
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
        [TypeOfHDR], [CaptionSafe], [EmbeddedCCTrack],BitRate,PSEResult
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

        --  ***************** TO DO :: Copy New Banijay Rights Template  ******************* ------










		-- ********************************************************************************************


	    IF @@ERROR <> 0
			 BEGIN
			   SET @errorMsg = 'Could not insert into ChecklistBanijayRights'
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


/****** Object:  StoredProcedure [dbo].[sel_GetLookup]    Script Date: 27/01/2023 12:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [bward].[sel_GetLookup]
	-- Add the parameters for the stored procedure here
	@TableName VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DECLARE @str_SQL VARCHAR(5000)

SET  @str_SQL  = 'SELECT Type FROM ' + @TableName + ' -- ORDER BY  Type'

EXEC(@str_SQL)

--print(@str_SQL)

END

GO

USE [QCSUK]
GO
/****** Object:  StoredProcedure [bward].[sp_SelectAudioTC]    Script Date: 02/02/2023 10:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 ALTER PROCEDURE [bward].[sp_SelectAudioTC]
	@_QCNum int,
	@_rev int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT 
		Language, ChannelCount,
		Language1, Language2, Language3, Language4, Language5, Language6, 
		Language7, Language8, Language9, Language10, Language11, Language12, 
		Language13, Language14, Language15, Language16, Language17, Language18, 
		Language19, Language20, Language21, Language22, Language23, Language24,
		ch1_desc, ch1_LKFS, ch1_tone, ch1_avg, ch1_peak, ch1_TruePeak,
		ch2_desc, ch2_LKFS, ch2_tone, ch2_avg, ch2_peak, ch2_TruePeak,
		ch3_desc,  ch3_LKFS, ch3_tone, ch3_avg, ch3_peak, ch3_TruePeak,
		ch4_desc,  ch4_LKFS, ch4_tone, ch4_avg, ch4_peak, ch4_TruePeak,
		ch5_desc,  ch5_LKFS, ch5_tone, ch5_avg, ch5_peak, ch5_TruePeak,
		ch6_desc,  ch6_LKFS, ch6_tone, ch6_avg, ch6_peak, ch6_TruePeak,
		ch7_desc,  ch7_LKFS, ch7_tone, ch7_avg, ch7_peak, ch7_TruePeak,
		ch8_desc,  ch8_LKFS, ch8_tone, ch8_avg, ch8_peak, ch8_TruePeak,
		ch9_desc,  ch9_LKFS, ch9_tone, ch9_avg, ch9_peak, ch9_TruePeak,
		ch10_desc, ch10_LKFS,  ch10_tone, ch10_avg, ch10_peak, ch10_TruePeak,
		ch11_desc, ch11_LKFS,  ch11_tone, ch11_avg, ch11_peak, ch11_TruePeak,
		ch12_desc,  ch12_LKFS, ch12_tone, ch12_avg, ch12_peak, ch12_TruePeak,
		ch13_desc, ch13_LKFS,  ch13_tone, ch13_avg, ch13_peak, ch13_TruePeak,
		ch14_desc, ch14_LKFS,  ch14_tone, ch14_avg, ch14_peak, ch14_TruePeak,
		ch15_desc, ch15_LKFS,  ch15_tone, ch15_avg, ch15_peak, ch15_TruePeak,
		ch16_desc, ch16_LKFS,  ch16_tone, ch16_avg, ch16_peak, ch16_TruePeak,
		ch17_desc, ch17_LKFS,  ch17_tone, ch17_avg, ch17_peak, ch17_TruePeak,
		ch18_desc, ch18_LKFS,  ch18_tone, ch18_avg, ch18_peak, ch18_TruePeak,
		ch19_desc, ch19_LKFS,  ch19_tone, ch19_avg, ch19_peak, ch19_TruePeak,
		ch20_desc, ch20_LKFS,  ch20_tone, ch20_avg, ch20_peak, ch20_TruePeak,
		ch21_desc, ch21_LKFS,  ch21_tone, ch21_avg, ch21_peak, ch21_TruePeak,
		ch22_desc, ch22_LKFS,  ch22_tone, ch22_avg, ch22_peak, ch22_TruePeak,
		ch23_desc, ch23_LKFS,  ch23_tone, ch23_avg, ch23_peak, ch23_TruePeak,
		ch24_desc, ch24_LKFS,  ch24_tone, ch24_avg, ch24_peak, ch24_TruePeak,

		InPhase1, InPhase2, InPhase3, InPhase4, InPhase5, InPhase6, 
		InPhase7, InPhase8, InPhase9, InPhase10, InPhase11, InPhase12, 
		InPhase13, InPhase14, InPhase15, InPhase16, InPhase17, InPhase18, 
		InPhase19, InPhase20, InPhase21, InPhase22, InPhase23, InPhase24,

		Discreate1, Discreate2, Discreate3, Discreate4, Discreate5, Discreate6, 
		Discreate7, Discreate8, Discreate9, Discreate10, Discreate11, Discreate12, 
		Discreate13, Discreate14, Discreate15, Discreate16, Discreate17, Discreate18, 
		Discreate19, Discreate20, Discreate21, Discreate22, Discreate23, Discreate24,
		
		FullQC_Vid, FullQC_cue,
		FullQC_ch1, FullQC_ch2, FullQC_ch3, FullQC_ch4, 
		FullQC_ch5, FullQC_ch6, FullQC_ch7, FullQC_ch8, 
		FullQC_ch9, FullQC_ch10, FullQC_ch11, FullQC_ch12,
		FullQC_ch13,FullQC_ch14, FullQC_ch15, FullQC_ch16,
		FullQC_ch17,FullQC_ch18, FullQC_ch19, FullQC_ch20, 
		FullQC_ch21,FullQC_ch22, FullQC_ch23, FullQC_ch24,
		SpotQC_vid, SpotQC_cue, 
		SpotQC_ch1, SpotQC_ch2, SpotQC_ch3, SpotQC_ch4, 
		SpotQC_ch5, SpotQC_ch6, SpotQC_ch7, SpotQC_ch8,
		SpotQC_ch9, SpotQC_ch10, SpotQC_ch11, SpotQC_ch12,
		SpotQC_ch13,SpotQC_ch14, SpotQC_ch15, SpotQC_ch16,
		SpotQC_ch17,SpotQC_ch18, SpotQC_ch19, SpotQC_ch20, 
		SpotQC_ch21,SpotQC_ch22, SpotQC_ch23, SpotQC_ch24,
		cue_desc, cue_LKFS,  cue_tone, cue_avg, cue_peak, cue_TruePeak,
		NR, time_code, CH12_Phase, CH34_Phase, QCinUnity, LTC_VITC_Match, SurroundSound, 
		TCInteg, Tone_Phase, Comp_Sync, BitRate,

		 TrackContent1, TrackContent2,TrackContent3,TrackContent4,TrackContent5,TrackContent6,
		TrackContent7,TrackContent8,TrackContent9,TrackContent10,TrackContent11,TrackContent12,
		TrackContent13,TrackContent14,TrackContent15,TrackContent16,TrackContent17,TrackContent18,
		TrackContent19,TrackContent20,TrackContent21,TrackContent22,TrackContent23,TrackContent24
	FROM 
		[bward].qcAudioTC a
	JOIN [bward].qcHeader h on a.qcNum = h.Qcnum and a.subQCNum = h.subQcnum
	WHERE 
		a.qcNum = @_QCNum
		AND a.subQCNum = @_rev
	
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not select qcAudioTC (sp_SelectAudioTC)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO

USE [QCSUK]
GO
/****** Object:  StoredProcedure [bward].[sp_UpdateAudioTC]    Script Date: 02/02/2023 10:24:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [bward].[sp_UpdateAudioTC]
	@_QCNum int,
	@_rev int,
	@_language1 VARCHAR(40) = NULL,
	@_language2 VARCHAR(40) = NULL,
	@_language3 VARCHAR(40) = NULL,
	@_language4 VARCHAR(40) = NULL,
	@_language5 VARCHAR(40) = NULL,
	@_language6 VARCHAR(40) = NULL,
	@_language7 VARCHAR(40) = NULL,
	@_language8 VARCHAR(40) = NULL,
	@_language9 VARCHAR(40) = NULL,
	@_language10 VARCHAR(40) = NULL,
	@_language11 VARCHAR(40) = NULL,
	@_language12 VARCHAR(40) = NULL,
	@_language13 VARCHAR(40) = NULL,
	@_language14 VARCHAR(40) = NULL,
	@_language15 VARCHAR(40) = NULL,
	@_language16 VARCHAR(40) = NULL,
	@_language17 VARCHAR(40) = NULL,
	@_language18 VARCHAR(40) = NULL,
	@_language19 VARCHAR(40) = NULL,
	@_language20 VARCHAR(40) = NULL,
	@_language21 VARCHAR(40) = NULL,
	@_language22 VARCHAR(40) = NULL,
	@_language23 VARCHAR(40) = NULL,
	@_language24 VARCHAR(40) = NULL,
	@_chCount VARCHAR(40) = NULL,
	@_ch1_Desc VARCHAR(40) = NULL,
	@_ch2_Desc VARCHAR(40) = NULL,
	@_ch3_Desc VARCHAR(40) = NULL,
	@_ch4_Desc VARCHAR(40) = NULL,
	@_ch5_Desc VARCHAR(40) = NULL,
	@_ch6_Desc VARCHAR(40) = NULL,
	@_ch7_Desc VARCHAR(40) = NULL,
	@_ch8_Desc VARCHAR(40) = NULL,
	@_ch9_Desc VARCHAR(40) = NULL,
	@_ch10_Desc VARCHAR(40) = NULL,
	@_ch11_Desc VARCHAR(40) = NULL,
	@_ch12_Desc VARCHAR(40) = NULL,
	@_ch13_Desc VARCHAR(40) = NULL,
	@_ch14_Desc VARCHAR(40) = NULL,
	@_ch15_Desc VARCHAR(40) = NULL,
	@_ch16_Desc VARCHAR(40) = NULL,
	@_ch17_Desc VARCHAR(40) = NULL,
	@_ch18_Desc VARCHAR(40) = NULL,
	@_ch19_Desc VARCHAR(40) = NULL,
	@_ch20_Desc VARCHAR(40) = NULL,
	@_ch21_Desc VARCHAR(40) = NULL,
	@_ch22_Desc VARCHAR(40) = NULL,
	@_ch23_Desc VARCHAR(40) = NULL,
	@_ch24_Desc VARCHAR(40) = NULL,
	@_cue_Desc VARCHAR(40) = NULL,
	@_ch1_LKFS VARCHAR(100) = NULL,
	@_ch2_LKFS VARCHAR(100) = NULL,
	@_ch3_LKFS VARCHAR(100) = NULL,
	@_ch4_LKFS VARCHAR(100) = NULL,
	@_ch5_LKFS VARCHAR(100) = NULL,
	@_ch6_LKFS VARCHAR(100) = NULL,
	@_ch7_LKFS VARCHAR(100) = NULL,
	@_ch8_LKFS VARCHAR(100) = NULL,
	@_ch9_LKFS VARCHAR(100) = NULL,
	@_ch10_LKFS VARCHAR(100) = NULL,
	@_ch11_LKFS VARCHAR(100) = NULL,
	@_ch12_LKFS VARCHAR(100) = NULL,
	@_ch13_LKFS VARCHAR(100) = NULL,
	@_ch14_LKFS VARCHAR(100) = NULL,
	@_ch15_LKFS VARCHAR(100) = NULL,
	@_ch16_LKFS VARCHAR(100) = NULL,
	@_ch17_LKFS VARCHAR(100) = NULL,
	@_ch18_LKFS VARCHAR(100) = NULL,
	@_ch19_LKFS VARCHAR(100) = NULL,
	@_ch20_LKFS VARCHAR(100) = NULL,
	@_ch21_LKFS VARCHAR(100) = NULL,
	@_ch22_LKFS VARCHAR(100) = NULL,
	@_ch23_LKFS VARCHAR(100) = NULL,
	@_ch24_LKFS VARCHAR(100) = NULL,
	@_cue_LKFS VARCHAR(100) = NULL,
	@_ch1_Tone VARCHAR(15) = NULL,
	@_ch2_Tone VARCHAR(15) = NULL,
	@_ch3_Tone VARCHAR(15) = NULL,
	@_ch4_Tone VARCHAR(15) = NULL,
	@_ch5_Tone VARCHAR(15) = NULL,
	@_ch6_Tone VARCHAR(15) = NULL,
	@_ch7_Tone VARCHAR(15) = NULL,
	@_ch8_Tone VARCHAR(15) = NULL,
	@_ch9_Tone VARCHAR(15) = NULL,
	@_ch10_Tone VARCHAR(15) = NULL,
	@_ch11_Tone VARCHAR(15) = NULL,
	@_ch12_Tone VARCHAR(15) = NULL,
	@_ch13_Tone VARCHAR(15) = NULL,
	@_ch14_Tone VARCHAR(15) = NULL,
	@_ch15_Tone VARCHAR(15) = NULL,
	@_ch16_Tone VARCHAR(15) = NULL,
	@_ch17_Tone VARCHAR(15) = NULL,
	@_ch18_Tone VARCHAR(15) = NULL,
	@_ch19_Tone VARCHAR(15) = NULL,
	@_ch20_Tone VARCHAR(15) = NULL,
	@_ch21_Tone VARCHAR(15) = NULL,
	@_ch22_Tone VARCHAR(15) = NULL,
	@_ch23_Tone VARCHAR(15) = NULL,
	@_ch24_Tone VARCHAR(15) = NULL,
	@_cue_Tone VARCHAR(15) = NULL,
	@_ch1_Avg VARCHAR(15) = NULL,
	@_ch2_Avg VARCHAR(15) = NULL,
	@_ch3_Avg VARCHAR(15) = NULL,
	@_ch4_Avg VARCHAR(15) = NULL,
	@_ch5_Avg VARCHAR(15) = NULL,
	@_ch6_Avg VARCHAR(15) = NULL,
	@_ch7_Avg VARCHAR(15) = NULL,
	@_ch8_Avg VARCHAR(15) = NULL,
	@_ch9_Avg VARCHAR(15) = NULL,
	@_ch10_Avg VARCHAR(15) = NULL,
	@_ch11_Avg VARCHAR(15) = NULL,
	@_ch12_Avg VARCHAR(15) = NULL,
	@_ch13_Avg VARCHAR(15) = NULL,
	@_ch14_Avg VARCHAR(15) = NULL,
	@_ch15_Avg VARCHAR(15) = NULL,
	@_ch16_Avg VARCHAR(15) = NULL,
	@_ch17_Avg VARCHAR(15) = NULL,
	@_ch18_Avg VARCHAR(15) = NULL,
	@_ch19_Avg VARCHAR(15) = NULL,
	@_ch20_Avg VARCHAR(15) = NULL,
	@_ch21_Avg VARCHAR(15) = NULL,
	@_ch22_Avg VARCHAR(15) = NULL,
	@_ch23_Avg VARCHAR(15) = NULL,
	@_ch24_Avg VARCHAR(15) = NULL,
	@_cue_Avg VARCHAR(15) = NULL,
	@_ch1_Peak VARCHAR(15) = NULL,
	@_ch2_Peak VARCHAR(15) = NULL,
	@_ch3_Peak VARCHAR(15) = NULL,
	@_ch4_Peak VARCHAR(15) = NULL,
	@_ch5_Peak VARCHAR(15) = NULL,
	@_ch6_Peak VARCHAR(15) = NULL,
	@_ch7_Peak VARCHAR(15) = NULL,
	@_ch8_Peak VARCHAR(15) = NULL,
	@_ch9_Peak VARCHAR(15) = NULL,
	@_ch10_Peak VARCHAR(15) = NULL,
	@_ch11_Peak VARCHAR(15) = NULL,
	@_ch12_Peak VARCHAR(15) = NULL,
	@_ch13_Peak VARCHAR(15) = NULL,
	@_ch14_Peak VARCHAR(15) = NULL,
	@_ch15_Peak VARCHAR(15) = NULL,
	@_ch16_Peak VARCHAR(15) = NULL,
	@_ch17_Peak VARCHAR(15) = NULL,
	@_ch18_Peak VARCHAR(15) = NULL,
	@_ch19_Peak VARCHAR(15) = NULL,
	@_ch20_Peak VARCHAR(15) = NULL,
	@_ch21_Peak VARCHAR(15) = NULL,
	@_ch22_Peak VARCHAR(15) = NULL,
	@_ch23_Peak VARCHAR(15) = NULL,
	@_ch24_Peak VARCHAR(15) = NULL,
	@_cue_Peak VARCHAR(15) = NULL,
	@_ch1_TruePeak VARCHAR(15) = NULL,
	@_ch2_TruePeak VARCHAR(15) = NULL,
	@_ch3_TruePeak VARCHAR(15) = NULL,
	@_ch4_TruePeak VARCHAR(15) = NULL,
	@_ch5_TruePeak VARCHAR(15) = NULL,
	@_ch6_TruePeak VARCHAR(15) = NULL,
	@_ch7_TruePeak VARCHAR(15) = NULL,
	@_ch8_TruePeak VARCHAR(15) = NULL,
	@_ch9_TruePeak VARCHAR(15) = NULL,
	@_ch10_TruePeak VARCHAR(15) = NULL,
	@_ch11_TruePeak VARCHAR(15) = NULL,
	@_ch12_TruePeak VARCHAR(15) = NULL,
	@_ch13_TruePeak VARCHAR(15) = NULL,
	@_ch14_TruePeak VARCHAR(15) = NULL,
	@_ch15_TruePeak VARCHAR(15) = NULL,
	@_ch16_TruePeak VARCHAR(15) = NULL,
	@_ch17_TruePeak VARCHAR(15) = NULL,
	@_ch18_TruePeak VARCHAR(15) = NULL,
	@_ch19_TruePeak VARCHAR(15) = NULL,
	@_ch20_TruePeak VARCHAR(15) = NULL,
	@_ch21_TruePeak VARCHAR(15) = NULL,
	@_ch22_TruePeak VARCHAR(15) = NULL,
	@_ch23_TruePeak VARCHAR(15) = NULL,
	@_ch24_TruePeak VARCHAR(15) = NULL,
	@_cue_TruePeak VARCHAR(15) = NULL,

	@_ch1_InPhase VARCHAR(3) = NULL,
	@_ch2_InPhase VARCHAR(3) = NULL,
	@_ch3_InPhase VARCHAR(3) = NULL,
	@_ch4_InPhase VARCHAR(3) = NULL,
	@_ch5_InPhase VARCHAR(3) = NULL,
	@_ch6_InPhase VARCHAR(3) = NULL,
	@_ch7_InPhase VARCHAR(3) = NULL,
	@_ch8_InPhase VARCHAR(3) = NULL,
	@_ch9_InPhase VARCHAR(3) = NULL,
	@_ch10_InPhase VARCHAR(3) = NULL,
	@_ch11_InPhase VARCHAR(3) = NULL,
	@_ch12_InPhase VARCHAR(3) = NULL,
	@_ch13_InPhase VARCHAR(3) = NULL,
	@_ch14_InPhase VARCHAR(3) = NULL,
	@_ch15_InPhase VARCHAR(3) = NULL,
	@_ch16_InPhase VARCHAR(3) = NULL,
	@_ch17_InPhase VARCHAR(3) = NULL,
	@_ch18_InPhase VARCHAR(3) = NULL,
	@_ch19_InPhase VARCHAR(3) = NULL,
	@_ch20_InPhase VARCHAR(3) = NULL,
	@_ch21_InPhase VARCHAR(3) = NULL,
	@_ch22_InPhase VARCHAR(3) = NULL,
	@_ch23_InPhase VARCHAR(3) = NULL,
	@_ch24_InPhase VARCHAR(3) = NULL,

	@_ch1_Discreate VARCHAR(3) = NULL,
	@_ch2_Discreate VARCHAR(3) = NULL,
	@_ch3_Discreate VARCHAR(3) = NULL,
	@_ch4_Discreate VARCHAR(3) = NULL,
	@_ch5_Discreate VARCHAR(3) = NULL,
	@_ch6_Discreate VARCHAR(3) = NULL,
	@_ch7_Discreate VARCHAR(3) = NULL,
	@_ch8_Discreate VARCHAR(3) = NULL,
	@_ch9_Discreate VARCHAR(3) = NULL,
	@_ch10_Discreate VARCHAR(3) = NULL,
	@_ch11_Discreate VARCHAR(3) = NULL,
	@_ch12_Discreate VARCHAR(3) = NULL,
	@_ch13_Discreate VARCHAR(3) = NULL,
	@_ch14_Discreate VARCHAR(3) = NULL,
	@_ch15_Discreate VARCHAR(3) = NULL,
	@_ch16_Discreate VARCHAR(3) = NULL,
	@_ch17_Discreate VARCHAR(3) = NULL,
	@_ch18_Discreate VARCHAR(3) = NULL,
	@_ch19_Discreate VARCHAR(3) = NULL,
	@_ch20_Discreate VARCHAR(3) = NULL,
	@_ch21_Discreate VARCHAR(3) = NULL,
	@_ch22_Discreate VARCHAR(3) = NULL,
	@_ch23_Discreate VARCHAR(3) = NULL,
	@_ch24_Discreate VARCHAR(3) = NULL,
	
	@_nr VARCHAR(10) = NULL,
	@_ch12Phase VARCHAR(17) = NULL,
	@_ch34Phase CHAR(10) = NULL,
	@_tonePhase VARCHAR(10) = NULL,
	@_timeCode VARCHAR(15) = NULL,
	@_tcInteg VARCHAR(15) = NULL,
	@_compSync VARCHAR(10) = NULL,
	@_qcInUnity NVARCHAR(3) = NULL,
	@_surroundSound NVARCHAR(3) = NULL,
	@_ltcMatch NVARCHAR(3) = NULL,
	
	@_fullQC_ch1 BIT = 0,
	@_fullQC_ch2 BIT = 0,
	@_fullQC_ch3 BIT = 0,
	@_fullQC_ch4 BIT = 0,
	@_fullQC_ch5 BIT = 0,
	@_fullQC_ch6 BIT = 0,
	@_fullQC_ch7 BIT = 0,
	@_fullQC_ch8 BIT = 0,
	@_fullQC_ch9 BIT = 0,
	@_fullQC_ch10 BIT = 0,
	@_fullQC_ch11 BIT = 0,
	@_fullQC_ch12 BIT = 0,
	@_fullQC_ch13 BIT = 0,
	@_fullQC_ch14 BIT = 0,
	@_fullQC_ch15 BIT = 0,
	@_fullQC_ch16 BIT = 0,
	@_fullQC_ch17 BIT = 0,
	@_fullQC_ch18 BIT = 0,
	@_fullQC_ch19 BIT = 0,
	@_fullQC_ch20 BIT = 0,
	@_fullQC_ch21 BIT = 0,
	@_fullQC_ch22 BIT = 0,
	@_fullQC_ch23 BIT = 0,
	@_fullQC_ch24 BIT = 0,
	@_fullQC_cue BIT = 0,
	@_spotQC_ch1 BIT = 0,
	@_spotQC_ch2 BIT = 0,
	@_spotQC_ch3 BIT = 0,
	@_spotQC_ch4 BIT = 0,
	@_spotQC_ch5 BIT = 0,
	@_spotQC_ch6 BIT = 0,
	@_spotQC_ch7 BIT = 0,
	@_spotQC_ch8 BIT = 0,
	@_spotQC_ch9 BIT = 0,
	@_spotQC_ch10 BIT = 0,
	@_spotQC_ch11 BIT = 0,
	@_spotQC_ch12 BIT = 0,
	@_spotQC_ch13 BIT = 0,
	@_spotQC_ch14 BIT = 0,
	@_spotQC_ch15 BIT = 0,
	@_spotQC_ch16 BIT = 0,
	@_spotQC_ch17 BIT = 0,
	@_spotQC_ch18 BIT = 0,
	@_spotQC_ch19 BIT = 0,
	@_spotQC_ch20 BIT = 0,
	@_spotQC_ch21 BIT = 0,
	@_spotQC_ch22 BIT = 0,
	@_spotQC_ch23 BIT = 0,
	@_spotQC_ch24 BIT = 0,
	@_spotQC_cue BIT = 0,

	-- Banijay Rights new template
	@_ch1_TrackContent VARCHAR(50) = NULL,
	@_ch2_TrackContent VARCHAR(50) = NULL,
	@_ch3_TrackContent VARCHAR(50) = NULL,
	@_ch4_TrackContent VARCHAR(50) = NULL,
	@_ch5_TrackContent VARCHAR(50) = NULL,
	@_ch6_TrackContent VARCHAR(50) = NULL,
	@_ch7_TrackContent VARCHAR(50) = NULL,
	@_ch8_TrackContent VARCHAR(50) = NULL,
	@_ch9_TrackContent VARCHAR(50) = NULL,
	@_ch10_TrackContent VARCHAR(50) = NULL,
	@_ch11_TrackContent VARCHAR(50) = NULL,
	@_ch12_TrackContent VARCHAR(50) = NULL,
	@_ch13_TrackContent VARCHAR(50) = NULL,
	@_ch14_TrackContent VARCHAR(50) = NULL,
	@_ch15_TrackContent VARCHAR(50) = NULL,
	@_ch16_TrackContent VARCHAR(50) = NULL,
	@_ch17_TrackContent VARCHAR(50) = NULL,
	@_ch18_TrackContent VARCHAR(50) = NULL,
	@_ch19_TrackContent VARCHAR(50) = NULL,
	@_ch20_TrackContent VARCHAR(50) = NULL,
	@_ch21_TrackContent VARCHAR(50) = NULL,
	@_ch22_TrackContent VARCHAR(50) = NULL,
	@_ch23_TrackContent VARCHAR(50) = NULL,
	@_ch24_TrackContent VARCHAR(50) = NULL,
	@BitRate VARCHAR(20) = NULL
	
AS
BEGIN

	SET XACT_ABORT ON
	
	DECLARE @ErrorMsg VARCHAR(300)
	
	BEGIN TRAN
	
	UPDATE 
		[bward].qcAudioTC 
	SET 
		Language1 = @_language1,
		Language2 = @_language2,
		Language3 = @_language3,
		Language4 = @_language4,
		Language5 = @_language5,
		Language6 = @_language6,
		Language7 = @_language7,
		Language8 = @_language8,
		Language9 = @_language9,
		Language10 = @_language10,
		Language11 = @_language11,
		Language12 = @_language12,
		Language13 = @_language13,
		Language14 = @_language14,
		Language15 = @_language15,
		Language16 = @_language16,
		Language17 = @_language17,
		Language18 = @_language18,
		Language19 = @_language19,
		Language20 = @_language20,
		Language21 = @_language21,
		Language22 = @_language22,
		Language23 = @_language23,
		Language24 = @_language24,
		ChannelCount = @_chCount,
		Ch1_Desc = @_ch1_Desc,
		Ch2_Desc = @_ch2_Desc,
		Ch3_Desc = @_ch3_Desc,
		Ch4_Desc = @_ch4_Desc,
		Ch5_Desc = @_ch5_Desc,
		Ch6_Desc = @_ch6_Desc,
		Ch7_Desc = @_ch7_Desc,
		Ch8_Desc = @_ch8_Desc,
		Ch9_Desc = @_ch9_Desc,
		Ch10_Desc = @_ch10_Desc,
		Ch11_Desc = @_ch11_Desc,
		Ch12_Desc = @_ch12_Desc,
		Ch13_Desc = @_ch13_Desc,
		Ch14_Desc = @_ch14_Desc,
		Ch15_Desc = @_ch15_Desc,
		Ch16_Desc = @_ch16_Desc,
		Ch17_Desc = @_ch17_Desc,
		Ch18_Desc = @_ch18_Desc,
		Ch19_Desc = @_ch19_Desc,
		Ch20_Desc = @_ch20_Desc,
		Ch21_Desc = @_ch21_Desc,
		Ch22_Desc = @_ch22_Desc,
		Ch23_Desc = @_ch23_Desc,
		Ch24_Desc = @_ch24_Desc,
		Cue_Desc = @_cue_Desc,
		Ch1_LKFS = @_ch1_LKFS,
		Ch2_LKFS = @_ch2_LKFS,
		Ch3_LKFS = @_ch3_LKFS,
		Ch4_LKFS = @_ch4_LKFS,
		Ch5_LKFS = @_ch5_LKFS,
		Ch6_LKFS = @_ch6_LKFS,
		Ch7_LKFS = @_ch7_LKFS,
		Ch8_LKFS = @_ch8_LKFS,
		Ch9_LKFS = @_ch9_LKFS,
		Ch10_LKFS = @_ch10_LKFS,
		Ch11_LKFS = @_ch11_LKFS,
		Ch12_LKFS = @_ch12_LKFS,
		Ch13_LKFS = @_ch13_LKFS,
		Ch14_LKFS = @_ch14_LKFS,
		Ch15_LKFS = @_ch15_LKFS,
		Ch16_LKFS = @_ch16_LKFS,
      	Ch17_LKFS = @_ch17_LKFS,
		Ch18_LKFS = @_ch18_LKFS,
		Ch19_LKFS = @_ch19_LKFS,
		Ch20_LKFS = @_ch20_LKFS,
		Ch21_LKFS = @_ch21_LKFS,
		Ch22_LKFS = @_ch22_LKFS,
		Ch23_LKFS = @_ch23_LKFS,
		Ch24_LKFS = @_ch24_LKFS,
		Cue_LKFS = @_cue_LKFS,
		Ch1_Tone = @_ch1_Tone,
		Ch2_Tone = @_ch2_Tone,
		Ch3_Tone = @_ch3_Tone,
		Ch4_Tone = @_ch4_Tone,
		Ch5_Tone = @_ch5_Tone,
		Ch6_Tone = @_ch6_Tone,
		Ch7_Tone = @_ch7_Tone,
		Ch8_Tone = @_ch8_Tone,
		Ch9_Tone = @_ch9_Tone,
		Ch10_Tone = @_ch10_Tone,
		Ch11_Tone = @_ch11_Tone,
		Ch12_Tone = @_ch12_Tone,
		Ch13_Tone = @_ch13_Tone,
		Ch14_Tone = @_ch14_Tone,
		Ch15_Tone = @_ch15_Tone,
		Ch16_Tone = @_ch16_Tone,
		Ch17_Tone = @_ch17_Tone,
		Ch18_Tone = @_ch18_Tone,
		Ch19_Tone = @_ch19_Tone,
		Ch20_Tone = @_ch20_Tone,
		Ch21_Tone = @_ch21_Tone,
		Ch22_Tone = @_ch22_Tone,
		Ch23_Tone = @_ch23_Tone,
		Ch24_Tone = @_ch24_Tone,
		Cue_Tone = @_cue_Tone,
		Ch1_Avg = @_ch1_Avg,
		Ch2_Avg = @_ch2_Avg,
		Ch3_Avg = @_ch3_Avg,
		Ch4_Avg = @_ch4_Avg,
		Ch5_Avg = @_ch5_Avg,
		Ch6_Avg = @_ch6_Avg,
		Ch7_Avg = @_ch7_Avg,
		Ch8_Avg = @_ch8_Avg,
		Ch9_Avg = @_ch9_Avg,
		Ch10_Avg = @_ch10_Avg,
		Ch11_Avg = @_ch11_Avg,
		Ch12_Avg = @_ch12_Avg,
		Ch13_Avg = @_ch13_Avg,
		Ch14_Avg = @_ch14_Avg,
		Ch15_Avg = @_ch15_Avg,
		Ch16_Avg = @_ch16_Avg,
		Ch17_Avg = @_ch17_Avg,
		Ch18_Avg = @_ch18_Avg,
		Ch19_Avg = @_ch19_Avg,
		Ch20_Avg = @_ch20_Avg,
		Ch21_Avg = @_ch21_Avg,
		Ch22_Avg = @_ch22_Avg,
		Ch23_Avg = @_ch23_Avg,
		Ch24_Avg = @_ch24_Avg,
		Cue_Avg = @_cue_Avg,
		Ch1_Peak = @_ch1_Peak,
		Ch2_Peak = @_ch2_Peak,
		Ch3_Peak = @_ch3_Peak,
		Ch4_Peak = @_ch4_Peak,
		Ch5_Peak = @_ch5_Peak,
		Ch6_Peak = @_ch6_Peak,
		Ch7_Peak = @_ch7_Peak,
		Ch8_Peak = @_ch8_Peak,
		Ch9_Peak = @_ch9_Peak,
		Ch10_Peak = @_ch10_Peak,
		Ch11_Peak = @_ch11_Peak,
		Ch12_Peak = @_ch12_Peak,
		Ch13_Peak = @_ch13_Peak,
		Ch14_Peak = @_ch14_Peak,
		Ch15_Peak = @_ch15_Peak,
		Ch16_Peak = @_ch16_Peak,
		Ch17_Peak = @_ch17_Peak,
		Ch18_Peak = @_ch18_Peak,
		Ch19_Peak = @_ch19_Peak,
		Ch20_Peak = @_ch20_Peak,
		Ch21_Peak = @_ch21_Peak,
		Ch22_Peak = @_ch22_Peak,
		Ch23_Peak = @_ch23_Peak,
		Ch24_Peak = @_ch24_Peak,
		Cue_Peak = @_cue_Peak,
		Ch1_TruePeak = @_ch1_TruePeak,
		Ch2_TruePeak = @_ch2_TruePeak,
		Ch3_TruePeak = @_ch3_TruePeak,
		Ch4_TruePeak = @_ch4_TruePeak,
		Ch5_TruePeak = @_ch5_TruePeak,
		Ch6_TruePeak = @_ch6_TruePeak,
		Ch7_TruePeak = @_ch7_TruePeak,
		Ch8_TruePeak = @_ch8_TruePeak,
		Ch9_TruePeak = @_ch9_TruePeak,
		Ch10_TruePeak = @_ch10_TruePeak,
		Ch11_TruePeak = @_ch11_TruePeak,
		Ch12_TruePeak = @_ch12_TruePeak,
		Ch13_TruePeak = @_ch13_TruePeak,
		Ch14_TruePeak = @_ch14_TruePeak,
		Ch15_TruePeak = @_ch15_TruePeak,
		Ch16_TruePeak = @_ch16_TruePeak,
		Ch17_TruePeak = @_ch17_TruePeak,
		Ch18_TruePeak = @_ch18_TruePeak,
		Ch19_TruePeak = @_ch19_TruePeak,
		Ch20_TruePeak = @_ch20_TruePeak,
		Ch21_TruePeak = @_ch21_TruePeak,
		Ch22_TruePeak = @_ch22_TruePeak,
		Ch23_TruePeak = @_ch23_TruePeak,
		Ch24_TruePeak = @_ch24_TruePeak,

		InPhase1 = @_ch1_InPhase,
		InPhase2 = @_ch2_InPhase,
		InPhase3 = @_ch3_InPhase,
		InPhase4 = @_ch4_InPhase,
		InPhase5 = @_ch5_InPhase,
		InPhase6 = @_ch6_InPhase,
		InPhase7 = @_ch7_InPhase,
		InPhase8 = @_ch8_InPhase,
		InPhase9 = @_ch9_InPhase,
		InPhase10 = @_ch10_InPhase,
		InPhase11 = @_ch11_InPhase,
		InPhase12 = @_ch12_InPhase,
		InPhase13 = @_ch13_InPhase,
		InPhase14 = @_ch14_InPhase,
		InPhase15 = @_ch15_InPhase,
		InPhase16 = @_ch16_InPhase,
		InPhase17 = @_ch17_InPhase,
		InPhase18 = @_ch18_InPhase,
		InPhase19 = @_ch19_InPhase,
		InPhase20 = @_ch20_InPhase,
		InPhase21 = @_ch21_InPhase,
		InPhase22 = @_ch22_InPhase,
		InPhase23 = @_ch23_InPhase,
		InPhase24 = @_ch24_InPhase,

		Discreate1 = @_ch1_Discreate,
		Discreate2 = @_ch2_Discreate,
		Discreate3 = @_ch3_Discreate,
		Discreate4 = @_ch4_Discreate,
		Discreate5 = @_ch5_Discreate,
		Discreate6 = @_ch6_Discreate,
		Discreate7 = @_ch7_Discreate,
		Discreate8 = @_ch8_Discreate,
		Discreate9 = @_ch9_Discreate,
		Discreate10 = @_ch10_Discreate,
		Discreate11 = @_ch11_Discreate,
		Discreate12 = @_ch12_Discreate,
		Discreate13 = @_ch13_Discreate,
		Discreate14 = @_ch14_Discreate,
		Discreate15 = @_ch15_Discreate,
		Discreate16 = @_ch16_Discreate,
		Discreate17 = @_ch17_Discreate,
		Discreate18 = @_ch18_Discreate,
		Discreate19 = @_ch19_Discreate,
		Discreate20 = @_ch20_Discreate,
		Discreate21 = @_ch21_Discreate,
		Discreate22 = @_ch22_Discreate,
		Discreate23 = @_ch23_Discreate,
		Discreate24 = @_ch24_Discreate,

		Cue_TruePeak = @_cue_TruePeak,
		NR = @_nr,
		Ch12_Phase = @_ch12Phase,
		Ch34_Phase = @_ch34Phase,
		Tone_Phase = @_tonePhase,
		Time_Code = @_timeCode,
		TCInteg = @_tcInteg,
		Comp_Sync = @_compSync,
		QCinUnity = @_qcInUnity,
		SurroundSound = @_surroundSound,
		LTC_VITC_Match = @_ltcMatch,
		
		-- Banijay Rights new template
		TrackContent1 = @_ch1_TrackContent,
		TrackContent2 = @_ch2_TrackContent,
		TrackContent3 = @_ch3_TrackContent,
		TrackContent4 = @_ch4_TrackContent,
		TrackContent5 = @_ch5_TrackContent,
		TrackContent6 = @_ch6_TrackContent,
		TrackContent7 = @_ch7_TrackContent,
		TrackContent8 = @_ch8_TrackContent,
		TrackContent9 = @_ch9_TrackContent,
		TrackContent10 = @_ch10_TrackContent,
		TrackContent11 = @_ch11_TrackContent,
		TrackContent12 = @_ch12_TrackContent,
		TrackContent13 = @_ch13_TrackContent,
		TrackContent14 = @_ch14_TrackContent,
		TrackContent15 = @_ch15_TrackContent,
		TrackContent16 = @_ch16_TrackContent,
		TrackContent17 = @_ch17_TrackContent,
		TrackContent18 = @_ch18_TrackContent,
		TrackContent19 = @_ch19_TrackContent,
		TrackContent20 = @_ch20_TrackContent,
		TrackContent21 = @_ch21_TrackContent,
		TrackContent22 = @_ch22_TrackContent,
		TrackContent23 = @_ch23_TrackContent,
		TrackContent24 = @_ch24_TrackContent
		
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
		
	UPDATE 
		[bward].qcHeader 
	SET 
		FullQC_Ch1 = @_fullQC_ch1,
		FullQC_Ch2 = @_fullQC_ch2,
		FullQC_Ch3 = @_fullQC_ch3,
		FullQC_Ch4 = @_fullQC_ch4,
		FullQC_Ch5 = @_fullQC_ch5,
		FullQC_Ch6 = @_fullQC_ch6,
		FullQC_Ch7 = @_fullQC_ch7,
		FullQC_Ch8 = @_fullQC_ch8,
		FullQC_Ch9 = @_fullQC_ch9,
		FullQC_Ch10 = @_fullQC_ch10,
		FullQC_Ch11 = @_fullQC_ch11,
		FullQC_Ch12 = @_fullQC_ch12,
		FullQC_Ch13 = @_fullQC_ch13,
		FullQC_Ch14 = @_fullQC_ch14,
		FullQC_Ch15 = @_fullQC_ch15,
		FullQC_Ch16 = @_fullQC_ch16,
		FullQC_Ch17 = @_fullQC_ch17,
		FullQC_Ch18 = @_fullQC_ch18,
		FullQC_Ch19 = @_fullQC_ch19,
		FullQC_Ch20 = @_fullQC_ch20,
		FullQC_Ch21 = @_fullQC_ch21,
		FullQC_Ch22 = @_fullQC_ch22,
		FullQC_Ch23 = @_fullQC_ch23,
		FullQC_Ch24 = @_fullQC_ch24,
		FullQC_Cue = @_fullQC_cue,
		SpotQC_Ch1 = @_spotQC_ch1,
		SpotQC_Ch2 = @_spotQC_ch2,
		SpotQC_Ch3 = @_spotQC_ch3,
		SpotQC_Ch4 = @_spotQC_ch4,
		SpotQC_Ch5 = @_spotQC_ch5,
		SpotQC_Ch6 = @_spotQC_ch6,
		SpotQC_Ch7 = @_spotQC_ch7,
		SpotQC_Ch8 = @_spotQC_ch8,
		SpotQC_Ch9 = @_spotQC_ch9,
		SpotQC_Ch10 = @_spotQC_ch10,
		SpotQC_Ch11 = @_spotQC_ch11,
		SpotQC_Ch12 = @_spotQC_ch12,
		SpotQC_Ch13 = @_spotQC_ch13,
		SpotQC_Ch14 = @_spotQC_ch14,
		SpotQC_Ch15 = @_spotQC_ch15,
		SpotQC_Ch16 = @_spotQC_ch16,
		SpotQC_Ch17 = @_spotQC_ch17,
		SpotQC_Ch18 = @_spotQC_ch18,
		SpotQC_Ch19 = @_spotQC_ch19,
		SpotQC_Ch20 = @_spotQC_ch20,
		SpotQC_Ch21 = @_spotQC_ch21,
		SpotQC_Ch22 = @_spotQC_ch22,
		SpotQC_Ch23 = @_spotQC_ch23,
		SpotQC_Ch24 = @_spotQC_ch24,
		SpotQC_Cue = @_spotQC_cue,
		BitRate  = @BitRate 
		
		
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
	
	COMMIT TRAN
	
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcAudioTC and qcHeader (sp_UpdateAudioTC)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO

/****** Object:  StoredProcedure [bward].[sp_SelectOverallSpecs]    Script Date: 07/02/2023 10:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
			Timecode, HBlanking, VBlanking, PSEResult 
	FROM 
			[bward].qcHeader
	WHERE 
			Qcnum= @_QCNum AND subQcnum = @_Rev

END

GO

/****** Object:  StoredProcedure [bward].[sp_UpdateOverallSpecs]    Script Date: 07/02/2023 10:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	@_pseresult VARCHAR(10) = NULL
	
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
		PSEResult = @_pseresult
		
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

/****** Object:  Table [bward].[BanijahRightsProgrammeLayout]    Script Date: 07/02/2023 13:08:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[BanijahRightsTapeLayout](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QCNum] [int] NOT NULL,
	[SubQCNum] [int] NOT NULL,
	[Type] [varchar](50) NULL,
	[TimecodeIn] [varchar](11) NULL,
	[TimecodeOut] [varchar](11) NULL,
	[PartDurationExcludingHolds] [varchar](11) NULL,
	[CountAsShow] [varchar](3) NULL,
 CONSTRAINT [PK_BanijahRightsTapeLayout] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijahRightsProgrammeLayout]    Script Date: 08/02/2023 11:17:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[BanijahRightsProgrammeLayout](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QCNum] [int] NOT NULL,
	[SubQCNum] [int] NOT NULL,
	[ProgrammeIn] [varchar](11) NULL,
	[ProgrammeOut] [varchar](11) NULL,
	[TotalLengthIncludingBreaks] [varchar](11) NULL,
	[ProgrammeDuration] [varchar](11) NULL,
	[NumberOfParts] [int] NULL,
	[SlateAccurate] [varchar](3) NULL,
	[NextWeekOrTrailerPresent] [varchar](20) NULL,
 CONSTRAINT [PK_BanijahRightsProgrammeLayout] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  StoredProcedure [bward].[sp_CopyQCReport]    Script Date: 08/02/2023 11:19:08 ******/
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
        [TypeOfHDR], [CaptionSafe], [EmbeddedCCTrack], BitRate, PSEResult
		 
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
        [TypeOfHDR], [CaptionSafe], [EmbeddedCCTrack], BitRate, PSEResult
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

/****** Object:  StoredProcedure [bward].[sel_GetBanijayRightsProgrammeLayout]    Script Date: 09/02/2023 10:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [bward].[sel_GetBanijayRightsProgrammeLayout] 
	-- Add the parameters for the stored procedure here
	@QCNum INT,
	@SubQCNum INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   -- Programme Layout 
   SELECT * FROM [bward].[BanijahRightsProgrammeLayout]
   WHERE [QCNum] =  @QCNum
   AND [SubQCNum]  = @SubQCNum

   --Tape Layout
  SELECT * FROM [bward].[BanijahRightsTapeLayout]
  WHERE [QCNum] =  @QCNum
   AND [SubQCNum]  = @SubQCNum

END

GO

/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateDPPLog]    Script Date: 09/02/2023 10:29:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateBanijayRightsProgrammeLayout]
	-- Add the parameters for the stored procedure here
    @Id INT = 0,
	@QCNum INT,
    @SubQCNum INT,
    @ProgrammeIn VARCHAR(11) = NULL,
	@ProgrammeOut VARCHAR(11) = NULL,
    @TotalLengthIncludingBreaks VARCHAR(11) = NULL,
    @ProgrammeDuration VARCHAR(11) = NULL,
    @NumberOfParts INT = NULL,
    @SlateAccurate VARCHAR(3) = NULL,
    @NextWeekOrTrailerPresent VARCHAR(20) = NULL
	
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
					
	BEGIN TRY
		 
	   IF (SELECT COUNT(*) FROM [bward].[BanijahRightsProgrammeLayout]
	       WHERE [QCNum] =  @QCNum
		   AND [SubQCNum]  = @SubQCNum) = 0
	     BEGIN
	        INSERT INTO [bward].[BanijahRightsProgrammeLayout](
			QCNum,
            SubQCNum,
            [ProgrammeIn],
            [ProgrammeOut],
            [TotalLengthIncludingBreaks],
            [ProgrammeDuration],
            [NumberOfParts],
            [SlateAccurate],
            [NextWeekOrTrailerPresent]
			)
	        SELECT
			@QCNum,
            @subQCNum,
            @ProgrammeIn ,
			@ProgrammeOut,
			@TotalLengthIncludingBreaks,
			@ProgrammeDuration,
			@NumberOfParts,
			@SlateAccurate,
			@NextWeekOrTrailerPresent

	     END
	   ELSE 
	     BEGIN
	     	       
	        UPDATE [bward].[BanijahRightsProgrammeLayout]
			SET 
			ProgrammeIn = @ProgrammeIn ,
			ProgrammeOut = 	@ProgrammeOut,
			TotalLengthIncludingBreaks = @TotalLengthIncludingBreaks,
			ProgrammeDuration = @ProgrammeDuration,
			NumberOfParts =	@NumberOfParts,
			SlateAccurate =	@SlateAccurate,
			NextWeekOrTrailerPresent = @NextWeekOrTrailerPresent
       		WHERE [QCNum] =  @QCNum
            AND [SubQCNum]  = @SubQCNum
	        
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'ins_up_InsertOrUpdateBanijayRightsProgrammeLayout failed: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO

/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateBanijayRightsTapeLayout]    Script Date: 09/02/2023 10:29:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateBanijayRightsTapeLayout]
	-- Add the parameters for the stored procedure here
    @Id INT = 0,
	@QCNum INT,
    @SubQCNum INT,
    @Type VARCHAR(50) = NULL,
    @TimecodeIn VARCHAR(11) = NULL,
	@TimecodeOut VARCHAR(11) = NULL,
	@PartDurationExcludingHolds VARCHAR(11) = NULL,
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



CREATE PROCEDURE [bward].[sel_GetBanijayRightsTapeLayoutById]
	-- Add the parameters for the stored procedure here
   @Id INT
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	 
	BEGIN TRY
	 SELECT * FROM [bward].[BanijahRightsTapeLayout] WHERE Id  = @Id
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get sel_GetBanijayRightsTapeLayoutById details: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO

CREATE PROCEDURE [bward].[del_DeleteBanijayRightsTapeLayoutById]
	-- Add the parameters for the stored procedure here
   @Id INT
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	 
	BEGIN TRY
	 DELETE FROM [bward].[BanijahRightsTapeLayout] WHERE Id  = @Id
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not delete del_DeleteBanijayRightsTapeLayoutById details: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO

/****** Object:  Table [bward].[BanijayRightsTextDetails]    Script Date: 15/02/2023 15:56:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[BanijayRightsTextDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QCNum] [int] NOT NULL,
	[SubQCNum] [int] NOT NULL,
	[TitleBoardInShow] [varchar](30) NULL,
	[TitleBoardAfterProg] [varchar](30) NULL,
	[InAndOutOfPartInShow] [varchar](30) NULL,
	[InAndOutOfPartAfterProg] [varchar](30) NULL,
	[EndCreditsInShow] [varchar](30) NULL,
	[EndCreditsAfterProg] [varchar](30) NULL,
	[AstonsNamestrapsEtcInShow] [varchar](30) NULL,
	[AstonsNamestrapsEtcIAfterProg] [varchar](30) NULL,
	[SubtitlesOrClosedCaptionsInShow] [varchar](30) NULL,
	[SubtitlesOrClosedCaptionsAfterProg] [varchar](30) NULL,
	[IsThereASecondTextedOrTextlessVersionInShow] [varchar](30) NULL,
	[IsThereASecondTextedOrTextlessVersionAfterProg] [varchar](30) NULL,
	[BurntInSubtitlesOrCC] [varchar](10) NULL,
	[Violence] [varchar](10) NULL,
	[Nudity] [varchar](10) NULL,
	[Swearing] [varchar](10) NULL,
	[BleepedOrUnBleeped] [varchar](10) NULL,
	[UnbleepedSplitTrackAvailable] [varchar](10) NULL,
	[SponsorshipOrProductPlacement] [varchar](10) NULL,
 CONSTRAINT [PK_bward.BanijayRightsTextDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateBanijayRightsTextDetails]
	-- Add the parameters for the stored procedure here
    @Id INT = 0,
	@QCNum INT,
    @SubQCNum INT,
    @TitleBoardInShow VARCHAR(30) = NULL,
	@TitleBoardAferProg VARCHAR(30) = NULL,
    @InAndOutOfPartInShow VARCHAR(30) = NULL,
	@InAndOutOfPartAfterProg VARCHAR(30) = NULL,
    @EndCreditsInShow VARCHAR(30) = NULL,
	@EndCreditsAfterProg VARCHAR(30) = NULL,
    @AstonsNamestrapsEtcInShow VARCHAR(30) = NULL,
    @AstonsNamestrapsEtcAfterProg VARCHAR(30) = NULL,
    @SubtitlesOrClosedCaptionsInShow VARCHAR(30) = NULL,
	@SubtitlesOrClosedCaptionsAfterProg VARCHAR(30) = NULL,
    @IsThereASecondTextedOrTextlessVersionInShow VARCHAR(30) = NULL,
    @IsThereASecondTextedOrTextlessVersionAfterProg VARCHAR(30) = NULL,
    @BurntInSubtitlesOrCC VARCHAR(10) = NULL,
    @Violence VARCHAR(10) = NULL,
    @Nudity VARCHAR(10) = NULL,
    @Swearing VARCHAR(10) = NULL,
    @BleepedOrUnBleeped VARCHAR(10) = NULL,
    @UnbleepedSplitTrackAvailable VARCHAR(10) = NULL,
    @SponsorshipOrProductPlacement VARCHAR(10) = NULL
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
					
	BEGIN TRY
		 
	   IF (SELECT COUNT(*) FROM [bward].[BanijayRightsTextDetails]
	       WHERE [QCNum] =  @QCNum
		   AND [SubQCNum]  = @SubQCNum) = 0
	     BEGIN
	        INSERT INTO [bward].[BanijayRightsTextDetails](
			QCNum,
            SubQCNum,
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
			@QCNum,
            @subQCNum,
            @TitleBoardInShow,
			@TitleBoardAferProg,
			@InAndOutOfPartInShow,
			@InAndOutOfPartAfterProg,
			@EndCreditsInShow,
			@EndCreditsAfterProg,
			@AstonsNamestrapsEtcInShow,
			@AstonsNamestrapsEtcAfterProg,
			@SubtitlesOrClosedCaptionsInShow,
			@SubtitlesOrClosedCaptionsAfterProg,
			@IsThereASecondTextedOrTextlessVersionInShow,
			@IsThereASecondTextedOrTextlessVersionAfterProg,
			@BurntInSubtitlesOrCC,
			@Violence,
			@Nudity,
			@Swearing,
			@BleepedOrUnBleeped,
			@UnbleepedSplitTrackAvailable,
			@SponsorshipOrProductPlacement

	     END
	   ELSE 
	     BEGIN
	     	       
	        UPDATE [bward].[BanijayRightsTextDetails]
			SET 
			TitleBoardInShow = @TitleBoardInShow,
			[TitleBoardAfterProg] = @TitleBoardAferProg,
			InAndOutOfPartInShow = @InAndOutOfPartInShow,
			InAndOutOfPartAfterProg = @InAndOutOfPartAfterProg,
			EndCreditsInShow = @EndCreditsInShow,
			EndCreditsAfterProg = @EndCreditsAfterProg,
			AstonsNamestrapsEtcInShow = @AstonsNamestrapsEtcInShow,
			AstonsNamestrapsEtcAfterProg = @AstonsNamestrapsEtcAfterProg,
			SubtitlesOrClosedCaptionsInShow = @SubtitlesOrClosedCaptionsInShow,
			SubtitlesOrClosedCaptionsAfterProg = @SubtitlesOrClosedCaptionsAfterProg,
			IsThereASecondTextedOrTextlessVersionInShow = IsThereASecondTextedOrTextlessVersionInShow,
			IsThereASecondTextedOrTextlessVersionAfterProg = @IsThereASecondTextedOrTextlessVersionAfterProg,
			BurntInSubtitlesOrCC = @BurntInSubtitlesOrCC,
			Violence = @Violence,
			Nudity = @Nudity,
			Swearing = @Swearing,
			BleepedOrUnBleeped = @BleepedOrUnBleeped,
			UnbleepedSplitTrackAvailable = @UnbleepedSplitTrackAvailable,
			SponsorshipOrProductPlacement =  @SponsorshipOrProductPlacement
       		WHERE [QCNum] =  @QCNum
            AND [SubQCNum]  = @SubQCNum
	        
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'ins_up_InsertOrUpdateBanijayRightsProgrammeLayout failed: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [bward].[sel_GetBanijayRightsTextDetails] 
	-- Add the parameters for the stored procedure here
	@QCNum INT,
	@SubQCNum INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
   SELECT * FROM [bward].[BanijayRightsTextDetails]
   WHERE [QCNum] =  @QCNum
   AND [SubQCNum]  = @SubQCNum



END

GO

/****** Object:  StoredProcedure [bward].[sp_CopyQCReport]    Script Date: 18/02/2023 10:48:14 ******/
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
-- Description:	Modified for Banijay Rights ( formally ESI) new template

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
        [TypeOfHDR], [CaptionSafe], [EmbeddedCCTrack], BitRate, PSEResult
		 
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
        [TypeOfHDR], [CaptionSafe], [EmbeddedCCTrack], BitRate, PSEResult
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


