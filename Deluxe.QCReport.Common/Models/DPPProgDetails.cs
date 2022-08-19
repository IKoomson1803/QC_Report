using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class DPPProgDetails : DPPBase, IDPPProgDetails
    {
      
        public string ProgrammeDetails { get; set; }
        public string Duration { get; set; }
        public string ProductionNumber { get; set; }
        public string Filename { get; set; }
        public string SeriesTitle { get; set; }
        public string ProgrammeTitleAndNumber { get; set; }
        public string EpisodeTitleAndNumber { get; set; }
        

    }
}
