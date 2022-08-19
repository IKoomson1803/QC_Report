using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Deluxe.QCReport.Common.Services;

namespace Deluxe.QCReport.Test
{
    [TestClass]
    public class TCTransformServiceTest
    {
        [TestMethod]
        public void TimecodeToFramesNumber_Test()
        {
            TCTransformService _tcSrv24 = new TCTransformService(24);
            TCTransformService _tcSrv25 = new TCTransformService(25);
            TCTransformService _tcSrv30 = new TCTransformService(30);

            string in_fail_01 = "00:01";
            string in_fail_02 = "not a timecode at all";
            string in_suc_03 = "00:01:00:00";
            string in_suc_04 = "10:00:00:00";
            string in_suc_05 = "10:31:13:14";
            string in_suc_06 = "23:59:59:23";
            string in_suc_07 = "14:39:47:00";
            string in_suc_08 = "19:18:24:10";
            string in_suc_09 = "10:05:30:10";
            string in_suc_10 = "11:51:31:20";
            string in_suc_11 = "03:14:20:00";
            string in_fail_12 = "";



            // 24 fps test
            // ===========
            int result01 = _tcSrv24.TimecodeToFramesNumber(in_fail_01);
            int result02 = _tcSrv24.TimecodeToFramesNumber(in_fail_02);
            int result03 = _tcSrv24.TimecodeToFramesNumber(in_suc_03);
            int result04 = _tcSrv24.TimecodeToFramesNumber(in_suc_04);
            int result05 = _tcSrv24.TimecodeToFramesNumber(in_suc_05);
            int result06 = _tcSrv24.TimecodeToFramesNumber(in_suc_06);
            int result07 = _tcSrv24.TimecodeToFramesNumber(in_suc_07);
            int result08 = _tcSrv24.TimecodeToFramesNumber(in_suc_08);
            int result09 = _tcSrv24.TimecodeToFramesNumber(in_suc_09);
            int result10 = _tcSrv24.TimecodeToFramesNumber(in_suc_10);
            int result11 = _tcSrv24.TimecodeToFramesNumber(in_suc_11);
            int result12 = _tcSrv24.TimecodeToFramesNumber(in_fail_12);

            Assert.AreEqual(0, result01);
            Assert.AreEqual(0, result02);
            Assert.AreEqual(1440, result03);
            Assert.AreEqual(864000, result04);
            Assert.AreEqual(908966, result05);
            Assert.AreEqual(2073599, result06);
            Assert.AreEqual(1266888, result07);
            Assert.AreEqual(1668106, result08);
            Assert.AreEqual(871930, result09);
            Assert.AreEqual(1024604, result10);
            Assert.AreEqual(279840, result11);
            Assert.AreEqual(0, result12);



            // 25 fps test
            // ===========
            result01 = _tcSrv25.TimecodeToFramesNumber(in_fail_01);
            result02 = _tcSrv25.TimecodeToFramesNumber(in_fail_02);
            result03 = _tcSrv25.TimecodeToFramesNumber(in_suc_03);
            result04 = _tcSrv25.TimecodeToFramesNumber(in_suc_04);
            result05 = _tcSrv25.TimecodeToFramesNumber(in_suc_05);
            result06 = _tcSrv25.TimecodeToFramesNumber(in_suc_06);
            result07 = _tcSrv25.TimecodeToFramesNumber(in_suc_07);
            result08 = _tcSrv25.TimecodeToFramesNumber(in_suc_08);
            result09 = _tcSrv25.TimecodeToFramesNumber(in_suc_09);
            result10 = _tcSrv25.TimecodeToFramesNumber(in_suc_10);
            result11 = _tcSrv25.TimecodeToFramesNumber(in_suc_11);
            result12 = _tcSrv25.TimecodeToFramesNumber(in_fail_12);

            Assert.AreEqual(0, result01);
            Assert.AreEqual(0, result02);
            Assert.AreEqual(1500, result03);
            Assert.AreEqual(900000, result04);
            Assert.AreEqual(946839, result05);
            Assert.AreEqual(2159998, result06);
            Assert.AreEqual(1319675, result07);
            Assert.AreEqual(1737610, result08);
            Assert.AreEqual(908260, result09);
            Assert.AreEqual(1067295, result10);
            Assert.AreEqual(291500, result11);
            Assert.AreEqual(0, result12);




            // 30 fps test
            // ===========
            result01 = _tcSrv30.TimecodeToFramesNumber(in_fail_01);
            result02 = _tcSrv30.TimecodeToFramesNumber(in_fail_02);
            result03 = _tcSrv30.TimecodeToFramesNumber(in_suc_03);
            result04 = _tcSrv30.TimecodeToFramesNumber(in_suc_04);
            result05 = _tcSrv30.TimecodeToFramesNumber(in_suc_05);
            result06 = _tcSrv30.TimecodeToFramesNumber(in_suc_06);
            result07 = _tcSrv30.TimecodeToFramesNumber(in_suc_07);
            result08 = _tcSrv30.TimecodeToFramesNumber(in_suc_08);
            result09 = _tcSrv30.TimecodeToFramesNumber(in_suc_09);
            result10 = _tcSrv30.TimecodeToFramesNumber(in_suc_10);
            result11 = _tcSrv30.TimecodeToFramesNumber(in_suc_11);
            result12 = _tcSrv30.TimecodeToFramesNumber(in_fail_12);

            Assert.AreEqual(0, result01);
            Assert.AreEqual(0, result02);
            Assert.AreEqual(1800, result03);
            Assert.AreEqual(1080000, result04);
            Assert.AreEqual(1136204, result05);
            Assert.AreEqual(2591993, result06);
            Assert.AreEqual(1583610, result07);
            Assert.AreEqual(2085130, result08);
            Assert.AreEqual(1089910, result09);
            Assert.AreEqual(1280750, result10);
            Assert.AreEqual(349800, result11);
            Assert.AreEqual(0, result12);



        }


