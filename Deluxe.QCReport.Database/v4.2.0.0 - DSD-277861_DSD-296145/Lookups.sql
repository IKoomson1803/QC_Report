USE [QCSUK]
GO

/****** Object:  Table [bward].[ColourPrimaries]    Script Date: 28/06/2023 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[ColourPrimaries](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[ColourRange]    Script Date: 28/06/2023 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[ColourRange](
	[Type] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[WhitePoint]    Script Date: 28/06/2023 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[WhitePoint](
	[Type] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
INSERT [bward].[ColourPrimaries] ([Type]) VALUES (N'BT.2020')
GO
INSERT [bward].[ColourPrimaries] ([Type]) VALUES (N'P3')
GO
INSERT [bward].[ColourRange] ([Type]) VALUES (N'Full')
GO
INSERT [bward].[ColourRange] ([Type]) VALUES (N'Limited')
GO
INSERT [bward].[ColourRange] ([Type]) VALUES (N'N/A')
GO
INSERT [bward].[WhitePoint] ([Type]) VALUES (N'D65 0.3127')
GO
INSERT [bward].[WhitePoint] ([Type]) VALUES (N'0.3290')
GO
INSERT [bward].[WhitePoint] ([Type]) VALUES (N'Other')
GO



/****** Object:  Table [bward].[ColourRange]    Script Date: 27/06/2023 10:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[ColourRangeHDRMetadata](
	[Type] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
INSERT [bward].[ColourRangeHDRMetadata] ([Type]) VALUES (N'Full')
GO
INSERT [bward].[ColourRangeHDRMetadata] ([Type]) VALUES (N'Video')
GO

/****** Object:  Table [bward].[HDRMetadataType]    Script Date: 27/06/2023 11:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[HDRMetadataType](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [bward].[HDRMetadataType] ([Type]) VALUES (N'Dolby Vision xml')
GO
INSERT [bward].[HDRMetadataType] ([Type]) VALUES (N'ST.2086 -Embedded')
GO
INSERT [bward].[HDRMetadataType] ([Type]) VALUES (N'ST.2086 Side Car xml')
GO

/****** Object:  Table [bward].[XmlAndBaseFileMetadataMatch]    Script Date: 27/06/2023 11:54:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[XmlAndBaseFileMetadataMatch](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [bward].[XmlAndBaseFileMetadataMatch] ([Type]) VALUES (N'Yes')
GO
INSERT [bward].[XmlAndBaseFileMetadataMatch] ([Type]) VALUES (N'No')
GO
INSERT [bward].[XmlAndBaseFileMetadataMatch] ([Type]) VALUES (N'No � see Xml vs Base File')
GO
INSERT [bward].[XmlAndBaseFileMetadataMatch] ([Type]) VALUES (N'N/A')
GO
INSERT [bward].[XmlAndBaseFileMetadataMatch] ([Type]) VALUES (N'Embedded')
GO

