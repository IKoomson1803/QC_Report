USE [QCSUK]
GO

/****** Object:  Table [bward].[ChecklistBanijayRights]    Script Date: 31/10/2022 12:22:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[ChecklistBanijayRights](
	[ChecklistId] [int] IDENTITY(1,1) NOT NULL,
	[Qcnum] [int] NOT NULL,
	[subQcnum] [int] NOT NULL,
	[CustId] [int] NOT NULL,
	[ChecklistCompleted] [bit] NOT NULL,
	[IsFile] [bit] NULL,
	[FileToSpec] [bit] NULL,
	[DecodeCheckPass] [bit] NULL,
	[Format] [varchar](50) NULL,
	[Standard] [varchar](50) NULL,
	[FrameRate] [varchar](50) NULL,
	[VideoBitRate] [varchar](50) NULL,
	[FrameSizeOrResolution] [varchar](20) NULL,
	[AspectRatio] [varchar](20) NULL,
	[BitDepth] [varchar](50) NULL,
	[AudioBitRate] [varchar](50) NULL,
	[SampleRate] [varchar](50) NULL,
	[Discrete] [varchar](3) NULL,
	[IsTheFileMetadataCorrect] [varchar](3) NULL,
	[InterlacedOrProgressiveCorrectlyFlagged] [varchar](3) NULL,
	[InterlacedOrProgressiveCorrectlyNotFlaggedReason] [varchar](50) NULL,
	[CLAPPresent] [varchar](3) NULL,
	[ColourPrimariesPresent] [varchar](50) NULL,
	[TransferCharacteristicsPresent] [varchar](50) NULL,
	[MatrixCoefficientsPresent] [varchar](50) NULL,
	[DisplayAspectRatioCorrect] [varchar](50) NULL,
	[InterlacedVsProgressiveCheckedAndCorrect] [varchar](50) NULL,
	[DoesTheFileContainLineup] [varchar](3) NULL,
	[DoesTheProgrammeStartOnTheHour] [varchar](3) NULL,
	[IsTheProgrammeSeamlessOrParted] [varchar](10) NULL,
	[PartedBreaksLogged] [varchar](3) NULL,
	[IfPartedSpecifyIfOneSecondBlackBetweenParts] [varchar](3) NULL,
	[BumpersPresentAndLogged] [varchar](3) NULL,
	[InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments] [varchar](3) NULL,
	[DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram] [varchar](3) NULL,
	[AreTextlessElementsPresent] [varchar](3) NULL,
	[AreThereTextlessCoversForAllTextedShots] [varchar](3) NULL,
	[AreTheTextlessCoversTheSameTimingAsTextedShots] [varchar](3) NULL,
	[IsTheGradeAndAspectRatioTheSameAsTextedShots] [varchar](3) NULL,
	[IsThere10SecondsOfBlackBetweenProgrammeAndTextless] [varchar](3) NULL,
	[IsThere10SecondsOfBlackBeforeEndOfFile] [varchar](3) NULL,
	[IsAudioLlayoutCorrect] [bit] NULL,
	[IsLineupToneCorrect] [bit] NULL,
	[IsLoudnessR128APass] [bit] NULL,
	[IsMAndEPresentAndComplete] [varchar](3)NULL,
	[IsMixMinusNarrationPresentAndComplete] [varchar](3) NULL,
	[MonoVsStereoChecked] [bit] NULL,
	[AudioInSync] [bit] NULL,
	[WAVSSupplied] [bit] NULL,
	[AllAssociatedWAVSPresent] [varchar](3) NULL,
	[VideoComplianceCheckedAndLogged] [bit] NULL,
	[FlashingLightsOrEpilepsyWarningPresent] [bit] NULL,
	[VideoContentCensoredBleepedOrBlurred] [varchar](10) NULL,
	[NudityPresent] [bit] NULL,
	[TimeSpecificTextPresent] [bit] NULL,
	[ProductPlacementPresent] [bit] NULL,
	[CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags] [bit] NULL,
	[AudioComplianceCheckedAndLogged] [bit] NULL,
	[AudioContentCensoredBleepedOrBlurred] [varchar](10) NULL,
	[ExtremeLanguagePresent] [bit] NULL,
	[TimeSpecificAudioPresent] [bit] NULL,
	[SlatePresent] [varchar](3) NULL,
	[SlateInformationCorrect] [varchar](3) NULL,
	[AllAssociatedWAVSNotPresentReason] [varchar](50) NULL,
	[ConfirmVideoFormat] [varchar](50) NULL,
	[VideoCodec] [varchar](100) NULL,
	[AudioCodec] [varchar](100) NULL,
	[AllEndLogos] [varchar](3) NULL,
	[RudeGestures] [bit] NULL,
	[HarmOrOffencePresentIncludingDrugAndAlcholAbuse] [bit] NULL,
 CONSTRAINT [PK_ChecklistBanijayRights] PRIMARY KEY CLUSTERED 
(
	[ChecklistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  StoredProcedure [bward].[sel_GetChecklistBanijayRights]    Script Date: 01/08/2022 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [bward].[sel_GetChecklistBanijayRights] 
	-- Add the parameters for the stored procedure here
	@Qcnum INT,
    @subQcnum INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ck.*,cl.CustName FROM [bward].[ChecklistBanijayRights] ck
	INNER JOIN [bward].[qcClients] cl
	ON ck.CustId = cl.CustID
	WHERE  [QCNum]  = @Qcnum
	AND [subQCNum] = @subQcnum
END

GO

/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateChecklistBanijayRights]    Script Date: 02/11/2022 12:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateChecklistBanijayRights]
(
    @IsMeasurements BIT, 
    @ChecklistId INT = 0,
	@Qcnum INT,
	@subQcnum INT,
	@CustId INT,
	@ChecklistCompleted bit,
	@IsFile BIT = NULL,

	/********* Measurements******************************/
	-- File Details
	@FileToSpec BIT = NULL,
	@DecodeCheckPass BIT = NULL,
	@ConfirmVideoFormat VARCHAR(50) = NULL,
	--Video Codec
	@VideoCodec VARCHAR(100) = NULL,
	@Format VARCHAR(50) = NULL,
	@Standard VARCHAR(50) = NULL,
	@FrameRate VARCHAR(50) = NULL,
	@VideoBitRate VARCHAR(50) = NULL,
	@FrameSizeOrResolution VARCHAR(20) = NULL,
	@AspectRatio VARCHAR(20) = NULL,
	-- Audio Codec
	@AudioCodec VARCHAR(100) = NULL,
	@BitDepth VARCHAR(50) = NULL,
	@AudioBitRate VARCHAR(50) = NULL,
	@SampleRate VARCHAR(50) = NULL,
	@Discrete VARCHAR(3) = NULL,
	-- Metadata
	@IsTheFileMetadataCorrect VARCHAR(3) = NULL,
	@InterlacedOrProgressiveCorrectlyFlagged VARCHAR(3) = NULL,
	@InterlacedOrProgressiveCorrectlyNotFlaggedReason VARCHAR(50) = NULL,
	@CLAPPresent VARCHAR(3) = NULL,
	@ColourPrimariesPresent VARCHAR(50) = NULL,
	@TransferCharacteristicsPresent VARCHAR(50) = NULL,
	@MatrixCoefficientsPresent VARCHAR(50) = NULL,

	/*********** Specifics********************************************/
	-- Video
	@DisplayAspectRatioCorrect VARCHAR(50) = NULL,
	@InterlacedVsProgressiveCheckedAndCorrect VARCHAR(50) = NULL,
	@DoesTheFileContainLineup VARCHAR(3) = NULL,
	@SlatePresent VARCHAR(3) = NULL,
	@SlateInformationCorrect VARCHAR(3) = NULL,
	@DoesTheProgrammeStartOnTheHour VARCHAR(3) = NULL,
	@IsTheProgrammeSeamlessOrParted VARCHAR(10) = NULL,
	@PartedBreaksLogged VARCHAR(3) = NULL, 
	@IfPartedSpecifyIfOneSecondBlackBetweenParts VARCHAR(3) = NULL,
	@BumpersPresentAndLogged VARCHAR(3) = NULL,
	@InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments VARCHAR(3) = NULL,
	@DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram VARCHAR(3) = NULL,
	@AllEndLogos VARCHAR(3) = NULL,
	--Textless
	@AreTextlessElementsPresent VARCHAR(3) = NULL,
	@AreThereTextlessCoversForAllTextedShots VARCHAR(3) = NULL,
	@AreTheTextlessCoversTheSameTimingAsTextedShots VARCHAR(3) = NULL,
	@IsTheGradeAndAspectRatioTheSameAsTextedShots VARCHAR(3) = NULL,
	@IsThere10SecondsOfBlackBetweenProgrammeAndTextless VARCHAR(3) = NULL,
	@IsThere10SecondsOfBlackBeforeEndOfFile VARCHAR(3) = NULL,
	-- Audio
	@IsAudioLlayoutCorrect BIT = NULL,
	@IsLineupToneCorrect BIT = NULL,
	@IsLoudnessR128APass BIT = NULL,
	@IsMAndEPresentAndComplete VARCHAR(3) = NULL,
	@IsMixMinusNarrationPresentAndComplete VARCHAR(3) = NULL,
	@MonoVsStereoChecked BIT = NULL,
	@AudioInSync BIT = NULL,
	-- WAV
	@WAVSSupplied BIT = NULL,
	@AllAssociatedWAVSPresent VARCHAR(3) = NULL,
	@AllAssociatedWAVSNotPresentReason VARCHAR(50) = NULL,
	-- Video Compliance
	@VideoComplianceCheckedAndLogged BIT = NULL,
	@FlashingLightsOrEpilepsyWarningPresent BIT = NULL,
	@VideoContentCensoredBleepedOrBlurred VARCHAR(10) = NULL,
	@NudityPresent BIT = NULL,
	@RudeGestures BIT = NULL,
	@HarmOrOffencePresentIncludingDrugAndAlcholAbuse BIT = NULL,
	@TimeSpecificTextPresent BIT = NULL,
	@ProductPlacementPresent BIT = NULL,
	@CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags BIT = NULL,
	-- Audio Compliance
	@AudioComplianceCheckedAndLogged BIT = NULL,
	@AudioContentCensoredBleepedOrBlurred VARCHAR(10) = NULL,
	@ExtremeLanguagePresent BIT = NULL,
	@TimeSpecificAudioPresent BIT = NULL
)
AS
BEGIN


