
/****** Object:  StoredProcedure [bward].[sp_SelectIndividualSpecs]    Script Date: 11/11/2015 17:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_SelectIndividualSpecs]
	@_QCNum int,
	@_Rev int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	
	SELECT 
		HBlank, CloseCap, Src_Barcode, 
		VBlank, Sync_Levl, RF, Burst_Levl,
		Front_Por, Channel_Cond, Slate_QC, VITS, Tracking_QC, 
		Labels_QC, VIRS, ctl_Track, Shipper_QC, VITC, 
		Tape_Wrap_QC, SubTitle_QC,
		AssetType
	
	FROM 
		[bward].qcElement E
	JOIN 
		[bward].qcHeader H ON E.qcNum = H.qcNum AND E.subQCNum = H.subQCNum
			
		WHERE 
			E.Qcnum= @_QCNum AND E.subQcnum = @_Rev

	
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not select qcElement or qcHeader (sp_SelectIndividualSpecs)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END