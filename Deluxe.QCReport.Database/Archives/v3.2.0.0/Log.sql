ALTER TABLE [bward].[qcTime] ADD item_num INT NULL
ALTER TABLE [bward].[qcTime] ADD ActionsForDisplay VARCHAR(100) NULL
GO

/****** Object:  StoredProcedure [bward].[sp_SelectLog]    Script Date: 24/11/2021 10:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[sp_SelectLog]
	@_QCNum int,
	@_rev int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	DECLARE @ItemNumberCount INT

	SELECT @ItemNumberCount = count(item_num)  FROM [bward].[qcTime] WHERE qcNum = @_QCNum AND subQCNum = @_rev 
	
	SELECT
		H.Qcnum, H.subQcnum, C.GradingScale
	FROM 
		[bward].qcHeader H
	JOIN 
		[bward].[qcClients] C on H.CustID = C.CustID
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
		
IF @ItemNumberCount = 0 -- For old Logs
	BEGIN 	
		SELECT 
			Time_Code, QC_Code, Note, QC_Grade, [Action], 
			item_duratn, in_master, TimeID, item_num, ActionsForDisplay
		FROM 
			[bward].qcTime T
		WHERE 
			qcNum = @_QCNum
			AND subQCNum = @_rev
		ORDER BY 
			Time_Code
    END
ELSE
    BEGIN
	     SELECT 
			Time_Code, QC_Code, Note, QC_Grade, [Action], 
			item_duratn, in_master, TimeID, item_num, ActionsForDisplay
		FROM 
			[bward].qcTime T
		WHERE 
			qcNum = @_QCNum
			AND subQCNum = @_rev
		ORDER BY 
			  COALESCE( item_num, 1000), Time_Code -- the NULL item numbers will be placed last in the result set
	END

IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not select qcTime (sp_SelectLog)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO

/****** Object:  StoredProcedure [bward].[sp_AddLog]    Script Date: 24/11/2021 12:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[sp_AddLog]
	@_QCNum int,
	@_rev int,
	@_tc CHAR(16) = NULL,
	@_qcCode CHAR(1) = NULL,
	@_note VARCHAR(750) = NULL,
	@_qcGrade CHAR(2) = NULL,
	@_action VARCHAR(255) = NULL,
	@_duration NVARCHAR(16) = NULL,
	@_inMaster BIT = NULL,
	@_itemNum INT = NULL,
	@_actionsForDisplay VARCHAR(100) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	INSERT INTO 
		[bward].qcTime 
	
		(QCNum, subQCNum, Time_code, QC_Code, Note, QC_Grade, [Action], item_Duratn, in_Master, item_num, ActionsForDisplay)
	
	VALUES
		(@_QCNum, @_rev, @_tc, @_qcCode, @_note, @_qcGrade, @_action, @_duration, @_inMaster, @_itemNum, @_actionsForDisplay)
			
		
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

GO

/****** Object:  StoredProcedure [bward].[sp_UpdateLog]    Script Date: 24/11/2021 11:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[sp_UpdateLog]
	@_QCNum int,
	@_rev int,
	@_timeID int,
	@_tc CHAR(16) = NULL,
	@_qcCode CHAR(1) = NULL,
	@_note VARCHAR(750) = NULL,
	@_qcGrade CHAR(2) = NULL,
	@_action VARCHAR(750) = NULL,
	@_duration NVARCHAR(16) = NULL,
	@_inMaster BIT = NULL,
	@_itemNum INT = NULL,
	@_actionsForDisplay VARCHAR(100) = NULL
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
		[Action] = @_action,
		item_Duratn = @_duration,
		in_Master = @_inMaster,
		item_num = @_itemNum,
		ActionsForDisplay = @_actionsForDisplay
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

GO