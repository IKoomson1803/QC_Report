
/****** Object:  Table [bward].[optStandard]    Script Date: 10/07/2017 17:12:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[optStandard](
	[StandardID] [int] IDENTITY(1,1) NOT NULL,
	[Standard] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Standard] PRIMARY KEY CLUSTERED 
(
	[StandardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [bward].[optStandard] ON 

GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (1, N'NTSC')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (2, N'PAL')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (3, N'525')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (4, N'625')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (5, N'1080/59.94i')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (6, N'1080/50i')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (7, N'1080/29.97P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (8, N'1080/25P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (9, N'1080/24P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (10, N'1080/23.98P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (11, N'2K/59.94i')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (12, N'2K/50i')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (13, N'2K/29.97P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (14, N'2K/25P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (15, N'2K/24P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (16, N'2K/23.98P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (17, N'UHD/59.94i')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (18, N'UHD/50i')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (19, N'UHD/29.97P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (20, N'UHD/25P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (21, N'UHD/24P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (22, N'UHD/23.98P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (23, N'4K/59.94i')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (24, N'4K/50i')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (25, N'4K/29.97P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (26, N'4K/25P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (27, N'4K/24P')
GO
INSERT [bward].[optStandard] ([StandardID], [Standard]) VALUES (28, N'4K/23.98P')
GO
SET IDENTITY_INSERT [bward].[optStandard] OFF
GO
