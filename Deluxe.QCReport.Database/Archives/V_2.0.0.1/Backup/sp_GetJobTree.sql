
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