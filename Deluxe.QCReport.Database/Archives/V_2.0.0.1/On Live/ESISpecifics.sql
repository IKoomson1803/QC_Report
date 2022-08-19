USE [QCSUK]
GO

/****** Object:  StoredProcedure [bward].[sel_GetChecklist]    Script Date: 21/06/2021 13:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [bward].[sel_GetESISpecifics] 
	-- Add the parameters for the stored procedure here
	@Qcnum INT,
    @subQcnum INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [bward].[qcEndemolSpecifics]
	WHERE  [QCNum]  = @Qcnum
	AND [subQCNum] = @subQcnum
END

 GO

 /****** Object:  StoredProcedure [bward].[sp_UpdateFinal]    Script Date: 21/06/2021 13:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[up_UpdateESISpecifics]
	@Qcnum INT,
    @subQcnum INT,
	@ESIEndCreditOrLogo VARCHAR(3) = NULL,
	@SeamlessOrParted VARCHAR(15) = NULL,
	@IsTextlessPresent VARCHAR(3) = NULL,
	@ContentCensoredBleepedOrBlurred VARCHAR(3) = NULL,
	@FlashingLightsOrEpilepsyWarningPresent VARCHAR(3) = NULL,
	@TimeSpecificTextOrAudioPresent VARCHAR(3) = NULL,
	@ExtremeLanguagePresent VARCHAR(3) = NULL,
	@NudityPresent VARCHAR(3) = NULL,
	@IsMandEComplete VARCHAR(3) = NULL



	
AS
BEGIN
		DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].[qcEndemolSpecifics]
	SET 
		ESIEndCreditOrLogo = @ESIEndCreditOrLogo,
		SeamlessOrParted = @SeamlessOrParted,
		IsTextlessPresent = @IsTextlessPresent,
		ContentCensoredBleepedOrBlurred = @ContentCensoredBleepedOrBlurred,
		FlashingLightsOrEpilepsyWarningPresent = @FlashingLightsOrEpilepsyWarningPresent ,
		TimeSpecificTextOrAudioPresent = @TimeSpecificTextOrAudioPresent ,
		ExtremeLanguagePresent =  @ExtremeLanguagePresent ,
		NudityPresent = @NudityPresent,
		IsMandEComplete = @IsMandEComplete
	WHERE 
		[QCNum] = @Qcnum AND
	    [SubQCNum] =  @subQcnum
	
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update up_UpdateESISpecifics'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END

GO

/****** Object:  StoredProcedure [bward].[sel_GetESISpecifics]    Script Date: 22/06/2021 15:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [bward].[sel_GetESIFinal] 
	-- Add the parameters for the stored procedure here
	@Qcnum INT,
    @subQcnum INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	h.Eval_Stat  AS 'Status',
	h.Comments,
	es.* 
	FROM [bward].[qcHeader] h
	INNER JOIN	[bward].[qcEndemolVideoAndAudio] es
	ON h.Qcnum = es.QCNum
		WHERE  es.QCNum  = @Qcnum
	AND es.subQCNum = @subQcnum
END

GO

GO
/****** Object:  StoredProcedure [bward].[up_UpdateESISpecifics]    Script Date: 22/06/2021 13:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[up_UpdateESIFinal]
   @Qcnum INT,
   @subQcnum INT,
   @Status VARCHAR(40)=NULL, 
   @Comments VARCHAR(MAX) = NULL,
   @LuminanceLevelsRating VARCHAR(6) = NULL,
   @LuminanceLevelsDetails VARCHAR(255) = NULL,
   @BlackLevelsRating VARCHAR(6) = NULL,
   @BlackLevelsDetails VARCHAR(255) = NULL,
   @ChrominanceLevelsRating VARCHAR(6) = NULL,
   @ChrominanceLevelsDetails VARCHAR(255) = NULL,
   @AudioPeaksAndLoudnessRating VARCHAR(6) = NULL,
   @AudioPeaksAndLoudnessDetails VARCHAR(255) = NULL,
   @TitleSafeRating VARCHAR(6) = NULL,
   @TitleSafeDetails VARCHAR(255) = NULL,
   @QCResult VARCHAR(6) = NULL
AS
BEGIN
		DECLARE @ErrorMsg VARCHAR(300)
		
		IF @Status IS NOT NULL
		 BEGIN
		      IF @Status = 'PASSED'
			    BEGIN
				  SET @QCResult = 'PASS'
				END
              ELSE IF @Status = 'FAILED'
			    BEGIN
				  SET @QCResult = 'FAIL'
				END
              ELSE  IF @Status = 'HOLD'
			    BEGIN
				  SET @QCResult = 'HOLD'
				END
		 END
	
	
	UPDATE 
		[bward].[qcHeader]
	SET 
	   [Eval_Stat] = @Status, 
       [Comments]  = @Comments
	WHERE 
		[QCNum] = @Qcnum AND
	    [SubQCNum] =  @subQcnum

    UPDATE 
		[bward].[qcEndemolVideoAndAudio]
	SET 
	   LuminanceLevelsRating = @LuminanceLevelsRating,
	   LuminanceLevelsDetails = @LuminanceLevelsDetails,
	   BlackLevelsRating = @BlackLevelsRating,
	   BlackLevelsDetails =  @BlackLevelsDetails,
	   ChrominanceLevelsRating = @ChrominanceLevelsRating,
	   ChrominanceLevelsDetails = @ChrominanceLevelsDetails,
	   AudioPeaksAndLoudnessRating = @AudioPeaksAndLoudnessRating,
	   AudioPeaksAndLoudnessDetails = @AudioPeaksAndLoudnessDetails,
	   TitleSafeRating = @TitleSafeRating,
	   TitleSafeDetails = @TitleSafeDetails,
	   QCResult =  @QCResult,
	   QCResultDate = CURRENT_tIMESTAMP
	WHERE 
		[QCNum] = @Qcnum AND
	    [SubQCNum] =  @subQcnum
	
  IF @@ERROR <> 0
	 BEGIN
		SET @errorMsg = 'Could not update up_UpdateESIFinal'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END
GO
