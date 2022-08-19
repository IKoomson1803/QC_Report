using System;
using System.Web;
using System.Web.Mvc;
using System.Net;

namespace Deluxe.QCReport.Web.Fillter
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class CustomAuthorize : AuthorizeAttribute
    {

        //public override void OnAuthorization(AuthorizationContext filterContext)
        //{
        //    //Set the current principal
        //    if (!string.IsNullOrWhiteSpace(SimpleSessionPersister.Username))
        //    {
        //        filterContext.HttpContext.User = new CustomPrincipal(new CustomIdentity(SimpleSessionPersister.Username));
        //    }

        //}

        private HttpContextBase _ctx;


        protected override bool AuthorizeCore(HttpContextBase ctx)
        {
            if (ctx == null)
                return false;

            this._ctx = ctx;

            if (_ctx.Request.RequestContext.HttpContext.User  != null &&  _ctx.Session != null)
            {
                var user = ctx.Request.RequestContext.HttpContext.User;

                return true;
            }
            else
            {
                return false;
            }
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            var urlHelper = new UrlHelper(
                   filterContext.RequestContext);

            if (filterContext.HttpContext.Request.IsAjaxRequest())
            {
                // This will be handled by the global js ajax errors handler AjaxGlobalHandler.js
                filterContext.RequestContext.HttpContext.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
                filterContext.HttpContext.Response.End();

            }
            else
            {

                if (this._ctx != null)
                {
                    
                    if (_ctx.Request.RequestContext.HttpContext.User != null &&  _ctx.Session == null)
                    {
                        filterContext.Result = new RedirectResult(
                        urlHelper.Action(
                        "Index",
                        "Home"));
                    }
                    else
                    {
                        filterContext.Result = new RedirectResult(
                         urlHelper.Action(
                        "Index",
                       "Home"));
                    }
                }
                else
                {
                    filterContext.Result = new RedirectResult(
                      urlHelper.Action(
                      "Index",
                      "Home"));
                }

            }
        }


    }
}