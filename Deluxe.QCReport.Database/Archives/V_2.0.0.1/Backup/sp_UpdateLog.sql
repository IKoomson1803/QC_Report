
/****** Object:  StoredProcedure [bward].[sp_UpdateLog]    Script Date: 11/16/2015 13:46:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateLog]
	@_QCNum int,
	@_rev int,
	@_timeID int,
	@_tc CHAR(16) = NULL,
	@_qcCode CHAR(1) = NULL,
	@_note VARCHAR(750) = NULL,
	@_qcGrade CHAR(2) = NULL,
	@_action VARCHAR(750) = NULL,
	@_duration NVARCHAR(16) = NULL,
	@_inMaster BIT
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcTime 
	SET 
		Time_code = @_tc,
		QC_Code = @_qcCode,
		Note = @_note,
		QC_Grade = @_qcGrade,
		Action = @_action,
		item_Duratn = @_duration,
		in_Master = @_inMaster
		
	WHERE 
		QCNum = @_QCNum
		AND subQCNum = @_rev
		AND TimeID = @_timeID
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcTime (sp_UpdateLog)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END