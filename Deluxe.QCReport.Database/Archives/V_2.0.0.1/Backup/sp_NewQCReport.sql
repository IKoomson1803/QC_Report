
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