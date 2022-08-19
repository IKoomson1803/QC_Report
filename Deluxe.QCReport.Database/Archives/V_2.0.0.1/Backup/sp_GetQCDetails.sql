
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