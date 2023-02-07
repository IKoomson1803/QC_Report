using System.Collections.Generic;
using Deluxe.QCReport.Common.Abstractions;


namespace Deluxe.QCReport.Common.Models
{
    public class BanijahRightsProgrammeLayout : IBanijahRightsProgrammeLayout
    {
        public int Id { get; set; }
        public int QCNum { get; set; }
        public int SubQCNum { get; set; }
        public string ProgrammeIn { get; set; }
        public string ProgrammeOut { get; set; }
        public string TotalLengthIncludingBreaks { get; set; }
        public string ProgrammeDuration { get; set; }
        public int? NumberOfParts { get; set; }
        public IList<BanijahRightsTapeLayout> TapeLayouts { get; set; }

        public BanijahRightsProgrammeLayout()
        {
            TapeLayouts = new List<BanijahRightsTapeLayout>();
        }
    }
}
