INSERT INTO [bward].[qcClients] ([CustCode],[CustName])
SELECT 'N/A','DPP Eyeball'
GO

ALTER TABLE [bward].[qcHeader] ADD ProgrammeDetails VARCHAR(MAX) NULL
ALTER TABLE [bward].[qcHeader] ADD ProductionNumber VARCHAR(50) NULL
ALTER TABLE [bward].[qcHeader] ADD ProgrammeTitleAndNumber VARCHAR(255) NULL
ALTER TABLE [bward].[qcHeader] ADD ProductionCompany VARCHAR(150) NULL
ALTER TABLE [bward].[qcHeader] ADD ContactPhoneNumber VARCHAR(20) NULL
ALTER TABLE [bward].[qcHeader] ADD PostCompany VARCHAR(150) NULL
ALTER TABLE [bward].[qcHeader] ADD ProductPlacementLogoPresentAndInSafeArea BIT NULL
ALTER TABLE [bward].[qcHeader] ADD SponsorshipHeadAndTailPresent BIT NULL
ALTER TABLE [bward].[qcHeader] ADD TAndCsWithinSafeArea BIT NULL
ALTER TABLE [bward].[qcHeader] ADD AuthorisedBy VARCHAR(50) NULL
ALTER TABLE [bward].[qcHeader] ADD AuthorisedDate DATETIME NULL
ALTER TABLE [bward].[qcHeader] ADD JobTitle VARCHAR(100) NULL
ALTER TABLE [bward].[qcHeader] ALTER COLUMN Duration VARCHAR(20) NULL

GO


CREATE PROCEDURE [bward].[sel_GetDPPProgDetails]
    @QCNum INT,
	@SubQCNum INT
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT 
		QCNum,
		subQCNum ,
        [Show] 'SeriesTitle',
        [Epis_Name] 'EpisodeTitleAndNumber',
        [Duration],
        [Filename],
        [ProgrammeDetails],
        [ProductionNumber],
        [ProgrammeTitleAndNumber]
	FROM 
		[bward].[qcHeader]
	WHERE 
		qcNum = @QCNum
		AND subQCNum = @SubQCNum
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'sel_DPPProgDetails Failed '
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO


CREATE PROCEDURE [bward].[sel_GetDPPProdDetails]
    @QCNum INT,
	@SubQCNum INT
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT 
		QCNum,
		subQCNum ,
       [ProductionCompany],
        [ContactPhoneNumber],
        [PostCompany]
	FROM 
		[bward].[qcHeader]
	WHERE 
		qcNum = @QCNum
		AND subQCNum = @SubQCNum
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'sel_DPPProdDetails Failed '
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO

CREATE PROCEDURE [bward].[sel_GetDPPCommBroadcasters]
    @QCNum INT,
	@SubQCNum INT
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT 
		QCNum,
		subQCNum ,
        [ProductPlacementLogoPresentAndInSafeArea],
        [SponsorshipHeadAndTailPresent],
        [TAndCsWithinSafeArea]
	FROM 
		[bward].[qcHeader]
	WHERE 
		qcNum = @QCNum
		AND subQCNum = @SubQCNum
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'sel_DPPCommBroadcasters Failed '
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


CREATE PROCEDURE [bward].[sel_GetDPPProdSignOff]
    @QCNum INT,
	@SubQCNum INT
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT 
		QCNum,
		subQCNum ,
       [AuthorisedBy],
      [AuthorisedDate],
      [JobTitle]
	FROM 
		[bward].[qcHeader]
	WHERE 
		qcNum = @QCNum
		AND subQCNum = @SubQCNum
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'sel_GetDPPProdSignOff Failed '
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO


