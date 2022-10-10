USE [QCSUK]
GO


/****** Object:  Table [bward].[ChecklistBanijayRights]    Script Date: 09/09/2022 15:37:13 ******/
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
	[ConfirmVideoFormat] [varchar](50) NULL,
	[Format] [varchar](50) NULL,
	[Standard] [varchar](50) NULL,
	[FrameRate] [varchar](50) NULL,
	[VideoBitRate] [varchar](50) NULL,
	[FrameSizeOrResolution] [varchar](20) NULL,
	[AspectRatio] [varchar](20) NULL,
	[BitDepth] [varchar](50) NULL,
	[AudioBitRate] [varchar](50) NULL,
	[SampleRate] [varchar](50) NULL,
	[Discrete] [bit] NULL,
	[IsTheFileMetadataCorrect] [bit] NULL,
	[InterlacedOrProgressiveCorrectlyFlagged] [bit] NULL,
	[InterlacedOrProgressiveCorrectlyNotFlaggedReason] [varchar](50) NULL,
	[CLAPPresent] [bit] NULL,
	[ColourPrimariesPresent] [varchar](50) NULL,
	[TransferCharacteristicsPresent] [varchar](50) NULL,
	[MatrixCoefficientsPresent] [varchar](50) NULL,
	[DisplayAspectRatioCorrect] [varchar](50) NULL,
	[InterlacedVsProgressiveCheckedAndCorrect] [varchar](50) NULL,
	[DoesTheFileContainLineup] [bit] NULL,
	[DoesTheProgrammeStartOnTheHour] [bit] NULL,
	[IsTheProgrammeSeamlessOrParted] [bit] NULL,
	[PartedBreaksLogged] [bit] NULL,
	[IfPartedSpecifyIfOneSecondBlackBetweenParts] [bit] NULL,
	[BumpersPresentAndLogged] [bit] NULL,
	[InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments] [bit] NULL,
	[DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram] [bit] NULL,
	[AreTextlessElementsPresent] [bit] NULL,
	[AreThereTextlessCoversForAllTextedShots] [bit] NULL,
	[AreTheTextlessCoversTheSameTimingAsTextedShots] [bit] NULL,
	[IsTheGradeAndAspectRatioTheSameAsTextedShots] [bit] NULL,
	[IsThere10SecondsOfBlackBetweenProgrammeAndTextless] [bit] NULL,
	[IsThere10SecondsOfBlackBeforeEndOfFile] [bit] NULL,
	[IsAudioLlayoutCorrect] [bit] NULL,
	[IsLineupToneCorrect] [bit] NULL,
	[IsLoudnessR128APass] [bit] NULL,
	[IsMAndEPresentAndComplete] [bit] NULL,
	[IsMixMinusNarrationPresentAndComplete] [bit] NULL,
	[MonoVsStereoChecked] [bit] NULL,
	[AudioInSync] [bit] NULL,
	[WAVSSupplied] [bit] NULL,
	[AllAssociatedWAVSPresent] [bit] NULL,
	[AllAssociatedWAVSNotPresentReason] [varchar](50) NULL,	
	[VideoComplianceCheckedAndLogged] [bit] NULL,
	[FlashingLightsOrEpilepsyWarningPresent] [bit] NULL,
	[VideoContentCensoredBleepedOrBlurred] [bit] NULL,
	[NudityPresent] [bit] NULL,
	[TimeSpecificTextPresent] [bit] NULL,
	[ProductPlacementPresent] [bit] NULL,
	[CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags] [bit] NULL,
	[AudioComplianceCheckedAndLogged] [bit] NULL,
	[AudioContentCensoredBleepedOrBlurred] [bit] NULL,
	[ExtremeLanguagePresent] [bit] NULL,
	[TimeSpecificAudioPresent] [bit] NULL,
	[IsTheSlatePresentAndInformationCorrect] [bit] NULL,
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

/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateChecklistBanijayRights]    Script Date: 30/09/2022 14:44:12 ******/
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
	@FileToSpec BIT = NULL,
	@DecodeCheckPass BIT = NULL,
	@ConfirmVideoFormat VARCHAR(50) = NULL,
	@Format VARCHAR(50) = NULL,
	@Standard VARCHAR(50) = NULL,
	@FrameRate VARCHAR(50) = NULL,
	@VideoBitRate VARCHAR(50) = NULL,
	@FrameSizeOrResolution VARCHAR(20) = NULL,
	@AspectRatio VARCHAR(20) = NULL,
	@BitDepth VARCHAR(50) = NULL,
	@AudioBitRate VARCHAR(50) = NULL,
	@SampleRate VARCHAR(50) = NULL,
	@Discrete BIT = NULL,
	@IsTheFileMetadataCorrect BIT = NULL,
	@InterlacedOrProgressiveCorrectlyFlagged BIT = NULL,
	@InterlacedOrProgressiveCorrectlyNotFlaggedReason VARCHAR(50) = NULL,
	@CLAPPresent BIT = NULL,
	@ColourPrimariesPresent VARCHAR(50) = NULL,
	@TransferCharacteristicsPresent VARCHAR(50) = NULL,
	@MatrixCoefficientsPresent VARCHAR(50) = NULL,
	@DisplayAspectRatioCorrect VARCHAR(50) = NULL,
	@InterlacedVsProgressiveCheckedAndCorrect VARCHAR(50) = NULL,
	@DoesTheFileContainLineup BIT = NULL,
	@IsTheSlatePresentAndInformationCorrect BIT = NULL,
	@DoesTheProgrammeStartOnTheHour BIT = NULL,
	@IsTheProgrammeSeamlessOrParted BIT = NULL,
	@PartedBreaksLogged BIT = NULL, 
	@IfPartedSpecifyIfOneSecondBlackBetweenParts BIT = NULL,
	@BumpersPresentAndLogged BIT = NULL,
	@InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments BIT = NULL,
	@DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram bit,
	@AreTextlessElementsPresent BIT = NULL,
	@AreThereTextlessCoversForAllTextedShots BIT = NULL,
	@AreTheTextlessCoversTheSameTimingAsTextedShots BIT = NULL,
	@IsTheGradeAndAspectRatioTheSameAsTextedShots BIT = NULL,
	@IsThere10SecondsOfBlackBetweenProgrammeAndTextless BIT = NULL,
	@IsThere10SecondsOfBlackBeforeEndOfFile BIT = NULL,
	@IsAudioLlayoutCorrect BIT = NULL,
	@IsLineupToneCorrect BIT = NULL,
	@IsLoudnessR128APass BIT = NULL,
	@IsMAndEPresentAndComplete BIT = NULL,
	@IsMixMinusNarrationPresentAndComplete BIT = NULL,
	@MonoVsStereoChecked BIT = NULL,
	@AudioInSync BIT = NULL,
	@WAVSSupplied BIT = NULL,
	@AllAssociatedWAVSPresent BIT = NULL,
	@AllAssociatedWAVSNotPresentReason VARCHAR(50) = NULL,
	@VideoComplianceCheckedAndLogged BIT = NULL,
	@FlashingLightsOrEpilepsyWarningPresent BIT = NULL,
	@VideoContentCensoredBleepedOrBlurred BIT = NULL,
	@NudityPresent BIT = NULL,
	@TimeSpecificTextPresent BIT = NULL,
	@ProductPlacementPresent BIT = NULL,
	@CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags BIT = NULL,
	@AudioComplianceCheckedAndLogged BIT = NULL,
	@AudioContentCensoredBleepedOrBlurred BIT = NULL,
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
				[Format],
				[Standard],
				[FrameRate],
				[VideoBitRate],
				[FrameSizeOrResolution],
				[AspectRatio],
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
				[IsTheSlatePresentAndInformationCorrect],
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
				@Format,
				@Standard,
				@FrameRate,
				@VideoBitRate,
				@FrameSizeOrResolution,
				@AspectRatio,
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
				@IsTheSlatePresentAndInformationCorrect,
				@DoesTheProgrammeStartOnTheHour,
				@IsTheProgrammeSeamlessOrParted,
				@PartedBreaksLogged,
				@IfPartedSpecifyIfOneSecondBlackBetweenParts,
				@BumpersPresentAndLogged,
				@InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments,
				@DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram,
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
						[Format] = @Format,
						[Standard] = @Standard,
						[FrameRate] = @FrameRate,
						[VideoBitRate] = @VideoBitRate,
						[FrameSizeOrResolution] = @FrameSizeOrResolution,
						[AspectRatio] = @AspectRatio,
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
						[IsTheSlatePresentAndInformationCorrect] = @IsTheSlatePresentAndInformationCorrect,
						[DoesTheProgrammeStartOnTheHour] = @DoesTheProgrammeStartOnTheHour,
						[IsTheProgrammeSeamlessOrParted] = @IsTheProgrammeSeamlessOrParted,
						[PartedBreaksLogged] = @PartedBreaksLogged,
						[IfPartedSpecifyIfOneSecondBlackBetweenParts] = @IfPartedSpecifyIfOneSecondBlackBetweenParts,
						[BumpersPresentAndLogged] = @BumpersPresentAndLogged,
						[InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments] = @InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments,
						[DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram] = @DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram,
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

USE [QCSUK]
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

USE [QCSUK]
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