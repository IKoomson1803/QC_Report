
/****** Object:  StoredProcedure [bward].[sp_DeleteTapeLayoutTC]    Script Date: 11/06/2015 13:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_DeleteTapeLayoutTC]
	@_QCNum int,
	@_rev int,
	@_tapeid int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	DELETE FROM 
		[bward].qcTapeFormat 
	WHERE 
		QCNum = @_QCNum
		AND subQCNum = @_rev
		AND TapeFormatID = @_tapeid

	IF @@ERROR <> 0
		BEGIN
			SET @errorMsg = 'Could not delete from qcTapeFormat (sp_DeleteTapeLayoutTC)'
			GOTO Error
		END
			
	Error:

		IF (@errorMsg IS NOT NULL)
		BEGIN
			RAISERROR(@errorMsg, 16, 1)
		END
END