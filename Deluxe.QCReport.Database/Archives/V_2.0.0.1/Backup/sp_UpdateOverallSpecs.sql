
/****** Object:  StoredProcedure [bward].[sp_UpdateOverallSpecs]    Script Date: 11/11/2015 15:42:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateOverallSpecs]
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
	@_frSize VARCHAR(100) = NULL
	
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
		Frame_Size = @_frSize
		
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