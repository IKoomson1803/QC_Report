using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Deluxe.QCReport.Web.Autofac;

namespace Deluxe.QCReport.Web
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            // AutofacConfig.RegisterComponents();
            GlobalErrorHandler.RegisterGlobalFilters(GlobalFilters.Filters);
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
             BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_Error(Object sender, EventArgs e)
        {
            Response.Write("<font face=\"Tahoma\" size=\"2\" color=\"red\">");
            Response.Write("Oops! Looks like an error occurred!!<hr></font>");
            Response.Write("<font face=\"Arial\" size=\"2\">");
            Response.Write(Server.GetLastError().Message.ToString());
            Response.Write("<hr>" + Server.GetLastError().ToString());
            Server.ClearError();
        }

        protected void Application_EndRequest()
        {   //here breakpoint
            // under debug mode you can find the exceptions at code: this.Context.AllErrors

            var lastError = Server.GetLastError(); 

            var allErrors = Context.AllErrors;

            var errorMessage = Context.Profile;
        }

    }


}
