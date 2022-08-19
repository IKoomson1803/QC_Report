USE [QCSUK]
GO

/****** Object:  Table [bward].[ChecklistWarner]    Script Date: 25/08/2021 15:59:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[ChecklistWarner](
	[ChecklistId] [int] IDENTITY(1,1) NOT NULL,
	[Qcnum] [int] NOT NULL,
	[subQcnum] [int] NOT NULL,
	[CustId] [int] NOT NULL,
	[ChecklistCompleted] [bit] NOT NULL,
	[IsFile] [bit] NULL,
	[WasOVReportSupplied] [bit] NULL,
	[WereAllLocalisedTextDocumentsSupplied] [bit] NULL,
	[WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied] [bit] NULL,
	[DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant] [bit] NULL,
	[HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig] [bit] NULL,
	[HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme] [bit] NULL,
	[IsCreatedLanguageVariantFileNormalVideoRange] [bit] NULL,
	[AreAllInsertsNormalVideoRange] [bit] NULL,
	[AreAllInsertsEditedCorrectly] [bit] NULL,
	[HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar] [bit] NULL,
	[FirstAndLastCutBeenCheckedOrloggedAsReference] [bit] NULL,
	[IsTheDubCardPresentAtEndFeatureAndOnSeparateFileSupplied] [bit] NULL,
	[IsDubCardNormalVideoRange] [bit] NULL,
	[HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar] [bit] NULL,
	[HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked] [bit] NULL,
	[IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail] [varchar](50) NULL,
	[IsAudioOnFileOV] [bit] NULL,
	[IsTheAudioChannelLayout_5_1_And_2_0] [bit] NULL,
	[IsThereMAndEOnFile] [bit] NULL,
	[Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs] [bit] NULL,
	[IsAudioDiscreate] [bit] NULL,
	[AudioOrVideoSyncCheckedOrLogged] [bit] NULL,
	[HasAllFileMetadatBeenChecked] [bit] NULL,
	[FileFormat] [varchar](50) NULL,
	[Codec] [varchar](50) NULL,
	[StandardOrFrameRate] [varchar](50) NULL,
	[Resolution] [varchar](50) NULL,
	[Progressive] [bit] NULL,
	[CLAPPresent] [bit] NULL,
	[ColourPrimaries] [varchar](50) NULL,
	[TransferCharacteristics] [varchar](50) NULL,
	[MatrixCoefficients] [varchar](50) NULL,
 CONSTRAINT [PK_bward]].[ChecklistWarner] PRIMARY KEY CLUSTERED 
(
	[ChecklistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [bward].[ChecklistWarner]  WITH CHECK ADD  CONSTRAINT [FK_ChecklistWarner_ChecklistWarner] FOREIGN KEY([ChecklistId])
REFERENCES [bward].[ChecklistWarner] ([ChecklistId])
GO

ALTER TABLE [bward].[ChecklistWarner] CHECK CONSTRAINT [FK_ChecklistWarner_ChecklistWarner]
GO


/****** Object:  StoredProcedure [bward].[sel_GetChecklistLionsGate]    Script Date: 25/08/2021 15:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [bward].[sel_GetChecklistWarner] 
	-- Add the parameters for the stored procedure here
	@Qcnum INT,
    @subQcnum INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ck.*,cl.CustName FROM [bward].[ChecklistWarner] ck
	INNER JOIN [bward].[qcClients] cl
	ON ck.CustId = cl.CustID
	WHERE  [QCNum]  = @Qcnum
	AND [subQCNum] = @subQcnum
END

GO

/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateChecklistLionsGate]    Script Date: 25/08/2021 16:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateChecklistWarner]
	-- Add the parameters for the stored procedure here
    @ChecklistId INT = 0,
	@Qcnum INT,
    @subQcnum INT,
    @CustId INT,
	@ChecklistCompleted BIT = 0,
	@IsFile  BIT = NULL,
	@WasOVReportSupplied BIT = NULL,
	@WereAllLocalisedTextDocumentsSupplied BIT = NULL,
	@WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied BIT = NULL,
	@DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant BIT = NULL,
	@HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig BIT = NULL,
	@HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme BIT = NULL,
	@IsCreatedLanguageVariantFileNormalVideoRange BIT = NULL,
	@AreAllInsertsNormalVideoRange BIT = NULL,
	@AreAllInsertsEditedCorrectly BIT = NULL,
	@HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar BIT = NULL,
	@FirstAndLastCutBeenCheckedOrloggedAsReference BIT = NULL,
	@IsTheDubCardPresentAtEndFeatureAndOnSeparateFileSupplied BIT = NULL,
	@IsDubCardNormalVideoRange BIT = NULL,
	@HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar BIT = NULL,
	@HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked BIT = NULL,
	@IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail  VARCHAR(50) = NULL,
	@IsAudioOnFileOV BIT = NULL,
	@IsTheAudioChannelLayout_5_1_And_2_0 BIT = NULL,
	@IsThereMAndEOnFile BIT = NULL,
	@Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs BIT = NULL,
	@IsAudioDiscreate BIT = NULL,
	@AudioOrVideoSyncCheckedOrLogged BIT = NULL,
	@HasAllFileMetadatBeenChecked BIT = NULL,
	@FileFormat  VARCHAR(50) = NULL,
	@Codec  VARCHAR(50) = NULL,
	@StandardOrFrameRate  VARCHAR(50) = NULL,
	@Resolution  VARCHAR(50) = NULL,
	@Progressive BIT = NULL,
	@CLAPPresent BIT = NULL,
	@ColourPrimaries  VARCHAR(50) = NULL,
	@TransferCharacteristics  VARCHAR(50) = NULL,
	@MatrixCoefficients  VARCHAR(50) = NULL
  
	
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)


	SELECT @ChecklistId = [ChecklistId] from [bward].[ChecklistWarner] WHERE [QCNum] = @Qcnum AND [subQCNum] =  @subQcnum
	
		
	BEGIN TRY
		 
	   IF @ChecklistId IS NULL OR @ChecklistId = 0
	     BEGIN
	        INSERT INTO [bward].[ChecklistWarner](
			QCNum,
            subQCNum,
            CustId,
            ChecklistCompleted,
			IsFile,
            WasOVReportSupplied,
			WereAllLocalisedTextDocumentsSupplied,
			WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied,
			DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant,
			HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig,
			HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme,
			IsCreatedLanguageVariantFileNormalVideoRange,
			AreAllInsertsNormalVideoRange,
			AreAllInsertsEditedCorrectly,
			HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar,
			FirstAndLastCutBeenCheckedOrloggedAsReference,
			IsTheDubCardPresentAtEndFeatureAndOnSeparateFileSupplied,
			IsDubCardNormalVideoRange,
			HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar,
			HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked,
			IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail,
			IsAudioOnFileOV,
			IsTheAudioChannelLayout_5_1_And_2_0,
			IsThereMAndEOnFile,
			Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs,
			IsAudioDiscreate,
			AudioOrVideoSyncCheckedOrLogged,
			HasAllFileMetadatBeenChecked,
			FileFormat,
			Codec,
			StandardOrFrameRate,
			Resolution,
			Progressive,
			CLAPPresent,
			ColourPrimaries,
			TransferCharacteristics,
			MatrixCoefficients
			
			)
	        SELECT
			@QCNum,
            @subQCNum,
            @CustId,
            @ChecklistCompleted,
			@IsFile,
			@WasOVReportSupplied,
			@WereAllLocalisedTextDocumentsSupplied,
			@WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied,
			@DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant,
			@HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig,
			@HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme,
			@IsCreatedLanguageVariantFileNormalVideoRange,
			@AreAllInsertsNormalVideoRange,
			@AreAllInsertsEditedCorrectly,
			@HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar,
			@FirstAndLastCutBeenCheckedOrloggedAsReference,
			@IsTheDubCardPresentAtEndFeatureAndOnSeparateFileSupplied,
			@IsDubCardNormalVideoRange,
			@HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar,
			@HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked,
			@IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail  ,
			@IsAudioOnFileOV,
			@IsTheAudioChannelLayout_5_1_And_2_0,
			@IsThereMAndEOnFile,
			@Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs,
			@IsAudioDiscreate,
			@AudioOrVideoSyncCheckedOrLogged,
			@HasAllFileMetadatBeenChecked,
			@FileFormat  ,
			@Codec  ,
			@StandardOrFrameRate  ,
			@Resolution  ,
			@Progressive,
			@CLAPPresent,
			@ColourPrimaries  ,
			@TransferCharacteristics  ,
			@MatrixCoefficients  

	     END
	   ELSE 
	     BEGIN
	     	       
	        UPDATE [bward].[ChecklistWarner]
			SET  ChecklistCompleted = @ChecklistCompleted,
			IsFile = @IsFile,
            WasOVReportSupplied = @WasOVReportSupplied,
			WereAllLocalisedTextDocumentsSupplied = @WereAllLocalisedTextDocumentsSupplied,
			WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied = @WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied,
			DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant = @DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant,
			HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig= @HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig,
			HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme = @HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme,
			IsCreatedLanguageVariantFileNormalVideoRange = @IsCreatedLanguageVariantFileNormalVideoRange,
			AreAllInsertsNormalVideoRange = @AreAllInsertsNormalVideoRange,
			AreAllInsertsEditedCorrectly = @AreAllInsertsEditedCorrectly,
			HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar = @HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar,
			FirstAndLastCutBeenCheckedOrloggedAsReference= @FirstAndLastCutBeenCheckedOrloggedAsReference,
			IsTheDubCardPresentAtEndFeatureAndOnSeparateFileSupplied = @IsTheDubCardPresentAtEndFeatureAndOnSeparateFileSupplied,
			IsDubCardNormalVideoRange = @IsDubCardNormalVideoRange,
			HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar= @HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar,
			HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked = @HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked,
			IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail = @IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail,
			IsAudioOnFileOV = @IsAudioOnFileOV,
			IsTheAudioChannelLayout_5_1_And_2_0 = @IsTheAudioChannelLayout_5_1_And_2_0,
			IsThereMAndEOnFile = @IsThereMAndEOnFile,
			Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs = @Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs,
			IsAudioDiscreate = @IsAudioDiscreate,
			AudioOrVideoSyncCheckedOrLogged = @AudioOrVideoSyncCheckedOrLogged,
			HasAllFileMetadatBeenChecked= @HasAllFileMetadatBeenChecked,
			FileFormat = @FileFormat,
			Codec = @Codec,
			StandardOrFrameRate = @StandardOrFrameRate,
			Resolution = @Resolution,
			Progressive = @Progressive,
			CLAPPresent  = @CLAPPresent,
			ColourPrimaries = @ColourPrimaries,
			TransferCharacteristics = @TransferCharacteristics,
			MatrixCoefficients = @MatrixCoefficients
    		WHERE [QCNum] = @QCNum
			AND [subQCNum] = @subQCNum 
	        
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'Could not insert or update ChecklistWarner tables: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO