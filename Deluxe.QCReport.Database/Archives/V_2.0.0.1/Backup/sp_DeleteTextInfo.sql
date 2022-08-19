
/****** Object:  StoredProcedure [bward].[sp_DeleteTextInfo]    Script Date: 11/06/2015 16:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_DeleteTextInfo]
	@_QCNum int,
	@_rev int,
	@_tiid int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	DELETE FROM 
		[bward].qcTextInfo 
	WHERE 
		QCNum = @_QCNum
		AND subQCNum = @_rev
		AND TextInfoID = @_tiid

	IF @@ERROR <> 0
		BEGIN
			SET @errorMsg = 'Could not delete from qcTextInfo (sp_DeleteTextInfo)'
			GOTO Error
		END
			
	Error:

		IF (@errorMsg IS NOT NULL)
		BEGIN
			RAISERROR(@errorMsg, 16, 1)
		END
END