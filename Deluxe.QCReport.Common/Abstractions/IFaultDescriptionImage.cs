using System.Web;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IFaultDescriptionImage
    {
       int Id { get; set; }
       int QCNum { get; set; }
       int SubQCNum { set; get; }
       string Description { set; get; }
       string ImageName { set; get; }
       string ImagePath { get; set; }
       

    }
}
