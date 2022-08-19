
/****** Object:  StoredProcedure [bward].[sp_SelectTextInfo]    Script Date: 11/06/2015 14:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_SelectTextInfo]
	@_QCNum int,
	@_rev int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT 
		QCNum, subQCNum, TextInfoID, TextInfo, TimeCodeIn, TimeCodeOut 
	FROM 
		[bward].qcTextInfo 
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
	ORDER BY 
		TimeCodeIn

	
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not select qcTextInfo (sp_SelectTextInfo)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END