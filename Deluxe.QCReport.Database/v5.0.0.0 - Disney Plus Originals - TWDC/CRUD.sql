USE [QCSUK]
GO

INSERT INTO [bward].[qcClients] (CustName,GradingScale)
SELECT 'Disney Plus Originals - TWDC',5
WHERE NOT EXISTS (SELECT NULL FROM  [bward].[qcClients] WHERE CustName =  'Disney Plus Originals - TWDC')

GO


/****** Object:  Table [bward].[DisneyTWDCProgrammeDetails]    Script Date: 12/06/2023 10:49:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[DisneyTWDCProgrammeDetails](
	[QCNum] [int] NOT NULL,
	[SubQCNum] [int] NOT NULL,
	[WonderlandShortID] [varchar](50) NULL,
	[QCType] [varchar](100) NULL,
	[QCScope] [varchar](30) NULL,
	[QCProcess] [varchar](50) NULL,
	[ProcessNotes] [varchar](255) NULL,
	[CSRManager] [varchar](50) NULL,
	[FileCreationFacility] [varchar](50) NULL,
	[QCManager] [varchar](50) NULL
) ON [PRIMARY]
GO

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [bward].[sel_GetDisneyTWDCProgrammeDetails] 
	-- Add the parameters for the stored procedure here
	@QCNum int,
	@SubQcNum int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT 
	    h.Qcnum,
        h.subQcnum,
        WonderlandShortID,
        QCType,
        QCScope,
        QCProcess,
        ProcessNotes,
        CSRManager,
        FileCreationFacility,
        QCManager,
		h.QCVendor,
        h.Wonum 'WorkOrderNumber',
        h.Show 'Title' ,
		h.Epis_Name 'AseetName',
        h.Operator    'QCOperatorId',
        h.QC_date  'QCDate',
        h.QC_VTR  'QCPlaybackDevice',
        h.bay_num  'QCRoom'
  
	FROM 
		[bward].qcHeader h
		INNER JOIN [bward].qcUsers u ON h.Operator = u.qcUserID 
	    LEFT JOIN [bward].[DisneyTWDCProgrammeDetails] p on h.Qcnum = p.QCNum
	
	 WHERE
		h.Qcnum = @QCNum 
		AND h.subQcnum = @SubQcNum


END
GO