CREATE PROCEDURE [bward].[up_UpdateDPPProgDetails]
	@QCNum INT,
	@SubQCNum INT,			
	@ProgrammeDetails VARCHAR(MAX) = NULL,
	@Duration VARCHAR(11) = NULL,
	@Filename VARCHAR(255) = NULL,
	@ProductionNumber VARCHAR(50) = NULL,
	@SeriesTitle NVARCHAR(255) = NULL,
	@ProgrammeTitleAndNumber VARCHAR(255) = NULL,
	@EpisodeTitleAndNumber NVARCHAR(255) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].[qcHeader] 
	SET 
		ProgrammeDetails = @ProgrammeDetails,
	    Duration = @Duration,
		[Filename] = @Filename,
	    ProductionNumber = @ProductionNumber,
		Show = @SeriesTitle,
	    ProgrammeTitleAndNumber = @ProgrammeTitleAndNumber,
		Epis_Name = @EpisodeTitleAndNumber
	WHERE 
		Qcnum = @QCNum
		AND subQcnum = @SubQCNum
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'up_UpdateDPPProgDetails Failed'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO


CREATE PROCEDURE [bward].[up_UpdateDPPProdDetails]
	@QCNum INT,
	@SubQCNum INT,
	@ProductionCompany VARCHAR(150) = NULL,
	@ContactPhoneNumber VARCHAR(20) = NULL,
	@PostCompany VARCHAR(150) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].[qcHeader] 
	SET 
		 ProductionCompany = @ProductionCompany,
	    ContactPhoneNumber = @ContactPhoneNumber,
	    PostCompany = @PostCompany
	WHERE 
		Qcnum = @QCNum
		AND subQcnum = @SubQCNum
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'up_UpdateDPPProdDetails Failed'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO


CREATE PROCEDURE [bward].[up_UpdateDPPCommBroadcasters]
	@QCNum INT,
	@SubQCNum INT,
	@ProductPlacementLogoPresentAndInSafeArea BIT = NULL,
	@SponsorshipHeadAndTailPresent BIT = NULL,
	@TAndCsWithinSafeArea BIT = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].[qcHeader] 
	SET 
		ProductPlacementLogoPresentAndInSafeArea = @ProductPlacementLogoPresentAndInSafeArea,
	    SponsorshipHeadAndTailPresent = @SponsorshipHeadAndTailPresent,
	    TAndCsWithinSafeArea = @TAndCsWithinSafeArea
	WHERE 
		Qcnum = @QCNum
		AND subQcnum = @SubQCNum
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'up_UpdateDPPCommBroadcasters Failed'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO



CREATE PROCEDURE [bward].[up_UpdateDPPProdSignOff]
	@QCNum INT,
	@SubQCNum INT,
	@AuthorisedBy VARCHAR(50) = NULL,
	@AuthorisedDate DATETIME = NULL,
	@JobTitle VARCHAR(100) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].[qcHeader] 
	SET 
		AuthorisedBy = @AuthorisedBy,
	    AuthorisedDate = @AuthorisedDate ,
	    JobTitle = @JobTitle
	WHERE 
		Qcnum = @QCNum
		AND subQcnum = @SubQCNum
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'up_UpdateDPPProdSignOff Failed'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO



