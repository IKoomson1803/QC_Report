using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace Deluxe.QCReport.Web.Fillter
{
    /// <summary>
    /// CustomException class to handle exceptions
    /// </summary>
    public class CustomException : FilterAttribute, IExceptionFilter
    {
        public void OnException(ExceptionContext filterContext)
        {
            if (!filterContext.ExceptionHandled && filterContext.Exception is NullReferenceException)
            {
                //TO DO :: Log exception to DB


                filterContext.Result = new RedirectResult("customErrorPage.chtml");
                filterContext.ExceptionHandled = true;
            }
        }
    }
}