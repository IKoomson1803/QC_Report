using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;


namespace Deluxe.QCReport.Web
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/base").Include(
            "~/Scripts/jquery-3.3.1.js",
            "~/Scripts/bootstrap.min.js",
            "~/Scripts/bootstrap-msg.min.js",
            "~/Scripts/jquery-ui-1.12.1.min.js",
            "~/Scripts/jquery.editable-select.min.js",
            "~/Scripts/jquery.unobtrusive-ajax.min.js",
            "~/Scripts/extensions.js",
             "~/Scripts/jquery.maskedinput.js"));

            bundles.Add(new ScriptBundle("~/bundles/jobNavigation").Include(
            "~/Scripts/Bundled/topNav_4.js"));
            //"~/Scripts/Bundled/jobDetailsNav.js"));


            bundles.Add(new StyleBundle("~/css/base").Include(
            "~/Content/bootstrap.min.css",
            "~/Content/bs_callout.css",
            "~/Content/bootstrap-msg.min.css",
            "~/Content/loader.css",
            "~/Content/jquery.editable-select.min.css",
            "~/Content/jquery-ui.css",
            "~/Content/jquery-ui.theme.css"));
            //"~/Content/Main.css"));
        
        }
    }
}