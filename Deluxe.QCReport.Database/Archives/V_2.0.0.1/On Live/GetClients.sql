USE [QCSUK]
GO
/****** Object:  StoredProcedure [dbo].[sel_GetUsers]    Script Date: 19/05/2021 11:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sel_GetClients]
	-- Add the parameters for the stored procedure here
   AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	 
	BEGIN TRY
	    SELECT LTRIM(RTRIM(c.CustName)) FROM [bward].[qcClients] c
	   WHERE c.CustName IS NOT NULL AND  LTRIM(RTRIM(c.CustName)) != ''
	   ORDER BY c.CustName
	   
	   
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get users: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END
