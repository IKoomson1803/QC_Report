USE [QCSUK]
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
	SELECT ck.*,cl.CustName FROM [bward].[ChecklisBanijayRights] ck
	INNER JOIN [bward].[qcClients] cl
	ON ck.CustId = cl.CustID
	WHERE  [QCNum]  = @Qcnum
	AND [subQCNum] = @subQcnum
END


GO

/**********************************************************************************/

CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateChecklistBanijayRights]
(
    @ChecklistId INT = 0,
	@Qcnum int,
	@subQcnum int,
	@CustId int,
	@ChecklistCompleted bit,
	@IsFile bit,
	@FileToSpec bit,
	@DecodeCheckPass bit,
	@Format varchar(50),
	@Standard varchar(50),
	@FrameRate varchar(50),
	@VideoBitRate varchar(50),
	@FrameSizeOrResolution varchar(20),
	@AspectRatio varchar(20),
	@BitDepth varchar(50),
	@AudioBitRate varchar(50),
	@SampleRate varchar(50),
	@Discrete bit,
	@IsTheFileMetadataCorrect bit,
	@InterlacedOrProgressiveCorrectlyFlagged bit,
	@InterlacedOrProgressiveCorrectlyNotFlaggedReason varchar(50),
	@CLAPPresent bit,
	@ColourPrimariesPresent varchar(50),
	@TransferCharacteristicsPresent varchar(50),
	@MatrixCoefficientsPresent varchar(50),
	@DisplayAspectRatioCorrect varchar(50),
	@InterlacedVsProgressiveCheckedAndCorrect varchar(50),
	@DoesTheFileContainLineup bit,
	@DoesTheProgrammeStartOnTheHour bit,
	@IsTheProgrammeSeamlessOrParted bit,
	@PartedBreaksLogged bit,
	@IfPartedSpecifyIfOneSecondBlackBetweenParts bit,
	@BumpersPresentAndLogged bit,
	@InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments bit,
	@DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram bit,
	@AreTextlessElementsPresent bit,
	@AreThereTextlessCoversForAllTextedShots bit,
	@AreTheTextlessCoversTheSameTimingAsTextedShots bit,
	@IsTheGradeAndAspectRatioTheSameAsTextedShots bit,
	@IsThere10SecondsOfBlackBetweenProgrammeAndTextless bit,
	@IsThere10SecondsOfBlackBeforeEndOfFile bit,
	@IsAudioLlayoutCorrect bit,
	@IsLineupToneCorrect bit,
	@IsLoudnessR128APass bit,
	@IsMAndEPresentAndComplete bit,
	@IsMixMinusNarrationPresentAndComplete bit,
	@MonoVsStereoChecked bit,
	@AudioInSync bit,
	@WAVSSupplied bit,
	@AllAssociatedWAVSPresent bit,
	@VideoComplianceCheckedAndLogged bit,
	@FlashingLightsOrEpilepsyWarningPresent bit,
	@VideoContentCensoredBleepedOrBlurred bit,
	@NudityPresent bit,
	@VideoTimeSpecificTextPresent bit,
	@ProductPlacementPresent bit,
	@CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags bit,
	@AudioComplianceCheckedAndLogged bit,
	@AudioContentCensoredBleepedOrBlurred bit,
	@ExtremeLanguagePresent bit,
	@AudioTimeSpecificTextPresent bit
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
				[VideoComplianceCheckedAndLogged],
				[FlashingLightsOrEpilepsyWarningPresent],
				[VideoContentCensoredBleepedOrBlurred],
				[NudityPresent],
				[VideoTimeSpecificTextPresent],
				[ProductPlacementPresent],
				[CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags],
				[AudioComplianceCheckedAndLogged],
				[AudioContentCensoredBleepedOrBlurred],
				[ExtremeLanguagePresent],
				[AudioTimeSpecificTextPresent]) 
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
				@VideoComplianceCheckedAndLogged,
				@FlashingLightsOrEpilepsyWarningPresent,
				@VideoContentCensoredBleepedOrBlurred,
				@NudityPresent,
				@VideoTimeSpecificTextPresent,
				@ProductPlacementPresent,
				@CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags,
				@AudioComplianceCheckedAndLogged,
				@AudioContentCensoredBleepedOrBlurred,
				@ExtremeLanguagePresent,
				@AudioTimeSpecificTextPresent
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
					[VideoComplianceCheckedAndLogged] = @VideoComplianceCheckedAndLogged,
					[FlashingLightsOrEpilepsyWarningPresent] = @FlashingLightsOrEpilepsyWarningPresent,
					[VideoContentCensoredBleepedOrBlurred] = @VideoContentCensoredBleepedOrBlurred,
					[NudityPresent] = @NudityPresent,
					[VideoTimeSpecificTextPresent] = @VideoTimeSpecificTextPresent,
					[ProductPlacementPresent] = @ProductPlacementPresent,
					[CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags] = @CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags,
					[AudioComplianceCheckedAndLogged] = @AudioComplianceCheckedAndLogged,
					[AudioContentCensoredBleepedOrBlurred] = @AudioContentCensoredBleepedOrBlurred,
					[ExtremeLanguagePresent] = @ExtremeLanguagePresent,
					[AudioTimeSpecificTextPresent] = @AudioTimeSpecificTextPresent 
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