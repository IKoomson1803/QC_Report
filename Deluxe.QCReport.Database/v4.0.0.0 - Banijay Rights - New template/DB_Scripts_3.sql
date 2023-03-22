TRUNCATE TABLE [bward].[BanijahRightsProgrammeLayout]
TRUNCATE TABLE [bward].[BanijahRightsTapeLayout]
GO

ALTER TABLE [bward].[BanijahRightsTapeLayout] ADD ItemNum INT NULL

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [bward].[ins_up_InsertOrUpdateBanijayRightsTapeLayout]
	-- Add the parameters for the stored procedure here
    @Id INT = 0,
	@QCNum INT,
    @SubQCNum INT,
    @Type VARCHAR(50) = NULL,
    @TimecodeIn VARCHAR(11) = NULL,
	@TimecodeOut VARCHAR(11) = NULL,
	@PartDurationExcludingHolds VARCHAR(100) = NULL,
	@CountAsShow VARCHAR(3) = NULL,
	@ItemNum INT = NULL
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	DECLARE @LastItemNumber  INT

						
	BEGIN TRY
		 
	   IF @Id = 0
	     BEGIN
	        INSERT INTO [bward].[BanijahRightsTapeLayout](
			QCNum,
            SubQCNum,
            [Type],
            TimecodeIn,
	        TimecodeOut,
	        PartDurationExcludingHolds,
	        CountAsShow,
			ItemNum
			)
	        SELECT
			@QCNum,
            @subQCNum,
            @Type,
            @TimecodeIn,
	        @TimecodeOut,
	        @PartDurationExcludingHolds,
	        @CountAsShow,
			@ItemNum

	     END
	   ELSE 
	     BEGIN
	     	       
	        UPDATE [bward].[BanijahRightsTapeLayout]
			SET 
			[Type] = @Type,
            TimecodeIn = @TimecodeIn,
	        TimecodeOut  =@TimecodeOut,
	        PartDurationExcludingHolds = @PartDurationExcludingHolds,
	        CountAsShow = @CountAsShow,
			ItemNum = @ItemNum
       		WHERE Id =  @Id
     
	     END 
	 
    END TRY
    BEGIN CATCH
             SET @errorMsg = 'ins_up_InsertOrUpdateBanijayRightsTapeLayout failed: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO