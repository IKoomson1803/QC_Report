 USE [QCSUK]
GO

ALTER TABLE [bward].[ChecklistBanijayRights] ADD VideoBitDepth VARCHAR(50) NULL
ALTER TABLE [bward].[qcHeader] ALTER COLUMN [Timecode] VARCHAR(50) NULL

 GO

EXEC sp_rename '[bward].[ChecklistBanijayRights].[BitDepth]', 'AudioBitDepth', 'COLUMN';

 GO

 USE [QCSUK]
GO
/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateChecklistBanijayRights]    Script Date: 10/01/2023 11:53:44 ******/
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
	@AudioBitDepth VARCHAR(50) = NULL,
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
				@AudioBitDepth,
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
						VideoBitDepth = @VideoBitDepth,
						[Format] = @Format,
						[Standard] = @Standard,
						[FrameRate] = @FrameRate,
						[VideoBitRate] = @VideoBitRate,
						[FrameSizeOrResolution] = @FrameSizeOrResolution,
						[AspectRatio] = @AspectRatio,
						[AudioCodec] = @AudioCodec,
						[AudioBitDepth] = @AudioBitDepth,
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

/****** Object:  StoredProcedure [bward].[sp_UpdateHeaderDetails]    Script Date: 10/01/2023 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[sp_UpdateHeaderDetails]
	@_QCNum int,
	@_rev int,
	@_thisPart int = NULL,
	@_totPart int = NULL,
	@_pono VARCHAR(15) = NULL,
	@_qcDate datetime = NULL,
	@_aspect VARCHAR(8) = NULL,
	@_custID int = NULL,
	@_show NVARCHAR(255) = NULL,
	@_epNo NVARCHAR(255) = NULL,
	@_epName NVARCHAR(255) = NULL,
	@_standard VARCHAR(20) = NULL,
	@_format VARCHAR(15) = NULL,
	@_version VARCHAR(60) = NULL,
	@_trt VARCHAR(20) = NULL,
	@_tapeDesc VARCHAR(255) = NULL,
	@_tapeNumber NVARCHAR(50) = NULL,
	@_filename VARCHAR(255) = NULL,
	@_subtitle NVARCHAR(50) = NULL,
	@_hLang NVARCHAR(50) = NULL,
	@_status NVARCHAR(30) = NULL,
	@_headLogo NVARCHAR(100) = NULL,
	@_tailLogo NVARCHAR(100) = NULL,
	@_timecode VARCHAR(50) = NULL,

	@_programmeDetails VARCHAR(MAX) = NULL,
	@_duration VARCHAR(11) = NULL,
	@_productionNumber VARCHAR(50) = NULL,
	@_programmeTitleAndNumber VARCHAR(255) = NULL,
	@_productionCompany VARCHAR(150) = NULL,
	@_contactPhoneNumber VARCHAR(20) = NULL,
	@_postCompany VARCHAR(150) = NULL,
	@_productPlacementLogoPresentAndInSafeArea BIT = NULL,
	@_sponsorshipHeadAndTailPresent BIT = NULL,
	@_tAndCsWithinSafeArea BIT = NULL,
	@_authorisedBy VARCHAR(50) = NULL,
	@_authorisedDate DATETIME = NULL,
	@_jobTitle VARCHAR(100) = NULL
		
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcHeader 
	SET 
		pono = @_pono,
		This_part = @_thisPart,
		Tot_part = @_totPart,
		 QC_Date = @_qcDate,  
		Aspect = @_aspect,
		CustID = @_custID,
		Show = @_show,
		Epis_no = @_epNo,
		Epis_name = @_epName,
		Version = @_version,
		Format = @_format,
		Standard = @_standard,
		TRT = @_trt,
		TapeDesc1 = @_tapeDesc,
		TapeNumber = @_tapeNumber,
		Filename = @_filename,
		Subtitle = @_subtitle,
		HLanguage = @_hLang,
		Status = @_status,
		HeadLogo = @_headLogo,
		TailLogo = @_tailLogo,
		Timecode = @_timecode,

		ProgrammeDetails = @_programmeDetails,
	    Duration = @_duration,
	    ProductionNumber = @_productionNumber,
	    ProgrammeTitleAndNumber = @_programmeTitleAndNumber,
	    ProductionCompany = @_productionCompany,
	    ContactPhoneNumber = @_contactPhoneNumber,
	    PostCompany = @_postCompany,
	    ProductPlacementLogoPresentAndInSafeArea = @_productPlacementLogoPresentAndInSafeArea,
	    SponsorshipHeadAndTailPresent = @_sponsorshipHeadAndTailPresent,
	    TAndCsWithinSafeArea = @_tAndCsWithinSafeArea,
	    AuthorisedBy = @_authorisedBy,
	    AuthorisedDate = @_authorisedDate ,
	    JobTitle = @_jobTitle

	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
		
		
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

