
/****** Object:  StoredProcedure [bward].[sp_AddLog]    Script Date: 11/16/2015 13:46:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_AddLog]
	@_QCNum int,
	@_rev int,
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
	
	INSERT INTO 
		[bward].qcTime 
	
		(QCNum, subQCNum, Time_code, QC_Code, Note, QC_Grade, Action, item_Duratn, in_Master)
	
	VALUES
		(@_QCNum, @_rev, @_tc, @_qcCode, @_note, @_qcGrade, @_action, @_duration, @_inMaster)
			
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not insert qcTime (sp_AddLog)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END