DECLARE @ErrorMsg VARCHAR(2000)

SELECT @ChecklistId = [ChecklistId] from [bward].[ChecklistBanijayRights] WHERE [QCNum] = @Qcnum AND [subQCNum] =  @subQcnum


BEGIN TRY
    IF @ChecklistId IS NULL OR @ChecklistId = 0
	 BEGIN

			 INSERT INTO [bward].[ChecklistBanijayRights](
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
				[BitDepth],
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
				SlatePresent,
	            SlateInformationCorrect,
				[DoesTheProgrammeStartOnTheHour],
				[IsTheProgrammeSeamlessOrParted],
				[PartedBreaksLogged],
				[IfPartedSpecifyIfOneSecondBlackBetweenParts],
				[BumpersPresentAndLogged],
				[InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments],
				[DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram],
				AllEndLogos,
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
			    RudeGestures,
	            HarmOrOffencePresentIncludingDrugAndAlcholAbuse,
				[TimeSpecificTextPresent],
				[ProductPlacementPresent],
				[CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags],
				[AudioComplianceCheckedAndLogged],
				[AudioContentCensoredBleepedOrBlurred],
				[ExtremeLanguagePresent],
				[TimeSpecificAudioPresent]) 
             SELECT
			   @Qcnum,
				@subQcnum,
				@CustId,
				@ChecklistCompleted,
				@IsFile,
				@FileToSpec,
				@DecodeCheckPass,
				@ConfirmVideoFormat,
				@VideoCodec,
				@Format,
				@Standard,
				@FrameRate,
				@VideoBitRate,
				@FrameSizeOrResolution,
				@AspectRatio,
				@AudioCodec,
				@BitDepth,
				@AudioBitRate,
				@SampleRate,
				@Discrete,
				@IsTheFileMetadataCorrect,
				@InterlacedOrProgressiveCorrectlyFlagged,
				@InterlacedOrProgressiveCorrectlyNotFlaggedReason,
				@CLAPPresent,
				@ColourPrimariesPresent,
				@TransferCharacteristicsPresent,
				@MatrixCoefficientsPresent,
				@DisplayAspectRatioCorrect,
				@InterlacedVsProgressiveCheckedAndCorrect,
				@DoesTheFileContainLineup,
				@SlatePresent,
	            @SlateInformationCorrect,
				@DoesTheProgrammeStartOnTheHour,
				@IsTheProgrammeSeamlessOrParted,
				@PartedBreaksLogged,
				@IfPartedSpecifyIfOneSecondBlackBetweenParts,
				@BumpersPresentAndLogged,
				@InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments,
				@DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram,
				@AllEndLogos,
				@AreTextlessElementsPresent,
				@AreThereTextlessCoversForAllTextedShots,
				@AreTheTextlessCoversTheSameTimingAsTextedShots,
				@IsTheGradeAndAspectRatioTheSameAsTextedShots,
				@IsThere10SecondsOfBlackBetweenProgrammeAndTextless,
				@IsThere10SecondsOfBlackBeforeEndOfFile,
				@IsAudioLlayoutCorrect,
				@IsLineupToneCorrect,
				@IsLoudnessR128APass,
				@IsMAndEPresentAndComplete,
				@IsMixMinusNarrationPresentAndComplete,
				@MonoVsStereoChecked,
				@AudioInSync,
				@WAVSSupplied,
				@AllAssociatedWAVSPresent,
				@AllAssociatedWAVSNotPresentReason,
				@VideoComplianceCheckedAndLogged,
				@FlashingLightsOrEpilepsyWarningPresent,
				@VideoContentCensoredBleepedOrBlurred,
				@NudityPresent,
				@RudeGestures,
	            @HarmOrOffencePresentIncludingDrugAndAlcholAbuse,
				@TimeSpecificTextPresent,
				@ProductPlacementPresent,
				@CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags,
				@AudioComplianceCheckedAndLogged,
				@AudioContentCensoredBleepedOrBlurred,
				@ExtremeLanguagePresent,
				@TimeSpecificAudioPresent
		 END
			   ELSE 
				 BEGIN
		   --        UPDATE [bward].[ChecklistBanijayRights] 
				 --   SET
					--[ChecklistCompleted] = @ChecklistCompleted,
					--[IsFile] = @IsFile,

					IF @IsMeasurements = 1
					  BEGIN  /*************** MEASUREMENTS  ********************************************/
					    UPDATE [bward].[ChecklistBanijayRights] 
						SET
	   					[FileToSpec] = @FileToSpec,
						[DecodeCheckPass] = @DecodeCheckPass,
						[ConfirmVideoFormat] = @ConfirmVideoFormat,
						[VideoCodec] = @VideoCodec,
						[Format] = @Format,
						[Standard] = @Standard,
						[FrameRate] = @FrameRate,
						[VideoBitRate] = @VideoBitRate,
						[FrameSizeOrResolution] = @FrameSizeOrResolution,
						[AspectRatio] = @AspectRatio,
						[AudioCodec] = @AudioCodec,
						[BitDepth] = @BitDepth,
						[AudioBitRate] = @AudioBitRate,
						[SampleRate] = @SampleRate,
						[Discrete] = @Discrete,
						[IsTheFileMetadataCorrect] = @IsTheFileMetadataCorrect,
						[InterlacedOrProgressiveCorrectlyFlagged] = @InterlacedOrProgressiveCorrectlyFlagged,
						[InterlacedOrProgressiveCorrectlyNotFlaggedReason] = @InterlacedOrProgressiveCorrectlyNotFlaggedReason,
						[CLAPPresent] = @CLAPPresent,
						[ColourPrimariesPresent] = @ColourPrimariesPresent,
						[TransferCharacteristicsPresent] = @TransferCharacteristicsPresent,
						[MatrixCoefficientsPresent] = @MatrixCoefficientsPresent
						WHERE [QCNum] = @QCNum
				        AND [subQCNum] = @subQCNum
					  END
                    ELSE
					  BEGIN  /*********** SPECIFICS *****************************************************/
					    UPDATE [bward].[ChecklistBanijayRights] 
						SET
						[DisplayAspectRatioCorrect] = @DisplayAspectRatioCorrect,
						[InterlacedVsProgressiveCheckedAndCorrect] = @InterlacedVsProgressiveCheckedAndCorrect,
						[DoesTheFileContainLineup] = @DoesTheFileContainLineup,
						SlatePresent = @SlatePresent,
	                    SlateInformationCorrect =  @SlateInformationCorrect,
						[DoesTheProgrammeStartOnTheHour] = @DoesTheProgrammeStartOnTheHour,
						[IsTheProgrammeSeamlessOrParted] = @IsTheProgrammeSeamlessOrParted,
						[PartedBreaksLogged] = @PartedBreaksLogged,
						[IfPartedSpecifyIfOneSecondBlackBetweenParts] = @IfPartedSpecifyIfOneSecondBlackBetweenParts,
						[BumpersPresentAndLogged] = @BumpersPresentAndLogged,
						[InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments] = @InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments,
						[DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram] = @DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram,
						AllEndLogos = @AllEndLogos,
						[AreTextlessElementsPresent] = @AreTextlessElementsPresent,
						[AreThereTextlessCoversForAllTextedShots] = @AreThereTextlessCoversForAllTextedShots,
						[AreTheTextlessCoversTheSameTimingAsTextedShots] = @AreTheTextlessCoversTheSameTimingAsTextedShots,
						[IsTheGradeAndAspectRatioTheSameAsTextedShots] = @IsTheGradeAndAspectRatioTheSameAsTextedShots,
						[IsThere10SecondsOfBlackBetweenProgrammeAndTextless] = @IsThere10SecondsOfBlackBetweenProgrammeAndTextless,
						[IsThere10SecondsOfBlackBeforeEndOfFile] = @IsThere10SecondsOfBlackBeforeEndOfFile,
						[IsAudioLlayoutCorrect] = @IsAudioLlayoutCorrect,
						[IsLineupToneCorrect] = @IsLineupToneCorrect,
						[IsLoudnessR128APass] = @IsLoudnessR128APass,
						[IsMAndEPresentAndComplete] = @IsMAndEPresentAndComplete,
						[IsMixMinusNarrationPresentAndComplete] = @IsMixMinusNarrationPresentAndComplete,
						[MonoVsStereoChecked] = @MonoVsStereoChecked,
						[AudioInSync] = @AudioInSync,
						[WAVSSupplied] = @WAVSSupplied,
						[AllAssociatedWAVSPresent] = @AllAssociatedWAVSPresent,
						[AllAssociatedWAVSNotPresentReason] = @AllAssociatedWAVSNotPresentReason,
						[VideoComplianceCheckedAndLogged] = @VideoComplianceCheckedAndLogged,
						[FlashingLightsOrEpilepsyWarningPresent] = @FlashingLightsOrEpilepsyWarningPresent,
						[VideoContentCensoredBleepedOrBlurred] = @VideoContentCensoredBleepedOrBlurred,
						[NudityPresent] = @NudityPresent,
						RudeGestures  = @RudeGestures,
	                    HarmOrOffencePresentIncludingDrugAndAlcholAbuse = @HarmOrOffencePresentIncludingDrugAndAlcholAbuse,
						[TimeSpecificTextPresent] = @TimeSpecificTextPresent,
						[ProductPlacementPresent] = @ProductPlacementPresent,
						[CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags] = @CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags,
						[AudioComplianceCheckedAndLogged] = @AudioComplianceCheckedAndLogged,
						[AudioContentCensoredBleepedOrBlurred] = @AudioContentCensoredBleepedOrBlurred,
						[ExtremeLanguagePresent] = @ExtremeLanguagePresent,
						[TimeSpecificAudioPresent] = @TimeSpecificAudioPresent 
      					WHERE [QCNum] = @QCNum
						AND [subQCNum] = @subQCNum 
				 END
		 END 
	 
    END TRY
    BEGIN CATCH
       SET @errorMsg = 'Could not insert or update ChecklistBanijayRights tables: ' + ERROR_MESSAGE()
       RAISERROR(@errorMsg, 16, 1)
    END CATCH		 		