        [TestMethod]
        public void FramesNumberToTimecode_Test()
        {
            TCTransformService _tcSrv24 = new TCTransformService(24);
            TCTransformService _tcSrv25 = new TCTransformService(25);
            TCTransformService _tcSrv30 = new TCTransformService(30);

            int in_fail_01 = 0;
            int in_fail_02 = 0;
            int in_suc_03 = 1440;
            int in_suc_04 = 864000;
            int in_suc_05 = 908966;
            int in_suc_06 = 2073599;
            int in_suc_07 = 1266888;
            int in_suc_08 = 1668106;
            int in_suc_09 = 871930;
            int in_suc_10 = 1024604;
            int in_suc_11 = 279840;
            int in_fail_12 = 0;


            // 24 fps test
            // ===========
            string result01 = _tcSrv24.FramesNumberToTimecode(in_fail_01);
            string result02 = _tcSrv24.FramesNumberToTimecode(in_fail_02);
            string result03 = _tcSrv24.FramesNumberToTimecode(in_suc_03);
            string result04 = _tcSrv24.FramesNumberToTimecode(in_suc_04);
            string result05 = _tcSrv24.FramesNumberToTimecode(in_suc_05);
            string result06 = _tcSrv24.FramesNumberToTimecode(in_suc_06);
            string result07 = _tcSrv24.FramesNumberToTimecode(in_suc_07);
            string result08 = _tcSrv24.FramesNumberToTimecode(in_suc_08);
            string result09 = _tcSrv24.FramesNumberToTimecode(in_suc_09);
            string result10 = _tcSrv24.FramesNumberToTimecode(in_suc_10);
            string result11 = _tcSrv24.FramesNumberToTimecode(in_suc_11);
            string result12 = _tcSrv24.FramesNumberToTimecode(in_fail_12);

            Assert.AreEqual("00:00:00:00", result01);
            Assert.AreEqual("00:00:00:00", result02);
            Assert.AreEqual("00:01:00:00", result03);
            Assert.AreEqual("10:00:00:00", result04);
            Assert.AreEqual("10:31:13:14", result05);
            Assert.AreEqual("23:59:59:23", result06);
            Assert.AreEqual("14:39:47:00", result07);
            Assert.AreEqual("19:18:24:10", result08);
            Assert.AreEqual("10:05:30:10", result09);
            Assert.AreEqual("11:51:31:20", result10);
            Assert.AreEqual("03:14:20:00", result11);
            Assert.AreEqual("00:00:00:00", result12);



            // 25 fps test
            // ===========

            in_fail_01 = 0;
            in_fail_02 = 0;
            in_suc_03 = 1500;
            in_suc_04 = 900000;
            in_suc_05 = 946839;
            in_suc_06 = 2159999;
            in_suc_07 = 1319675;
            in_suc_08 = 1737610;
            in_suc_09 = 908260;
            in_suc_10 = 1067295;
            in_suc_11 = 291500;
            in_fail_12 = 0;

            result01 = _tcSrv25.FramesNumberToTimecode(in_fail_01);
            result02 = _tcSrv25.FramesNumberToTimecode(in_fail_02);
            result03 = _tcSrv25.FramesNumberToTimecode(in_suc_03);
            result04 = _tcSrv25.FramesNumberToTimecode(in_suc_04);
            result05 = _tcSrv25.FramesNumberToTimecode(in_suc_05);
            result06 = _tcSrv25.FramesNumberToTimecode(in_suc_06);
            result07 = _tcSrv25.FramesNumberToTimecode(in_suc_07);
            result08 = _tcSrv25.FramesNumberToTimecode(in_suc_08);
            result09 = _tcSrv25.FramesNumberToTimecode(in_suc_09);
            result10 = _tcSrv25.FramesNumberToTimecode(in_suc_10);
            result11 = _tcSrv25.FramesNumberToTimecode(in_suc_11);
            result12 = _tcSrv25.FramesNumberToTimecode(in_fail_12);

            Assert.AreEqual("00:00:00:00", result01);
            Assert.AreEqual("00:00:00:00", result02);
            Assert.AreEqual("00:01:00:00", result03);
            Assert.AreEqual("10:00:00:00", result04);
            Assert.AreEqual("10:31:13:14", result05);
            Assert.AreEqual("23:59:59:24", result06);
            Assert.AreEqual("14:39:47:00", result07);
            Assert.AreEqual("19:18:24:10", result08);
            Assert.AreEqual("10:05:30:10", result09);
            Assert.AreEqual("11:51:31:20", result10);
            Assert.AreEqual("03:14:20:00", result11);
            Assert.AreEqual("00:00:00:00", result12);



            // 30 fps test
            // ===========

            in_fail_01 = 0;
            in_fail_02 = 0;
            in_suc_03 = 1800;
            in_suc_04 = 1080000;
            in_suc_05 = 1136204;
            in_suc_06 = 2591994;
            in_suc_07 = 1583610;
            in_suc_08 = 2085130;
            in_suc_09 = 1089910;
            in_suc_10 = 1280750;
            in_suc_11 = 349800;
            in_fail_12 = 0;
            
            result01 = _tcSrv30.FramesNumberToTimecode(in_fail_01);
            result02 = _tcSrv30.FramesNumberToTimecode(in_fail_02);
            result03 = _tcSrv30.FramesNumberToTimecode(in_suc_03);
            result04 = _tcSrv30.FramesNumberToTimecode(in_suc_04);
            result05 = _tcSrv30.FramesNumberToTimecode(in_suc_05);
            result06 = _tcSrv30.FramesNumberToTimecode(in_suc_06);
            result07 = _tcSrv30.FramesNumberToTimecode(in_suc_07);
            result08 = _tcSrv30.FramesNumberToTimecode(in_suc_08);
            result09 = _tcSrv30.FramesNumberToTimecode(in_suc_09);
            result10 = _tcSrv30.FramesNumberToTimecode(in_suc_10);
            result11 = _tcSrv30.FramesNumberToTimecode(in_suc_11);
            result12 = _tcSrv30.FramesNumberToTimecode(in_fail_12);

            Assert.AreEqual("00:00:00:00", result01);
            Assert.AreEqual("00:00:00:00", result02);
            Assert.AreEqual("00:01:00:00", result03);
            Assert.AreEqual("10:00:00:00", result04);
            Assert.AreEqual("10:31:13:14", result05);
            Assert.AreEqual("23:59:59:24", result06);
            Assert.AreEqual("14:39:47:00", result07);
            Assert.AreEqual("19:18:24:10", result08);
            Assert.AreEqual("10:05:30:10", result09);
            Assert.AreEqual("11:51:31:20", result10);
            Assert.AreEqual("03:14:20:00", result11);
            Assert.AreEqual("00:00:00:00", result12);
        }

