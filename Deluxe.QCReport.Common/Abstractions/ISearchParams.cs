using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface ISearchParams
    {
        string WorkOrderNumber { get; set; }
        string TapeNumber { get; set; }
        string QCUser { get; set; }
        string QCUser2 { get; set; }
        string RevisedBy { get; set; }
        string RevisedBy2 { get; set; }
        string ClientName { get; set; }

        string Title { get; set; }
        string EpisodeName { get; set; }
        string EpisodeNumber { get; set; }
        string Filename { get; set; }
          string Statuses { get; set; }
       
        DateTime? FromDate { get; set; }
        DateTime? ToDate { get; set; }

        int? AudioGrade1 { get; set; }
        int? AudioGrade2 { get; set; }
        int? AudioGrade3 { get; set; }
        int? AudioGrade4 { get; set; }
        int? AudioGrade5 { get; set; }

        int? VideoGrade1 { get; set; }
        int? VideoGrade2 { get; set; }
        int? VideoGrade3 { get; set; }
        int? VideoGrade4 { get; set; }
        int? VideoGrade5 { get; set; }

        int? OverallGrade1 { get; set; }
        int? OverallGrade2 { get; set; }
        int? OverallGrade3 { get; set; }
        int? OverallGrade4 { get; set; }
        int? OverallGrade5 { get; set; }
    }
}
