
/****** Object:  StoredProcedure [bward].[sp_SelectTapeLayoutTC]    Script Date: 11/05/2015 18:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].sp_SelectTapeLayoutTC
	@_QCNum int,
	@_rev int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT 
		qcnum, subqcnum, TapeFormatID, item_num, Description, Time_Code, Length 
	FROM 
		[bward].qcTapeFormat 
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
	ORDER BY 
		item_num

	
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not select qcTapeFormat (sp_SelectTapeLayoutTC)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END