
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