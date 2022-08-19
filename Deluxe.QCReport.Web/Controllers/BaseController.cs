using System;
using System.IO;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using Deluxe.QCReport.Web.Utilities;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Utilities;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Services;

namespace Deluxe.QCReport.Web.Controllers
{
    public class BaseController : Controller
    {
       // private readonly ILoggerService _loggerService;

        #region Overridden Methods

        //public BaseController()
        //{
        //    var conn = ConfigManager.DatabaseConnection;
        //    _loggerService = new LoggerService(new LoggerRepository(conn));
        //}

        protected string RenderPartialViewToString()
        {
            return RenderPartialViewToString(
                                null,
                                null);
        }

        protected string RenderPartialViewToString(string viewName)
        {
            return RenderPartialViewToString(
                viewName,
                null);
        }

        protected string RenderPartialViewToString(object model)
        {
            return RenderPartialViewToString(
                null,
                model);
        }

        /// <summary>
        /// Renders partial view as HTML string
        /// </summary>
        /// <param name="viewName"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        protected string RenderPartialViewToString(string viewName, object model)
        {
            if (string.IsNullOrEmpty(viewName))
                viewName = ControllerContext.RouteData.GetRequiredString("action");

            ViewData.Model = model;

            using (StringWriter sw = new StringWriter())
            {
                ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(
                    ControllerContext,
                    viewName);

                ViewContext viewContext = new ViewContext(
                    ControllerContext,
                    viewResult.View,
                    ViewData,
                    TempData,
                    sw);

                viewResult.View.Render(
                    viewContext,
                    sw);

                return sw.GetStringBuilder().ToString();
            }
        }


        //protected override void OnActionExecuting(ActionExecutingContext filterContext)
        //{

        //    // If the browser session or authentication session has expired...
        //    if (SimpleSessionPersister.User == null || !filterContext.HttpContext.Request.IsAuthenticated)
        //    {
        //        if (filterContext.HttpContext.Request.IsAjaxRequest())
        //        {
        //            // For AJAX requests, we're overriding the returned JSON result with a simple string,
        //            // indicating to the calling JavaScript code that a redirect should be performed.
        //            filterContext.Result = new JsonResult
        //            {
        //                Data = new
        //                {
        //                    // allows js to test for timeout and redirect
        //                    HasTimedOut = true,
        //                    Error = "Not Authorized"
        //                },
        //                JsonRequestBehavior = JsonRequestBehavior.AllowGet
        //            };
        //        }
        //        else
        //        {
        //            // For round-trip posts, we're forcing a redirect to Account/SessionExpired/, which
        //            // simply displays a temporary 5 second notification that they have timed out, and
        //            // will, in turn, redirect to the logon page.
        //            filterContext.Result = new RedirectToRouteResult(
        //            new RouteValueDictionary
        //            {
        //                { "Controller", "Account" },
        //                { "Action", "SessionExpired" }
        //            });
        //        }
        //    }

        //    base.OnActionExecuting(filterContext);

        //}

        protected override void HandleUnknownAction(string actionName)
        {
            try
            {
                View(actionName).ExecuteResult(ControllerContext);
            }
            catch
            {
                View("Error").ExecuteResult(ControllerContext);
            }
        }

        protected override void OnException(ExceptionContext filterContext)
        {
            filterContext.ExceptionHandled = true;

            //Log the error!!
            WebSystemUtility.LogSystemActivity(filterContext.Exception);


            ////Redirect or return a view, but not both.
            //filterContext.Result = RedirectToAction("Index", "ErrorHandler");
            //// OR 
            //filterContext.Result = new ViewResult
            //{
            //    ViewName = "~/Views/ErrorHandler/Index.cshtml"
            //};
        }


        #endregion

    }
}