
/****** Object:  StoredProcedure [bward].[sp_DeleteLog]    Script Date: 11/16/2015 13:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_DeleteLog]
	@_QCNum int,
	@_rev int,
	@_tid int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	DELETE FROM 
		[bward].qctime 
	WHERE 
		QCNum = @_QCNum AND 
		subQCNum = @_rev AND 
		TimeID = @_tid
	

IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not Delete qcTime (sp_DeleteLog)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END