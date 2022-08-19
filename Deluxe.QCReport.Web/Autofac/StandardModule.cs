using Deluxe.QCReport.Common.Services;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Utilities;
using Deluxe.QCReport.Common.Abstractions;
//using Autofac;


namespace Deluxe.QCReport.Web.Autofac
{
    public class StandardModule //: Module
    {

    //    protected override void Load(ContainerBuilder builder)
    //    {
    //        var conn = ConfigManager.DatabaseConnection;

    //        //Register Repositories ******************************************/
    //        builder.RegisterType<LoggerRepository>() // concrete type
    //            .As<ILoggerRepository>() // abstraction
    //            .WithParameter(
    //                "connString",
    //                conn)
    //             .SingleInstance();

    //        builder.RegisterType<UserAccountRepository>() // concrete type
    //          .As<IUserAccountRepository>() // abstraction
    //          .WithParameter(
    //              "connString",
    //              conn)
    //           .SingleInstance();

           

    //        //Register Seervices ************************************************/
    //        builder.RegisterType<LoggerService>() // concrete type
    //           .As<ILoggerService>() // abstraction
    //           .SingleInstance();

    //        builder.RegisterType<UserAccountService>() // concrete type
    //          .As<IUserAccountService>() // abstraction
    //          .SingleInstance();

          

    //        base.Load(builder);

    //    }

    }
}