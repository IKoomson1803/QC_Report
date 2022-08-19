ALTER TABLE [bward].[qcHeader]
ADD Timecode varchar(11),
 HBlanking varchar(50),
 VBlanking varchar(50)

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
			Timecode, HBlanking, VBlanking 
	FROM 
			[bward].qcHeader
	WHERE 
			Qcnum= @_QCNum AND subQcnum = @_Rev

END

GO

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
			Timecode, HBlanking, VBlanking 
	FROM 
			[bward].qcHeader
	WHERE 
			Qcnum= @_QCNum AND subQcnum = @_Rev

END

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
	@_vblanking VARCHAR(50) = NULL
	
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
		Timecode = @_timecode,
		HBlanking = @_hblanking,
		VBlanking = @_vblanking
		
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
ALTER PROCEDURE [bward].[sp_SelectHeaderDetails]
	@_QCNum int,
	@_Rev int
AS
BEGIN
	
	SELECT	
			Pono, This_part, Tot_Part, QC_date, 
			Aspect, C.CustId as CstId, C.CustName as CstName, Show, Epis_no, Epis_Name, 
			Version, TapeDesc1, Format, Standard, TRT, TapeNumber, 
			Subtitle, HLanguage, Status, HeadLogo, TailLogo, AssetType, Filename, QC_Type,
			Timecode
	FROM 
			qcHeader H
	INNER JOIN 
			qcClients C ON H.CustId = C.CustID 
	GROUP BY 
			Pono, This_part, Tot_Part, QC_date,
			Aspect, C.CustId, C.CustName, Show, Epis_no, Epis_Name, 
			Version, TapeDesc1, Format, Standard, TRT, TapeNumber, 
			Subtitle, HLanguage, Status, HeadLogo, TailLogo, AssetType, Filename,
			Qcnum, subQcnum, QC_Type,Timecode
	HAVING 
			Qcnum= @_QCNum AND subQcnum = @_Rev

END

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
	@_show VARCHAR(40) = NULL,
	@_epNo VARCHAR(30) = NULL,
	@_epName VARCHAR(40) = NULL,
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
	@_timecode VARCHAR(11) = NULL
	
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
		Timecode = @_timecode
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