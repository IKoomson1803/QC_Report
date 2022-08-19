
/****** Object:  StoredProcedure [bward].[sp_SelectLog]    Script Date: 11/16/2015 13:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_SelectLog]
	@_QCNum int,
	@_rev int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT
		H.Qcnum, H.subQcnum, C.GradingScale
	FROM 
		[bward].qcHeader H
	JOIN 
		[bward].[qcClients] C on H.CustID = C.CustID
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
		
		
	SELECT 
		Time_Code, QC_Code, Note, QC_Grade, Action, 
		item_duratn, in_master, TimeID
	FROM 
		[bward].qcTime T
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
	ORDER BY 
		Time_Code



IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not select qcTime (sp_SelectLog)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END