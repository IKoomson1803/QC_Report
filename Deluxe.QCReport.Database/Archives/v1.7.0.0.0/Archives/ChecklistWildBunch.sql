USE [QCSUK]
GO

/****** Object:  Table [bward].[bward.ChecklistWildBunch]    Script Date: 27/08/2021 15:18:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[ChecklistWildBunch](
	[ChecklistId] [int] IDENTITY(1,1) NOT NULL,
	[Qcnum] [int] NOT NULL,
	[subQcnum] [int] NOT NULL,
	[CustId] [int] NOT NULL,
	[ChecklistCompleted] [bit] NOT NULL,
	[IsFile] [bit] NULL,
	[_4_4_4_FullScaleFilesAreAcceptableMentionedAndLogged] [varchar](50) NULL,
	[_4_4_4_ScaledOR_4_2_2_Above_700MVOrBelow_0MVAreAFail] [varchar](50) NULL,
	[HeadBuildPresentAndCorrect] [varchar](50) NULL,
	[TimecodesCcorrectCheckedAndMatched] [varchar](50) NULL,
	[AspectRatioCheckedOnAllContent] [bit] NULL,
	[AllHAndVBlankingChecked] [bit] NULL,
	[AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText] [bit] NULL,
	[LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard] [bit] NULL,
	[LoggedWildbunchLogoPresent] [bit] NULL,
	[BrandingOrCopyrightwithinContentLogged] [bit] NULL,
	[AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe] [bit] NULL,
	[AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers] [bit] NULL,
	[AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot] [bit] NULL,
	[AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot] [bit] NULL,
	[AreAllAudioChannelsPresent] [bit] NULL,
	[AudioOrVideoSyncCheckedOrLogged] [bit] NULL,
	[MonoAudioListTracks] [bit] NULL,
	[SplitTrackAudio] [bit] NULL,
	[AreMAndETracksFullyFilled] [bit] NULL,
	[AnyUnclearDialogueOrBuriedInTheMix] [bit] NULL,
	[IsAudioDiscreate] [bit] NULL,
	[HasAllFileMetadataBeenChecked] [bit] NULL,
	[FileFormatOrCodec] [varchar](50) NULL,
	[StandardOrFrameRate] [varchar](50) NULL,
	[Resolution] [varchar](50) NULL,
	[Progressive] [bit] NULL,
	[CLAPPresent] [bit] NULL,
	[ColourPrimaries] [varchar](50) NULL,
	[TransferCharacteristics] [varchar](50) NULL,
	[MatrixCoefficients] [varchar](50) NULL,
	[TaggedOrLabelledAudioWBTVOnly] [bit] NULL,
	[AudioBitDepthOrRate] [varchar](50) NULL,
 CONSTRAINT [PK_bward.ChecklistWildBunch] PRIMARY KEY CLUSTERED 
(
	[ChecklistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  StoredProcedure [bward].[sel_GetChecklistWildBunch]    Script Date: 27/08/2021 15:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [bward].[sel_GetChecklistWildBunch] 
	-- Add the parameters for the stored procedure here
	@Qcnum INT,
    @subQcnum INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ck.*,cl.CustName FROM [bward].[ChecklistWildBunch] ck
	INNER JOIN [bward].[qcClients] cl
	ON ck.CustId = cl.CustID
	WHERE  [QCNum]  = @Qcnum
	AND [subQCNum] = @subQcnum
END

GO



/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateChecklistWildBunch]    Script Date: 27/08/2021 15:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateChecklisWildBunch]
	-- Add the parameters for the stored procedure here
    @ChecklistId INT = 0,
	@Qcnum INT,
    @subQcnum INT,
    @CustId INT,
	@ChecklistCompleted BIT = 0,
	@IsFile  BIT = NULL,
	@_4_4_4_FullScaleFilesAreAcceptableMentionedAndLogged VARCHAR(50) = NULL,
	@_4_4_4_ScaledOR_4_2_2_Above_700MVOrBelow_0MVAreAFail VARCHAR(50) = NULL,
	@HeadBuildPresentAndCorrect VARCHAR(50) = NULL,
	@TimecodesCcorrectCheckedAndMatched VARCHAR(50) = NULL,
	@AspectRatioCheckedOnAllContent BIT = NULL,
	@AllHAndVBlankingChecked BIT = NULL,
	@AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText BIT = NULL,
	@LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard BIT = NULL,
	@LoggedWildbunchLogoPresent BIT = NULL,
	@BrandingOrCopyrightwithinContentLogged BIT = NULL,
	@AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe BIT = NULL,
	@AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers BIT = NULL,
	@AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot BIT = NULL,
	@AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot BIT = NULL,
	@AreAllAudioChannelsPresent BIT = NULL,
	@AudioOrVideoSyncCheckedOrLogged BIT = NULL,
	@MonoAudioListTracks BIT = NULL,
	@SplitTrackAudio BIT = NULL,
	@AreMAndETracksFullyFilled BIT = NULL,
	@AnyUnclearDialogueOrBuriedInTheMix BIT = NULL,
	@IsAudioDiscreate BIT = NULL,
	@HasAllFileMetadataBeenChecked BIT = NULL,
	@FileFormatOrCodec VARCHAR(50) = NULL,
	@StandardOrFrameRate VARCHAR(50) = NULL,
	@Resolution VARCHAR(50) = NULL,
	@Progressive BIT = NULL,
	@CLAPPresent BIT = NULL,
	@ColourPrimaries VARCHAR(50) = NULL,
	@TransferCharacteristics VARCHAR(50) = NULL,
	@MatrixCoefficients VARCHAR(50) = NULL,
	@TaggedOrLabelledAudioWBTVOnly BIT = NULL,
	@AudioBitDepthOrRate VARCHAR(50) = NULL

  
	
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)


	SELECT @ChecklistId = [ChecklistId] from [bward].[ChecklistWildBunch] WHERE [QCNum] = @Qcnum AND [subQCNum] =  @subQcnum
	
		
	BEGIN TRY
		 
	   IF @ChecklistId IS NULL OR @ChecklistId = 0
	     BEGIN
	        INSERT INTO [bward].[ChecklistWildBunch](
			QCNum,
            subQCNum,
            CustId,
            ChecklistCompleted,
			IsFile,
	         _4_4_4_FullScaleFilesAreAcceptableMentionedAndLogged,
			_4_4_4_ScaledOR_4_2_2_Above_700MVOrBelow_0MVAreAFail,
			HeadBuildPresentAndCorrect,
			TimecodesCcorrectCheckedAndMatched,
			AspectRatioCheckedOnAllContent ,
			AllHAndVBlankingChecked ,
			AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText ,
			LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard ,
			LoggedWildbunchLogoPresent ,
			BrandingOrCopyrightwithinContentLogged ,
			AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe ,
			AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers ,
			AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot ,
			AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot ,
			AreAllAudioChannelsPresent ,
			AudioOrVideoSyncCheckedOrLogged ,
			MonoAudioListTracks ,
			SplitTrackAudio ,
			AreMAndETracksFullyFilled ,
			AnyUnclearDialogueOrBuriedInTheMix ,
			IsAudioDiscreate ,
			HasAllFileMetadataBeenChecked ,
			FileFormatOrCodec,
			StandardOrFrameRate,
			Resolution,
			Progressive ,
			CLAPPresent ,
			ColourPrimaries,
			TransferCharacteristics,
			MatrixCoefficients,
			TaggedOrLabelledAudioWBTVOnly ,
			AudioBitDepthOrRate
			
			)
	        SELECT
			@QCNum,
            @subQCNum,
            @CustId,
            @ChecklistCompleted,
			@IsFile,
			@_4_4_4_FullScaleFilesAreAcceptableMentionedAndLogged,
			@_4_4_4_ScaledOR_4_2_2_Above_700MVOrBelow_0MVAreAFail,
			@HeadBuildPresentAndCorrect,
			@TimecodesCcorrectCheckedAndMatched,
			@AspectRatioCheckedOnAllContent,
			@AllHAndVBlankingChecked,
			@AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText,
			@LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard,
			@LoggedWildbunchLogoPresent,
			@BrandingOrCopyrightwithinContentLogged,
			@AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe,
			@AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers,
			@AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot,
			@AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot,
			@AreAllAudioChannelsPresent,
			@AudioOrVideoSyncCheckedOrLogged,
			@MonoAudioListTracks,
			@SplitTrackAudio,
			@AreMAndETracksFullyFilled,
			@AnyUnclearDialogueOrBuriedInTheMix,
			@IsAudioDiscreate,
			@HasAllFileMetadataBeenChecked,
			@FileFormatOrCodec,
			@StandardOrFrameRate,
			@Resolution,
			@Progressive,
			@CLAPPresent,
			@ColourPrimaries,
			@TransferCharacteristics,
			@MatrixCoefficients,
			@TaggedOrLabelledAudioWBTVOnly,
			@AudioBitDepthOrRate

	     END
	   ELSE 
	     BEGIN
	     	       
	              
	        UPDATE [bward].[ChecklistWildBunch]
			SET  ChecklistCompleted = @ChecklistCompleted,
			IsFile = @IsFile,
			_4_4_4_FullScaleFilesAreAcceptableMentionedAndLogged = @_4_4_4_FullScaleFilesAreAcceptableMentionedAndLogged,
			_4_4_4_ScaledOR_4_2_2_Above_700MVOrBelow_0MVAreAFail = @_4_4_4_ScaledOR_4_2_2_Above_700MVOrBelow_0MVAreAFail,
			HeadBuildPresentAndCorrect = @HeadBuildPresentAndCorrect,
			TimecodesCcorrectCheckedAndMatched  = @TimecodesCcorrectCheckedAndMatched,
			AspectRatioCheckedOnAllContent = @AspectRatioCheckedOnAllContent,
			AllHAndVBlankingChecked = @AllHAndVBlankingChecked,
			AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText = @AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText,
			LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard = @LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard,
			LoggedWildbunchLogoPresent = @LoggedWildbunchLogoPresent,
			BrandingOrCopyrightwithinContentLogged = @BrandingOrCopyrightwithinContentLogged,
			AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe = @AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe,
			AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers = @AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers,
			AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot = @AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot,
			AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot = @AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot,
			AreAllAudioChannelsPresent = @AreAllAudioChannelsPresent,
			AudioOrVideoSyncCheckedOrLogged = @AudioOrVideoSyncCheckedOrLogged,
			MonoAudioListTracks = @MonoAudioListTracks,
			SplitTrackAudio = @SplitTrackAudio,
			AreMAndETracksFullyFilled = @AreMAndETracksFullyFilled,
			AnyUnclearDialogueOrBuriedInTheMix = @AnyUnclearDialogueOrBuriedInTheMix,
			IsAudioDiscreate = @IsAudioDiscreate,
			HasAllFileMetadataBeenChecked = @HasAllFileMetadataBeenChecked,
			FileFormatOrCodec = @FileFormatOrCodec,
			StandardOrFrameRate = @StandardOrFrameRate,
			Resolution = @Resolution,
			Progressive = @Progressive,
			CLAPPresent = @CLAPPresent,
			ColourPrimaries = @ColourPrimaries,
			TransferCharacteristics = @TransferCharacteristics,
			MatrixCoefficients = @MatrixCoefficients,
			TaggedOrLabelledAudioWBTVOnly = @TaggedOrLabelledAudioWBTVOnly,
			AudioBitDepthOrRate = @AudioBitDepthOrRate
       		WHERE [QCNum] = @QCNum
			AND [subQCNum] = @subQCNum 
	        
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'Could not insert or update ChecklistWildBunch tables: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

