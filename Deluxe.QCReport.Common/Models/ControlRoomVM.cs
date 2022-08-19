using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class ControlRoomVM : IControlRoom
    {
        public int QCRoomID { get; set; }
        public string BayNumber { get; set; }
    }
}
