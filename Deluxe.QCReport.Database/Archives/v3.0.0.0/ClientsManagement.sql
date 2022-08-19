
CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateClient]
	-- Add the parameters for the stored procedure here
    @CustID INT = 0,
	@CustName CHAR(50),
	@CustCode CHAR(10) = NULL,
	@CustAddress VARCHAR(150),
    @CustPhone VARCHAR(20) = NULL,
	@GradingScale INT = NULL
   
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	
		
	BEGIN TRY
		 
	   IF @CustID = 0 
	     BEGIN
	        INSERT INTO [bward].[qcClients]([CustCode],[CustName],[CustAddress],[CustPhone])
	        SELECT  @CustCode, @CustName,@CustAddress, @CustPhone
	     END
	   ELSE 
	     BEGIN
	       
	        UPDATE [bward].[qcClients]
	        SET CustCode = @CustCode,
			CustName  = @CustName,
			CustAddress = @CustAddress,
			CustPhone = @CustPhone
		    WHERE CustID = @CustID
	  
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'Could not insert or update Client table: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO



CREATE PROCEDURE [bward].[sel_GetClientDetails]
	-- Add the parameters for the stored procedure here
   @CustName CHAR(50)
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	 
	BEGIN TRY
	 SELECT TOP 1 * FROM [bward].[qcClients] 
	WHERE CustName = LTRIM(RTRIM(@CustName))
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get client details: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO

