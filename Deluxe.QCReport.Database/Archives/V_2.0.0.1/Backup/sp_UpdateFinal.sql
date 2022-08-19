
/****** Object:  StoredProcedure [bward].[sp_UpdateFinal]    Script Date: 11/11/2015 17:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateFinal]
	@_QCNum int,
	@_Rev int,
	@_evalStatus VARCHAR(16) = NULL,
	@_oComments TEXT = NULL,
	@_aComments TEXT = NULL,
	@_vComments TEXT = NULL,
		
	@_otp NVARCHAR(3) = NULL,
	@_otv NVARCHAR(14) = NULL,
	@_ctp NVARCHAR(3) = NULL,
	@_ctv NVARCHAR(14) = NULL,
	@_capp NVARCHAR(3) = NULL,
	@_capv NVARCHAR(14) = NULL,
	
	@_gOverall INT = NULL,
	@_gAudio INT = NULL,
	@_gVideo INT = NULL,
	
	@_bcSuit VARCHAR(1) = NULL,
	@_bcSuitReason VARCHAR(2000) = NULL,
	@_dvdSuit VARCHAR(1) = NULL,
	@_dvdSuitReason VARCHAR(2000) = NULL,
	@_vodSuit VARCHAR(1) = NULL,
	@_vodSuitReason VARCHAR(2000) = NULL
	
AS
BEGIN
		DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcHeader 
	SET 
		Eval_Stat = @_evalStatus,
		Comments = @_oComments,
		RecommendationComments = @_aComments,
		VideoComments = @_vComments,
		OTPercent = @_otp,
		OTVer = @_otv,
		CTPercent = @_ctp,
		CTVer = @_ctv,
		CapPercent = @_capp,
		CapVer = @_capv,
		grdVideo = @_gVideo,
		grdAudio = @_gAudio,
		grdOverall = @_gOverall,
		Broadcast_Suitable = @_bcSuit,
		Broadcast_Suitable_Reason = @_bcSuitReason,
		DVD_Blu_Ray_Suitable = @_dvdSuit,
		DVD_Blu_Ray_Suitable_Reason = @_dvdSuitReason,
		VOD_Suitable = @_vodSuit,
		VOD_Suitable_Reason = @_vodSuitReason
		
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
		
		

	
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcHeader (sp_UpdateFinal)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END