        [TestMethod]
        public void AddTimecodes_Test()
        {
            TCTransformService _tcSrv24 = new TCTransformService(24);
            TCTransformService _tcSrv25 = new TCTransformService(25);
            TCTransformService _tcSrv30 = new TCTransformService(30);

            string in_01 = "00:01:32:11";
            string in_02 = "00:00:00:10";
            string in_03 = "00:01:00:00";
            string in_04 = "10:00:00:00";
            string in_05 = "10:31:13:14";
            string in_06 = "23:59:59:23";
            string in_07 = "14:39:47:00";
            string in_08 = "19:18:24:10";
            string in_09 = "10:05:30:10";
            string in_10 = "11:51:31:20";
            string in_add_01 = "00:14:20:00";
            string in_add_02 = "00:00:07:10";



            // 24 fps test
            // ===========
            string result01 = _tcSrv24.AddTimecodes(in_01, in_add_01);
            string result02 = _tcSrv24.AddTimecodes(in_02, in_add_01);
            string result03 = _tcSrv24.AddTimecodes(in_03, in_add_01);
            string result04 = _tcSrv24.AddTimecodes(in_05, in_add_01);
            string result05 = _tcSrv24.AddTimecodes(in_06, in_add_01);
            string result06 = _tcSrv24.AddTimecodes(in_07, in_add_02);
            string result07 = _tcSrv24.AddTimecodes(in_01, in_add_02);
            string result08 = _tcSrv24.AddTimecodes(in_02, in_add_02);
            string result09 = _tcSrv24.AddTimecodes(in_03, in_add_02);
            string result10 = _tcSrv24.AddTimecodes(in_04, in_add_02);
            string result11 = _tcSrv24.AddTimecodes(in_05, in_add_02);
            string result12 = _tcSrv24.AddTimecodes(in_06, in_add_02);

            Assert.AreEqual("00:15:52:11", result01);
            Assert.AreEqual("00:14:20:10", result02);
            Assert.AreEqual("00:15:20:00", result03);
            Assert.AreEqual("10:45:33:14", result04);
            Assert.AreEqual("24:14:19:23", result05);
            Assert.AreEqual("14:39:54:10", result06);
            Assert.AreEqual("00:01:39:21", result07);
            Assert.AreEqual("00:00:07:20", result08);
            Assert.AreEqual("00:01:07:10", result09);
            Assert.AreEqual("10:00:07:10", result10);
            Assert.AreEqual("10:31:21:00", result11);
            Assert.AreEqual("24:00:07:09", result12);


        }


    }
}
