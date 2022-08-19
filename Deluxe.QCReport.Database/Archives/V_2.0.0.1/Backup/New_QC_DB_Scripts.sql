
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


/****** Object:  StoredProcedure [bward].[sp_AddTextInfo]    Script Date: 11/06/2015 14:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_AddTextInfo]
	@_QCNum int,
	@_rev int,
	@_tcIn NVARCHAR(14) = NULL,
	@_tcOut NVARCHAR(14) = NULL,
	@_textinfo NVARCHAR(500) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	INSERT INTO 
		[bward].qcTextInfo 
		(QCNum, subQCNum, TextInfo, TimeCodeIn, TimeCodeOut)
	VALUES 
		(@_QCNum, @_rev, @_textinfo, @_tcIn, @_tcOut)
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not insert qcTextInfo (sp_AddTextInfo)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


/****** Object:  StoredProcedure [bward].[sp_DeleteLog]    Script Date: 11/16/2015 13:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_DeleteLog]
	@_QCNum int,
	@_rev int,
	@_tid int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	DELETE FROM 
		[bward].qctime 
	WHERE 
		QCNum = @_QCNum AND 
		subQCNum = @_rev AND 
		TimeID = @_tid
	

IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not Delete qcTime (sp_DeleteLog)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


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


/****** Object:  StoredProcedure [bward].[sp_DeleteTextInfo]    Script Date: 11/06/2015 16:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_DeleteTextInfo]
	@_QCNum int,
	@_rev int,
	@_tiid int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	DELETE FROM 
		[bward].qcTextInfo 
	WHERE 
		QCNum = @_QCNum
		AND subQCNum = @_rev
		AND TextInfoID = @_tiid

	IF @@ERROR <> 0
		BEGIN
			SET @errorMsg = 'Could not delete from qcTextInfo (sp_DeleteTextInfo)'
			GOTO Error
		END
			
	Error:

		IF (@errorMsg IS NOT NULL)
		BEGIN
			RAISERROR(@errorMsg, 16, 1)
		END
END


/****** Object:  StoredProcedure [bward].[sp_GetJobTree]    Script Date: 16/03/2021 17:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [bward].[sp_GetJobTree]
	-- Add the parameters for the stored procedure here
	@qcWONumber VARCHAR(10) = NULL,
	@qcNumber INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @ErrorMsg VARCHAR(300)
    
--SELECT 
--	DISTINCT woNum, QCNum, subQCNum, qc_type, revised_date 
--FROM 
--	[bward].qcHeader 
--WHERE 
--	(woNum = @qcWONumber OR @qcWONumber IS NULL)
--	AND
--	(QCNum = @qcNumber OR @qcNumber IS NULL)
--	AND 
--	Deleted = 0 
--ORDER BY 
--	qcNum

SELECT 
	DISTINCT woNum, QCNum, subQCNum, qc_type, revised_date 
FROM 
	[bward].qcHeader 
WHERE 
	(woNum = @qcWONumber OR @qcWONumber IS NULL)
	AND
	(QCNum = @qcNumber OR @qcNumber IS NULL)
	AND 
	Deleted = 0 
GROUP BY
	woNum, QCNum, subQCNum, qc_type, revised_date 
ORDER BY 
   QCNum,subQCNum
    
	
	IF @@ERROR <> 0
	BEGIN
	   SET @errorMsg = 'Could not select qc job in sp_GetJobTree'
	   RAISERROR(@errorMsg, 16, 1)
	END
     
END


/****** Object:  StoredProcedure [bward].[sp_GetQCDetails]    Script Date: 01/11/2016 13:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_GetQCDetails]
	@_QCNum int,
	@_Rev int
AS
BEGIN
	
	SELECT	
	
			woNum, QCNum, subQCNum, C.CustName as CstName, qc_type, AssetType
	
	FROM 
			qcHeader H
	INNER JOIN 
			qcClients C ON H.CustId = C.CustID 
	GROUP BY 
			woNum, QCNum, subQCNum, C.CustName, qc_type, AssetType
	HAVING 
			Qcnum= @_QCNum AND subQcnum = @_Rev


END


/****** Object:  StoredProcedure [bward].[sp_NewQCReport]    Script Date: 11/20/2015 13:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Isaac Koomson
-- Create date: 13/01/2012
-- Description:	Creates a new QC Report 

-- Modified By:	Isaac Koomson
-- Modification date: 16/08/2012
-- Description:	Modified to include Asset Type - File/Tape 

-- =============================================
ALTER PROCEDURE [bward].[sp_NewQCReport]
	-- Add the parameters for the stored procedure here
	@qcWONumber VARCHAR(10),
	@customer VARCHAR(50),
	@qcType VARCHAR(1),
	@qcUserId INT,
	@qcFullName VARCHAR(50),
	@assetType VARCHAR(50),
	@result INT = NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @ErrorMsg VARCHAR(300)
    DECLARE @lastQCNumber INT
    DECLARE @newQCNumber INT
    DECLARE @newSubQCNumber INT -- Revision Number
    DECLARE @customerId INT
    DECLARE @tapeLayout1 VARCHAR(50)
    DECLARE @tapeLayout2 VARCHAR(50)
    DECLARE @tapeLayout3 VARCHAR(50)
    DECLARE @tapeLayout4 VARCHAR(50)
    DECLARE @tapeLayout5 VARCHAR(50)
    DECLARE @tapeLayout6 VARCHAR(50)
    DECLARE @tapeLayout7 VARCHAR(50)
    DECLARE @tapeLayout8 VARCHAR(50)
    DECLARE @tapeLayout9 VARCHAR(50)
        
	 --Wrap in transaction
     BEGIN TRAN
     
     SELECT @lastQCNumber = LastQCNum FROM bward.qcConfig  -- Get the Last QC Number
     SET @newQCNumber = @lastQCNumber + 1
     SET @newSubQCNumber = 1  -- New Revison Number is always 1
     SELECT @customerId = CustID FROM qcClients WHERE CustName = LTRIM(RTRIM(@customer))
     
     SET @tapeLayout1 = 'Roll Up'
     SET @tapeLayout2  = 'Bars & Tone'
     SET @tapeLayout3 = 'Black'
     SET @tapeLayout4 = 'Slate'
     SET @tapeLayout5 = 'Black'
     SET @tapeLayout6 = 'Program'
     SET @tapeLayout7 = 'Black'
     SET @tapeLayout8 = 'Textless'
     SET @tapeLayout9 = 'Black'
     
     -- ********************** Insert QC Header **************************************************
     INSERT INTO qcHeader(woNum, QCNum, subQCNum, QC_date, CustID, Revised_date, Operator, Revised_By, this_Part, tot_Part, qc_type, AssetType) 
	 VALUES ( @qcWONumber, @newQCNumber, @newSubQCNumber, CURRENT_TIMESTAMP, @customerId, CURRENT_TIMESTAMP, @qcUserId, LTRIM(RTRIM(@qcFullName)), 1, 1, LTRIM(RTRIM(@qcType)), LTRIM(RTRIM(@assetType)))

	IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcHeader'
	   GOTO Error
	END
	
	-- ********************Insert QC AudioTC **********************************************************
	INSERT INTO qcAudioTC 
					(qcNum, subQCNum, language, Ch1_Desc,
					Ch2_Desc, 
					--Ch3_Desc, Ch4_Desc, 
					Cue_Desc, 
					Ch1_Tone, Ch2_Tone, 
					--Ch3_Tone, Ch4_Tone, 
					NR, Ch12_Phase, Ch34_Phase, Time_Code, 
					Tone_Phase, TCInteg, Comp_Sync) 
		VALUES (@newQCNumber, @newSubQCNumber, 'English', 'English Stereo Left',
				'English Stereo Right', 
				--'Music & Effects Stereo Right', 'Music & Effects Stereo Left', 
				'MOS', '-18dbFS', '-18dbFS', 
				--'-18dbFS', '-18dbFS', 
				'None', 'OK', 'OK', 'EBU', 'OK', 'OK', 'OK')
	
		
		IF @@ERROR <> 0
	      BEGIN
	       SET @errorMsg = 'Could not insert into qcAudioTC'
	       GOTO Error
	      END
	
	-- ********************Insert QC BVHE **********************************************************
     INSERT INTO qcBVHE (qcNum, subQCNum) VALUES ( @newQCNumber, @newSubQCNumber )
          
     IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcBVHE'
	   GOTO Error
	END
     
	-- ********************Insert QC Element**********************************************************
	INSERT INTO qcElement 
					(qcNum, subQCNum, part_num,
					HBlank, CloseCap, VBlank, Sync_levl, RF,
					Burst_levl, Serrations, front_por, Channel_Cond, Slate_QC, 
					VITS, Tracking_QC, Labels_QC, VIRS, ctl_track,
					Shipper_QC, VITC, Tape_Wrap_Qc, SubTitle_QC ) 
		VALUES (@newQCNumber, @newSubQCNumber, 1, 
				'11.8', 'No', '25', 'N/A', 'OK', 'N/A', 
				'N/A', 'N/A', 'OK', 'OK', 'N/A', 'OK', 'OK', 'N/A', 
				'OK', 'OK', '19/21', 'OK', 'NONE')
	
	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcElement'
	   GOTO Error
	END
	
	-- ********************Insert QC TapeFormat **********************************************************
	INSERT INTO qcTapeFormat (qcNum, subQCNum, Item_num, Description)
	SELECT @newQCNumber, @newSubQCNumber,1,@tapeLayout1 UNION 
	SELECT @newQCNumber, @newSubQCNumber,2,@tapeLayout2 UNION 
	SELECT @newQCNumber, @newSubQCNumber,3,@tapeLayout3 UNION
	SELECT @newQCNumber, @newSubQCNumber,4,@tapeLayout4 UNION  
	SELECT @newQCNumber, @newSubQCNumber,5,@tapeLayout5 UNION 
	SELECT @newQCNumber, @newSubQCNumber,6,@tapeLayout6 UNION 
	SELECT @newQCNumber, @newSubQCNumber,7,@tapeLayout7 UNION 
	SELECT @newQCNumber, @newSubQCNumber,8,@tapeLayout8 UNION 
	SELECT @newQCNumber, @newSubQCNumber,9,@tapeLayout9
	
	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcTapeFormat'
	   GOTO Error
	END
	
	
	-- ********************Insert QC CTISS **********************************************************
   INSERT INTO qcCTISS (qcNum, subQCNum) VALUES (@newQCNumber, @newSubQCNumber )

	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcCTISS'
	   GOTO Error
	END
	
	-- ********************Update the Last QC Number **********************************************************
	
	UPDATE bward.qcConfig SET LastQCNum = @newQCNumber, Flag = 'Saved'
	
	 IF @@ERROR <> 0
	 BEGIN
	   SET @errorMsg = 'Could not insert into qcConfig'
	   GOTO Error
	END
     
	-- ********************************************************************************************************

	
	IF (@errorMsg IS NULL)--Everything worked fine, commit transaction
	 BEGIN
		 COMMIT
	      SET @result = @newQCNumber
	 END
	 
Error:
	
	--If there is any error, then Roll back the Transaction
	IF (@errorMsg IS NOT NULL)
	BEGIN
		ROLLBACK TRAN
		SET @errorMsg = @errorMsg + ' in sp_NewQCReport'
		RAISERROR(@errorMsg, 16, 1)
	END	
	
END


/****** Object:  StoredProcedure [bward].[sp_SelectAudioTC]    Script Date: 11/09/2015 13:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_SelectAudioTC]
	@_QCNum int,
	@_rev int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT 
		Language, ChannelCount,
		Language1, Language2, Language3, Language4, Language5, Language6, 
		Language7, Language8, Language9, Language10, Language11, Language12, 
		Language13, Language14, Language15, Language16, Language17, Language18, 
		Language19, Language20, Language21, Language22, Language23, Language24,
		ch1_desc, ch1_LKFS, ch1_tone, ch1_avg, ch1_peak, ch1_TruePeak,
		ch2_desc, ch2_LKFS, ch2_tone, ch2_avg, ch2_peak, ch2_TruePeak,
		ch3_desc,  ch3_LKFS, ch3_tone, ch3_avg, ch3_peak, ch3_TruePeak,
		ch4_desc,  ch4_LKFS, ch4_tone, ch4_avg, ch4_peak, ch4_TruePeak,
		ch5_desc,  ch5_LKFS, ch5_tone, ch5_avg, ch5_peak, ch5_TruePeak,
		ch6_desc,  ch6_LKFS, ch6_tone, ch6_avg, ch6_peak, ch6_TruePeak,
		ch7_desc,  ch7_LKFS, ch7_tone, ch7_avg, ch7_peak, ch7_TruePeak,
		ch8_desc,  ch8_LKFS, ch8_tone, ch8_avg, ch8_peak, ch8_TruePeak,
		ch9_desc,  ch9_LKFS, ch9_tone, ch9_avg, ch9_peak, ch9_TruePeak,
		ch10_desc, ch10_LKFS,  ch10_tone, ch10_avg, ch10_peak, ch10_TruePeak,
		ch11_desc, ch11_LKFS,  ch11_tone, ch11_avg, ch11_peak, ch11_TruePeak,
		ch12_desc,  ch12_LKFS, ch12_tone, ch12_avg, ch12_peak, ch12_TruePeak,
		ch13_desc, ch13_LKFS,  ch13_tone, ch13_avg, ch13_peak, ch13_TruePeak,
		ch14_desc, ch14_LKFS,  ch14_tone, ch14_avg, ch14_peak, ch14_TruePeak,
		ch15_desc, ch15_LKFS,  ch15_tone, ch15_avg, ch15_peak, ch15_TruePeak,
		ch16_desc, ch16_LKFS,  ch16_tone, ch16_avg, ch16_peak, ch16_TruePeak,
		ch17_desc, ch17_LKFS,  ch17_tone, ch17_avg, ch17_peak, ch17_TruePeak,
		ch18_desc, ch18_LKFS,  ch18_tone, ch18_avg, ch18_peak, ch18_TruePeak,
		ch19_desc, ch19_LKFS,  ch19_tone, ch19_avg, ch19_peak, ch19_TruePeak,
		ch20_desc, ch20_LKFS,  ch20_tone, ch20_avg, ch20_peak, ch20_TruePeak,
		ch21_desc, ch21_LKFS,  ch21_tone, ch21_avg, ch21_peak, ch21_TruePeak,
		ch22_desc, ch22_LKFS,  ch22_tone, ch22_avg, ch22_peak, ch22_TruePeak,
		ch23_desc, ch23_LKFS,  ch23_tone, ch23_avg, ch23_peak, ch23_TruePeak,
		ch24_desc, ch24_LKFS,  ch24_tone, ch24_avg, ch24_peak, ch24_TruePeak,
		FullQC_Vid, FullQC_cue,
		FullQC_ch1, FullQC_ch2, FullQC_ch3, FullQC_ch4, 
		FullQC_ch5, FullQC_ch6, FullQC_ch7, FullQC_ch8, 
		FullQC_ch9, FullQC_ch10, FullQC_ch11, FullQC_ch12,
		FullQC_ch13,FullQC_ch14, FullQC_ch15, FullQC_ch16,
		FullQC_ch17,FullQC_ch18, FullQC_ch19, FullQC_ch20, 
		FullQC_ch21,FullQC_ch22, FullQC_ch23, FullQC_ch24,
		SpotQC_vid, SpotQC_cue, 
		SpotQC_ch1, SpotQC_ch2, SpotQC_ch3, SpotQC_ch4, 
		SpotQC_ch5, SpotQC_ch6, SpotQC_ch7, SpotQC_ch8,
		SpotQC_ch9, SpotQC_ch10, SpotQC_ch11, SpotQC_ch12,
		SpotQC_ch13,SpotQC_ch14, SpotQC_ch15, SpotQC_ch16,
		SpotQC_ch17,SpotQC_ch18, SpotQC_ch19, SpotQC_ch20, 
		SpotQC_ch21,SpotQC_ch22, SpotQC_ch23, SpotQC_ch24,
		cue_desc, cue_LKFS,  cue_tone, cue_avg, cue_peak, cue_TruePeak,
		NR, time_code, CH12_Phase, CH34_Phase, QCinUnity, LTC_VITC_Match, SurroundSound, 
		TCInteg, Tone_Phase, Comp_Sync
	FROM 
		[bward].qcAudioTC a
	JOIN [bward].qcHeader h on a.qcNum = h.Qcnum and a.subQCNum = h.subQcnum
	WHERE 
		a.qcNum = @_QCNum
		AND a.subQCNum = @_rev
	
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not select qcAudioTC (sp_SelectAudioTC)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


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


/****** Object:  StoredProcedure [bward].[sp_SelectHeaderDetails]    Script Date: 10/29/2015 17:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_SelectHeaderDetails]
	@_QCNum int,
	@_Rev int
AS
BEGIN
	
	SELECT	
			Pono, This_part, Tot_Part, QC_date, 
			Aspect, C.CustId as CstId, C.CustName as CstName, Show, Epis_no, Epis_Name, 
			Version, TapeDesc1, Format, Standard, TRT, TapeNumber, 
			Subtitle, HLanguage, Status, HeadLogo, TailLogo, AssetType, Filename, QC_Type 
	FROM 
			qcHeader H
	INNER JOIN 
			qcClients C ON H.CustId = C.CustID 
	GROUP BY 
			Pono, This_part, Tot_Part, QC_date,
			Aspect, C.CustId, C.CustName, Show, Epis_no, Epis_Name, 
			Version, TapeDesc1, Format, Standard, TRT, TapeNumber, 
			Subtitle, HLanguage, Status, HeadLogo, TailLogo, AssetType, Filename,
			Qcnum, subQcnum, QC_Type
	HAVING 
			Qcnum= @_QCNum AND subQcnum = @_Rev

END


/****** Object:  StoredProcedure [bward].[sp_SelectHistoryDetails]    Script Date: 10/29/2015 17:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_SelectHistoryDetails]
	@_QCNum int,
	@_Rev int
AS
BEGIN
	
	SELECT 
	Revised_By, Revised_Date, qcUserID, FullName, Bay_Num, AssetType,
	QC_VTR, Stock_Mfg, Stock_Batch, Rec_Date, Rec_VTR,
	Rec_Fac, Src_Format, Src_Standard, Src_Desc, AddInfo, textless, Duration,
	QCNum, subQcnum 
	
	FROM 
		[bward].qcHeader h
		INNER JOIN [bward].qcUsers u ON h.Operator = u.qcUserID 

	GROUP BY 
		Revised_By, Revised_Date, qcUserID, FullName, Bay_Num, AssetType,
		QC_VTR, Stock_Mfg, Stock_Batch, Rec_Date, Rec_VTR, 
		Rec_Fac, Src_Format, Src_Standard, Src_Desc, AddInfo, textless, Duration,
		QCNum, subQcnum 

	HAVING 
		Qcnum= @_QCNum AND subQcnum = @_Rev

END


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


/****** Object:  StoredProcedure [bward].[sp_SelectOverallSpecs]    Script Date: 11/11/2015 15:42:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_SelectOverallSpecs]
	@_QCNum int,
	@_Rev int
AS
BEGIN
	
	SELECT	
			Lum_Peak, Chroma_Peak, Bar_Vid, Lum_Avg,
			Chroma_Avg, Bar_Chr, Black, IRE_MV, Bar_Set,
			Video_Codec,Video_Bit_Rate,Video_Bit_Depth,Bit_Rate_Mode,
			Audio_Codec,Audio_Bit_Rate,Audio_Bit_Depth,Sample_Rate,
			GOP_Structure,Gamut,Colour_Encoding,File_Size,
			Active_Picture,AssetType,Frame_Size 
	FROM 
			[bward].qcHeader
	WHERE 
			Qcnum= @_QCNum AND subQcnum = @_Rev

END


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


/****** Object:  StoredProcedure [bward].[sp_SelectTextInfo]    Script Date: 11/06/2015 14:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_SelectTextInfo]
	@_QCNum int,
	@_rev int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT 
		QCNum, subQCNum, TextInfoID, TextInfo, TimeCodeIn, TimeCodeOut 
	FROM 
		[bward].qcTextInfo 
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
	ORDER BY 
		TimeCodeIn

	
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not select qcTextInfo (sp_SelectTextInfo)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


/****** Object:  StoredProcedure [bward].[sp_UpdateAudioTC]    Script Date: 11/10/2015 16:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateAudioTC]
	@_QCNum int,
	@_rev int,
	@_language1 VARCHAR(40) = NULL,
	@_language2 VARCHAR(40) = NULL,
	@_language3 VARCHAR(40) = NULL,
	@_language4 VARCHAR(40) = NULL,
	@_language5 VARCHAR(40) = NULL,
	@_language6 VARCHAR(40) = NULL,
	@_language7 VARCHAR(40) = NULL,
	@_language8 VARCHAR(40) = NULL,
	@_language9 VARCHAR(40) = NULL,
	@_language10 VARCHAR(40) = NULL,
	@_language11 VARCHAR(40) = NULL,
	@_language12 VARCHAR(40) = NULL,
	@_language13 VARCHAR(40) = NULL,
	@_language14 VARCHAR(40) = NULL,
	@_language15 VARCHAR(40) = NULL,
	@_language16 VARCHAR(40) = NULL,
	@_language17 VARCHAR(40) = NULL,
	@_language18 VARCHAR(40) = NULL,
	@_language19 VARCHAR(40) = NULL,
	@_language20 VARCHAR(40) = NULL,
	@_language21 VARCHAR(40) = NULL,
	@_language22 VARCHAR(40) = NULL,
	@_language23 VARCHAR(40) = NULL,
	@_language24 VARCHAR(40) = NULL,
	@_chCount VARCHAR(40) = NULL,
	@_ch1_Desc VARCHAR(40) = NULL,
	@_ch2_Desc VARCHAR(40) = NULL,
	@_ch3_Desc VARCHAR(40) = NULL,
	@_ch4_Desc VARCHAR(40) = NULL,
	@_ch5_Desc VARCHAR(40) = NULL,
	@_ch6_Desc VARCHAR(40) = NULL,
	@_ch7_Desc VARCHAR(40) = NULL,
	@_ch8_Desc VARCHAR(40) = NULL,
	@_ch9_Desc VARCHAR(40) = NULL,
	@_ch10_Desc VARCHAR(40) = NULL,
	@_ch11_Desc VARCHAR(40) = NULL,
	@_ch12_Desc VARCHAR(40) = NULL,
	@_ch13_Desc VARCHAR(40) = NULL,
	@_ch14_Desc VARCHAR(40) = NULL,
	@_ch15_Desc VARCHAR(40) = NULL,
	@_ch16_Desc VARCHAR(40) = NULL,
	@_ch17_Desc VARCHAR(40) = NULL,
	@_ch18_Desc VARCHAR(40) = NULL,
	@_ch19_Desc VARCHAR(40) = NULL,
	@_ch20_Desc VARCHAR(40) = NULL,
	@_ch21_Desc VARCHAR(40) = NULL,
	@_ch22_Desc VARCHAR(40) = NULL,
	@_ch23_Desc VARCHAR(40) = NULL,
	@_ch24_Desc VARCHAR(40) = NULL,
	@_cue_Desc VARCHAR(40) = NULL,
	@_ch1_LKFS VARCHAR(100) = NULL,
	@_ch2_LKFS VARCHAR(100) = NULL,
	@_ch3_LKFS VARCHAR(100) = NULL,
	@_ch4_LKFS VARCHAR(100) = NULL,
	@_ch5_LKFS VARCHAR(100) = NULL,
	@_ch6_LKFS VARCHAR(100) = NULL,
	@_ch7_LKFS VARCHAR(100) = NULL,
	@_ch8_LKFS VARCHAR(100) = NULL,
	@_ch9_LKFS VARCHAR(100) = NULL,
	@_ch10_LKFS VARCHAR(100) = NULL,
	@_ch11_LKFS VARCHAR(100) = NULL,
	@_ch12_LKFS VARCHAR(100) = NULL,
	@_ch13_LKFS VARCHAR(100) = NULL,
	@_ch14_LKFS VARCHAR(100) = NULL,
	@_ch15_LKFS VARCHAR(100) = NULL,
	@_ch16_LKFS VARCHAR(100) = NULL,
	@_ch17_LKFS VARCHAR(100) = NULL,
	@_ch18_LKFS VARCHAR(100) = NULL,
	@_ch19_LKFS VARCHAR(100) = NULL,
	@_ch20_LKFS VARCHAR(100) = NULL,
	@_ch21_LKFS VARCHAR(100) = NULL,
	@_ch22_LKFS VARCHAR(100) = NULL,
	@_ch23_LKFS VARCHAR(100) = NULL,
	@_ch24_LKFS VARCHAR(100) = NULL,
	@_cue_LKFS VARCHAR(100) = NULL,
	@_ch1_Tone VARCHAR(15) = NULL,
	@_ch2_Tone VARCHAR(15) = NULL,
	@_ch3_Tone VARCHAR(15) = NULL,
	@_ch4_Tone VARCHAR(15) = NULL,
	@_ch5_Tone VARCHAR(15) = NULL,
	@_ch6_Tone VARCHAR(15) = NULL,
	@_ch7_Tone VARCHAR(15) = NULL,
	@_ch8_Tone VARCHAR(15) = NULL,
	@_ch9_Tone VARCHAR(15) = NULL,
	@_ch10_Tone VARCHAR(15) = NULL,
	@_ch11_Tone VARCHAR(15) = NULL,
	@_ch12_Tone VARCHAR(15) = NULL,
	@_ch13_Tone VARCHAR(15) = NULL,
	@_ch14_Tone VARCHAR(15) = NULL,
	@_ch15_Tone VARCHAR(15) = NULL,
	@_ch16_Tone VARCHAR(15) = NULL,
	@_ch17_Tone VARCHAR(15) = NULL,
	@_ch18_Tone VARCHAR(15) = NULL,
	@_ch19_Tone VARCHAR(15) = NULL,
	@_ch20_Tone VARCHAR(15) = NULL,
	@_ch21_Tone VARCHAR(15) = NULL,
	@_ch22_Tone VARCHAR(15) = NULL,
	@_ch23_Tone VARCHAR(15) = NULL,
	@_ch24_Tone VARCHAR(15) = NULL,
	@_cue_Tone VARCHAR(15) = NULL,
	@_ch1_Avg VARCHAR(15) = NULL,
	@_ch2_Avg VARCHAR(15) = NULL,
	@_ch3_Avg VARCHAR(15) = NULL,
	@_ch4_Avg VARCHAR(15) = NULL,
	@_ch5_Avg VARCHAR(15) = NULL,
	@_ch6_Avg VARCHAR(15) = NULL,
	@_ch7_Avg VARCHAR(15) = NULL,
	@_ch8_Avg VARCHAR(15) = NULL,
	@_ch9_Avg VARCHAR(15) = NULL,
	@_ch10_Avg VARCHAR(15) = NULL,
	@_ch11_Avg VARCHAR(15) = NULL,
	@_ch12_Avg VARCHAR(15) = NULL,
	@_ch13_Avg VARCHAR(15) = NULL,
	@_ch14_Avg VARCHAR(15) = NULL,
	@_ch15_Avg VARCHAR(15) = NULL,
	@_ch16_Avg VARCHAR(15) = NULL,
	@_ch17_Avg VARCHAR(15) = NULL,
	@_ch18_Avg VARCHAR(15) = NULL,
	@_ch19_Avg VARCHAR(15) = NULL,
	@_ch20_Avg VARCHAR(15) = NULL,
	@_ch21_Avg VARCHAR(15) = NULL,
	@_ch22_Avg VARCHAR(15) = NULL,
	@_ch23_Avg VARCHAR(15) = NULL,
	@_ch24_Avg VARCHAR(15) = NULL,
	@_cue_Avg VARCHAR(15) = NULL,
	@_ch1_Peak VARCHAR(15) = NULL,
	@_ch2_Peak VARCHAR(15) = NULL,
	@_ch3_Peak VARCHAR(15) = NULL,
	@_ch4_Peak VARCHAR(15) = NULL,
	@_ch5_Peak VARCHAR(15) = NULL,
	@_ch6_Peak VARCHAR(15) = NULL,
	@_ch7_Peak VARCHAR(15) = NULL,
	@_ch8_Peak VARCHAR(15) = NULL,
	@_ch9_Peak VARCHAR(15) = NULL,
	@_ch10_Peak VARCHAR(15) = NULL,
	@_ch11_Peak VARCHAR(15) = NULL,
	@_ch12_Peak VARCHAR(15) = NULL,
	@_ch13_Peak VARCHAR(15) = NULL,
	@_ch14_Peak VARCHAR(15) = NULL,
	@_ch15_Peak VARCHAR(15) = NULL,
	@_ch16_Peak VARCHAR(15) = NULL,
	@_ch17_Peak VARCHAR(15) = NULL,
	@_ch18_Peak VARCHAR(15) = NULL,
	@_ch19_Peak VARCHAR(15) = NULL,
	@_ch20_Peak VARCHAR(15) = NULL,
	@_ch21_Peak VARCHAR(15) = NULL,
	@_ch22_Peak VARCHAR(15) = NULL,
	@_ch23_Peak VARCHAR(15) = NULL,
	@_ch24_Peak VARCHAR(15) = NULL,
	@_cue_Peak VARCHAR(15) = NULL,
	@_ch1_TruePeak VARCHAR(15) = NULL,
	@_ch2_TruePeak VARCHAR(15) = NULL,
	@_ch3_TruePeak VARCHAR(15) = NULL,
	@_ch4_TruePeak VARCHAR(15) = NULL,
	@_ch5_TruePeak VARCHAR(15) = NULL,
	@_ch6_TruePeak VARCHAR(15) = NULL,
	@_ch7_TruePeak VARCHAR(15) = NULL,
	@_ch8_TruePeak VARCHAR(15) = NULL,
	@_ch9_TruePeak VARCHAR(15) = NULL,
	@_ch10_TruePeak VARCHAR(15) = NULL,
	@_ch11_TruePeak VARCHAR(15) = NULL,
	@_ch12_TruePeak VARCHAR(15) = NULL,
	@_ch13_TruePeak VARCHAR(15) = NULL,
	@_ch14_TruePeak VARCHAR(15) = NULL,
	@_ch15_TruePeak VARCHAR(15) = NULL,
	@_ch16_TruePeak VARCHAR(15) = NULL,
	@_ch17_TruePeak VARCHAR(15) = NULL,
	@_ch18_TruePeak VARCHAR(15) = NULL,
	@_ch19_TruePeak VARCHAR(15) = NULL,
	@_ch20_TruePeak VARCHAR(15) = NULL,
	@_ch21_TruePeak VARCHAR(15) = NULL,
	@_ch22_TruePeak VARCHAR(15) = NULL,
	@_ch23_TruePeak VARCHAR(15) = NULL,
	@_ch24_TruePeak VARCHAR(15) = NULL,
	@_cue_TruePeak VARCHAR(15) = NULL,
	@_nr VARCHAR(10) = NULL,
	@_ch12Phase VARCHAR(17) = NULL,
	@_ch34Phase CHAR(10) = NULL,
	@_tonePhase VARCHAR(10) = NULL,
	@_timeCode VARCHAR(15) = NULL,
	@_tcInteg VARCHAR(15) = NULL,
	@_compSync VARCHAR(10) = NULL,
	@_qcInUnity NVARCHAR(3) = NULL,
	@_surroundSound NVARCHAR(3) = NULL,
	@_ltcMatch NVARCHAR(3) = NULL,
	
	@_fullQC_ch1 BIT = 0,
	@_fullQC_ch2 BIT = 0,
	@_fullQC_ch3 BIT = 0,
	@_fullQC_ch4 BIT = 0,
	@_fullQC_ch5 BIT = 0,
	@_fullQC_ch6 BIT = 0,
	@_fullQC_ch7 BIT = 0,
	@_fullQC_ch8 BIT = 0,
	@_fullQC_ch9 BIT = 0,
	@_fullQC_ch10 BIT = 0,
	@_fullQC_ch11 BIT = 0,
	@_fullQC_ch12 BIT = 0,
	@_fullQC_ch13 BIT = 0,
	@_fullQC_ch14 BIT = 0,
	@_fullQC_ch15 BIT = 0,
	@_fullQC_ch16 BIT = 0,
	@_fullQC_ch17 BIT = 0,
	@_fullQC_ch18 BIT = 0,
	@_fullQC_ch19 BIT = 0,
	@_fullQC_ch20 BIT = 0,
	@_fullQC_ch21 BIT = 0,
	@_fullQC_ch22 BIT = 0,
	@_fullQC_ch23 BIT = 0,
	@_fullQC_ch24 BIT = 0,
	@_fullQC_cue BIT = 0,
	@_spotQC_ch1 BIT = 0,
	@_spotQC_ch2 BIT = 0,
	@_spotQC_ch3 BIT = 0,
	@_spotQC_ch4 BIT = 0,
	@_spotQC_ch5 BIT = 0,
	@_spotQC_ch6 BIT = 0,
	@_spotQC_ch7 BIT = 0,
	@_spotQC_ch8 BIT = 0,
	@_spotQC_ch9 BIT = 0,
	@_spotQC_ch10 BIT = 0,
	@_spotQC_ch11 BIT = 0,
	@_spotQC_ch12 BIT = 0,
	@_spotQC_ch13 BIT = 0,
	@_spotQC_ch14 BIT = 0,
	@_spotQC_ch15 BIT = 0,
	@_spotQC_ch16 BIT = 0,
	@_spotQC_ch17 BIT = 0,
	@_spotQC_ch18 BIT = 0,
	@_spotQC_ch19 BIT = 0,
	@_spotQC_ch20 BIT = 0,
	@_spotQC_ch21 BIT = 0,
	@_spotQC_ch22 BIT = 0,
	@_spotQC_ch23 BIT = 0,
	@_spotQC_ch24 BIT = 0,
	@_spotQC_cue BIT = 0
	
AS
BEGIN

	SET XACT_ABORT ON
	
	DECLARE @ErrorMsg VARCHAR(300)
	
	BEGIN TRAN
	
	UPDATE 
		[bward].qcAudioTC 
	SET 
		Language1 = @_language1,
		Language2 = @_language2,
		Language3 = @_language3,
		Language4 = @_language4,
		Language5 = @_language5,
		Language6 = @_language6,
		Language7 = @_language7,
		Language8 = @_language8,
		Language9 = @_language9,
		Language10 = @_language10,
		Language11 = @_language11,
		Language12 = @_language12,
		Language13 = @_language13,
		Language14 = @_language14,
		Language15 = @_language15,
		Language16 = @_language16,
		Language17 = @_language17,
		Language18 = @_language18,
		Language19 = @_language19,
		Language20 = @_language20,
		Language21 = @_language21,
		Language22 = @_language22,
		Language23 = @_language23,
		Language24 = @_language24,
		ChannelCount = @_chCount,
		Ch1_Desc = @_ch1_Desc,
		Ch2_Desc = @_ch2_Desc,
		Ch3_Desc = @_ch3_Desc,
		Ch4_Desc = @_ch4_Desc,
		Ch5_Desc = @_ch5_Desc,
		Ch6_Desc = @_ch6_Desc,
		Ch7_Desc = @_ch7_Desc,
		Ch8_Desc = @_ch8_Desc,
		Ch9_Desc = @_ch9_Desc,
		Ch10_Desc = @_ch10_Desc,
		Ch11_Desc = @_ch11_Desc,
		Ch12_Desc = @_ch12_Desc,
		Ch13_Desc = @_ch13_Desc,
		Ch14_Desc = @_ch14_Desc,
		Ch15_Desc = @_ch15_Desc,
		Ch16_Desc = @_ch16_Desc,
		Ch17_Desc = @_ch17_Desc,
		Ch18_Desc = @_ch18_Desc,
		Ch19_Desc = @_ch19_Desc,
		Ch20_Desc = @_ch20_Desc,
		Ch21_Desc = @_ch21_Desc,
		Ch22_Desc = @_ch22_Desc,
		Ch23_Desc = @_ch23_Desc,
		Ch24_Desc = @_ch24_Desc,
		Cue_Desc = @_cue_Desc,
		Ch1_LKFS = @_ch1_LKFS,
		Ch2_LKFS = @_ch2_LKFS,
		Ch3_LKFS = @_ch3_LKFS,
		Ch4_LKFS = @_ch4_LKFS,
		Ch5_LKFS = @_ch5_LKFS,
		Ch6_LKFS = @_ch6_LKFS,
		Ch7_LKFS = @_ch7_LKFS,
		Ch8_LKFS = @_ch8_LKFS,
		Ch9_LKFS = @_ch9_LKFS,
		Ch10_LKFS = @_ch10_LKFS,
		Ch11_LKFS = @_ch11_LKFS,
		Ch12_LKFS = @_ch12_LKFS,
		Ch13_LKFS = @_ch13_LKFS,
		Ch14_LKFS = @_ch14_LKFS,
		Ch15_LKFS = @_ch15_LKFS,
		Ch16_LKFS = @_ch16_LKFS,
      	Ch17_LKFS = @_ch17_LKFS,
		Ch18_LKFS = @_ch18_LKFS,
		Ch19_LKFS = @_ch19_LKFS,
		Ch20_LKFS = @_ch20_LKFS,
		Ch21_LKFS = @_ch21_LKFS,
		Ch22_LKFS = @_ch22_LKFS,
		Ch23_LKFS = @_ch23_LKFS,
		Ch24_LKFS = @_ch24_LKFS,
		Cue_LKFS = @_cue_LKFS,
		Ch1_Tone = @_ch1_Tone,
		Ch2_Tone = @_ch2_Tone,
		Ch3_Tone = @_ch3_Tone,
		Ch4_Tone = @_ch4_Tone,
		Ch5_Tone = @_ch5_Tone,
		Ch6_Tone = @_ch6_Tone,
		Ch7_Tone = @_ch7_Tone,
		Ch8_Tone = @_ch8_Tone,
		Ch9_Tone = @_ch9_Tone,
		Ch10_Tone = @_ch10_Tone,
		Ch11_Tone = @_ch11_Tone,
		Ch12_Tone = @_ch12_Tone,
		Ch13_Tone = @_ch13_Tone,
		Ch14_Tone = @_ch14_Tone,
		Ch15_Tone = @_ch15_Tone,
		Ch16_Tone = @_ch16_Tone,
		Ch17_Tone = @_ch17_Tone,
		Ch18_Tone = @_ch18_Tone,
		Ch19_Tone = @_ch19_Tone,
		Ch20_Tone = @_ch20_Tone,
		Ch21_Tone = @_ch21_Tone,
		Ch22_Tone = @_ch22_Tone,
		Ch23_Tone = @_ch23_Tone,
		Ch24_Tone = @_ch24_Tone,
		Cue_Tone = @_cue_Tone,
		Ch1_Avg = @_ch1_Avg,
		Ch2_Avg = @_ch2_Avg,
		Ch3_Avg = @_ch3_Avg,
		Ch4_Avg = @_ch4_Avg,
		Ch5_Avg = @_ch5_Avg,
		Ch6_Avg = @_ch6_Avg,
		Ch7_Avg = @_ch7_Avg,
		Ch8_Avg = @_ch8_Avg,
		Ch9_Avg = @_ch9_Avg,
		Ch10_Avg = @_ch10_Avg,
		Ch11_Avg = @_ch11_Avg,
		Ch12_Avg = @_ch12_Avg,
		Ch13_Avg = @_ch13_Avg,
		Ch14_Avg = @_ch14_Avg,
		Ch15_Avg = @_ch15_Avg,
		Ch16_Avg = @_ch16_Avg,
		Ch17_Avg = @_ch17_Avg,
		Ch18_Avg = @_ch18_Avg,
		Ch19_Avg = @_ch19_Avg,
		Ch20_Avg = @_ch20_Avg,
		Ch21_Avg = @_ch21_Avg,
		Ch22_Avg = @_ch22_Avg,
		Ch23_Avg = @_ch23_Avg,
		Ch24_Avg = @_ch24_Avg,
		Cue_Avg = @_cue_Avg,
		Ch1_Peak = @_ch1_Peak,
		Ch2_Peak = @_ch2_Peak,
		Ch3_Peak = @_ch3_Peak,
		Ch4_Peak = @_ch4_Peak,
		Ch5_Peak = @_ch5_Peak,
		Ch6_Peak = @_ch6_Peak,
		Ch7_Peak = @_ch7_Peak,
		Ch8_Peak = @_ch8_Peak,
		Ch9_Peak = @_ch9_Peak,
		Ch10_Peak = @_ch10_Peak,
		Ch11_Peak = @_ch11_Peak,
		Ch12_Peak = @_ch12_Peak,
		Ch13_Peak = @_ch13_Peak,
		Ch14_Peak = @_ch14_Peak,
		Ch15_Peak = @_ch15_Peak,
		Ch16_Peak = @_ch16_Peak,
		Ch17_Peak = @_ch17_Peak,
		Ch18_Peak = @_ch18_Peak,
		Ch19_Peak = @_ch19_Peak,
		Ch20_Peak = @_ch20_Peak,
		Ch21_Peak = @_ch21_Peak,
		Ch22_Peak = @_ch22_Peak,
		Ch23_Peak = @_ch23_Peak,
		Ch24_Peak = @_ch24_Peak,
		Cue_Peak = @_cue_Peak,
		Ch1_TruePeak = @_ch1_TruePeak,
		Ch2_TruePeak = @_ch2_TruePeak,
		Ch3_TruePeak = @_ch3_TruePeak,
		Ch4_TruePeak = @_ch4_TruePeak,
		Ch5_TruePeak = @_ch5_TruePeak,
		Ch6_TruePeak = @_ch6_TruePeak,
		Ch7_TruePeak = @_ch7_TruePeak,
		Ch8_TruePeak = @_ch8_TruePeak,
		Ch9_TruePeak = @_ch9_TruePeak,
		Ch10_TruePeak = @_ch10_TruePeak,
		Ch11_TruePeak = @_ch11_TruePeak,
		Ch12_TruePeak = @_ch12_TruePeak,
		Ch13_TruePeak = @_ch13_TruePeak,
		Ch14_TruePeak = @_ch14_TruePeak,
		Ch15_TruePeak = @_ch15_TruePeak,
		Ch16_TruePeak = @_ch16_TruePeak,
		Ch17_TruePeak = @_ch17_TruePeak,
		Ch18_TruePeak = @_ch18_TruePeak,
		Ch19_TruePeak = @_ch19_TruePeak,
		Ch20_TruePeak = @_ch20_TruePeak,
		Ch21_TruePeak = @_ch21_TruePeak,
		Ch22_TruePeak = @_ch22_TruePeak,
		Ch23_TruePeak = @_ch23_TruePeak,
		Ch24_TruePeak = @_ch24_TruePeak,
		Cue_TruePeak = @_cue_TruePeak,
		NR = @_nr,
		Ch12_Phase = @_ch12Phase,
		Ch34_Phase = @_ch34Phase,
		Tone_Phase = @_tonePhase,
		Time_Code = @_timeCode,
		TCInteg = @_tcInteg,
		Comp_Sync = @_compSync,
		QCinUnity = @_qcInUnity,
		SurroundSound = @_surroundSound,
		LTC_VITC_Match = @_ltcMatch 
		
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
		
	UPDATE 
		[bward].qcHeader 
	SET 
		FullQC_Ch1 = @_fullQC_ch1,
		FullQC_Ch2 = @_fullQC_ch2,
		FullQC_Ch3 = @_fullQC_ch3,
		FullQC_Ch4 = @_fullQC_ch4,
		FullQC_Ch5 = @_fullQC_ch5,
		FullQC_Ch6 = @_fullQC_ch6,
		FullQC_Ch7 = @_fullQC_ch7,
		FullQC_Ch8 = @_fullQC_ch8,
		FullQC_Ch9 = @_fullQC_ch9,
		FullQC_Ch10 = @_fullQC_ch10,
		FullQC_Ch11 = @_fullQC_ch11,
		FullQC_Ch12 = @_fullQC_ch12,
		FullQC_Ch13 = @_fullQC_ch13,
		FullQC_Ch14 = @_fullQC_ch14,
		FullQC_Ch15 = @_fullQC_ch15,
		FullQC_Ch16 = @_fullQC_ch16,
		FullQC_Ch17 = @_fullQC_ch17,
		FullQC_Ch18 = @_fullQC_ch18,
		FullQC_Ch19 = @_fullQC_ch19,
		FullQC_Ch20 = @_fullQC_ch20,
		FullQC_Ch21 = @_fullQC_ch21,
		FullQC_Ch22 = @_fullQC_ch22,
		FullQC_Ch23 = @_fullQC_ch23,
		FullQC_Ch24 = @_fullQC_ch24,
		FullQC_Cue = @_fullQC_cue,
		SpotQC_Ch1 = @_spotQC_ch1,
		SpotQC_Ch2 = @_spotQC_ch2,
		SpotQC_Ch3 = @_spotQC_ch3,
		SpotQC_Ch4 = @_spotQC_ch4,
		SpotQC_Ch5 = @_spotQC_ch5,
		SpotQC_Ch6 = @_spotQC_ch6,
		SpotQC_Ch7 = @_spotQC_ch7,
		SpotQC_Ch8 = @_spotQC_ch8,
		SpotQC_Ch9 = @_spotQC_ch9,
		SpotQC_Ch10 = @_spotQC_ch10,
		SpotQC_Ch11 = @_spotQC_ch11,
		SpotQC_Ch12 = @_spotQC_ch12,
		SpotQC_Ch13 = @_spotQC_ch13,
		SpotQC_Ch14 = @_spotQC_ch14,
		SpotQC_Ch15 = @_spotQC_ch15,
		SpotQC_Ch16 = @_spotQC_ch16,
		SpotQC_Ch17 = @_spotQC_ch17,
		SpotQC_Ch18 = @_spotQC_ch18,
		SpotQC_Ch19 = @_spotQC_ch19,
		SpotQC_Ch20 = @_spotQC_ch20,
		SpotQC_Ch21 = @_spotQC_ch21,
		SpotQC_Ch22 = @_spotQC_ch22,
		SpotQC_Ch23 = @_spotQC_ch23,
		SpotQC_Ch24 = @_spotQC_ch24,
		SpotQC_Cue = @_spotQC_cue
		
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
	
	COMMIT TRAN
	
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcAudioTC and qcHeader (sp_UpdateAudioTC)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


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


/****** Object:  StoredProcedure [bward].[sp_UpdateHeaderDetails]    Script Date: 11/05/2015 18:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateHeaderDetails]
	@_QCNum int,
	@_rev int,
	@_thisPart int = NULL,
	@_totPart int = NULL,
	@_pono VARCHAR(15) = NULL,
	@_qcDate datetime = NULL,
	@_aspect VARCHAR(8) = NULL,
	@_custID int = NULL,
	@_show VARCHAR(40) = NULL,
	@_epNo VARCHAR(30) = NULL,
	@_epName VARCHAR(40) = NULL,
	@_standard VARCHAR(20) = NULL,
	@_format VARCHAR(15) = NULL,
	@_version VARCHAR(60) = NULL,
	@_trt VARCHAR(20) = NULL,
	@_tapeDesc VARCHAR(255) = NULL,
	@_tapeNumber NVARCHAR(50) = NULL,
	@_filename VARCHAR(255) = NULL,
	@_subtitle NVARCHAR(50) = NULL,
	@_hLang NVARCHAR(50) = NULL,
	@_status NVARCHAR(30) = NULL,
	@_headLogo NVARCHAR(100) = NULL,
	@_tailLogo NVARCHAR(100) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcHeader 
	SET 
		pono = @_pono,
		This_part = @_thisPart,
		Tot_part = @_totPart,
		QC_Date = @_qcDate,
		Aspect = @_aspect,
		CustID = @_custID,
		Show = @_show,
		Epis_no = @_epNo,
		Epis_name = @_epName,
		Version = @_version,
		Format = @_format,
		Standard = @_standard,
		TRT = @_trt,
		TapeDesc1 = @_tapeDesc,
		TapeNumber = @_tapeNumber,
		Filename = @_filename,
		Subtitle = @_subtitle,
		HLanguage = @_hLang,
		Status = @_status,
		HeadLogo = @_headLogo,
		TailLogo = @_tailLogo
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcHeader (sp_UpdateHeaderDetails)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


/****** Object:  StoredProcedure [bward].[sp_UpdateHistoryDetails]    Script Date: 11/06/2015 13:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateHistoryDetails]
	@_QCNum int,
	@_rev int,
	@_revDate datetime = NULL,
	@_revised_By VARCHAR(50) = NULL,
	@_operID int = NULL,
	@_bay_Num VARCHAR(30) = NULL,
	@_qcVTR VARCHAR(7) = NULL,
	@_stockMfg VARCHAR(20) = NULL,
	@_stockBatch VARCHAR(40) = NULL,
	@_recDate datetime = NULL,
	@_recVTR VARCHAR(9) = NULL,
	@_recFac VARCHAR(30) = NULL,
	@_srcFormat VARCHAR(50) = NULL,
	@_srcStandard VARCHAR(40) = NULL,
	@_srcDesc VARCHAR(40) = NULL,
	@_addInfo VARCHAR(80) = NULL,
	@_textless VARCHAR(5) = NULL,
	@_duration NVARCHAR(10) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcHeader 
	SET 
		Revised_by = @_revised_By,
		revised_date = @_revDate,
		Operator = @_operID,
		Bay_num = @_bay_Num,
		QC_VTR = @_qcVTR,
		Stock_Mfg = @_stockMfg,
		Stock_Batch = @_stockBatch,
		Rec_Date = @_recDate,
		Rec_VTR = @_recVTR,
		Rec_Fac = @_recFac,
		Src_Format = @_srcFormat,
		Src_Standard = @_srcStandard,
		src_desc = @_srcDesc,
		AddInfo = @_addInfo,
		Textless = @_textless,
		Duration = @_duration
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev

	IF @@ERROR <> 0
		BEGIN
			SET @errorMsg = 'Could not update qcHeader (sp_UpdateHistoryDetails)'
			GOTO Error
		END
			
	Error:

		IF (@errorMsg IS NOT NULL)
		BEGIN
			RAISERROR(@errorMsg, 16, 1)
		END
END


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


/****** Object:  StoredProcedure [bward].[sp_UpdateLog]    Script Date: 11/16/2015 13:46:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateLog]
	@_QCNum int,
	@_rev int,
	@_timeID int,
	@_tc CHAR(16) = NULL,
	@_qcCode CHAR(1) = NULL,
	@_note VARCHAR(750) = NULL,
	@_qcGrade CHAR(2) = NULL,
	@_action VARCHAR(750) = NULL,
	@_duration NVARCHAR(16) = NULL,
	@_inMaster BIT
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcTime 
	SET 
		Time_code = @_tc,
		QC_Code = @_qcCode,
		Note = @_note,
		QC_Grade = @_qcGrade,
		Action = @_action,
		item_Duratn = @_duration,
		in_Master = @_inMaster
		
	WHERE 
		QCNum = @_QCNum
		AND subQCNum = @_rev
		AND TimeID = @_timeID
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcTime (sp_UpdateLog)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


/****** Object:  StoredProcedure [bward].[sp_UpdateOverallSpecs]    Script Date: 11/11/2015 15:42:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateOverallSpecs]
	@_QCNum int,
	@_Rev int,
	@_lumPeak VARCHAR(15) = NULL,
	@_chPeak VARCHAR(15) = NULL,
	@_barVid VARCHAR(15) = NULL,
	@_lumAvg VARCHAR(15) = NULL,
	@_chAvg VARCHAR(15) = NULL,
	@_barChr VARCHAR(15) = NULL,
	@_black VARCHAR(15) = NULL,
	@_ireMv CHAR(1) = NULL,
	@_barSet VARCHAR(15) = NULL,
	@_vidCodec VARCHAR(100) = NULL,
	@_vidRate VARCHAR(100) = NULL,
	@_vidDepth VARCHAR(100) = NULL,
	@_bitRateMode VARCHAR(100) = NULL,
	@_auCodec VARCHAR(100) = NULL,
	@_auRate VARCHAR(100) = NULL,
	@_auDepth VARCHAR(100) = NULL,
	@_sampleRate VARCHAR(100) = NULL,
	@_gop VARCHAR(100) = NULL,
	@_gamut VARCHAR(100) = NULL,
	@_colEnc VARCHAR(100) = NULL,
	@_fileSize VARCHAR(100) = NULL,
	@_actPic VARCHAR(100) = NULL,
	@_frSize VARCHAR(100) = NULL
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	
	UPDATE 
		[bward].qcHeader
	SET 
		Lum_Peak = @_lumPeak,
		Chroma_Peak = @_chPeak,
		Bar_Vid = @_barVid,
		Lum_Avg = @_lumAvg,
		Chroma_Avg = @_chAvg,
		Bar_Chr = @_barChr,
		Black = @_black,
		IRE_MV = @_ireMv,
		Bar_Set = @_barSet,
		Video_Codec = @_vidCodec,
		Video_Bit_Rate = @_vidRate,
		Video_Bit_Depth = @_vidDepth,
		Bit_Rate_Mode = @_bitRateMode,
		Audio_Codec = @_auCodec,
		Audio_Bit_Rate = @_auRate,
		Audio_Bit_Depth = @_auDepth,
		Sample_Rate = @_sampleRate,
		GOP_Structure = @_gop,
		Gamut = @_gamut,
		Colour_Encoding = @_colEnc,
		File_Size = @_fileSize,
		Active_Picture = @_actPic,
		Frame_Size = @_frSize
		
	WHERE 
		Qcnum= @_QCNum AND subQcnum = @_Rev

	
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcHeader (sp_UpdateHeaderDetails)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


/****** Object:  StoredProcedure [bward].[sp_UpdateQCReport]    Script Date: 01/11/2016 16:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateQCReport]
	@_QCNum int,
	@_rev int,
	
	@qcCustId INT,
	@qcWONumber VARCHAR(10),
	@customer VARCHAR(50),
	@qcType VARCHAR(1),
	@qcUserId INT,
	@qcFullName VARCHAR(50),
	@assetType VARCHAR(50)
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcHeader 
	SET 
		woNum = @qcWONumber, 
		CustID = @qcCustId, 
		Operator = @qcUserId, 
		Revised_By = @qcFullName, 
		qc_type = @qcType, 
		AssetType = @assetType
				
	WHERE 
		qcNum = @_QCNum
		AND subQCNum = @_rev
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcHeader (sp_UpdateQCReport)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


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


/****** Object:  StoredProcedure [bward].[sp_UpdateTextInfo]    Script Date: 11/06/2015 14:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_UpdateTextInfo]
	@_QCNum int,
	@_rev int,
	@_tcid int,
	@_tcIn NVARCHAR(14) = NULL,
	@_tcOut NVARCHAR(14) = NULL,
	@_textinfo NVARCHAR(500) = NULL
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	UPDATE 
		[bward].qcTextInfo 
	SET 
		TextInfo = @_textinfo,
		TimeCodeIn = @_tcIn,
		TimeCodeOut = @_tcOut
	WHERE 
		QCNum = @_QCNum
		AND subQCNum = @_rev
		AND TextInfoID = @_tcid
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not update qcTextInfo (sp_UpdateTextInfo)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END


