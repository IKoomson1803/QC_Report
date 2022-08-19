
/****** Object:  StoredProcedure [bward].[sp_UpdateIndividualSpecs]    Script Date: 11/11/2015 17:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateIndividualSpecs]
	@_QCNum int,
	@_Rev int,
	@_hBlank VARCHAR(16) = NULL,
	@_vBlank VARCHAR(16) = NULL,
	@_cc CHAR(10) = NULL,
	@_vRF CHAR(10) = NULL,
	@_srcBarcode CHAR(10) = NULL,
	@_burstLvl CHAR(10) = NULL,
	@_syncLvl CHAR(10) = NULL,
	@_frontPorch CHAR(10) = NULL,
	@_chConditions CHAR(10) = NULL,
	@_slate CHAR(5) = NULL,
	@_vits CHAR(10) = NULL,
	@_virs CHAR(10) = NULL,
	@_vitc CHAR(7) = NULL,
	@_tracking CHAR(5) = NULL,
	@_label CHAR(5) = NULL,
	@_controlTrack CHAR(5) = NULL,
	@_shipper CHAR(5) = NULL,
	@_tapeWrap CHAR(5) = NULL,
	@_subtitle VARCHAR(30) = NULL
	
AS
BEGIN
		DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcElement 
	SET 
		HBlank = @_hBlank,
		CloseCap = @_cc,
		src_Barcode = @_srcBarcode,
		VBlank = @_vBlank,
		Sync_Levl = @_syncLvl,
		RF = @_vRF,
		Burst_Levl = @_burstLvl,
		Front_Por = @_frontPorch,
		Channel_Cond = @_chConditions,
		Slate_QC = @_slate,
		VITS = @_vits,
		Tracking_qc = @_tracking,
		Labels_qc = @_label,
		VIRS = @_virs,
		ctl_track = @_controlTrack,
		shipper_qc = @_shipper,
		VITC = @_vitc,
		Tape_wrap_qc = @_tapeWrap,
		Subtitle_QC = @_subtitle
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
		
		

	
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcElement (sp_UpdateIndividualSpecs)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END