END


GO


/****** Object:  Table [bward].[StatusHistory]    Script Date: 07/10/2022 12:17:44 ******/

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[StatusHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QCNum] [int] NOT NULL,
	[SubQCNum] [int] NOT NULL,
	[Status] [varchar](40) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_StatusHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [bward].[StatusHistory] ADD  CONSTRAINT [DF_StatusHistory_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO

/****** Object:  StoredProcedure [bward].[sp_UpdateFinal]    Script Date: 07/10/2022 12:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [bward].[sp_UpdateFinal]
	@_QCNum int,
	@_Rev int,
	@_evalStatus VARCHAR(40) = NULL,
	@_oComments TEXT = NULL,
	@_aComments TEXT = NULL,
	@_vComments TEXT = NULL,
		
	@_otp NVARCHAR(30) = NULL,
	@_otv NVARCHAR(30) = NULL,
	@_ctp NVARCHAR(30) = NULL,
	@_ctv NVARCHAR(30) = NULL,
	@_capp NVARCHAR(30) = NULL,
	@_capv NVARCHAR(30) = NULL,
	
	@_gOverall INT = NULL,
	@_gAudio INT = NULL,
	@_gVideo INT = NULL,
	
	@_bcSuit VARCHAR(1) = NULL,
	@_bcSuitReason VARCHAR(2000) = NULL,
	@_dvdSuit VARCHAR(1) = NULL,
	@_dvdSuitReason VARCHAR(2000) = NULL,
	@_vodSuit VARCHAR(1) = NULL,
	@_vodSuitReason VARCHAR(2000) = NULL
	
AS
BEGIN
		DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcHeader 
	SET 
		Eval_Stat = @_evalStatus,
		Comments = @_oComments,
		RecommendationComments = @_aComments,
		VideoComments = @_vComments,
		OTPercent = @_otp,
		OTVer = @_otv,
		CTPercent = @_ctp,
		CTVer = @_ctv,
		CapPercent = @_capp,
		CapVer = @_capv,
		grdVideo = @_gVideo,
		grdAudio = @_gAudio,
		grdOverall = @_gOverall,
		Broadcast_Suitable = @_bcSuit,
		Broadcast_Suitable_Reason = @_bcSuitReason,
		DVD_Blu_Ray_Suitable = @_dvdSuit,
		DVD_Blu_Ray_Suitable_Reason = @_dvdSuitReason,
		VOD_Suitable = @_vodSuit,
		VOD_Suitable_Reason = @_vodSuitReason
		
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev

	/**********Insert into Ststus Historr table ***************************************************/

	IF @_evalStatus IS NOT NULL
	 BEGIN
	      IF (SELECT COUNT(*) FROM [bward].[StatusHistory] WHERE [Status] = @_evalStatus AND QCNum = @_QCNum AND  SubQCNum = @_rev  ) = 0
				 BEGIN 	 
					 INSERT INTO [bward].[StatusHistory]([QCNum], [SubQCNum], [Status])
					 SELECT @_QCNum, @_rev, @_evalStatus
				     WHERE NOT EXISTS (SELECT NULL FROM [bward].[StatusHistory] WHERE [Status] = @_evalStatus)
				 END
          ELSE
		    BEGIN
			   UPDATE [bward].[StatusHistory]
			   SET DateAdded = CURRENT_TIMESTAMP
			   WHERE [Status] = @_evalStatus AND QCNum = @_QCNum AND  SubQCNum = @_rev
			END
	       
	 END
		
		

	
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcHeader (sp_UpdateFinal)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO

/****** Object:  StoredProcedure [bward].[up_UpdateESIFinal]    Script Date: 07/10/2022 13:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[up_UpdateESIFinal]
   @Qcnum INT,
   @subQcnum INT,
   @Status VARCHAR(40)=NULL, 
   @Comments VARCHAR(MAX) = NULL,
   @LuminanceLevelsRating VARCHAR(6) = NULL,
   @LuminanceLevelsDetails VARCHAR(255) = NULL,
   @BlackLevelsRating VARCHAR(6) = NULL,
   @BlackLevelsDetails VARCHAR(255) = NULL,
   @ChrominanceLevelsRating VARCHAR(6) = NULL,
   @ChrominanceLevelsDetails VARCHAR(255) = NULL,
   @AudioPeaksAndLoudnessRating VARCHAR(6) = NULL,
   @AudioPeaksAndLoudnessDetails VARCHAR(255) = NULL,
   @TitleSafeRating VARCHAR(6) = NULL,
   @TitleSafeDetails VARCHAR(255) = NULL,
   @QCResult VARCHAR(6) = NULL
AS
BEGIN
		DECLARE @ErrorMsg VARCHAR(300)
		

		IF @Status IS NOT NULL
		 BEGIN
		      IF @Status = 'PASSED'
			    BEGIN
				  SET @QCResult = 'PASS'
				END
              ELSE IF @Status = 'FAILED'
			    BEGIN
				  SET @QCResult = 'FAIL'
				END
              ELSE  IF @Status = 'HOLD'
			    BEGIN
				  SET @QCResult = 'HOLD'
				END
		 END
	
	UPDATE 
		[bward].[qcHeader]
	SET 
	   [Eval_Stat] = @Status, 
       [Comments]  = @Comments
	WHERE 
		[QCNum] = @Qcnum AND
	    [SubQCNum] =  @subQcnum

    UPDATE 
		[bward].[qcEndemolVideoAndAudio]
	SET 
	   LuminanceLevelsRating = @LuminanceLevelsRating,
	   LuminanceLevelsDetails = @LuminanceLevelsDetails,
	   BlackLevelsRating = @BlackLevelsRating,
	   BlackLevelsDetails =  @BlackLevelsDetails,
	   ChrominanceLevelsRating = @ChrominanceLevelsRating,
	   ChrominanceLevelsDetails = @ChrominanceLevelsDetails,
	   AudioPeaksAndLoudnessRating = @AudioPeaksAndLoudnessRating,
	   AudioPeaksAndLoudnessDetails = @AudioPeaksAndLoudnessDetails,
	   TitleSafeRating = @TitleSafeRating,
	   TitleSafeDetails = @TitleSafeDetails,
	   QCResult =  @QCResult,
	   QCResultDate = CURRENT_tIMESTAMP
	WHERE 
		[QCNum] = @Qcnum AND
	    [SubQCNum] =  @subQcnum

  	/**********Insert into Status History table ***************************************************/

	IF @Status IS NOT NULL
	 BEGIN
	      IF (SELECT COUNT(*) FROM [bward].[StatusHistory] WHERE [Status] = @Status AND QCNum = @Qcnum AND  SubQCNum = @subQcnum) = 0
				 BEGIN 	 
					 INSERT INTO [bward].[StatusHistory]([QCNum], [SubQCNum], [Status])
					 SELECT @Qcnum, @subQcnum, @Status
				     WHERE NOT EXISTS (SELECT NULL FROM [bward].[StatusHistory] WHERE [Status] = @Status)
				 END
          ELSE
		    BEGIN
			   UPDATE [bward].[StatusHistory]
			   SET DateAdded = CURRENT_TIMESTAMP
			   WHERE [Status] = @Status AND QCNum = @Qcnum AND  SubQCNum = @subQcnum
			END
	       
	 END
	
  IF @@ERROR <> 0
	 BEGIN
		SET @errorMsg = 'Could not update up_UpdateESIFinal'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO

/****** Object:  StoredProcedure [bward].[sel_Search]    Script Date: 10/10/2022 13:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[sel_Search]
	-- Add the parameters for the stored procedure here  VARCHAR(50),
	    @WorkOrderNumber VARCHAR(10) = NULL,
        @TapeNumber  VARCHAR(50) = NULL,
		@QCUser VARCHAR(50) = NULL,
		@QCUser2 VARCHAR(50) = NULL,
		@RevisedBy VARCHAR(50) = NULL,
		@RevisedBy2 VARCHAR(50) = NULL,
		@ClientName VARCHAR(50) = NULL,
        @Title  VARCHAR(50) = NULL,
        @EpisodeName  VARCHAR(50) = NULL,
        @EpisodeNumber  VARCHAR(50) = NULL,
		@Filename  VARCHAR(255) = NULL,
        @Statuses  VARCHAR(255) = NULL,
        @FromDate DATETIME = NULL,
        @ToDate  DATETIME = NULL,

        @AudioGrade1  INT = NULL,
        @AudioGrade2  INT = NULL,
        @AudioGrade3  INT = NULL,
        @AudioGrade4  INT = NULL,
        @AudioGrade5  INT = NULL,

        @VideoGrade1  INT = NULL,
        @VideoGrade2  INT = NULL,
        @VideoGrade3  INT = NULL,
        @VideoGrade4  INT = NULL,
        @VideoGrade5  INT = NULL,

        @OverallGrade1  INT = NULL,
        @OverallGrade2  INT = NULL,
        @OverallGrade3  INT = NULL,
        @OverallGrade4  INT = NULL,
        @OverallGrade5  INT = NULL

		
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	DECLARE  @QCUserId INT 
	DECLARE  @QCUserId2 INT
	DECLARE  @ClientId  INT

	IF @QCUser IS NOT NULL
	  BEGIN
	    SELECT TOP 1  @QCUserId = [qcUserID] FROM [bward].[qcUsers] WHERE LTRIM(RTRIM([FullName])) = LTRIM(RTRIM(@QCUser))
	  END
 
 IF @QCUser2 IS NOT NULL
	  BEGIN
	    SELECT TOP 1  @QCUserId2 = [qcUserID] FROM [bward].[qcUsers] WHERE LTRIM(RTRIM([FullName])) = LTRIM(RTRIM(@QCUser2))
	  END


   IF @ClientName IS NOT NULL
	  BEGIN
	    SELECT  TOP 1 @ClientId = [CustID] FROM [bward].[qcClients]  WHERE LTRIM(RTRIM([CustName])) = LTRIM(RTRIM(@ClientName))
	  END


	 
	BEGIN TRY
	             IF OBJECT_ID(N'tempdb..#TempTable') IS NOT NULL
					BEGIN
						DROP TABLE #TempTable
					END

				;WITH CTE AS (
	    			SELECT DISTINCT TOP 2000  h.woNum, h.QCNum, h.subqcnum, c.CustName, u1.FullName,
					u2.FullName 'FullName2',h.Revised_By,h.Revised_By_2,
					h.TapeNumber, h.Show, h.Epis_Name, h.Epis_no,
					ISNULL(sh.DateAdded, h.QC_Date) QC_Date , h.QC_Date_2, h.[Filename],
					ISNULL(sh.[Status], h.Eval_Stat) Eval_Stat, h.grdVideo, h.grdAudio, h.grdOverall, h.[Version] FROM qcHeader h
					LEFT OUTER JOIN [bward].[qcClients] c ON h.custid = c.custid 
					LEFT OUTER JOIN [bward].[qcUsers] u1 ON h.operator = u1.qcUserID 
					LEFT OUTER JOIN [bward].[qcUsers] u2 ON h.Operator_2 = u2.qcUserID 
					LEFT OUTER JOIN [bward].[StatusHistory] sh ON h.Qcnum = sh.[QCNum]
					WHERE
					  (
					   @WorkOrderNumber IS NULL 
					   OR h.Wonum LIKE '%' + LTRIM(RTRIM(@WorkOrderNumber)) + '%'
					 )
					 AND
					 (
						@TapeNumber IS NULL 
					   OR h.TapeNumber LIKE '%' + LTRIM(RTRIM(@TapeNumber)) + '%'
					 )
					 AND
					 (
					   @QCUserId IS NULL
					   OR h.Operator = @QCUserId
					 )
					  AND
					 (
					   @QCUserId2 IS NULL
					   OR h.Operator_2 = @QCUserId2
					 )
					  AND
					 (
					   @RevisedBy IS NULL
					   OR h.Revised_By LIKE '%' + LTRIM(RTRIM(@RevisedBy)) + '%' 
					 )
					  AND
					 (
					   @RevisedBy2 IS NULL
					   OR h.Revised_By_2 LIKE '%' + LTRIM(RTRIM(@RevisedBy2)) + '%' 
					 )
					 AND
					 (
						@ClientId IS NULL
						OR h.CustId = @ClientId
					 )
					 AND
					 (
					   @Title IS NULL
					   OR h.Show LIKE '%' + LTRIM(RTRIM(@Title)) + '%'
					 )
					 AND
					 (
					   @EpisodeName IS NULL
					   OR h.Epis_Name LIKE '%' + LTRIM(RTRIM(@EpisodeName)) + '%'
					 )
					 AND 
					 (
					   @EpisodeNumber IS NULL
					   OR h.Epis_no LIKE '%' + LTRIM(RTRIM(@EpisodeNumber)) + '%'
					 )
					  AND 
					 (
					   @Filename IS NULL
					   OR h.[Filename] LIKE '%' + LTRIM(RTRIM(@Filename)) + '%'
					 )

					 AND
					 (
						@Statuses IS NULL
						
							 OR (h.Eval_Stat IS NOT NULL AND h.Eval_Stat IN (SELECT value
							FROM [bward].[fn_SplitVarCharMax](@Statuses,',')))
						
							 OR (sh.[Status] IS NOT NULL AND sh.[Status] IN (SELECT value
						   FROM [bward].[fn_SplitVarCharMax](@Statuses,','))) 
						
			    	) 
		    		  AND
					 (
					   @FromDate IS NULL AND @ToDate IS NULL
					   OR h.QC_date BETWEEN @FromDate AND @ToDate
					 )
					 AND
					 (
					   @AudioGrade1 IS NULL
					   OR h.grdAudio = 1
					 )
					  AND
					 (
					   @AudioGrade2 IS NULL
					   OR h.grdAudio = 2
					 )
					 AND
					 (
					   @AudioGrade3 IS NULL
					   OR h.grdAudio = 3
					 )
					  AND
					 (
					   @AudioGrade4 IS NULL
					   OR h.grdAudio = 4
					 )
					  AND
					 (
					   @AudioGrade5 IS NULL
					   OR h.grdAudio = 5
					 )

					 AND
					 (
					   @VideoGrade1 IS NULL
					   OR h.grdVideo = 1
					 )
					  AND
					 (
					   @VideoGrade2 IS NULL
					   OR h.grdVideo = 2
					 )
					 AND
					 (
					   @VideoGrade3 IS NULL
					   OR h.grdVideo = 3
					 )
					  AND
					 (
					   @VideoGrade4 IS NULL
					   OR h.grdVideo = 4
					 )
					  AND
					 (
					   @VideoGrade5 IS NULL
					   OR h.grdVideo = 5
					 )
		 		 
					 AND
					 (
					   @OverallGrade1 IS NULL
					   OR h.grdOverall = 1
					 )
					  AND
					 (
					   @OverallGrade2 IS NULL
					   OR h.grdOverall = 2
					 )
					 AND
					 (
					   @OverallGrade3 IS NULL
					   OR h.grdOverall = 3
					 )
					  AND
					 (
					   @OverallGrade4 IS NULL
					   OR h.grdOverall = 4
					 )
					  AND
					 (
					   @OverallGrade5 IS NULL
					   OR h.grdOverall = 5
					 )
		 	
					AND h.Deleted  = 0
		
					--ORDER BY wonum, qcNum, subQCNum
				)

          -- A CTE must be followed by a single SELECT, INSERT, UPDATE, MERGE, or DELETE statement that references some or all the CTE columns.
		  -- A CTE can also be specified in a CREATE VIEW statement as part of the defining SELECT statement of the view
		  -- https://learn.microsoft.com/en-us/sql/t-sql/queries/with-common-table-expression-transact-sql?redirectedfrom=MSDN&view=sql-server-ver16

		  -- SELECT FROM CTE INTO #TempTable		 
          SELECT CTE.* INTO #TempTable FROM CTE

		  IF @Statuses IS NOT NULL
		    BEGIN
			   SELECT * FROM #TempTable WHERE Eval_Stat IN (SELECT value
			    FROM [bward].[fn_SplitVarCharMax](@Statuses,','))
			    ORDER BY wonum, qcNum, subQCNum
			END
         ELSE
		   BEGIN
		     SELECT * FROM #TempTable 
			 ORDER BY wonum, qcNum, subQCNum
		   END

		   DROP TABLE #TempTable ;
   	 
	 END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get [bward].[sel_Search]: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO

/****** Object:  StoredProcedure [bward].[sp_CopyQCReport]    Script Date: 12/10/2022 13:09:58 ******/
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
	DECLARE @qcType VARCHAR(1)
    
	 --Wrap in transaction
     BEGIN TRAN
     
     SELECT @lastQCNumber = LastQCNum FROM bward.qcConfig  -- Get the Last QC Number
     SET @newQCNumber = @lastQCNumber + 1
     SET @newSubQCNumber = 1  -- New Revison Number is awlays 1
	 SELECT @qcType = qc_type FROM bward.qcHeader WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber

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
		[SponsorshipHeadAndTailPresent],[TAndCsWithinSafeArea]
		 
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
		[SponsorshipHeadAndTailPresent],[TAndCsWithinSafeArea]
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
			QCinUnity, SurroundSound 
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
			QCinUnity, SurroundSound 
			
  
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
				[BitDepth],
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
				[SlatePresent],
	            [SlateInformationCorrect] ,
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
				[TimeSpecificAudioPresent],
				[AllEndLogos],
	            [RudeGestures],
	            [HarmOrOffencePresentIncludingDrugAndAlcholAbuse]
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
				[BitDepth],
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
				[SlatePresent],
	            [SlateInformationCorrect] ,
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
				[TimeSpecificAudioPresent],
				[AllEndLogos],
	            [RudeGestures],
	            [HarmOrOffencePresentIncludingDrugAndAlcholAbuse]
                FROM [bward].[ChecklistBanijayRights] 
			   	WHERE QCNum = @qcNumber AND subQCNum = @subQCNumber

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