CREATE TABLE [bward].[ChecklistDPP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QCNum] [int] NOT NULL,
	[SubQCNum] [int] NOT NULL,
	[ChecklistCompleted] [bit] NOT NULL,
	[AQCWarningsReviewed] [bit] NULL,
	[PSEReportReviewed] [bit] NULL,
	[AS11DPPMetadataChecked] [bit] NULL,
	[AudioChannelLayoutMatchesMetadata] [bit] NULL,
	[MultichannelAudioMetadataMatches] [bit] NULL,
	[MultichannelDownMixSoundPhaseChecked] [bit] NULL,
	[ClockOrSlateInformationMatchesMetadata] [bit] NULL,
	[AFDcorrect] [bit] NULL,
	[StillsAreDeinterlacedCorrectly] [bit] NULL,
	[LineUpStartsAt_09_59_30_00] [bit] NULL,
	[FirstPartClockOrSlateStartsAt_09_59_50_00] [bit] NULL,
	[FirstPartProgrammeStartsAt_10_00_00_00] [bit] NULL,
	[CaptionsInsideSafeArea] [bit] NULL,
	[EndCreditsMeetBroadcasterBranding] [bit] NULL,
	[RollersAndMotionGFXAreInterlacedAndSmooth] [bit] NULL,
	[FreezeOrlivingHoldPresentAtEnd] [bit] NULL,
 CONSTRAINT [PK_DPPChecklist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


-- =============================================
CREATE PROCEDURE [bward].[sel_GetChecklistDPP] 
	-- Add the parameters for the stored procedure here
	@Qcnum INT,
    @subQcnum INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [bward].[ChecklistDPP]
	WHERE  [QCNum]  = @Qcnum
	AND [subQCNum] = @subQcnum
END

GO


CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateChecklistDPP]
	-- Add the parameters for the stored procedure here
    @Id INT = 0,
	@QCNum INT,
    @SubQCNum INT,
    @ChecklistCompleted BIT = 0,
	@AQCWarningsReviewed BIT = NULL,
    @PSEReportReviewed BIT = NULL,
    @AS11DPPMetadataChecked BIT = NULL,
    @AudioChannelLayoutMatchesMetadata BIT = NULL,
    @MultichannelAudioMetadataMatches BIT = NULL,
    @MultichannelDownMixSoundPhaseChecked BIT = NULL,
    @ClockOrSlateInformationMatchesMetadata BIT = NULL,
	@AFDcorrect BIT = NULL,
    @StillsAreDeinterlacedCorrectly BIT = NULL,
    @LineUpStartsAt_09_59_30_00 BIT = NULL,
    @FirstPartClockOrSlateStartsAt_09_59_50_00 BIT = NULL,
    @FirstPartProgrammeStartsAt_10_00_00_00 BIT = NULL,
    @CaptionsInsideSafeArea BIT = NULL,
    @EndCreditsMeetBroadcasterBranding BIT = NULL,
    @RollersAndMotionGFXAreInterlacedAndSmooth BIT = NULL,
    @FreezeOrlivingHoldPresentAtEnd BIT = NULL

  
	
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)


	SELECT @Id = Id from [bward].[ChecklistDPP] WHERE [QCNum] = @QCNum AND [SubQCNum] =  @SubQCNum
	
		
	BEGIN TRY
		 
	   IF @Id = 0
	     BEGIN
	        INSERT INTO [bward].[ChecklistDPP](
			QCNum,
            SubQCNum,
            ChecklistCompleted,
			AQCWarningsReviewed,
			PSEReportReviewed,
			AS11DPPMetadataChecked,
			AudioChannelLayoutMatchesMetadata,
			MultichannelAudioMetadataMatches,
			MultichannelDownMixSoundPhaseChecked,
			ClockOrSlateInformationMatchesMetadata,
			AFDcorrect,
			StillsAreDeinterlacedCorrectly,
			LineUpStartsAt_09_59_30_00,
			FirstPartClockOrSlateStartsAt_09_59_50_00,
			FirstPartProgrammeStartsAt_10_00_00_00,
			CaptionsInsideSafeArea,
			EndCreditsMeetBroadcasterBranding,
			RollersAndMotionGFXAreInterlacedAndSmooth,
			FreezeOrlivingHoldPresentAtEnd
			
			)
	        SELECT
			@QCNum,
            @subQCNum,
            @ChecklistCompleted,
			@AQCWarningsReviewed,
			@PSEReportReviewed,
			@AS11DPPMetadataChecked,
			@AudioChannelLayoutMatchesMetadata,
			@MultichannelAudioMetadataMatches,
			@MultichannelDownMixSoundPhaseChecked,
			@ClockOrSlateInformationMatchesMetadata,
			@AFDcorrect,
			@StillsAreDeinterlacedCorrectly,
			@LineUpStartsAt_09_59_30_00,
			@FirstPartClockOrSlateStartsAt_09_59_50_00,
			@FirstPartProgrammeStartsAt_10_00_00_00,
			@CaptionsInsideSafeArea,
			@EndCreditsMeetBroadcasterBranding,
			@RollersAndMotionGFXAreInterlacedAndSmooth,
			@FreezeOrlivingHoldPresentAtEnd

	     END
	   ELSE 
	     BEGIN
	     	       
	        UPDATE [bward].[ChecklistDPP]
			SET  ChecklistCompleted = @ChecklistCompleted,
			AQCWarningsReviewed = @AQCWarningsReviewed,
			PSEReportReviewed = @PSEReportReviewed,
			AS11DPPMetadataChecked = @AS11DPPMetadataChecked,
			AudioChannelLayoutMatchesMetadata = @AudioChannelLayoutMatchesMetadata,
			MultichannelAudioMetadataMatches = @MultichannelAudioMetadataMatches,
			MultichannelDownMixSoundPhaseChecked = @MultichannelDownMixSoundPhaseChecked,
			ClockOrSlateInformationMatchesMetadata = @ClockOrSlateInformationMatchesMetadata,
			AFDcorrect = @AFDcorrect,
			StillsAreDeinterlacedCorrectly = @StillsAreDeinterlacedCorrectly,
			LineUpStartsAt_09_59_30_00 = @LineUpStartsAt_09_59_30_00,
			FirstPartClockOrSlateStartsAt_09_59_50_00 = @FirstPartClockOrSlateStartsAt_09_59_50_00,
			FirstPartProgrammeStartsAt_10_00_00_00 = @FirstPartProgrammeStartsAt_10_00_00_00,
			CaptionsInsideSafeArea = @CaptionsInsideSafeArea,
			EndCreditsMeetBroadcasterBranding = @EndCreditsMeetBroadcasterBranding,
			RollersAndMotionGFXAreInterlacedAndSmooth = @RollersAndMotionGFXAreInterlacedAndSmooth,
			FreezeOrlivingHoldPresentAtEnd = @FreezeOrlivingHoldPresentAtEnd
       		WHERE [QCNum] = @QCNum
			AND [SubQCNum] = @subQCNum 
	        
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'ins_up_InsertOrUpdateChechlistDPP failed: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END



