
/****** Object:  StoredProcedure [bward].[sp_AddTextInfo]    Script Date: 11/06/2015 14:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_AddTextInfo]
	@_QCNum int,
	@_rev int,
	@_tcIn NVARCHAR(14) = NULL,
	@_tcOut NVARCHAR(14) = NULL,
	@_textinfo NVARCHAR(500) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	INSERT INTO 
		[bward].qcTextInfo 
		(QCNum, subQCNum, TextInfo, TimeCodeIn, TimeCodeOut)
	VALUES 
		(@_QCNum, @_rev, @_textinfo, @_tcIn, @_tcOut)
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not insert qcTextInfo (sp_AddTextInfo)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END