
/****** Object:  StoredProcedure [bward].[sp_SelectFinal]    Script Date: 11/11/2015 17:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_SelectFinal]
	@_QCNum int,
	@_Rev int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	
	SELECT 
		H.CustID, C.GradingScale, Eval_Stat, OTPercent, OTVer, CTPercent, CTVer, CapPercent, CapVer, grdVideo, grdAudio, grdOverall, 
		Broadcast_Suitable, Broadcast_Suitable_Reason, 
		DVD_Blu_Ray_Suitable, DVD_Blu_Ray_Suitable_Reason, 
		VOD_Suitable, VOD_Suitable_Reason, qc_type, Comments,RecommendationComments,VideoComments  
		
	FROM 
		[bward].[qcHeader] H		
	JOIN 
		[bward].[qcClients] C on H.CustID = C.CustID
	WHERE 
		Qcnum= @_QCNum AND subQcnum = @_Rev

	
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not select qcHeader (sp_SelectFinal)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END