USE [QCSUK]
GO
/****** Object:  Table [bward].[optStatus]    Script Date: 17/05/2021 17:10:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[optStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [bward].[optStatus] ON 
GO
INSERT [bward].[optStatus] ([StatusId], [Status]) VALUES (1, N'PASSED')
GO
INSERT [bward].[optStatus] ([StatusId], [Status]) VALUES (2, N'FAILED')
GO
INSERT [bward].[optStatus] ([StatusId], [Status]) VALUES (3, N'HOLD')
GO
INSERT [bward].[optStatus] ([StatusId], [Status]) VALUES (4, N'PASS DI / DSS')
GO
INSERT [bward].[optStatus] ([StatusId], [Status]) VALUES (5, N'PASS DI / FAIL DSS')
GO
INSERT [bward].[optStatus] ([StatusId], [Status]) VALUES (6, N'PASS DI')
GO
INSERT [bward].[optStatus] ([StatusId], [Status]) VALUES (7, N'PASS DSS / FAIL DI')
GO
INSERT [bward].[optStatus] ([StatusId], [Status]) VALUES (8, N'FAIL DI / DSS')
GO
INSERT [bward].[optStatus] ([StatusId], [Status]) VALUES (9, N'FAIL DI')
GO
INSERT [bward].[optStatus] ([StatusId], [Status]) VALUES (10, N'FAIL DSS')
GO
SET IDENTITY_INSERT [bward].[optStatus] OFF
GO
/****** Object:  Index [PK_optStatus]    Script Date: 17/05/2021 17:10:51 ******/
ALTER TABLE [bward].[optStatus] ADD  CONSTRAINT [PK_optStatus] PRIMARY KEY NONCLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
