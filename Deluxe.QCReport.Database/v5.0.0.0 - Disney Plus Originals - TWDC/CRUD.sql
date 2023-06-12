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
	[QCVendor] [varchar](100) NULL,
	[CSRManager] [varchar](50) NULL,
	[FileCreationFacility] [varchar](50) NULL,
	[QCManager] [varchar](50) NULL
) ON [PRIMARY]
GO
