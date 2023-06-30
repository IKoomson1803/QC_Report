USE [QCSUK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [bward].[qcHeader] ADD ColourRange VARCHAR(20) NULL

GO

/****** Object:  StoredProcedure [bward].[sp_SelectOverallSpecs]    Script Date: 30/06/2023 12:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[sp_SelectOverallSpecs]
	@_QCNum int,
	@_Rev int
AS
BEGIN
	
	SELECT	
			Lum_Peak, Chroma_Peak, Bar_Vid, Lum_Avg,
			Chroma_Avg, Bar_Chr, Black, IRE_MV, Bar_Set,
			Video_Codec,Video_Bit_Rate,Video_Bit_Depth,Bit_Rate_Mode,
			Audio_Codec,Audio_Bit_Rate,Audio_Bit_Depth,Sample_Rate,
			GOP_Structure,Gamut,Colour_Encoding,File_Size,
			Active_Picture,AssetType,Frame_Size,
			Timecode, HBlanking, VBlanking, PSEResult,
			DecodeCheck, MaxCLL, MaxFALL, ColourSpace, ColourRange
	FROM 
			[bward].qcHeader
	WHERE 
			Qcnum= @_QCNum AND subQcnum = @_Rev

END

GO

/****** Object:  StoredProcedure [bward].[sp_UpdateOverallSpecs]    Script Date: 30/06/2023 12:18:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[sp_UpdateOverallSpecs]
	@_QCNum int,
	@_Rev int,
	@_lumPeak VARCHAR(15) = NULL,
	@_chPeak VARCHAR(15) = NULL,
	@_barVid VARCHAR(15) = NULL,
	@_lumAvg VARCHAR(15) = NULL,
	@_chAvg VARCHAR(15) = NULL,
	@_barChr VARCHAR(15) = NULL,
	@_black VARCHAR(15) = NULL,
	@_ireMv CHAR(1) = NULL,
	@_barSet VARCHAR(15) = NULL,
	@_vidCodec VARCHAR(100) = NULL,
	@_vidRate VARCHAR(100) = NULL,
	@_vidDepth VARCHAR(100) = NULL,
	@_bitRateMode VARCHAR(100) = NULL,
	@_auCodec VARCHAR(100) = NULL,
	@_auRate VARCHAR(100) = NULL,
	@_auDepth VARCHAR(100) = NULL,
	@_sampleRate VARCHAR(100) = NULL,
	@_gop VARCHAR(100) = NULL,
	@_gamut VARCHAR(100) = NULL,
	@_colEnc VARCHAR(100) = NULL,
	@_fileSize VARCHAR(100) = NULL,
	@_actPic VARCHAR(100) = NULL,
	@_frSize VARCHAR(100) = NULL,

    @_timecode VARCHAR(11) = NULL,
	@_hblanking VARCHAR(50) = NULL,
	@_vblanking VARCHAR(50) = NULL,
	@_pseresult VARCHAR(10) = NULL,
	@_decodecheck VARCHAR(10) = NULL,
	@_maxcll VARCHAR(50) = NULL,
	@_maxfall VARCHAR(50) = NULL,
	@_colourspace VARCHAR(50) = NULL,
	@_colourrange VARCHAR(20) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	
	UPDATE 
		[bward].qcHeader
	SET 
		Lum_Peak = @_lumPeak,
		Chroma_Peak = @_chPeak,
		Bar_Vid = @_barVid,
		Lum_Avg = @_lumAvg,
		Chroma_Avg = @_chAvg,
		Bar_Chr = @_barChr,
		Black = @_black,
		IRE_MV = @_ireMv,
		Bar_Set = @_barSet,
		Video_Codec = @_vidCodec,
		Video_Bit_Rate = @_vidRate,
		Video_Bit_Depth = @_vidDepth,
		Bit_Rate_Mode = @_bitRateMode,
		Audio_Codec = @_auCodec,
		Audio_Bit_Rate = @_auRate,
		Audio_Bit_Depth = @_auDepth,
		Sample_Rate = @_sampleRate,
		GOP_Structure = @_gop,
		Gamut = @_gamut,
		Colour_Encoding = @_colEnc,
		File_Size = @_fileSize,
		Active_Picture = @_actPic,
		Frame_Size = @_frSize,
		--Timecode = @_timecode,
		HBlanking = @_hblanking,
		VBlanking = @_vblanking,
		PSEResult = @_pseresult,
		DecodeCheck = @_decodecheck, 
		MaxCLL = @_maxcll, 
		MaxFALL  = @_maxfall,
        ColourSpace = @_colourspace,
		ColourRange = @_colourrange
	WHERE 
		Qcnum= @_QCNum AND subQcnum = @_Rev

	
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
    @NotRequired bit,
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
			@NotRequired,
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
			NotRequired = @NotRequired,
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





