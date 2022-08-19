
/****** Object:  StoredProcedure [bward].[sp_SelectAudioTC]    Script Date: 11/09/2015 13:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bward].[sp_SelectAudioTC]
	@_QCNum int,
	@_rev int
	
AS
BEGIN
	DECLARE @ErrorMsg VARCHAR(300)
	
	SELECT 
		Language, ChannelCount,
		Language1, Language2, Language3, Language4, Language5, Language6, 
		Language7, Language8, Language9, Language10, Language11, Language12, 
		Language13, Language14, Language15, Language16, Language17, Language18, 
		Language19, Language20, Language21, Language22, Language23, Language24,
		ch1_desc, ch1_LKFS, ch1_tone, ch1_avg, ch1_peak, ch1_TruePeak,
		ch2_desc, ch2_LKFS, ch2_tone, ch2_avg, ch2_peak, ch2_TruePeak,
		ch3_desc,  ch3_LKFS, ch3_tone, ch3_avg, ch3_peak, ch3_TruePeak,
		ch4_desc,  ch4_LKFS, ch4_tone, ch4_avg, ch4_peak, ch4_TruePeak,
		ch5_desc,  ch5_LKFS, ch5_tone, ch5_avg, ch5_peak, ch5_TruePeak,
		ch6_desc,  ch6_LKFS, ch6_tone, ch6_avg, ch6_peak, ch6_TruePeak,
		ch7_desc,  ch7_LKFS, ch7_tone, ch7_avg, ch7_peak, ch7_TruePeak,
		ch8_desc,  ch8_LKFS, ch8_tone, ch8_avg, ch8_peak, ch8_TruePeak,
		ch9_desc,  ch9_LKFS, ch9_tone, ch9_avg, ch9_peak, ch9_TruePeak,
		ch10_desc, ch10_LKFS,  ch10_tone, ch10_avg, ch10_peak, ch10_TruePeak,
		ch11_desc, ch11_LKFS,  ch11_tone, ch11_avg, ch11_peak, ch11_TruePeak,
		ch12_desc,  ch12_LKFS, ch12_tone, ch12_avg, ch12_peak, ch12_TruePeak,
		ch13_desc, ch13_LKFS,  ch13_tone, ch13_avg, ch13_peak, ch13_TruePeak,
		ch14_desc, ch14_LKFS,  ch14_tone, ch14_avg, ch14_peak, ch14_TruePeak,
		ch15_desc, ch15_LKFS,  ch15_tone, ch15_avg, ch15_peak, ch15_TruePeak,
		ch16_desc, ch16_LKFS,  ch16_tone, ch16_avg, ch16_peak, ch16_TruePeak,
		ch17_desc, ch17_LKFS,  ch17_tone, ch17_avg, ch17_peak, ch17_TruePeak,
		ch18_desc, ch18_LKFS,  ch18_tone, ch18_avg, ch18_peak, ch18_TruePeak,
		ch19_desc, ch19_LKFS,  ch19_tone, ch19_avg, ch19_peak, ch19_TruePeak,
		ch20_desc, ch20_LKFS,  ch20_tone, ch20_avg, ch20_peak, ch20_TruePeak,
		ch21_desc, ch21_LKFS,  ch21_tone, ch21_avg, ch21_peak, ch21_TruePeak,
		ch22_desc, ch22_LKFS,  ch22_tone, ch22_avg, ch22_peak, ch22_TruePeak,
		ch23_desc, ch23_LKFS,  ch23_tone, ch23_avg, ch23_peak, ch23_TruePeak,
		ch24_desc, ch24_LKFS,  ch24_tone, ch24_avg, ch24_peak, ch24_TruePeak,
		FullQC_Vid, FullQC_cue,
		FullQC_ch1, FullQC_ch2, FullQC_ch3, FullQC_ch4, 
		FullQC_ch5, FullQC_ch6, FullQC_ch7, FullQC_ch8, 
		FullQC_ch9, FullQC_ch10, FullQC_ch11, FullQC_ch12,
		FullQC_ch13,FullQC_ch14, FullQC_ch15, FullQC_ch16,
		FullQC_ch17,FullQC_ch18, FullQC_ch19, FullQC_ch20, 
		FullQC_ch21,FullQC_ch22, FullQC_ch23, FullQC_ch24,
		SpotQC_vid, SpotQC_cue, 
		SpotQC_ch1, SpotQC_ch2, SpotQC_ch3, SpotQC_ch4, 
		SpotQC_ch5, SpotQC_ch6, SpotQC_ch7, SpotQC_ch8,
		SpotQC_ch9, SpotQC_ch10, SpotQC_ch11, SpotQC_ch12,
		SpotQC_ch13,SpotQC_ch14, SpotQC_ch15, SpotQC_ch16,
		SpotQC_ch17,SpotQC_ch18, SpotQC_ch19, SpotQC_ch20, 
		SpotQC_ch21,SpotQC_ch22, SpotQC_ch23, SpotQC_ch24,
		cue_desc, cue_LKFS,  cue_tone, cue_avg, cue_peak, cue_TruePeak,
		NR, time_code, CH12_Phase, CH34_Phase, QCinUnity, LTC_VITC_Match, SurroundSound, 
		TCInteg, Tone_Phase, Comp_Sync
	FROM 
		[bward].qcAudioTC a
	JOIN [bward].qcHeader h on a.qcNum = h.Qcnum and a.subQCNum = h.subQcnum
	WHERE 
		a.qcNum = @_QCNum
		AND a.subQCNum = @_rev
	
		
		
IF @@ERROR <> 0
	BEGIN
		SET @errorMsg = 'Could not select qcAudioTC (sp_SelectAudioTC)'
		GOTO Error
	END
		
Error:

	IF (@errorMsg IS NOT NULL)
	BEGIN
		RAISERROR(@errorMsg, 16, 1)
	END
	
END