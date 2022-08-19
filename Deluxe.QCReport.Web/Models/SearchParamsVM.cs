using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Web.Models
{
    public class SearchParamsVM : SearchParams
    {

        public string From_Date { get; set; }
        public string To_Date { get; set; }

        public List<Header>  Headers { get; set; }
        public Dictionary<int, string> StatusList { get; set; }

        public SearchParamsVM()
        {
            Headers = new List<Header>();
        }

    }
}