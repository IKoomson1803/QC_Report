using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    /// <summary>
    /// Banijay Rights Programme Details interface
    /// </summary>
    public interface IBanijahRightsProgrammeDetails
    {
        string ProgrammeTitle { get; set; }
        string Filename { get; set; }
        string EpisodeTitle { get; set; }
        string EpisodeNumber { get; set; }
        string FileWrapper { get; set; }
        string VideoCodec { get; set; }
        string SDROrHDR { get; set; }
        string FrameRate { get; set; }
        string AspectRatio { get; set; }
        string Version { get; set; }
        string VideoLines { get; set; }
        string TypeOfHDR { get; set; }
        string Timecode { get; set; }
        string CaptionSafe { get; set; }
        string EmbeddedCCTrack { get; set; }
    }
}
