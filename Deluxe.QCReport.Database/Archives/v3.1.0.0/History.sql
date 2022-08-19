USE [QCSUK]
GO

ALTER TABLE [bward].[qcHeader] ADD Revised_By_2 VARCHAR(50) NULL
ALTER TABLE [bward].[qcHeader] ADD Revised_Date_2 DATETIME NULL  
ALTER TABLE [bward].[qcHeader] ALTER COLUMN Textless VARCHAR(11) NULL  
ALTER TABLE [bward].[qcHeader] ALTER COLUMN Duration VARCHAR(11) NULL

ALTER TABLE [bward].[qcHeader] ADD Operator_2 INT NULL
ALTER TABLE [bward].[qcHeader] ADD QC_Date_2 DATETIME NULL  
ALTER TABLE [bward].[qcHeader] ADD Operator_Activity VARCHAR(150) NULL  
ALTER TABLE [bward].[qcHeader] ADD Operator_2_Activity VARCHAR(150) NULL  

ALTER TABLE [bward].[qcHeader] ADD Bay_Num_2 VARCHAR(30) NULL  
ALTER TABLE [bward].[qcHeader] ADD QC_VTR_2 VARCHAR(20) NULL  
ALTER TABLE [bward].[qcHeader] ALTER COLUMN QC_VTR VARCHAR(20) NULL


GO

/****** Object:  StoredProcedure [bward].[sp_SelectHistoryDetails]    Script Date: 05/11/2021 10:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[sp_SelectHistoryDetails]
	@_QCNum int,
	@_Rev int
AS
BEGIN
	
	SELECT 
	Revised_By, Revised_Date, Revised_By_2, Revised_Date_2,u1.qcUserID, u1.FullName,u2.qcUserID 'qcUserID2', u2.FullName 'FullName2',
    QC_Date,QC_Date_2, Operator_Activity, Operator_2_Activity, Bay_Num, Bay_Num_2, AssetType,QC_VTR,QC_VTR_2,
    Stock_Mfg, Stock_Batch, Rec_Date, Rec_VTR,
	Rec_Fac, Src_Format, Src_Standard, Src_Desc, AddInfo, textless, Duration,
	QCNum, subQcnum 
	
	FROM 
		[bward].qcHeader h
		INNER JOIN [bward].qcUsers u1 ON h.Operator = u1.qcUserID 
		LEFT JOIN [bward].qcUsers u2 ON h.Operator_2 = u2.qcUserID 

	GROUP BY 
		Revised_By, Revised_Date,  Revised_By_2, Revised_Date_2,u1.qcUserID, u1.FullName, u2.qcUserID, u2.FullName, 
       QC_Date, QC_Date_2, Operator_Activity, Operator_2_Activity, Bay_Num,Bay_Num_2, AssetType,QC_VTR, QC_VTR_2,
	   Stock_Mfg, Stock_Batch, Rec_Date, Rec_VTR,
	   Rec_Fac, Src_Format, Src_Standard, Src_Desc, AddInfo, textless, Duration,
	   QCNum, subQcnum 

	HAVING 
		Qcnum= @_QCNum AND subQcnum = @_Rev

END
GO

/****** Object:  StoredProcedure [bward].[sp_UpdateHistoryDetails]    Script Date: 05/11/2021 10:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[sp_UpdateHistoryDetails]
	@_QCNum INT,
	@_rev INT,
	@_revDate DATETIME = NULL,
	@_revised_By VARCHAR(50) = NULL,
	@_operID INT = NULL,
	@_bay_Num VARCHAR(30) = NULL,
	@_qcVTR VARCHAR(20) = NULL,
	@_stockMfg VARCHAR(20) = NULL,
	@_stockBatch VARCHAR(40) = NULL,
	@_recDate DATETIME = NULL,
	@_recVTR VARCHAR(9) = NULL,
	@_recFac VARCHAR(30) = NULL,
	@_srcFormat VARCHAR(50) = NULL,
	@_srcStandard VARCHAR(40) = NULL,
	@_srcDesc VARCHAR(40) = NULL,
	@_addInfo VARCHAR(80) = NULL,
	@_textless VARCHAR(11) = NULL,
	@_duration VARCHAR(11) = NULL,
	@_revDate_2 DATETIME = NULL,
	@_revised_By_2 VARCHAR(50) = NULL,

	@_qcDate datetime = NULL,
	@_operID_2 INT = NULL,
	@_qcDate_2 DATETIME = NULL,
	@_oper_Activity VARCHAR(150) = NULL,
    @_oper_2_Activity VARCHAR(150) = NULL,

	@_bay_Num_2 VARCHAR(30) = NULL,
	@_qcVTR_2 VARCHAR(20) = NULL
	
	
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
		Duration = @_duration,
		Revised_by_2 = @_revised_By_2,
		Revised_Date_2 = @_revDate_2,

		QC_date = @_qcDate,
		Operator_2 = @_operID_2,
		QC_Date_2 = @_qcDate_2,
	    Operator_Activity = @_oper_Activity,
	    Operator_2_Activity = @_oper_2_Activity,

		Bay_num_2 = @_bay_Num_2,
		QC_VTR_2 = @_qcVTR_2

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
GO
