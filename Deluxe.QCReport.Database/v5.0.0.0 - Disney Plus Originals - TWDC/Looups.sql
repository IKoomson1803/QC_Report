USE [QCSUK]
GO
/****** Object:  Table [bward].[DisneyTWDCAssetType]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCAssetType](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCAudioBitDepth]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCAudioBitDepth](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCAudioConfiguration]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCAudioConfiguration](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCAudioSampleRate]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCAudioSampleRate](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCCanvasImageAspectRatio]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCCanvasImageAspectRatio](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCChromaSubSamplingRate]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCChromaSubSamplingRate](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCClosedCaptionType]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCClosedCaptionType](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCColorEncoding]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCColorEncoding](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCComponentEvent]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCComponentEvent](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCCreatedFrom]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCCreatedFrom](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCFinalStatus]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCFinalStatus](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCForensicWatermark]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCForensicWatermark](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCFrameRate]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCFrameRate](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCMainLanguage]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCMainLanguage](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCQCEvaluation]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCQCEvaluation](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCQCProcess]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCQCProcess](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCQCScope]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCQCScope](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCQCStatus]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCQCStatus](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCQCType]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCQCType](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCResolutionStandard]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCResolutionStandard](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[DisneyTWDCTextedLanguage]    Script Date: 12/06/2023 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[DisneyTWDCTextedLanguage](
	[Type] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'2.0 Music & Effects Pro Tools Supersession')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'2.0 Printmaster Pro Tools Supersession')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'2.0 Stems Pro Tools Supersession')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'5.1 Music & Effects Pro Tools Supersession')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'5.1 Printmaster Pro Tools Supersession')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'5.1 Stems Pro Tools Supersession')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'7.1 Music & Effects Pro Tools Supersession')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'7.1 Printmaster Pro Tools Supersession')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'7.1 Stems Pro Tools Supersession')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Blu-ray Disk')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Clipster Project')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Digital Betacam')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Digital Cinema Package (DCP)')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Disc Image (I50)')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Disney Streaming Package (MovieLabs MMC)')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Dolby Vision Metadata')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'DVD')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'HD SDR IMF-A')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'HD SDR ProHQ')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'HDCAM')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'HDCAM-SR')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Home Atmos ADM BWAV')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Home Atmos DAMF')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Home Atmos Music & Effects Pro Tools Supersession')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Home Atmos Printmaster Pro Tools Suppression')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Home Atmos Stems Pro Tools Suppression')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Image Sequence (DPX)')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Image Sequence (EXR')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Image Sequence (TIFF)')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'IMSC Subtitles')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'LTO')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'Other (See Asset Type Notes)')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'UHD HDR IMF-A')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'UHD HDR IMF-D')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'UHD HDR ProXQ')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'UHD SDR IMF-A')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'UHD SDR IMF-D')
GO
INSERT [bward].[DisneyTWDCAssetType] ([Type]) VALUES (N'UHD SDR ProHQ')
GO
INSERT [bward].[DisneyTWDCAudioBitDepth] ([Type]) VALUES (N'N/A')
GO
INSERT [bward].[DisneyTWDCAudioBitDepth] ([Type]) VALUES (N'16')
GO
INSERT [bward].[DisneyTWDCAudioBitDepth] ([Type]) VALUES (N'20')
GO
INSERT [bward].[DisneyTWDCAudioBitDepth] ([Type]) VALUES (N'24')
GO
INSERT [bward].[DisneyTWDCAudioBitDepth] ([Type]) VALUES (N'96')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'1.0 Mono')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'1.0 Mono M&E')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 Left')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 Right')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 Left Total')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 Right Total')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 M&E Left Total')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 M&E Right total')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Left Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Right Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Centre Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Low-Frequency Effect Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Left Surround Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Right Surround Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 M&E Left Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 M8E Right Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 M&E Centre Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 M&E Low-Frequency Effect Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 M8/E Left Surround Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 M8E Right Surround Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1| Left Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 Right Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 Centre Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 Low-Frequency Effect Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 Left Surround Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 Right Surround Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 Left Surround Rear Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 Right Surround Rear Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 M&E Left Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 MBLE Right Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 M&E Centre Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 M&E Low-Frequency Effect Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 M&E Left Surround Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 M&E Right Surround Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 M&/E Left Surround Rear Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'7.1 M&E Right Surround Rear Channel')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'Dolby E 5.1/2.0')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'Dolby E 5.1/ 2.0 (R128)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Left (R128)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Right (R128)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Centre (R128)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 LFE (R128)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Left Surround (R128)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Right Surround (R128)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 Left (R128)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 Right (R128)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'1.0 Mono R128)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Left (FICAM)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Right (FICAM)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Centre (FICAM)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 LFE (FICAM)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Left Surround (FICAM)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'5.1 Right Surround (FICAM)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'Audio Descriptive 2.0 LT')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'Audio Descriptive 2.0 RT')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 Left Total (FICAM)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 Right Total (FICAM)')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 Left PAL Legal')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'2.0 Right PAL Legal')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'French Audio Descriptive LT')
GO
INSERT [bward].[DisneyTWDCAudioConfiguration] ([Type]) VALUES (N'French Audio Descriptive RT')
GO
INSERT [bward].[DisneyTWDCAudioSampleRate] ([Type]) VALUES (N'22.05kHz')
GO
INSERT [bward].[DisneyTWDCAudioSampleRate] ([Type]) VALUES (N'32.0kHz')
GO
INSERT [bward].[DisneyTWDCAudioSampleRate] ([Type]) VALUES (N'44.056kHz')
GO
INSERT [bward].[DisneyTWDCAudioSampleRate] ([Type]) VALUES (N'44.1kHz')
GO
INSERT [bward].[DisneyTWDCAudioSampleRate] ([Type]) VALUES (N'48.0kHz')
GO
INSERT [bward].[DisneyTWDCAudioSampleRate] ([Type]) VALUES (N'88.2kHz')
GO
INSERT [bward].[DisneyTWDCAudioSampleRate] ([Type]) VALUES (N'96.0kHz')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 1.19')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 1.20')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 1.33')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 1.37')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 1.66')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 1.75')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 1.78')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 1.85')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 1.90')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.00')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.10')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.20')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.21')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.24')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.35')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.39')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.40')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.50')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.55')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.76')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'16x9 2.96')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 1.19')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 1.20')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 1.33')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 1.37')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 1.66')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 1.75')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 1.78')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 1.85')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 1.90')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 2.00')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 2.10')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 2.20')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 2.24')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 2.35')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 2.39')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 2.40')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 2.50')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 2.55')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 2.76')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'4x3 2.96')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Flat 1.19')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Flat 1.20')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Flat 1.33')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Flat 1.37')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Flat 1.66')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Flat 1.75')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Flat 1.78')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Flat 1.85')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Full 1.90')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 1.90')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.00')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.10')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.20')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.21')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.24')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.35')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.39')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.40')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.50')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.55')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.76')
GO
INSERT [bward].[DisneyTWDCCanvasImageAspectRatio] ([Type]) VALUES (N'Scope 2.96')
GO
INSERT [bward].[DisneyTWDCChromaSubSamplingRate] ([Type]) VALUES (N'4:2:0')
GO
INSERT [bward].[DisneyTWDCChromaSubSamplingRate] ([Type]) VALUES (N'4:2:2')
GO
INSERT [bward].[DisneyTWDCChromaSubSamplingRate] ([Type]) VALUES (N'4:4:4')
GO
INSERT [bward].[DisneyTWDCClosedCaptionType] ([Type]) VALUES (N'N/A')
GO
INSERT [bward].[DisneyTWDCClosedCaptionType] ([Type]) VALUES (N'EIA 608')
GO
INSERT [bward].[DisneyTWDCClosedCaptionType] ([Type]) VALUES (N'EIA 708')
GO
INSERT [bward].[DisneyTWDCColorEncoding] ([Type]) VALUES (N'BT601')
GO
INSERT [bward].[DisneyTWDCColorEncoding] ([Type]) VALUES (N'BT709')
GO
INSERT [bward].[DisneyTWDCColorEncoding] ([Type]) VALUES (N'BT2020')
GO
INSERT [bward].[DisneyTWDCColorEncoding] ([Type]) VALUES (N'P3')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Black at Head')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Bars & Tone')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Slate')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'2-Pop')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Head Tail')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Start of Program Animation_VFX')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Artwork')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Audio')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Audio Description')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Cations')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Channel Identifiers')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Commentary')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Commercial Break')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Film Related')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'HDR Metadata')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Intermission')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Logo')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Motion Code')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Packaging')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Picture Insert')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Platform Metadata')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Stereography 3D')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Subtitles')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Titles Graphics')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Dub Cards')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'End of Program')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Tail Pop')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'Black at Tail')
GO
INSERT [bward].[DisneyTWDCComponentEvent] ([Type]) VALUES (N'End of File')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'2K film down conversion')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'2K Film Scan')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'4K Film Scan')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Blu-ray Disc')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Clipster Project')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'D1')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'D2')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'D5')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'D6')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Delta')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Digital Betacam')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Digital Cinema Package (DCP)')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Disc Image (ISO)')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'DPX-A')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'DPX-R')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'DPX-V')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'DPX-V and DPX-A')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'DPX-V and WAV')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'DVD')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'EXR-V')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'EXR-V and DPX-A')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'HD SDR ProHQ')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'HDCAM')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'HDCAM and WAV Audio')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'HDCAM-SR')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'HDCAM-SR and WAV Audio')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Home Atmos ADM BWAV')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Home Atmos DAMF')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Image Sequence (DPX) and WAV Audio')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Image Sequence (EXR) and WAV Audio')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Image Sequence (TIFF) and WAV Audio')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'IMF')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'MPEG-2')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Other (See Created From Notes)')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'ProRes – HQ 86129NDF (NTSC)')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Pro Tools Supersession')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Resolve Project')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'Transport Stream (TS)')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'UHD HDR ProXQ')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'UHD SDR ProHQ')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'VHS')
GO
INSERT [bward].[DisneyTWDCCreatedFrom] ([Type]) VALUES (N'WAV Audio')
GO
INSERT [bward].[DisneyTWDCFinalStatus] ([Type]) VALUES (N'Acceptable')
GO
INSERT [bward].[DisneyTWDCFinalStatus] ([Type]) VALUES (N'Approved')
GO
INSERT [bward].[DisneyTWDCFinalStatus] ([Type]) VALUES (N'Approved: in Source')
GO
INSERT [bward].[DisneyTWDCFinalStatus] ([Type]) VALUES (N'Creative Intent')
GO
INSERT [bward].[DisneyTWDCFinalStatus] ([Type]) VALUES (N'Fixed')
GO
INSERT [bward].[DisneyTWDCFinalStatus] ([Type]) VALUES (N'Localization')
GO
INSERT [bward].[DisneyTWDCFinalStatus] ([Type]) VALUES (N'Rejected')
GO
INSERT [bward].[DisneyTWDCForensicWatermark] ([Type]) VALUES (N'N/A')
GO
INSERT [bward].[DisneyTWDCForensicWatermark] ([Type]) VALUES (N'Verified')
GO
INSERT [bward].[DisneyTWDCForensicWatermark] ([Type]) VALUES (N'Pending')
GO
INSERT [bward].[DisneyTWDCForensicWatermark] ([Type]) VALUES (N'Failed')
GO
INSERT [bward].[DisneyTWDCFrameRate] ([Type]) VALUES (N'23.976')
GO
INSERT [bward].[DisneyTWDCFrameRate] ([Type]) VALUES (N'24')
GO
INSERT [bward].[DisneyTWDCFrameRate] ([Type]) VALUES (N'25')
GO
INSERT [bward].[DisneyTWDCFrameRate] ([Type]) VALUES (N'29.97')
GO
INSERT [bward].[DisneyTWDCFrameRate] ([Type]) VALUES (N'30')
GO
INSERT [bward].[DisneyTWDCFrameRate] ([Type]) VALUES (N'48')
GO
INSERT [bward].[DisneyTWDCFrameRate] ([Type]) VALUES (N'50')
GO
INSERT [bward].[DisneyTWDCFrameRate] ([Type]) VALUES (N'59.94')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Azerbaijani')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Belarusian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Bosnian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Bulgarian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Burmese')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Catalan - Valencian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Chinese - Cantonese')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Chinese - Mandarin PRC')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Chinese - Mandarin Taiwan')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Croatian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Czech')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Danish')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Dutch')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'English')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'English - Australian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'English - British')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Estonian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Farsi: Persian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Finnish')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Flemish')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'French - Canadian (Quebecois)')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'French - France')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'German')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'German - Austrian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'German - Swiss/Alsatian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Greek - Modern')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Hebrew')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Hindi')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Hungarian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Icelandic')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Indonesian Bahasa')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Italian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Japanese')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Kazakh')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Korean')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Latin')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Latvian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Luxembourg')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Lithuanian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Macedonian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Malay Bahasa')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Malayalam')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Maori')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Mongolian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Northern Sami')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Norwegian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Panjabi')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Polish')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Portuguese - Brazilian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Portuguese - European')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Pushto')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Romanian - Moldavian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Russian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Serbian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Slavic')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Slovak')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Slovenian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Somali')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Spanish - Argentinian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Spanish - Castilian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Spanish - Chilean')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Spanish - Latin American')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Spanish - Mexican')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Swedish')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Tagaloq')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Taiwanese - Min Nan')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Tamil')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Thai')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Turkish')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Ukrainian')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Urdu')
GO
INSERT [bward].[DisneyTWDCMainLanguage] ([Type]) VALUES (N'Vietnamese')
GO
INSERT [bward].[DisneyTWDCQCEvaluation] ([Type]) VALUES (N'FYI')
GO
INSERT [bward].[DisneyTWDCQCEvaluation] ([Type]) VALUES (N'Fixed')
GO
INSERT [bward].[DisneyTWDCQCEvaluation] ([Type]) VALUES (N'Localisation')
GO
INSERT [bward].[DisneyTWDCQCEvaluation] ([Type]) VALUES (N'Review Required')
GO
INSERT [bward].[DisneyTWDCQCEvaluation] ([Type]) VALUES (N'Rejected')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'3D Convergence Review')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'3D Left Eve Review')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'3D Right Eye Review')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'3D Side-By-Side Review')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'BD Top.')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'And-Bottom Review')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'Censorship Review')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'Client Review')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'Comparative Review')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'Dirt Review')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'Other (See Process Notes)')
GO
INSERT [bward].[DisneyTWDCQCProcess] ([Type]) VALUES (N'Quadrant Review')
GO
INSERT [bward].[DisneyTWDCQCScope] ([Type]) VALUES (N'Full Linear')
GO
INSERT [bward].[DisneyTWDCQCScope] ([Type]) VALUES (N'Spot')
GO
INSERT [bward].[DisneyTWDCQCStatus] ([Type]) VALUES (N'In Progress')
GO
INSERT [bward].[DisneyTWDCQCStatus] ([Type]) VALUES (N'Approved')
GO
INSERT [bward].[DisneyTWDCQCStatus] ([Type]) VALUES (N'Review Required')
GO
INSERT [bward].[DisneyTWDCQCStatus] ([Type]) VALUES (N'Rejected')
GO
INSERT [bward].[DisneyTWDCQCType] ([Type]) VALUES (N'Content OC - Audio')
GO
INSERT [bward].[DisneyTWDCQCType] ([Type]) VALUES (N'Content QC - Image and Embedded Audio')
GO
INSERT [bward].[DisneyTWDCQCType] ([Type]) VALUES (N'Content QC - Image without Audio')
GO
INSERT [bward].[DisneyTWDCQCType] ([Type]) VALUES (N'Primary QC - Audio')
GO
INSERT [bward].[DisneyTWDCQCType] ([Type]) VALUES (N'Primary QC - Image and Embedded Audio')
GO
INSERT [bward].[DisneyTWDCQCType] ([Type]) VALUES (N'Primary QC - Image without Audio')
GO
INSERT [bward].[DisneyTWDCQCType] ([Type]) VALUES (N'Technical OC - Audio')
GO
INSERT [bward].[DisneyTWDCQCType] ([Type]) VALUES (N'Technical QC - Image and Embedded Audio')
GO
INSERT [bward].[DisneyTWDCQCType] ([Type]) VALUES (N'Technical QC - Image without Audio')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'720x486 (SD NTSC)')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'720x756 (SD PAL)')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'1920x804')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'1280x720')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'1920x1080 (HD)')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'2048x1556')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'2134x894')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'3840x804')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'3840x1606')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'3840x1608')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'3840x2160 (UHD)')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'4096x2160 (DCI 4K)')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'3996x2160 (DCI 4K Flat)')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'4096x1716 (DCI 4K Scope)')
GO
INSERT [bward].[DisneyTWDCResolutionStandard] ([Type]) VALUES (N'4096x3112 (DCI 4K Anamorphic)')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Azerbaijani')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Belarusian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Bosnian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Bulgarian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Burmese')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Catalan – Valencian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Chinese Simplified Characters')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Chinese Simplified Characters - Malaysia')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Chinese Simplified Characters - PRC')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Chinese Simplified Characters - Singapore')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Chinese Traditional Characters')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Chinese Traditional Characters - Hong Kong')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Chinese Traditional Characters - Taiwan')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Croatian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Czech')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Danish')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Dutch')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'English')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'English - Australian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'British')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Estonian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Farsi; Persian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Finnish')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Flemish')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'French Canadian (Quebecois)')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'French - France')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'German')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'German -')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Austrian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'German - Swiss/Alsatian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Greek - Modern')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Hebrew')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Hindi')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Hungarian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Icelandic')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Indonesian Bahasa')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Italian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Japanese')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Kazakh')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Korean')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Latin')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Latvian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Lexembourgish')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Lithuanian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Macedonian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Malay Bahasa')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Malayalam')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Maori')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Mongolian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Northern Sami')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Norwegian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Panjabi')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Polish')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Portuguese - Brazilian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Portuguese - European')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Pushto')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Romanian - Moldavian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Russian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Semi Textless')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Serbian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Slavic')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Slovak')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Slovenian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Somali')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Spanish - Argentinian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Spanish - Castilian')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Spanish - Chilean')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Spanish - Latin American')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Spanish - Mexican')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Swedish')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Tagalog')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Taiwanese - Min Nan')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Tamil')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Telugu')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Textless (No Linguistic Content)')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Thai')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Turkish')
GO
INSERT [bward].[DisneyTWDCTextedLanguage] ([Type]) VALUES (N'Ukrainian')
GO