GO


CREATE TABLE [bward].[DPPLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QCNum] [int] NOT NULL,
	[SubQCNum] [int] NOT NULL,
	[TimeCode] [varchar](11) NULL,
	[Issue] [nvarchar](255) NULL,
	[ActionOrResolution] [nvarchar](255) NULL,
	[Initials] [nvarchar](30) NULL,
 CONSTRAINT [PK_DPPLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE PROCEDURE [bward].[sel_GetDPPLog] 
	-- Add the parameters for the stored procedure here
	@Qcnum INT,
    @subQcnum INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [bward].[DPPLog]
	WHERE  [QCNum]  = @Qcnum
	AND [subQCNum] = @subQcnum
END

GO


CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateDPPLog]
	-- Add the parameters for the stored procedure here
    @Id INT = 0,
	@QCNum INT,
    @SubQCNum INT,
    @TimeCode VARCHAR(11) = NULL,
    @Issue NVARCHAR(255) = NULL,
    @ActionOrResolution NVARCHAR(255) = NULL,
    @Initials NVARCHAR(30) = NULL
 
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	
			
	BEGIN TRY
		 
	   IF @Id = 0
	     BEGIN
	        INSERT INTO [bward].[DPPLog](
			QCNum,
            SubQCNum,
            TimeCode,
			Issue,
			ActionOrResolution,
			Initials
			)
	        SELECT
			@QCNum,
            @subQCNum,
            @TimeCode,
			@Issue,
			@ActionOrResolution,
			@Initials

	     END
	   ELSE 
	     BEGIN
	     	       
	        UPDATE [bward].[DPPLog]
			SET 
			TimeCode = @TimeCode,
			Issue = @Issue,
			ActionOrResolution = @ActionOrResolution,
			Initials = @Initials
       		WHERE Id =  @Id 
	        
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'ins_up_InsertOrUpdateDPPLog failed: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO

CREATE PROCEDURE [bward].[del_DeleteDPPLog]
	@Id int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	DELETE FROM 
		 [bward].[DPPLog]
	WHERE 
		Id = @Id
	

IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'del_DeleteDPPLog failed'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO	
