USE [QCSUK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [bward].[HDRMetadata]    Script Date: 29/06/2023 17:37:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[HDRMetadata](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QCNum] [int] NOT NULL,
	[SubQCNum] [int] NOT NULL,
	[NotRequired] [bit] NOT NULL,
	[HDRMetadataSupplied] [varchar](10) NULL,
	[HDRMetadataType] [varchar](50) NULL,
	[XmlAndBaseFileMetadataMatch] [varchar](50) NULL,
	[MaxCLL] [varchar](50) NULL,
	[MaxFALL] [varchar](50) NULL,
	[ColorPrimariesMastering] [varchar](20) NULL,
	[ColorPrimariesDolbyVision] [varchar](20) NULL,
	[WhitePointMastering] [varchar](20) NULL,
	[WhitePointDolbyVision] [varchar](20) NULL,
	[PeakBrightnessMastering] [varchar](50) NULL,
	[PeakBrightnessDolbyVision] [varchar](50) NULL,
	[MinimumBrightnessMastering] [varchar](50) NULL,
	[MinimumBrightnessDolbyVision] [varchar](50) NULL,
	[Encoding] [varchar](50) NULL,
	[ColourSpace] [varchar](50) NULL,
	[ColourRange] [varchar](10) NULL,
	[ColourPrimariesMatchVideoFile] [varchar](10) NULL,
	[FrameRateMatchVideoFile] [varchar](10) NULL,
	[CanvasAspectRatioMatchVideoFile] [varchar](10) NULL,
	[ImageAspectRatioMatchVideoFile] [varchar](10) NULL,
	[ColourRangeMatchVideoFile] [varchar](10) NULL,
 CONSTRAINT [PK_HDRMetadata] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE PROCEDURE [bward].[sel_GetHDRMMetadata]
    @QCNum INT,
	@SubQCNum INT
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT * FROM 
		[bward].[HDRMetadata]
	WHERE 
		qcNum = @QCNum
		AND subQCNum = @SubQCNum
	
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'sel_GetHDRMetadata '
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO


CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateHDRMMetadata]
	-- Add the parameters for the stored procedure here
    @Id INT = 0,
	@QCNum INT,
    @SubQCNum INT,
    @NotRequred bit,
    @HDRMetadataSupplied  VARCHAR(50) = NULL,
    @HDRMetadataType  VARCHAR(50) = NULL,
    @XmlAndBaseFileMetadataMatch  VARCHAR(50) = NULL,
    @MaxCLL  VARCHAR(50) = NULL,
    @MaxFALL  VARCHAR(50) = NULL,
    @ColorPrimariesMastering  VARCHAR(50) = NULL,
    @ColorPrimariesDolbyVision  VARCHAR(50) = NULL,
    @WhitePointMastering  VARCHAR(50) = NULL,
    @WhitePointDolbyVision  VARCHAR(50) = NULL,
    @PeakBrightnessMastering  VARCHAR(50) = NULL,
    @PeakBrightnessDolbyVision  VARCHAR(50) = NULL,
    @MinimumBrightnessMastering  VARCHAR(50) = NULL,
    @MinimumBrightnessDolbyVision  VARCHAR(50) = NULL,
    @Encoding  VARCHAR(50) = NULL,
    @ColourSpace  VARCHAR(50) = NULL,
    @ColourRange  VARCHAR(50) = NULL,
    @ColourPrimariesMatchVideoFile  VARCHAR(50) = NULL,
    @FrameRateMatchVideoFile  VARCHAR(50) = NULL,
    @CanvasAspectRatioMatchVideoFile  VARCHAR(50) = NULL,
    @ImageAspectRatioMatchVideoFile  VARCHAR(50) = NULL,
    @ColourRangeMatchVideoFile  VARCHAR(50) = NULL

AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
					
	BEGIN TRY
		 
	   IF (SELECT COUNT(*) FROM [bward].[HDRMetadata]
	       WHERE [QCNum] =  @QCNum
		   AND [SubQCNum]  = @SubQCNum) = 0
	     BEGIN
	        INSERT INTO [bward].[HDRMetadata](
			QCNum,
            SubQCNum,
			[NotRequired],
			HDRMetadataSupplied ,
		    HDRMetadataType ,
		    XmlAndBaseFileMetadataMatch ,
		    MaxCLL ,
		    MaxFALL ,
		    ColorPrimariesMastering ,
		    ColorPrimariesDolbyVision ,
		    WhitePointMastering ,
		    WhitePointDolbyVision ,
		    PeakBrightnessMastering ,
		    PeakBrightnessDolbyVision ,
		    MinimumBrightnessMastering ,
		    MinimumBrightnessDolbyVision ,
		    [Encoding] ,
		    ColourSpace ,
		    ColourRange ,
		    ColourPrimariesMatchVideoFile ,
		    FrameRateMatchVideoFile ,
		    CanvasAspectRatioMatchVideoFile ,
		    ImageAspectRatioMatchVideoFile ,
		    ColourRangeMatchVideoFile 
			)
	        SELECT
			@QCNum,
            @subQCNum,
			@NotRequred,
            @HDRMetadataSupplied ,
			@HDRMetadataType ,
			@XmlAndBaseFileMetadataMatch ,
			@MaxCLL ,
			@MaxFALL ,
			@ColorPrimariesMastering ,
			@ColorPrimariesDolbyVision ,
			@WhitePointMastering ,
			@WhitePointDolbyVision ,
			@PeakBrightnessMastering ,
			@PeakBrightnessDolbyVision ,
			@MinimumBrightnessMastering ,
			@MinimumBrightnessDolbyVision ,
			@Encoding ,
			@ColourSpace ,
			@ColourRange ,
			@ColourPrimariesMatchVideoFile ,
			@FrameRateMatchVideoFile ,
			@CanvasAspectRatioMatchVideoFile ,
			@ImageAspectRatioMatchVideoFile ,
			@ColourRangeMatchVideoFile 

	     END
	   ELSE 
	     BEGIN
	     	       
	        UPDATE [bward].[HDRMetadata]
			SET 
			NotRequired = @NotRequred,
			HDRMetadataSupplied = @HDRMetadataSupplied ,
		    HDRMetadataType = @HDRMetadataType ,
		    XmlAndBaseFileMetadataMatch  = @XmlAndBaseFileMetadataMatch,
		    MaxCLL = @MaxCLL ,
		    MaxFALL = @MaxFALL ,
		    ColorPrimariesMastering = @ColorPrimariesMastering ,
		    ColorPrimariesDolbyVision  = @ColorPrimariesDolbyVision,
		    WhitePointMastering  = @WhitePointMastering,
		    WhitePointDolbyVision  = @WhitePointDolbyVision,
		    PeakBrightnessMastering  = @PeakBrightnessMastering,
		    PeakBrightnessDolbyVision = @PeakBrightnessDolbyVision,
		    MinimumBrightnessMastering  = @MinimumBrightnessMastering,
		    MinimumBrightnessDolbyVision  = @MinimumBrightnessDolbyVision,
		    [Encoding]  = @Encoding,
		    ColourSpace = @ColourSpace ,
		    ColourRange  = @ColourRange,
		    ColourPrimariesMatchVideoFile  = @ColourPrimariesMatchVideoFile,
		    FrameRateMatchVideoFile = @FrameRateMatchVideoFile ,
		    CanvasAspectRatioMatchVideoFile = @CanvasAspectRatioMatchVideoFile ,
		    ImageAspectRatioMatchVideoFile  = @ImageAspectRatioMatchVideoFile,
		    ColourRangeMatchVideoFile  = @ColourRangeMatchVideoFile
		    WHERE [QCNum] =  @QCNum
            AND [SubQCNum]  = @SubQCNum
	        
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'ins_up_InsertOrUpdateHDRMMetadata]: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO





