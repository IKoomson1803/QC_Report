USE [QCSUK]
GO

/****** Object:  Table [bward].[ChecklistLionsGate]    Script Date: 20/08/2021 16:39:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[ChecklistLionsGate](
	[ChecklistId] [int] IDENTITY(1,1) NOT NULL,
	[Qcnum] [int] NOT NULL,
	[subQcnum] [int] NOT NULL,
	[CustId] [int] NOT NULL,
	[ChecklistCompleted] [bit] NOT NULL,
	[IsTheFileFullRangeVideo] [bit] NULL,
	[IsTheFrameRateOfTheContenCorrect] [bit] NULL,
	[IsTheHeadBuildCorrect] [bit] NULL,
	[AreTheVideoLevelsCorrectOnTheHeadBuild] [bit] NULL,
	[AreTheVideoLevelsCorrectOnTheContent] [bit] NULL,
	[HasTheAspectRatioBeenCheckedOTheSlateAndProgramme] [bit] NULL,
	[IsTheInfoOnTheSlateCcorrect] [bit] NULL,
	[IsTheLionsgateCeletiallLogoAddedOrPresent] [bit] NULL,
	[IsAllAddedTextWithin16_9NinetyPercentTitleSafe] [bit] NULL,
	[HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText] [bit] NULL,
	[AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots] [bit] NULL,
	[FlashingImagesPpresentImagesLikelyToCauseASeizure] [bit] NULL,
	[FirstAndLastCutBeenCheckedOrLoggedAsReference] [bit] NULL,
	[IsTheAudioToneOnHeadBuildCorrect] [bit] NULL,
	[Is_2_0_StereoTVFullMixPresentAndQCeD] [bit] NULL,
	[HasThe_5_1_MixBeenSpotChecked] [bit] NULL,
	[AudioOrVideoSyncCheckedOrLogged] [bit] NULL,
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
	[AudioBitDepthOrRate] [varchar](50) NULL,
	[IsFile] [bit] NULL,
 CONSTRAINT [PK_ChecklistLionsGate] PRIMARY KEY CLUSTERED 
(
	[ChecklistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [QCSUK]
GO
/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateChecklist]    Script Date: 20/08/2021 17:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
USE [QCSUK]
GO
/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateChecklistLionsGate]    Script Date: 23/08/2021 11:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  StoredProcedure [bward].[sel_GetChecklistLionsGate]    Script Date: 23/08/2021 11:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [bward].[sel_GetChecklistLionsGate] 
	-- Add the parameters for the stored procedure here
	@Qcnum INT,
    @subQcnum INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ck.*,cl.CustName FROM [bward].[ChecklistLionsGate] ck
	INNER JOIN [bward].[qcClients] cl
	ON ck.CustId = cl.CustID
	WHERE  [QCNum]  = @Qcnum
	AND [subQCNum] = @subQcnum
END
GO

CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateChecklistLionsGate]
	-- Add the parameters for the stored procedure here
    @ChecklistId INT = 0,
	@Qcnum INT,
    @subQcnum INT,
    @CustId INT,
	@ChecklistCompleted BIT = 0,
    @IsTheFileFullRangeVideo bit= NULL,
	@IsTheFrameRateOfTheContenCorrect bit= NULL,
	@IsTheHeadBuildCorrect bit= NULL,
	@AreTheVideoLevelsCorrectOnTheHeadBuild bit= NULL,
	@AreTheVideoLevelsCorrectOnTheContent bit= NULL,
	@HasTheAspectRatioBeenCheckedOTheSlateAndProgramme bit= NULL,
	@IsTheInfoOnTheSlateCcorrect bit= NULL,
	@IsTheLionsgateCeletiallLogoAddedOrPresent bit= NULL,
	@IsAllAddedTextWithin16_9NinetyPercentTitleSafe bit= NULL,
	@HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText bit= NULL,
	@AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots bit= NULL,
	@FlashingImagesPpresentImagesLikelyToCauseASeizure bit= NULL,
	@FirstAndLastCutBeenCheckedOrLoggedAsReference bit= NULL,
	@IsTheAudioToneOnHeadBuildCorrect bit= NULL,
	@Is_2_0_StereoTVFullMixPresentAndQCeD bit= NULL,
	@HasThe_5_1_MixBeenSpotChecked bit= NULL,
	@AudioOrVideoSyncCheckedOrLogged bit= NULL,
	@IsAudioDiscreate bit= NULL,
	@HasAllFileMetadataBeenChecked bit= NULL,
	@FileFormatOrCodec varchar(50)= NULL,
	@StandardOrFrameRate varchar(50)= NULL,
	@Resolution varchar(50)= NULL,
	@Progressive bit= NULL,
	@CLAPPresent bit= NULL,
	@ColourPrimaries varchar(50) =  NULL,
	@TransferCharacteristics varchar(50)= NULL,
	@MatrixCoefficients varchar(50)= NULL,
	@AudioBitDepthOrRate varchar(50)= NULL,
	@IsFile  BIT = NULL
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)


	SELECT @ChecklistId = [ChecklistId] from [bward].[ChecklistLionsGate] WHERE [QCNum] = @Qcnum AND [subQCNum] =  @subQcnum
	
		
	BEGIN TRY
		 
	   IF @ChecklistId IS NULL OR @ChecklistId = 0
	     BEGIN
	        INSERT INTO [bward].[ChecklistLionsGate](
			QCNum,
            subQCNum,
            CustId,
            ChecklistCompleted,
            IsTheFileFullRangeVideo,
			IsTheFrameRateOfTheContenCorrect,
			IsTheHeadBuildCorrect,
			AreTheVideoLevelsCorrectOnTheHeadBuild,
			AreTheVideoLevelsCorrectOnTheContent,
			HasTheAspectRatioBeenCheckedOTheSlateAndProgramme,
			IsTheInfoOnTheSlateCcorrect,
			IsTheLionsgateCeletiallLogoAddedOrPresent,
			IsAllAddedTextWithin16_9NinetyPercentTitleSafe,
			HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText,
			AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots,
			FlashingImagesPpresentImagesLikelyToCauseASeizure,
			FirstAndLastCutBeenCheckedOrLoggedAsReference,
			IsTheAudioToneOnHeadBuildCorrect,
			Is_2_0_StereoTVFullMixPresentAndQCeD,
			HasThe_5_1_MixBeenSpotChecked,
			AudioOrVideoSyncCheckedOrLogged,
			IsAudioDiscreate,
			HasAllFileMetadataBeenChecked,
			FileFormatOrCodec,
			StandardOrFrameRate,
			Resolution,
			Progressive,
			CLAPPresent,
			ColourPrimaries,
			TransferCharacteristics,
			MatrixCoefficients,
			AudioBitDepthOrRate,
			IsFile
			)
	        SELECT
			@QCNum,
            @subQCNum,
            @CustId,
            @ChecklistCompleted,
			@IsTheFileFullRangeVideo ,
			@IsTheFrameRateOfTheContenCorrect ,
			@IsTheHeadBuildCorrect ,
			@AreTheVideoLevelsCorrectOnTheHeadBuild ,
			@AreTheVideoLevelsCorrectOnTheContent ,
			@HasTheAspectRatioBeenCheckedOTheSlateAndProgramme ,
			@IsTheInfoOnTheSlateCcorrect ,
			@IsTheLionsgateCeletiallLogoAddedOrPresent ,
			@IsAllAddedTextWithin16_9NinetyPercentTitleSafe ,
			@HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText ,
			@AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots ,
			@FlashingImagesPpresentImagesLikelyToCauseASeizure ,
			@FirstAndLastCutBeenCheckedOrLoggedAsReference ,
			@IsTheAudioToneOnHeadBuildCorrect ,
			@Is_2_0_StereoTVFullMixPresentAndQCeD ,
			@HasThe_5_1_MixBeenSpotChecked ,
			@AudioOrVideoSyncCheckedOrLogged ,
			@IsAudioDiscreate ,
			@HasAllFileMetadataBeenChecked ,
			@FileFormatOrCodec,
			@StandardOrFrameRate,
			@Resolution,
			@Progressive ,
			@CLAPPresent ,
			@ColourPrimaries,
			@TransferCharacteristics,
			@MatrixCoefficients,
			@AudioBitDepthOrRate,
			@IsFile
	     END
	   ELSE 
	     BEGIN
	     	       
	        UPDATE [bward].[ChecklistLionsGate]
			SET  ChecklistCompleted = @ChecklistCompleted,
			IsTheFileFullRangeVideo= @IsTheFileFullRangeVideo,
			IsTheFrameRateOfTheContenCorrect=@IsTheFrameRateOfTheContenCorrect ,
			IsTheHeadBuildCorrect= @IsTheHeadBuildCorrect,
			AreTheVideoLevelsCorrectOnTheHeadBuild=@AreTheVideoLevelsCorrectOnTheHeadBuild ,
			AreTheVideoLevelsCorrectOnTheContent=@AreTheVideoLevelsCorrectOnTheContent ,
			HasTheAspectRatioBeenCheckedOTheSlateAndProgramme= @HasTheAspectRatioBeenCheckedOTheSlateAndProgramme,
			IsTheInfoOnTheSlateCcorrect= @IsTheInfoOnTheSlateCcorrect,
			IsTheLionsgateCeletiallLogoAddedOrPresent=@IsTheLionsgateCeletiallLogoAddedOrPresent ,
			IsAllAddedTextWithin16_9NinetyPercentTitleSafe=@IsAllAddedTextWithin16_9NinetyPercentTitleSafe ,
			HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText=@HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText ,
			AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots= @AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots,
			FlashingImagesPpresentImagesLikelyToCauseASeizure= @FlashingImagesPpresentImagesLikelyToCauseASeizure,
			FirstAndLastCutBeenCheckedOrLoggedAsReference= @FirstAndLastCutBeenCheckedOrLoggedAsReference,
			IsTheAudioToneOnHeadBuildCorrect= @IsTheAudioToneOnHeadBuildCorrect,
			Is_2_0_StereoTVFullMixPresentAndQCeD= @Is_2_0_StereoTVFullMixPresentAndQCeD,
			HasThe_5_1_MixBeenSpotChecked=@HasThe_5_1_MixBeenSpotChecked ,
			AudioOrVideoSyncCheckedOrLogged=@AudioOrVideoSyncCheckedOrLogged ,
			IsAudioDiscreate= @IsAudioDiscreate,
			HasAllFileMetadataBeenChecked= @HasAllFileMetadataBeenChecked,
			FileFormatOrCodec= @FileFormatOrCodec,
			StandardOrFrameRate= @StandardOrFrameRate,
			Resolution=@Resolution ,
			Progressive= @Progressive,
			CLAPPresent=@CLAPPresent ,
			ColourPrimaries= @ColourPrimaries ,
			TransferCharacteristics=@TransferCharacteristics ,
			MatrixCoefficients= @MatrixCoefficients,
			AudioBitDepthOrRate = @AudioBitDepthOrRate,
			IsFile = @IsFile
			
			 WHERE [QCNum] = @QCNum
			 AND [subQCNum] = @subQCNum 
	        
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'Could not insert or update ChecklistLionsgate tables: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END



GO