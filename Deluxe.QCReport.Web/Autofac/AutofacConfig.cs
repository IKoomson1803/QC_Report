using System.Web.Mvc;
using System.Web.Http;
//using Autofac;
//using Autofac.Integration.Mvc;
////using Autofac.Integration.WebApi;



namespace Deluxe.QCReport.Web.Autofac
{
    /// <summary>
    ///  Autofac module for regsitering dependencies
    /// </summary>
    public class AutofacConfig
    {
        public static void RegisterComponents()
        {
            //var builder = new ContainerBuilder();

            //// Register our dependencies
            //builder.RegisterModule(
            //    new StandardModule());

            //// Register dependencies in controllers
            //builder.RegisterControllers(
            //    typeof(MvcApplication).Assembly);

            //// Register Web API controllers
            ////builder.RegisterApiControllers(
            ////    typeof(MvcApplication).Assembly);

            //var container = builder.Build();

            //// Set MVC DI resolver to use our Autofac container
            //DependencyResolver.SetResolver(
            //    new AutofacDependencyResolver(container));

            //// Set the dependency resolver for Web API.
            ////GlobalConfiguration.Configuration.DependencyResolver = new AutofacWebApiDependencyResolver(container); ;
        }
    }
}