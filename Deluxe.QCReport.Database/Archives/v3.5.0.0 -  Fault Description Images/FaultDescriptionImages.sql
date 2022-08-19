
/****** Object:  Table [bward].[qcFaultDescriptionImage]    Script Date: 16/05/2022 13:52:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[qcFaultDescriptionImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QCNum] [int] NOT NULL,
	[SubQCNum] [int] NOT NULL,
	[Description] [varchar](2000) NOT NULL,
	[ImageName] [varchar](255) NOT NULL,
	[ImagePath] [varchar](255) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_qcFaultDescriptionImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [bward].[qcFaultDescriptionImage] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO

ALTER TABLE [bward].[qcFaultDescriptionImage]  WITH CHECK ADD  CONSTRAINT [FK_qcFaultDescriptionImage_qcHeader] FOREIGN KEY([QCNum], [SubQCNum])
REFERENCES [bward].[qcHeader] ([Qcnum], [subQcnum])
GO

ALTER TABLE [bward].[qcFaultDescriptionImage] CHECK CONSTRAINT [FK_qcFaultDescriptionImage_qcHeader]
GO

/****** Object:  StoredProcedure [bward].[ins_FaultDescriptionImage]    Script Date: 16/05/2022 13:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  StoredProcedure [bward].[ins_up_FaultDescriptionImage]    Script Date: 17/05/2022 10:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[ins_up_InsertOrUpdateFaultDescriptionImage]
	-- Add the parameters for the stored procedure here
	@Id INT = 0,
	@QCNum INT,
	@SubQCNum INT,
	@Description VARCHAR(2000),
	@ImageName VARCHAR(255),
	@ImagePath VARCHAR(255)
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	
	BEGIN TRY

	  IF @Id = 0
	     BEGIN
		   INSERT INTO [bward].[qcFaultDescriptionImage]([QCNum],[SubQCNum],[Description],[ImageName], ImagePath)
	       SELECT @QCNum, @SubQCNum, @Description, @ImageName, @ImagePath
		 END
	   ELSE
	     BEGIN
		   UPDATE [bward].[qcFaultDescriptionImage]
		   SET [Description] = @Description,
		   ImageName = @ImageName,
		   ImagePath = @ImagePath
		   WHERE Id = @Id
		 END
	   
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not insert or update [bward].[qcFaultDescriptionImage]: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO

/****** Object:  StoredProcedure [bward].[del_FaultDescriptionImage]    Script Date: 17/05/2022 10:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[del_DeleteFaultDescriptionImage]
	-- Add the parameters for the stored procedure here
	@Id INT

AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	
	BEGIN TRY

	   
		  DELETE FROM [bward].[qcFaultDescriptionImage]
		  WHERE Id = @Id
		 
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not delete fromk [bward].[qcFaultDescriptionImage]: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO

/****** Object:  StoredProcedure [bward].[sel_FaultDescriptionImages]    Script Date: 23/05/2022 12:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [bward].[sel_FaultDescriptionImages] 
	-- Add the parameters for the stored procedure here
	@Qcnum INT,
    @subQcnum INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [bward].[qcFaultDescriptionImage]
	WHERE  [QCNum]  = @Qcnum
	AND [subQCNum] = @subQcnum
END

GO

CREATE PROCEDURE [bward].[sel_GetFaultDescriptionImageById]
	-- Add the parameters for the stored procedure here
   @Id INT
AS
BEGIN
	
	DECLARE @ErrorMsg VARCHAR(2000)
	 
	BEGIN TRY
	 SELECT * FROM [bward].[qcFaultDescriptionImage] WHERE Id  = @Id
    END TRY
    BEGIN CATCH
        SET @errorMsg = 'Could not get FaultDescriptionImage details: ' + ERROR_MESSAGE()
        RAISERROR(@errorMsg, 16, 1)
    END CATCH
		
END

GO

