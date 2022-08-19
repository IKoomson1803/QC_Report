
/****** Object:  StoredProcedure [bward].[sp_UpdateHistoryDetails]    Script Date: 11/06/2015 13:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateHistoryDetails]
	@_QCNum int,
	@_rev int,
	@_revDate datetime = NULL,
	@_revised_By VARCHAR(50) = NULL,
	@_operID int = NULL,
	@_bay_Num VARCHAR(30) = NULL,
	@_qcVTR VARCHAR(7) = NULL,
	@_stockMfg VARCHAR(20) = NULL,
	@_stockBatch VARCHAR(40) = NULL,
	@_recDate datetime = NULL,
	@_recVTR VARCHAR(9) = NULL,
	@_recFac VARCHAR(30) = NULL,
	@_srcFormat VARCHAR(50) = NULL,
	@_srcStandard VARCHAR(40) = NULL,
	@_srcDesc VARCHAR(40) = NULL,
	@_addInfo VARCHAR(80) = NULL,
	@_textless VARCHAR(5) = NULL,
	@_duration NVARCHAR(10) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcHeader 
	SET 
		Revised_by = @_revised_By,
		revised_date = @_revDate,
		Operator = @_operID,
		Bay_num = @_bay_Num,
		QC_VTR = @_qcVTR,
		Stock_Mfg = @_stockMfg,
		Stock_Batch = @_stockBatch,
		Rec_Date = @_recDate,
		Rec_VTR = @_recVTR,
		Rec_Fac = @_recFac,
		Src_Format = @_srcFormat,
		Src_Standard = @_srcStandard,
		src_desc = @_srcDesc,
		AddInfo = @_addInfo,
		Textless = @_textless,
		Duration = @_duration
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev

	IF @@ERROR <> 0
		BEGIN
			SET @errorMsg = 'Could not update qcHeader (sp_UpdateHistoryDetails)'
			GOTO Error
		END
			
	Error:

		IF (@errorMsg IS NOT NULL)
		BEGIN
			RAISERROR(@errorMsg, 16, 1)
		END
END