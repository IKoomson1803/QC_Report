
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