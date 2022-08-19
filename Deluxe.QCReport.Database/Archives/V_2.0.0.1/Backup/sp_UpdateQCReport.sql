
/****** Object:  StoredProcedure [bward].[sp_UpdateQCReport]    Script Date: 01/11/2016 16:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateQCReport]
	@_QCNum int,
	@_rev int,
	
	@qcCustId INT,
	@qcWONumber VARCHAR(10),
	@customer VARCHAR(50),
	@qcType VARCHAR(1),
	@qcUserId INT,
	@qcFullName VARCHAR(50),
	@assetType VARCHAR(50)
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcHeader 
	SET 
		woNum = @qcWONumber, 
		CustID = @qcCustId, 
		Operator = @qcUserId, 
		Revised_By = @qcFullName, 
		qc_type = @qcType, 
		AssetType = @assetType
				
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcHeader (sp_UpdateQCReport)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END