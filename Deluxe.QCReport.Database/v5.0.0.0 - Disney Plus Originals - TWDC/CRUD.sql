USE [QCSUK]
GO

INSERT INTO [bward].[qcClients] (CustName,GradingScale)
SELECT 'Disney Plus Originals - TWDC',5
WHERE NOT EXISTS (SELECT NULL FROM  [bward].[qcClients] WHERE CustName =  'Disney Plus Originals - TWDC')

GO


/****** Object:  Table [bward].[DisneyTWDCProgrammeDetails]    Script Date: 12/06/2023 10:49:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[DisneyTWDCProgrammeDetails](
	[QCNum] [int] NOT NULL,
	[SubQCNum] [int] NOT NULL,
	[WonderlandShortID] [varchar](50) NULL,
	[QCType] [varchar](100) NULL,
	[QCScope] [varchar](30) NULL,
	[QCProcess] [varchar](50) NULL,
	[ProcessNotes] [varchar](255) NULL,
	[CSRManager] [varchar](50) NULL,
	[FileCreationFacility] [varchar](50) NULL,
	[QCManager] [varchar](50) NULL
) ON [PRIMARY]
GO

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [bward].[sel_GetDisneyTWDCProgrammeDetails] 
	-- Add the parameters for the stored procedure here
	@QCNum int,
	@SubQcNum int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT 
	    h.Qcnum,
        h.subQcnum,
        WonderlandShortID,
        QCType,
        QCScope,
        QCProcess,
        ProcessNotes,
        CSRManager,
        FileCreationFacility,
        QCManager,
		h.QCVendor,
        h.Wonum 'WorkOrderNumber',
        h.Show 'Title' ,
		h.Epis_Name 'AssetName',
        h.Operator    'QCOperatorId',
        h.QC_date  'QCDate',
        h.QC_VTR  'QCPlaybackDevice',
        h.bay_num  'QCRoom'
  
	FROM 
		[bward].qcHeader h
		INNER JOIN [bward].qcUsers u ON h.Operator = u.qcUserID 
	    LEFT JOIN [bward].[DisneyTWDCProgrammeDetails] p on h.Qcnum = p.QCNum
	
	 WHERE
		h.Qcnum = @QCNum 
		AND h.subQcnum = @SubQcNum


END
GO

CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateDisneyTWDCProgrammeDetails]
	-- Add the parameters for the stored procedure here
  	@QCNum INT,
    @SubQCNum INT,
    @WonderlandShortID VARCHAR(50) = NULL,
    @QCType VARCHAR(100) = NULL,
    @QCScope VARCHAR(30) = NULL,
    @QCProcess VARCHAR(50) = NULL,
    @ProcessNotes VARCHAR(255) = NULL,
    @CSRManager VARCHAR(50) = NULL,
    @FileCreationFacility VARCHAR(50) = NULL,
    @QCManager VARCHAR(50) = NULL,

    -- Header
    @QCVendor VARCHAR(50) = NULL,
    @WorkOrderNumber VARCHAR(50) = NULL,  -- Not updatedable
    @Title NVARCHAR(255) = NULL,
    @AssetName NVARCHAR(255) = NULL,
    @QCOperatorId INT,
    @QCDate DATETIME,
    @QCPlaybackDevice  VARCHAR(20) = NULL,
    @QCRoom  VARCHAR(30) = NULL
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
					
	BEGIN TRY
		 
	   IF (SELECT COUNT(*) FROM [bward].[DisneyTWDCProgrammeDetails]
	       WHERE [QCNum] =  @QCNum
		   AND [SubQCNum]  = @SubQCNum) = 0
	     BEGIN
	        INSERT INTO [bward].[DisneyTWDCProgrammeDetails](
			QCNum,
            SubQCNum,
            WonderlandShortID,
			QCType,
			QCScope,
			QCProcess,
			ProcessNotes,
			CSRManager,
			FileCreationFacility,
			QCManager
			)
	        SELECT
			@QCNum,
            @subQCNum,
            @WonderlandShortID,
			@QCType,
			@QCScope,
			@QCProcess,
			@ProcessNotes,
			@CSRManager,
			@FileCreationFacility,
			@QCManager
	     END
	   ELSE 
	     BEGIN
	        UPDATE [bward].[DisneyTWDCProgrammeDetails]
			SET 
			SubQCNum = @SubQCNum,
            WonderlandShortID = @WonderlandShortID,
			QCType = @QCType,
			QCScope = @QCScope,
			QCProcess = @QCProcess,
			ProcessNotes = @ProcessNotes,
			CSRManager = @CSRManager,
			FileCreationFacility = @FileCreationFacility,
			QCManager = @QCManager
       		WHERE [QCNum] =  @QCNum
            AND [SubQCNum]  = @SubQCNum
	     END 

     --Update Header
	   BEGIN
	     UPDATE [bward].[qcHeader]
			SET 
			QCVendor = @QCVendor,
			Show = @Title,
			Epis_Name  = @AssetName,
			Operator =  @QCOperatorId,
			QC_date = @QCDate,
			QC_VTR =  @QCPlaybackDevice,
			bay_num =   @QCRoom
       		WHERE [QCNum] =  @QCNum
            AND [SubQCNum]  = @SubQCNum
         END
	 
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'ins_up_InsertOrUpdateDisneyTWDCProgrammeDetails failed: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO


/****** Object:  Table [bward].[DisneyTWDCElementInformation]    Script Date: 14/06/2023 16:39:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[DisneyTWDCElementInformation](
	[QCNum] [int] NOT NULL,
	[SubQCNum] [int] NOT NULL,
	[AssetType] [varchar](100) NULL,
	[AssetTypeNotes] [varchar](255) NULL,
	[CreatedFrom] [varchar](50) NULL,
	[CreatedFromNotes] [varchar](255) NULL,
	[AssetCreationDate] [datetime] NULL,
	[CanvasImageAspectRatio] [varchar](30) NULL,
	[FrameRate] [varchar](20) NULL,
	[ResolutionStandard] [varchar](30) NULL,
	[FileSize] [bigint] NULL,
	[TwoPopAtHead] [varchar](3) NULL,
	[TwoPopAtTail] [varchar](3) NULL,
	[CommercialBreaks] [varchar](3) NULL,
	[HeadLogos] [varchar](255) NULL,
	[TailLogos] [varchar](255) NULL,
	[TotalRuntime] [varchar](30) NULL,
	[ForensicWatermark] [varchar](10) NULL,
	[AudioConformedLanguage] [varchar](50) NULL,
	[AudioBitDepth] [varchar](10) NULL,
	[AudioSampleRate] [varchar](15) NULL,
	[ClosedCaptions] [varchar](3) NULL,
	[ClosedCaptionType] [varchar](10) NULL,
	[ValidAssetNaming] [varchar](3) NULL,
	[TextlessAtTail] [varchar](3) NULL,
	[LocalizedInserts] [varchar](3) NULL,
	[LocalizedSubtitles] [varchar](3) NULL,
	[SuperimposedText] [varchar](3) NULL,
	[ForcedNarratives] [varchar](3) NULL,
	[TextInTitleSafe] [varchar](3) NULL,
	[Censored] [varchar](3) NULL,
	[EDLProvided] [varchar](3) NULL
) ON [PRIMARY]
GO


