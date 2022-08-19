using Deluxe.QCReport.Common.Abstractions;


namespace Deluxe.QCReport.Common.Models
{
    public class Client : IClient
    {
        public int CustID { get; set; }
        public string CustCode { get; set; }
        public string CustName { get; set; }
       public string CustAddress { get; set; }
        public string CustPhone { get; set; }
        public int? GradingScale { get; set; }

    }
}
