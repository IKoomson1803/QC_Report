 USE [QCSUK]
GO

ALTER TABLE [bward].[ChecklistBanijayRights] ADD VideoBitDepth VARCHAR(50) NULL

 GO


/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateChecklistBanijayRights]    Script Date: 05/01/2023 16:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [bward].[ins_up_InsertOrUpdateChecklistBanijayRights]
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
	@VideoBitDepth VARCHAR(50) = NULL,
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
				VideoBitDepth,
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
				@VideoBitDepth,
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
						VideoBitDepth = @VideoBitDepth,
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

