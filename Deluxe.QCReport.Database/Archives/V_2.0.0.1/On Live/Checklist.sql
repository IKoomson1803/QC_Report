USE [QCSUK]
GO
/****** Object:  Table [bward].[Checklist]    Script Date: 08/06/2021 14:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[Checklist](
	[ChecklistId] [int] IDENTITY(1,1) NOT NULL,
	[QCNum] [int] NOT NULL,
	[subQCNum] [int] NOT NULL,
	[CustId] [int] NOT NULL,
	[Audio24TracksPresent] [bit] NULL,
	[AudioTrackLayout] [bit] NULL,
	[AudioCodec] [varchar](50) NULL,
	[AudioSampleRate] [varchar](50) NULL,
	[AudioBitRate] [varchar](50) NULL,
	[AudioBitDepth] [varchar](50) NULL,
	[AudioChannelsDiscrete] [bit] NULL,
	[AudioTracksLabelledOrtTaggedInQT] [bit] NULL,
	[FileType] [varchar](50) NULL,
	[FileName] [bit] NULL,
	[ProgrammeHeadBuild] [bit] NULL,
	[ProgrammeSlatePresent] [bit] NULL,
	[ProgrammeStart1stBlackVideoAndAudio] [bit] NULL,
	[ProgrammeBlackBetweenProgrammeAndTextlessElements] [bit] NULL,
	[ProgrammeTextlessElementsPresent] [bit] NULL,
	[ProgrammeFullTextlessCoversForTextedShotsPresent] [bit] NULL,
	[ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot] [bit] NULL,
	[ProgrammeTextlessGaps1Or2s] [bit] NULL,
	[ProgrammeEnd1stBlackVideoAndAudio] [bit] NULL,
	[VideoJesExtensifier] [bit] NULL,
	[VideoContainerOrWrapper] [varchar](50) NULL,
	[VideoTimecode] [bit] NULL,
	[VideoCodec] [varchar](50) NULL,
	[VideoResolution] [varchar](50) NULL,
	[VideoFrameRateOrStandard] [varchar](50) NULL,
	[VideoDisplayAspectRatio] [varchar](50) NULL,
	[VideoProgressive] [bit] NULL,
	[VideoCLAP] [bit] NULL,
	[VideoColourPrimaries] [bit] NULL,
	[VideoTransferCharacteristics] [bit] NULL,
	[VideoMatrixCoefficients] [bit] NULL,
	[ChecklistCompleted] [bit] NOT NULL,
	[StandardDefinition] [varchar](50) NULL,
	[IsFile] [bit] NULL,
 CONSTRAINT [PK_bward]].[Checklist] PRIMARY KEY CLUSTERED 
(
	[ChecklistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [bward].[Checklist]  WITH NOCHECK ADD  CONSTRAINT [FK_checklist_qcHeader] FOREIGN KEY([QCNum], [subQCNum])
REFERENCES [bward].[qcHeader] ([Qcnum], [subQcnum])
GO
ALTER TABLE [bward].[Checklist] CHECK CONSTRAINT [FK_checklist_qcHeader]
GO

/****** Object:  StoredProcedure [bward].[ins_up_InsertOrUpdateChecklist]    Script Date: 08/06/2021 14:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateChecklist]
	-- Add the parameters for the stored procedure here
    @ChecklistId INT = 0,
	@Qcnum INT,
    @subQcnum INT,
    @CustId INT,
	@Audio24TracksPresent BIT = NULL,
	@AudioTrackLayout BIT = NULL,
	@AudioCodec VARCHAR(50) = NULL,
	@AudioSampleRate VARCHAR(50) = NULL,
	@AudioBitRate VARCHAR(50) = NULL,
	@AudioBitDepth  VARCHAR(50) = NULL,
	@AudioChannelsDiscrete BIT = NULL,
	@AudioTracksLabelledOrtTaggedInQT BIT = NULL,
	@FileType VARCHAR(50) = NULL,
	@FileName BIT = NULL,
	@ProgrammeHeadBuild BIT = NULL,
	@ProgrammeSlatePresent BIT = NULL,
	@ProgrammeStart1stBlackVideoAndAudio BIT = NULL,
	@ProgrammeBlackBetweenProgrammeAndTextlessElements BIT = NULL,
	@ProgrammeTextlessElementsPresent  BIT = NULL,
	@ProgrammeFullTextlessCoversForTextedShotsPresent BIT = NULL,
	@ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot BIT = NULL,
	@ProgrammeTextlessGaps1Or2s BIT = NULL,
	@ProgrammeEnd1stBlackVideoAndAudio BIT = NULL,
	@VideoJesExtensifier BIT = NULL,
	@VideoContainerOrWrapper VARCHAR(50) = NULL,
	@VideoTimecode  BIT = NULL,
	@VideoCodec VARCHAR(50) = NULL,
	@VideoResolution VARCHAR(50) = NULL,
	@VideoFrameRateOrStandard  VARCHAR(50) = NULL,
	@VideoDisplayAspectRatio  VARCHAR(50) = NULL,
	@VideoProgressive   BIT = NULL,
	@VideoCLAP  BIT = NULL,
	@VideoColourPrimaries BIT = NULL,
	@VideoTransferCharacteristics BIT = NULL,
	@VideoMatrixCoefficients BIT = NULL,
	@ChecklistCompleted BIT = 0,
	@StandardDefinition  VARCHAR(50) = NULL,
	@IsFile  BIT = NULL
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)


	SELECT @ChecklistId = [ChecklistId] from [bward].[Checklist] WHERE [QCNum] = @Qcnum AND [subQCNum] =  @subQcnum
	
		
	BEGIN TRY
		 
	   IF @ChecklistId IS NULL OR @ChecklistId = 0
	     BEGIN
	        INSERT INTO [bward].[Checklist](
			[QCNum],
            [subQCNum],
            [CustId],
            [Audio24TracksPresent],
            [AudioTrackLayout],
            [AudioCodec],
            [AudioSampleRate],
            [AudioBitRate],
			[AudioBitDepth],
		    [AudioChannelsDiscrete],
            [AudioTracksLabelledOrtTaggedInQT],
            [FileType],
            [FileName],
            [ProgrammeHeadBuild],
            [ProgrammeSlatePresent],
            [ProgrammeStart1stBlackVideoAndAudio],
            [ProgrammeBlackBetweenProgrammeAndTextlessElements],
            [ProgrammeTextlessElementsPresent],
		    [ProgrammeFullTextlessCoversForTextedShotsPresent],
			[ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot],
            [ProgrammeTextlessGaps1Or2s],
            [ProgrammeEnd1stBlackVideoAndAudio],
		    [VideoJesExtensifier],
            [VideoContainerOrWrapper],
            [VideoTimecode],
            [VideoCodec],
            [VideoResolution],
            [VideoFrameRateOrStandard],
            [VideoDisplayAspectRatio],
            [VideoProgressive],
            [VideoCLAP],
            [VideoColourPrimaries],
            [VideoTransferCharacteristics],
            [VideoMatrixCoefficients],
            [ChecklistCompleted],
            [StandardDefinition],
            [IsFile]
			)
	        SELECT
			@QCNum,
            @subQCNum,
            @CustId,
            @Audio24TracksPresent,
            @AudioTrackLayout,
            @AudioCodec,
            @AudioSampleRate,
            @AudioBitRate,
			@AudioBitDepth,
		    @AudioChannelsDiscrete,
            @AudioTracksLabelledOrtTaggedInQT,
            @FileType,
            @FileName,
            @ProgrammeHeadBuild,
            @ProgrammeSlatePresent,
            @ProgrammeStart1stBlackVideoAndAudio,
            @ProgrammeBlackBetweenProgrammeAndTextlessElements,
            @ProgrammeTextlessElementsPresent,
		    @ProgrammeFullTextlessCoversForTextedShotsPresent,
			@ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot,
            @ProgrammeTextlessGaps1Or2s,
            @ProgrammeEnd1stBlackVideoAndAudio,
		    @VideoJesExtensifier,
            @VideoContainerOrWrapper,
            @VideoTimecode,
            @VideoCodec,
            @VideoResolution,
            @VideoFrameRateOrStandard,
            @VideoDisplayAspectRatio,
            @VideoProgressive,
            @VideoCLAP,
            @VideoColourPrimaries,
            @VideoTransferCharacteristics,
            @VideoMatrixCoefficients,
            @ChecklistCompleted,
			@StandardDefinition,
			@IsFile 
	     END
	   ELSE 
	     BEGIN
	     	       
	        UPDATE [bward].[Checklist]
	        SET  [Audio24TracksPresent] = @Audio24TracksPresent,
            [AudioTrackLayout] = @AudioTrackLayout ,
            [AudioCodec]  = @AudioCodec ,
            [AudioSampleRate]= @AudioSampleRate ,
            [AudioBitRate]= @AudioBitRate ,
			[AudioBitDepth]= @AudioBitDepth ,
		    [AudioChannelsDiscrete]= @AudioChannelsDiscrete ,
            [AudioTracksLabelledOrtTaggedInQT]= @AudioTracksLabelledOrtTaggedInQT ,
            [FileType]= @FileType ,
            [FileName]= @FileName ,
            [ProgrammeHeadBuild]= @ProgrammeHeadBuild,
            [ProgrammeSlatePresent]= @ProgrammeSlatePresent ,
            [ProgrammeStart1stBlackVideoAndAudio]= @ProgrammeSlatePresent ,
            [ProgrammeBlackBetweenProgrammeAndTextlessElements]= @ProgrammeBlackBetweenProgrammeAndTextlessElements ,
            [ProgrammeTextlessElementsPresent]= @ProgrammeTextlessElementsPresent ,
		    [ProgrammeFullTextlessCoversForTextedShotsPresent]= @ProgrammeFullTextlessCoversForTextedShotsPresent ,
			[ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot]= @ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot ,
            [ProgrammeTextlessGaps1Or2s]= @ProgrammeTextlessGaps1Or2s ,
            [ProgrammeEnd1stBlackVideoAndAudio]= @ProgrammeEnd1stBlackVideoAndAudio ,
		    [VideoJesExtensifier]= @VideoJesExtensifier ,
            [VideoContainerOrWrapper]= @VideoContainerOrWrapper ,
            [VideoTimecode]= @VideoTimecode ,
            [VideoCodec]= @VideoCodec ,
            [VideoResolution]= @VideoResolution ,
            [VideoFrameRateOrStandard]= @VideoFrameRateOrStandard ,
            [VideoDisplayAspectRatio]= @VideoDisplayAspectRatio ,
            [VideoProgressive]= @VideoProgressive ,
            [VideoCLAP]= @VideoCLAP ,
            [VideoColourPrimaries]= @VideoColourPrimaries ,
            [VideoTransferCharacteristics]= @VideoTransferCharacteristics ,
            [VideoMatrixCoefficients]= @VideoMatrixCoefficients ,
            [ChecklistCompleted] = @ChecklistCompleted,
            [StandardDefinition] = @StandardDefinition,
            [IsFile] = @IsFile
			
			 WHERE [QCNum] = @QCNum
			 AND [subQCNum] = @subQCNum 
	        
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'Could not insert or update Checklist tables: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END


GO

