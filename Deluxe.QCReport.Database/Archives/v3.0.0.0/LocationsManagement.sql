
CREATE PROCEDURE [dbo].[sel_GetLocations]
	-- Add the parameters for the stored procedure here
   AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	 
	BEGIN TRY
	   SELECT LTRIM(RTRIM(l.Location)) 'Location' FROM [bward].[qcLocation] l
	   WHERE l.Location IS NOT NULL 
	   AND  L.pkey > 5 
	   ORDER BY l.Location
	   
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get users: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO


CREATE PROCEDURE [bward].[sel_GetLocationDetails]
	-- Add the parameters for the stored procedure here
   @location VARCHAR(60)
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	 
	BEGIN TRY
	 SELECT TOP 1 * FROM [bward].[qcLocation]
	WHERE [Location] = LTRIM(RTRIM(@location))
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get location details: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO


CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateLocation]
	-- Add the parameters for the stored procedure here
    @pkey INT = 0,
	@Location varCHAR(60),
	@Address VARCHAR(200),
    @ReportName VARCHAR(60) = NULL
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	
		
	BEGIN TRY
		 
	   IF @pkey = 0 
	     BEGIN
	        INSERT INTO [bward].[qcLocation]([Location],[Address] )
	        SELECT @Location, @Address
	     END
	   ELSE 
	     BEGIN
	       
	        UPDATE [bward].[qcLocation]
	        SET [Location] = @Location,
			[Address]  = @Address
		    WHERE [pkey] = @pkey
	  
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'Could not insert or update Location table: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END


