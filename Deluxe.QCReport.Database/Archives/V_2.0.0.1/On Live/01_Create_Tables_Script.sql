USE [QCSUK]
GO
/****** Object:  Table [bward].[Role]    Script Date: 13/04/2021 17:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[Role](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [bward].[Role] ([Id], [Name]) VALUES (0, N'Read Only')
GO
INSERT [bward].[Role] ([Id], [Name]) VALUES (1, N'Operator')
GO
INSERT [bward].[Role] ([Id], [Name]) VALUES (2, N'Supervisor')
GO
INSERT [bward].[Role] ([Id], [Name]) VALUES (3, N'Administrator')
GO


SET ANSI_PADDING OFF
GO

SET QUOTED_IDENTIFIER OFF
GO

/****** Object:  Table [bward].[SystemActivityLog]    Script Date: 04/10/2019 12:42:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [bward].[SystemActivityLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](20) NOT NULL,
	[Source] [varchar](255) NOT NULL,
	[Details] [varchar](max) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[UserId] [int] NULL,
	[IPAddress] [varchar](20) NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [bward].[SystemActivityLog] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO

/****** Object:  Table [bward].[UserActivityLog]    Script Date: 07/07/2016 11:33:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [bward].[UserActivityLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](20) NOT NULL,
	[Source] [varchar](255) NOT NULL,
	[Details] [varchar](max) NOT NULL,
	[UserId] [int] NULL,
	[IPAddress] [varchar](20) NULL,
	[DateAdded] [datetime] NOT NULL,
	[ActivityType] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ActivityLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [bward].[UserActivityLog] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO

/**************************************************************************/