
/****** Object:  StoredProcedure [bward].[sp_UpdateHeaderDetails]    Script Date: 11/05/2015 18:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateHeaderDetails]
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
	@_tailLogo NVARCHAR(100) = NULL
	
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
		TailLogo = @_tailLogo
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