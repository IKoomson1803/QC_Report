
/****** Object:  StoredProcedure [bward].[sp_UpdateTextInfo]    Script Date: 11/06/2015 14:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateTextInfo]
	@_QCNum int,
	@_rev int,
	@_tcid int,
	@_tcIn NVARCHAR(14) = NULL,
	@_tcOut NVARCHAR(14) = NULL,
	@_textinfo NVARCHAR(500) = NULL
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcTextInfo 
	SET 
		TextInfo = @_textinfo,
		TimeCodeIn = @_tcIn,
		TimeCodeOut = @_tcOut
	WHERE 
		QCNum = @_QCNum
		AND subQCNum = @_rev
		AND TextInfoID = @_tcid
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcTextInfo (sp_UpdateTextInfo)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END