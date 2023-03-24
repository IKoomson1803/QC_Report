USE [QCSUK]
GO
/****** Object:  Table [bward].[BanijayRightsAspectRatio]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsAspectRatio](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsCaptionSafe]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsCaptionSafe](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsCodec]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsCodec](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsFileWrapper]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsFileWrapper](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsFrameRate]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsFrameRate](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsInShowAndAfterProg]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsInShowAndAfterProg](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsLanguage]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsLanguage](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsPosition]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsPosition](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsSDROrHDR]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsSDROrHDR](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsTimecode]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsTimecode](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsTone]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsTone](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsTrackContent]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsTrackContent](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsTypeOfHDR]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsTypeOfHDR](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bward].[BanijayRightsVideoLines]    Script Date: 30/01/2023 14:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsVideoLines](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'1.33:1 (4:3)')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'1.66:1')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'1.55:1')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'1.75:1')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'1.77:1')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'1.78:1 (16:9)')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'1.85:1')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'2.00:1')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'2.35:1')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'2.40:1')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'2.55:1')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'DUAL. See notes')
GO
INSERT [bward].[BanijayRightsAspectRatio] ([Type]) VALUES (N'VARIOUS. See notes')
GO
INSERT [bward].[BanijayRightsCaptionSafe] ([Type]) VALUES (N'16:9')
GO
INSERT [bward].[BanijayRightsCaptionSafe] ([Type]) VALUES (N'14:9')
GO
INSERT [bward].[BanijayRightsCaptionSafe] ([Type]) VALUES (N'4:3')
GO
INSERT [bward].[BanijayRightsCaptionSafe] ([Type]) VALUES (N'14x9 Safe')
GO
INSERT [bward].[BanijayRightsCaptionSafe] ([Type]) VALUES (N'Out of 14x9 safe within 90% safe')
GO
INSERT [bward].[BanijayRightsCaptionSafe] ([Type]) VALUES (N'90% Safe')
GO
INSERT [bward].[BanijayRightsCaptionSafe] ([Type]) VALUES (N'Out of 14x9 safe and 90% safe')
GO
INSERT [bward].[BanijayRightsCaptionSafe] ([Type]) VALUES (N'Out of 90% Safe - Within Action safe')
GO
INSERT [bward].[BanijayRightsCaptionSafe] ([Type]) VALUES (N'Out of Action safe / Chopped off')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'IMX50')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'ProRes 422')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'ProRes 422(HQ)')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'XDCam HD 4:2:2')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'ProRes 4444')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'ProRes 4444 (XQ)')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'DNxHD')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'DNxHD 185x')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'DNxHD 2020')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'DNxHD 2020x')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'XDCAM HD')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'XDCAM HD 35')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'AVC')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'AVC - Intra 100')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'AVC - Intra 50')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'H264.mov')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'SDR / HDR')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'NA')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'SDR')
GO
INSERT [bward].[BanijayRightsCodec] ([Type]) VALUES (N'HDR')
GO
INSERT [bward].[BanijayRightsFileWrapper] ([Type]) VALUES (N'MOV')
GO
INSERT [bward].[BanijayRightsFileWrapper] ([Type]) VALUES (N'MXF')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'23.98p')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'24p')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'25p')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'50p')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'50i')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'29.97p')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'59.94i')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'525')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'576p25')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'625')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'720/23.98P')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'720/25P')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'Not Known')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'NTSC')
GO
INSERT [bward].[BanijayRightsFrameRate] ([Type]) VALUES (N'PAL')
GO
INSERT [bward].[BanijayRightsInShowAndAfterProg] ([Type]) VALUES (N'Texted on picture')
GO
INSERT [bward].[BanijayRightsInShowAndAfterProg] ([Type]) VALUES (N'Texted on neutral')
GO
INSERT [bward].[BanijayRightsInShowAndAfterProg] ([Type]) VALUES (N'Textless picture')
GO
INSERT [bward].[BanijayRightsInShowAndAfterProg] ([Type]) VALUES (N'None')
GO
INSERT [bward].[BanijayRightsInShowAndAfterProg] ([Type]) VALUES (N'N/A')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'English')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'Spanish')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'French')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'Portuguese')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'Italian')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'Swedish')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'Flemish')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'German')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'Danish')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'Finnish')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'Dutch')
GO
INSERT [bward].[BanijayRightsLanguage] ([Type]) VALUES (N'N/A')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'Mono')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'2.0 Left')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'2.0 Right')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'5.1 Left')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'5.1 Right')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'5.1 Centre')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'5.1 LFE')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'5.1 Rear Left')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'5.1 Rear Right')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'DataStream')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'Dolby E')
GO
INSERT [bward].[BanijayRightsPosition] ([Type]) VALUES (N'N/A')
GO
INSERT [bward].[BanijayRightsSDROrHDR] ([Type]) VALUES (N'N/A')
GO
INSERT [bward].[BanijayRightsSDROrHDR] ([Type]) VALUES (N'SDR')
GO
INSERT [bward].[BanijayRightsSDROrHDR] ([Type]) VALUES (N'HDR')
GO
INSERT [bward].[BanijayRightsTimecode] ([Type]) VALUES (N'LTC/VITC')
GO
INSERT [bward].[BanijayRightsTimecode] ([Type]) VALUES (N'LTC ONLY')
GO
INSERT [bward].[BanijayRightsTimecode] ([Type]) VALUES (N'Embedded In File')
GO
INSERT [bward].[BanijayRightsTimecode] ([Type]) VALUES (N'Unusable')
GO
INSERT [bward].[BanijayRightsTimecode] ([Type]) VALUES (N'Not present')
GO
INSERT [bward].[BanijayRightsTone] ([Type]) VALUES (N'-18dBFS')
GO
INSERT [bward].[BanijayRightsTone] ([Type]) VALUES (N'-20dBFS')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'Mute')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'Full Mix')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'Mix Minus VO')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'M+E')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'Sync')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'VO')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'Effects')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'Sync+VO')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'Music')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'LFE')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'Dolby E Full Mix')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'Dolby E MMVO')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'Dolby E M+E')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'Mix Minus VO dipped')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'M+E dipped')
GO
INSERT [bward].[BanijayRightsTrackContent] ([Type]) VALUES (N'N/A')
GO
INSERT [bward].[BanijayRightsTypeOfHDR] ([Type]) VALUES (N'HDR 10')
GO
INSERT [bward].[BanijayRightsTypeOfHDR] ([Type]) VALUES (N'HDR 10+')
GO
INSERT [bward].[BanijayRightsTypeOfHDR] ([Type]) VALUES (N'HLG')
GO
INSERT [bward].[BanijayRightsTypeOfHDR] ([Type]) VALUES (N'PQ')
GO
INSERT [bward].[BanijayRightsTypeOfHDR] ([Type]) VALUES (N'Dolby Vision')
GO
INSERT [bward].[BanijayRightsVideoLines] ([Type]) VALUES (N'576 (PAL)')
GO
INSERT [bward].[BanijayRightsVideoLines] ([Type]) VALUES (N'480 (NTSC)')
GO
INSERT [bward].[BanijayRightsVideoLines] ([Type]) VALUES (N'720')
GO
INSERT [bward].[BanijayRightsVideoLines] ([Type]) VALUES (N'1080 (HD)')
GO
INSERT [bward].[BanijayRightsVideoLines] ([Type]) VALUES (N'2160 (UHD)')
GO
INSERT [bward].[BanijayRightsVideoLines] ([Type]) VALUES (N'2160 (4k)')
GO
INSERT [bward].[BanijayRightsVideoLines] ([Type]) VALUES (N'UHD 3840x2160')
GO
INSERT [bward].[BanijayRightsVideoLines] ([Type]) VALUES (N'UHD 3840x2160 BT2020')
GO
INSERT [bward].[BanijayRightsVideoLines] ([Type]) VALUES (N'UHD 3840x2160 BT709')
GO

/****** Object:  Table [bward].[BanijayRightsBitRate]    Script Date: 27/02/2023 11:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bward].[BanijayRightsBitRate](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [bward].[BanijayRightsBitRate] ([Type]) VALUES (N'16bit')
GO
INSERT [bward].[BanijayRightsBitRate] ([Type]) VALUES (N'24bit')
GO
