using System;
using Deluxe.QCReport.Common.Abstractions;


namespace Deluxe.QCReport.Common.Models
{
    public class SearchParams : ISearchParams
    {
        
        public string TapeNumber { get; set; }
        public string QCUser { get; set; }
        public string QCUser2 { get; set; }
        public string RevisedBy { get; set; }
        public string RevisedBy2 { get; set; }
        public string ClientName { get; set; }
        public string Title { get; set; }
        public string EpisodeName { get; set; }
        public string EpisodeNumber { get; set; }
        public string Filename { get; set; }
       public string Statuses { get; set; }
       

        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }
        
        public int? AudioGrade1 { get; set; }
        public int? AudioGrade2 { get; set; }
        public int? AudioGrade3 { get; set; }
        public int? AudioGrade4 { get; set; }
        public int? AudioGrade5 { get; set; }

        public int? VideoGrade1 { get; set; }
        public int? VideoGrade2 { get; set; }
        public int? VideoGrade3 { get; set; }
        public int? VideoGrade4 { get; set; }
        public int? VideoGrade5 { get; set; }

        public int? OverallGrade1 { get; set; }
        public int? OverallGrade2 { get; set; }
        public int? OverallGrade3 { get; set; }
        public int? OverallGrade4 { get; set; }
        public int? OverallGrade5 { get; set; }
    }


}

