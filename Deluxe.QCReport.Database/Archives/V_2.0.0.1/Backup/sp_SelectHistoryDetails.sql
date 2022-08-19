
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