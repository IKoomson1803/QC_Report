
/****** Object:  StoredProcedure [bward].[sp_AddTapeLayoutTC]    Script Date: 11/05/2015 18:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].sp_AddTapeLayoutTC
	@_QCNum int,
	@_rev int,
	@_itemNum int,
	@_desc VARCHAR(255) = NULL,
	@_length NVARCHAR(16) = NULL,
	@_timecode CHAR(16) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	

	INSERT INTO 
		[bward].qcTapeFormat 
		(QCNum, subQCNum, item_num, Description, Length, Time_code) 
	VALUES 
		(@_QCNum, @_rev, @_itemNum, @_desc, @_length, @_timecode)
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not insert qcTapeFormat (sp_AddTapeLayoutTC)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END