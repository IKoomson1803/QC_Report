
/****** Object:  StoredProcedure [bward].[sp_UpdateTapeLayoutTC]    Script Date: 11/05/2015 18:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].sp_UpdateTapeLayoutTC
	@_QCNum int,
	@_rev int,
	@_tapeid int,
	@_itemNum int,
	@_desc VARCHAR(255) = NULL,
	@_length NVARCHAR(16) = NULL,
	@_timecode CHAR(16) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcTapeFormat 
	SET 
		item_num = @_itemNum,
		Description = @_desc,
		Length = @_length,
		Time_code = @_timecode
	WHERE 
		QCNum = @_QCNum
		AND subQCNum = @_rev
		AND TapeFormatID = @_tapeid
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcTapeFormat (sp_UpdateTapeLayoutTC)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END