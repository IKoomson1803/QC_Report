USE [QCSUK]
GO
/****** Object:  StoredProcedure [bward].[sel_Search]    Script Date: 18/08/2021 17:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [bward].[sel_Search]
	-- Add the parameters for the stored procedure here  VARCHAR(50),
        @TapeNumber  VARCHAR(50) = NULL,
		@QCUser VARCHAR(50) = NULL,
		@RevisedBy VARCHAR(50) = NULL,
		@ClientName VARCHAR(50) = NULL,
        @Title  VARCHAR(50) = NULL,
        @EpisodeName  VARCHAR(50) = NULL,
        @EpisodeNumber  VARCHAR(50) = NULL,
		@Filename  VARCHAR(255) = NULL,
        @Statuses  VARCHAR(255) = NULL,
        @FromDate DATETIME = NULL,
        @ToDate  DATETIME = NULL,

        @AudioGrade1  INT = NULL,
        @AudioGrade2  INT = NULL,
        @AudioGrade3  INT = NULL,
        @AudioGrade4  INT = NULL,
        @AudioGrade5  INT = NULL,

        @VideoGrade1  INT = NULL,
        @VideoGrade2  INT = NULL,
        @VideoGrade3  INT = NULL,
        @VideoGrade4  INT = NULL,
        @VideoGrade5  INT = NULL,

        @OverallGrade1  INT = NULL,
        @OverallGrade2  INT = NULL,
        @OverallGrade3  INT = NULL,
        @OverallGrade4  INT = NULL,
        @OverallGrade5  INT = NULL
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	DECLARE  @QCUserId INT 
	DECLARE  @ClientId  INT

	IF @QCUser IS NOT NULL
	  BEGIN
	    SELECT TOP 1  @QCUserId = [qcUserID] FROM [bward].[qcUsers] WHERE LTRIM(RTRIM([FullName])) = LTRIM(RTRIM(@QCUser))
	  END
 

   IF @ClientName IS NOT NULL
	  BEGIN
	    SELECT  TOP 1 @ClientId = [CustID] FROM [bward].[qcClients]  WHERE LTRIM(RTRIM([CustName])) = LTRIM(RTRIM(@ClientName))
	  END


	 
	BEGIN TRY
	SELECT top 2000 h.woNum, h.QCNum, h.subqcnum, c.CustName, u.FullName,h.Revised_By,h.TapeNumber, h.Show, h.Epis_Name, h.Epis_no, h.QC_Date, h.[Filename],
	Eval_Stat, grdVideo, grdAudio, grdOverall,Version  FROM qcHeader h
	LEFT OUTER JOIN [bward].[qcClients] c ON h.custid = c.custid 
	LEFT OUTER JOIN [bward].[qcUsers] u ON h.operator = u.qcUserID 
	WHERE 
		 (
		    @TapeNumber IS NULL 
		   OR h.TapeNumber LIKE '%' + LTRIM(RTRIM(@TapeNumber)) + '%'
		 )
		 AND
		 (
		   @QCUserId IS NULL
		   OR h.Operator = @QCUserId
		 )
		  AND
		 (
		   @RevisedBy IS NULL
		   OR h.Revised_By LIKE '%' + LTRIM(RTRIM(@RevisedBy)) + '%' 
		 )
		 AND
		 (
		    @ClientId IS NULL
			OR h.CustId = @ClientId
		 )
		 AND
		 (
		   @Title IS NULL
		   OR h.Show LIKE '%' + LTRIM(RTRIM(@Title)) + '%'
		 )
	     AND
		 (
		   @EpisodeName IS NULL
		   OR h.Epis_Name LIKE '%' + LTRIM(RTRIM(@EpisodeName)) + '%'
		 )
	     AND 
		 (
		   @EpisodeNumber IS NULL
		   OR h.Epis_no LIKE '%' + LTRIM(RTRIM(@EpisodeNumber)) + '%'
		 )
		  AND 
		 (
		   @Filename IS NULL
		   OR h.[Filename] LIKE '%' + LTRIM(RTRIM(@Filename)) + '%'
		 )

		 AND
		 (
		    @Statuses IS NULL
		    OR h.Eval_Stat IN (SELECT value
		   FROM [bward].[fn_SplitVarCharMax](@Statuses,',')) 
		 )
		  AND
	     (
		   @FromDate IS NULL AND @ToDate IS NULL
		   OR h.QC_date BETWEEN @FromDate AND @ToDate
		 )
		 AND
		 (
		   @AudioGrade1 IS NULL
		   OR h.grdAudio = 1
		 )
		  AND
		 (
		   @AudioGrade2 IS NULL
		   OR h.grdAudio = 2
		 )
		 AND
		 (
		   @AudioGrade3 IS NULL
		   OR h.grdAudio = 3
		 )
		  AND
		 (
		   @AudioGrade4 IS NULL
		   OR h.grdAudio = 4
		 )
		  AND
		 (
		   @AudioGrade5 IS NULL
		   OR h.grdAudio = 5
		 )

		 AND
		 (
		   @VideoGrade1 IS NULL
		   OR h.grdVideo = 1
		 )
		  AND
		 (
		   @VideoGrade2 IS NULL
		   OR h.grdVideo = 2
		 )
		 AND
		 (
		   @VideoGrade3 IS NULL
		   OR h.grdVideo = 3
		 )
		  AND
		 (
		   @VideoGrade4 IS NULL
		   OR h.grdVideo = 4
		 )
		  AND
		 (
		   @VideoGrade5 IS NULL
		   OR h.grdVideo = 5
		 )
		 		 
		 AND
		 (
		   @OverallGrade1 IS NULL
		   OR h.grdOverall = 1
		 )
		  AND
		 (
		   @OverallGrade2 IS NULL
		   OR h.grdOverall = 2
		 )
		 AND
		 (
		   @OverallGrade3 IS NULL
		   OR h.grdOverall = 3
		 )
		  AND
		 (
		   @OverallGrade4 IS NULL
		   OR h.grdOverall = 4
		 )
		  AND
		 (
		   @OverallGrade5 IS NULL
		   OR h.grdOverall = 5
		 )
		 	
	    AND h.Deleted = 0 ORDER BY wonum, qcNum, subQCNum
	 
	 
	 END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get [bward].[sel_Search]: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO

/****** Object:  StoredProcedure [dbo].[sel_GetUsers]    Script Date: 18/08/2021 16:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sel_GetRevisedByUsers]
	-- Add the parameters for the stored procedure here
   AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	 
	BEGIN TRY
	   SELECT DISTINCT LTRIM(RTRIM(u.FullName)) FullName from [bward].[qcUsers] u
	   INNER JOIN [bward].[Role] ur
	   ON u.SecurityLevel  = ur.Id
	   WHERE u.Deleted IS NULL  AND u.FullName IS NOT NULL
	  -- ORDER BY u.UserName
	   
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get users: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO

/****** Object:  StoredProcedure [dbo].[sel_GetUsers]    Script Date: 18/08/2021 17:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sel_GetUsers]
	-- Add the parameters for the stored procedure here
   AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	 
	BEGIN TRY
	   SELECT DISTINCT LTRIM(RTRIM(u.FullName)) FullName from [bward].[qcUsers] u
	   INNER JOIN [bward].[Role] ur
	   ON u.SecurityLevel  = ur.Id
	   WHERE u.Deleted IS NULL  AND u.FullName IS NOT NULL
	  -- ORDER BY u.UserName
	   
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get users: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO