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

/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateChecklistBanijayRights]    Script Date: 21/09/2022 12:01:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateChecklistBanijayRights]
(
    @ChecklistId INT = 0,
	@Qcnum INT,
	@subQcnum INT,
	@CustId INT,
	@ChecklistCompleted bit,
	@IsFile BIT = NULL,
	@FileToSpec BIT = NULL,
	@DecodeCheckPass BIT = NULL,
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
		           UPDATE [bward].[ChecklistBanijayRights] 
				    SET [Qcnum] = @Qcnum,
					[subQcnum] = @subQcnum,
					[CustId] = @CustId,
					[ChecklistCompleted] = @ChecklistCompleted,
					[IsFile] = @IsFile,
					[FileToSpec] = @FileToSpec,
					[DecodeCheckPass] = @DecodeCheckPass,
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
					[MatrixCoefficientsPresent] = @MatrixCoefficientsPresent,
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
	 
    END TRY
    BEGIN CATCH
       SET @errorMsg = 'Could not insert or update ChecklistBanijayRights tables: ' + ERROR_MESSAGE()
       RAISERROR(@errorMsg, 16, 1)
    END CATCH		 		

END



GO
