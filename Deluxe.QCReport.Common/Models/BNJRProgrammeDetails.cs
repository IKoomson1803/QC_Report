using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class BNJRProgrammeDetails : QCBase, IBNJRProgrammeDetails
    {
        /// <summary>
        ///  Banijay Rights Programme Details model
        /// </summary>
        public string ProgrammeTitle { get; set; }
        public string Filename { get; set; }
        public string EpisodeTitle { get; set; }
        public string EpisodeNumber { get; set; }
        public string FileWrapper { get; set; }
        public string VideoCodec { get; set; }
        public string SDROrHDR {get; set;}
        public string FrameRate { get; set; }
        public string AspectRatio { get; set; }
        public string Version { get; set; }
        public string  VideoLines { get; set; }
        public string TypeOfHDR { get; set; }
        public string Timecode { get; set; }
        public string CaptionSafe { get; set; }
        public string EmbeddedCCTrack { get; set; }

    }
}
