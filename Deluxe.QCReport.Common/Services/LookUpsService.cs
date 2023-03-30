using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;


namespace Deluxe.QCReport.Common.Services
{
    public  class LookUpsService : ILookupsService
    {
        private readonly ILookupsRepository _rep;

        public LookUpsService()
        {

        }

        public LookUpsService(ILookupsRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                    $"LookUpsService expects ctor injection: {nameof(ILookupsRepository)}");

        }

        public IList<string> GetLookups(StoredProcedure.Lookup lookup)
        {
            return _rep.GetLookups(lookup);
        }

        public static Dictionary<int, string> GetAspectRatio()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.AspectRatio);
        }
        public static Dictionary<int, string> GetCustName()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.CustName);
        }
        public static Dictionary<int, string> GetVersion()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.Version);
        }
        public static Dictionary<int, string> GetFormat()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.Format);
        }
        public static Dictionary<int, string> GetTapeDesc()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.TapeDesc);
        }
        public static Dictionary<int, string> GetOperator()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.Operator);
        }
        public static Dictionary<int, string> GetQCRoom()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.QCRoom);
        }
        public static Dictionary<int, string> GetAudioTC()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.AudioTC);
        }
        public static Dictionary<int, string> GetLanguage()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.Language);
        }
        public static Dictionary<int, string> GetAudioDesc()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.AudioDesc);
        }
        public static Dictionary<int, string> GetTCIntegrity()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.TCIntegrity);
        }
        
        public static Dictionary<int, string> GetColourEncoding()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.ColourEncoding);
        }
        public static Dictionary<int, string> GetColourSpace()
        {
            Dictionary<int, string> result = new Dictionary<int, string>();

            result.Add(1, "BT601");
            result.Add(2, "BT709");
            result.Add(3, "BT2020");
            result.Add(4, "P3");
            

            return result;
        }
        public static Dictionary<int, string> GetGamut()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.Gamut);
        }
        public static Dictionary<int, string> GetGOPStructure()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.GOPStructure);
        }
        public static Dictionary<int, string> GetAudioBitDepth()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.AudioBitDepth);
        }
        public static Dictionary<int, string> GetAudioCodec()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.AudioCodec);
        }
        public static Dictionary<int, string> GetBitRateMode()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.BitRateMode);
        }
        public static Dictionary<int, string> GetVideoBitDepth()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.VideoBitDepth);
        }
        public static Dictionary<int, string> GetVideoCodec()
        {

            return LookUpsRepository.GetLookupList(Constants.LookupType.VideoCodec);
        }

       
        public static Dictionary<int, string> GetStandard()
        {
            //Dictionary<int, string> result = new Dictionary<int, string>();

            //result.Add(1, "NTSC");
            //result.Add(2, "PAL");
            //result.Add(3, "525");
            //result.Add(4, "625");
            //result.Add(5, "1080/59.94i");
            //result.Add(6, "1080/50i");
            //result.Add(7, "1080/29.97Psf");
            //result.Add(8, "1080/25Psf");
            //result.Add(9, "1080/24Psf");
            //result.Add(10, "1080/23.98Psf");
            //result.Add(11, "Not Known");

            //return result;

            return LookUpsRepository.GetLookupList(Constants.LookupType.Standard);


        }

        public static Dictionary<int, string> GetChannelCount()
        {
            Dictionary<int, string> result = new Dictionary<int, string>();

            result.Add(0, "0 Channels");
            result.Add(1, "2 Channels");
            result.Add(2, "4 Channels");
            result.Add(3, "6 Channels");
            result.Add(4, "8 Channels");
            result.Add(5, "10 Channels");
            result.Add(6, "12 Channels");
            result.Add(7, "14 Channels");
            result.Add(8, "16 Channels");
            result.Add(9, "18 Channels");
            result.Add(10, "20 Channels");
            result.Add(11, "22 Channels");
            result.Add(12, "24 Channels");

            return result;
        }

        public static Dictionary<int, string> GetTone()
        {
            Dictionary<int, string> result = new Dictionary<int, string>();

            result.Add(1, "-18dbFS");
            result.Add(2, "-20dbFS");
            return result;
        }

        public static Dictionary<int, string> GetFullSpotCheck()
        {
            Dictionary<int, string> result = new Dictionary<int, string>();

            result.Add(1, "Full");
            result.Add(2, "Spot");
            return result;
        }

        public static Dictionary<string, string> GetPassOrFail()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("P", "Pass");
            result.Add("F", "Fail");
            return result;
        }

        public static Dictionary<string, string> GetPassedOrFailed()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("P", "Passed");
            result.Add("F", "Failed");
            result.Add("N/A", "N/A");
            return result;
        }

        public static Dictionary<string, string> GetDecodeCheck()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("PD", "Pending");
            result.Add("P", "Passed");
            result.Add("F", "Failed");
            result.Add("N/A", "N/A");

            return result;
        }

        public static Dictionary<string, string> GetQCStatus()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("P", "Passed");
            result.Add("PF", "Passed with faults");
            result.Add("F", "Failed");
            result.Add("N/A", "N/A");
            return result;
        }

        public static Dictionary<string, string> GetCountAsShow()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("Y", "Y");
            result.Add("N", "N");
            return result;
        }
        public static Dictionary<string, string> GetNextWeekOrTrailerPresent()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("Y", "Yes");
            result.Add("N", "No");
            result.Add("DTB", "Dip to Black");
           result.Add("N/A", "N/A");
            return result;
        }
        //Next week / trailer present


        public static Dictionary<int, string> GetNoiseReduction()
        {
            Dictionary<int, string> result = new Dictionary<int, string>();

            result.Add(1, "None");
            result.Add(2, "DolbA");
            result.Add(3, "DolbB");
            result.Add(4, "DolSR");
            return result;
        }

        public static Dictionary<int, string> GetChPhase()
        {
            Dictionary<int, string> result = new Dictionary<int, string>();

            result.Add(1, "NA");
            result.Add(2, "OK");
            result.Add(3, "Marginal");
            result.Add(4, "NG");
            return result;
        }

        public static Dictionary<string, string> GetYesNo()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("Y", "Yes");
            result.Add("N", "No");
            return result;
        }

        public static Dictionary<string, string> GetYesNoNA()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("Y", "Yes");
            result.Add("N", "No");
            result.Add("N/A", "N/A");
            return result;
        }

        public static Dictionary<string, string> GetYesNoNotAll()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("Y", "Yes");
            result.Add("N", "No");
            result.Add("NA", "Not All");
            return result;
        }

        public static Dictionary<string, string> GetYesNoNotAll2()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("Y", "Yes");
            result.Add("N", "No");
            result.Add("SO", "Some");
            result.Add("NA", "Not All");
            return result;
        }

        public static Dictionary<int, string> GetCloseCap()
        {
            Dictionary<int, string> result = new Dictionary<int, string>();

            result.Add(1, "No");
            result.Add(2, "Yes");
            result.Add(3, "Yes - NG");
            result.Add(4, "Yes - OK");
            return result;
        }

        public static Dictionary<string, string> GetSeamlessOrParted()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("S", "Seamless");
            result.Add("P", "Parted");
            return result;
        }

        public static Dictionary<int, string> GetEvalStatus()
        {

            //return LookUpsRepository.GetLookupList(Constants.LookupType.Status);

            Dictionary<int, string> result = new Dictionary<int, string>();

            //result.Add(0, "");
            result.Add(1, "PASSED");
            result.Add(2, "FAILED");
            result.Add(3, "HOLD");
            result.Add(4, "REFERRAL");

            //result.Add(5, "PASS DI / DSS");
            //result.Add(6, "PASS DI / FAIL DSS");
            //result.Add(7, "PASS DI");
            //result.Add(8, "PASS DSS / FAIL D1");
            //result.Add(9, "FAIL DI / DSS");
            //result.Add(10, "FAIL DI");
            //result.Add(11, "FAIL DSS");


            return result;
        }

        public static Dictionary<string, string> GetQCActionType()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            result.Add("Full QC", "Full QC");
            result.Add("Spot", "Spot");
            result.Add("Clone of QCed master", "Clone of QCed master");
            result.Add("5 Point Spot Check", "5 Point Spot Check");
            return result;
        }


        public static Dictionary<int, string> GetFinalGrades(int? gradeScale)
        {
            Dictionary<int, string> result = new Dictionary<int, string>();
            result.Add(0, "");

            if (gradeScale.HasValue)
            {
                for (int i = 1; i <= gradeScale; i++)
                {
                    result.Add(i, i.ToString());
                }
            }

            return result;
        }

        public static Dictionary<int, string> GetSeverityGrades()
        {
            Dictionary<int, string> result = new Dictionary<int, string>();
           
            result.Add(1, "1");
            result.Add(2, "2");
            result.Add(3, "3");
            result.Add(4, "4");
            result.Add(5, "5");

            return result;
        }

        public static Dictionary<int, string> GetQCType()
        {
            Dictionary<int, string> result = new Dictionary<int, string>();

            //result.Add(1, "A");
            //result.Add(2, "V");
            //result.Add(3, "F");


            result.Add(1, "Audio");
            result.Add(2, "File");
            result.Add(3, "Film");
            result.Add(4, "Metadata");
            result.Add(5, "Subtitle");
            result.Add(6, "Tape");
            result.Add(7, "Timecode");
            result.Add(8, "Video");


            return result;
        }

        public static Dictionary<int, string> GetScrt()
        {
            Dictionary<int, string> result = new Dictionary<int, string>();

            result.Add(1, "ALL");
            result.Add(2, "U-L");
            result.Add(3, "U-C");
            result.Add(4, "U-R");
            result.Add(5, "M-L");
            result.Add(6, "M-C");
            result.Add(7, "M-R");
            result.Add(8, "L-L");
            result.Add(9, "L-C");
            result.Add(10, "L-R");
            return result;
        }

       
    }
}
