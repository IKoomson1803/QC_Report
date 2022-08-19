
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Threading.Tasks;
using Deluxe.QCReport.Common;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Services;
using Deluxe.QCReport.Common.Utilities;
using Deluxe.QCReport.Web.Models;
using Deluxe.QCReport.Web.Utilities;
using Deluxe.QCReport.Web.Fillter;

namespace Deluxe.QCReport.Web.Controllers
{
   // [Authorize]
   [CustomAuthorize]
    public class AdministrationController : Controller
    {
        private readonly IUserAccountService _userService;
        private readonly ILoggerService _loggerService;
        private readonly IClientService  _clientService;
        private readonly ILocationService _locationService;
        private readonly IAspectRatioService _aspectRatioService;


        //public AdministrationController(IUserAccountService userService,
        //    ILoggerService loggerService)
        //{
        //    this._userService = userService ?? throw new ArgumentNullException(
        //              $"AccountController expects ctor injection: {nameof(IUserAccountService)}");

        //    this._loggerService = loggerService ?? throw new ArgumentNullException(
        //               $"AccountController expects ctor injection: {nameof(ILoggerService)}");


        //}
        public AdministrationController()
        {
            var conn = ConfigManager.DatabaseConnection;

            var loggerRepository = new LoggerRepository(conn);
            _loggerService = new LoggerService(loggerRepository);

            _userService = new UserAccountService(new UserAccountRepository(conn, _loggerService));
            _clientService = new ClientService(new ClientRepository(conn, _loggerService));
            _locationService = new LocationService(new LocationRepository(conn, _loggerService));
            _aspectRatioService = new AspectRatioService(new AspectRatioRepository(conn, _loggerService));

        }

        // GET: Administration
        public ActionResult Index()
        {
            SetViewBag();
            return View();
        }

        private void SetViewBag()
        {

            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            string vbUsername = clientId.Name;
            int vbSecLevel = 0;


            UserAccount usr = UserAccountService.GetUserAccount(clientId.Name);

            if (usr != null)
            {
                vbUsername = usr.UserName;
                vbSecLevel = usr.SecurityLevel.Value;
            }

            ViewBag.Username = vbUsername;
            ViewBag.SecLevel = vbSecLevel;

        }

        #region Users Management 

        public  ActionResult GetUsers()
        {
            //var users =  _userService.GetUsers().ToArray();
            var users = _userService.GetRevisedByUsers().ToArray();
            return Json(users, JsonRequestBehavior.AllowGet);
            
        }

        public ActionResult GetRevisedByUsers()
        {
            var users = _userService.GetRevisedByUsers().ToArray();
            return Json(users, JsonRequestBehavior.AllowGet);

        }

        public ActionResult LoadUserPartial()
        {
             UserAccountVM model = new UserAccountVM();

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "User partial was viewed."),
                                           Constants.ActivityType.UserPartialViewed);

            /*******************************************************************************************/


            return PartialView("_UserPartial", model);
        }

        public ActionResult GetUserDetails(string Username)
        {
            // var user = UserAccountService.GetUserAccount(Username);
            var user = UserAccountService.GetUserAccountDetails(Username);
            //var result = (user != null);
           // return Json(new { success = result, data = user });

            if (user == null)
            {
                user = new UserAccount { qcUserId = 0 };
            }


            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "User details [{0}] was searched.",
                                             Username),
                                            Constants.ActivityType.UserDetailsSearched);

            /*******************************************************************************************/

            return Json(user, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SaveUser(UserAccount user)
        {
            if (user == null)
            {
                return Json(new { success = false, msg = "Failed to save user, please contact system admin. " });
            }

            user.UserName = user.UserNameText;
            bool result = _userService.InsertOrUpdateUser(user);
            string resultMsg = "User saved successfully";

            if (!result) 
            { 
                resultMsg = "User saving failed!";
            }
            else
            {

                /****************Log User Activity******************************************************/

                if(user.qcUserId > 0)
                {
                    WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "User details [{0}] was updated",
                                                 user.UserName),
                                                Constants.ActivityType.UpdatedUser);
                }
                else
                {
                    WebSystemUtility.LogUserActivity(
                                          string.Format(
                                              "New user details [{0}] was inserted",
                                               user.UserName),
                                              Constants.ActivityType.InsertUser);
                }
                

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }

        #endregion

        #region Clients Management

        public ActionResult GetClients()
        {
            var clients = _clientService.GetClients()?.ToArray();
            return Json(clients, JsonRequestBehavior.AllowGet);

        }

        public ActionResult LoadClientPartial()
        {

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Client partial was viewed."),
                                           Constants.ActivityType.ClientPartialViewed);

            /*******************************************************************************************/

            return PartialView("_ClientPartial");
        }

        public ActionResult GetClientDetails(string clientName)
        {
            var client = _clientService.GetClientDetails(clientName);
           
            if (client == null)
            {
                client = new Client();
            }

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Client details [{0}] was searched.",
                                             clientName),
                                            Constants.ActivityType.ClientDetailsSearched);

            /*******************************************************************************************/

            return Json(client, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SaveClient(Client client)
        {
            if (client == null)
            {
                return Json(new { success = false, msg = "Failed to save client, please contact system admin. " });
            }


            bool result = _clientService.SaveClient(client);
            string resultMsg = "Client saved successfully";

            if (!result)
            {
                resultMsg = "Client saving failed!";
            }
            else
            {

                /****************Log User Activity******************************************************/

                if (client.CustID > 0)
                {
                    WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Client details [{0}] was updated",
                                                 client.CustName),
                                                Constants.ActivityType.ClientDetailsUpdated);
                }
                else
                {
                    WebSystemUtility.LogUserActivity(
                                          string.Format(
                                              "New client details [{0}] was inserted",
                                               client.CustName),
                                              Constants.ActivityType.NewClientAdded);
                }


                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }


        #endregion

        #region Locations Management

        public ActionResult LoadLocationPartial()
        {

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Location partial was viewed."),
                                           Constants.ActivityType.LocationPartialViewed);

            /*******************************************************************************************/

            return PartialView("_LocationPartial");
        }

        public ActionResult GetLocations()
        {
            var locations = _locationService.GetLocations()?.ToArray();
            return Json(locations, JsonRequestBehavior.AllowGet);

        }

        public ActionResult GetLocationDetails(string location)
        {
            var deluxeLocation = _locationService.GetLocationDetails(location);

            if (deluxeLocation == null)
            {
                deluxeLocation = new LocationVM();
            }

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Location details [{0}] was searched.",
                                             location),
                                            Constants.ActivityType.LocationDetailsSearched);

            /*******************************************************************************************/

            return Json(deluxeLocation, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SaveLocation(LocationVM  deluxeLocation )
        {
            if (deluxeLocation == null)
            {
                return Json(new { success = false, msg = "Failed to save location, please contact system admin. " });
            }


            bool result = _locationService.SaveLocation(deluxeLocation);
            string resultMsg = "Location saved successfully";

            if (!result)
            {
                resultMsg = "Location saving failed!";
            }
            else
            {

                /****************Log User Activity******************************************************/

                if (deluxeLocation.pkey > 0)
                {
                    WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Location details [{0}] was updated",
                                                 deluxeLocation.Location),
                                                Constants.ActivityType.LocationDetailsUpdated);
                }
                else
                {
                    WebSystemUtility.LogUserActivity(
                                          string.Format(
                                              "New location details [{0}] was inserted",
                                               deluxeLocation.Location),
                                              Constants.ActivityType.NewLocationAdded);
                }


                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }


        #endregion

        #region Aspect Ratio
        public ActionResult LoadAspectRatioPartial()
        {

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Aspect Ratios partial was viewed."),
                                           Constants.ActivityType.AspectRatioPartialViewed);

            /*******************************************************************************************/

            return PartialView("_AspectRatioPartial");
        }

        public ActionResult GetAspectRatios()
        {
            var aspectRatios = _aspectRatioService.GetAll()?.ToArray();
            return Json(aspectRatios, JsonRequestBehavior.AllowGet);

        }

        public ActionResult GetAspectRatioDetails(string aspectRatio)
        {
            var aspectRatioVM = _aspectRatioService.GetByName(aspectRatio);

            if (aspectRatioVM == null)
            {
                aspectRatioVM = new AspectRatioVM();
            }

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Aspect Ratio details [{0}] was searched.",
                                             aspectRatio),
                                            Constants.ActivityType.AspectRatioDetailsSearched);

            /*******************************************************************************************/

            return Json(aspectRatioVM, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public ActionResult SaveAspectRatio(AspectRatioVM model)
        {
            if(model == null)
            {
                return Json(new { success = false, msg = "Failed to save aspect ratio, please contact system admin." });
            }
           

            bool result = _aspectRatioService.Save(model);
            string resultMsg = "Aspect Ratio saved successfully";

            if (!result)
            {
                resultMsg = "Aspect Ratio saving failed!";
            } 
            else
            {

                /****************Log User Activity******************************************************/

                if (model.AspectID > 0)
                {
                    WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Aspect Ratio details [{0}] was updated",
                                                 model.AspectID),
                                                 Constants.ActivityType.LocationDetailsUpdated);
                }
                else
                {
                    WebSystemUtility.LogUserActivity(
                                          string.Format(
                                              "New aspect ratio details [{0}] was inserted",
                                               model.AspectRatio),
                                              Constants.ActivityType.NewLocationAdded);
                }


                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }




        #endregion

        #region Formats
        public ActionResult LoadFormatPartial()
        {

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Format partial was viewed."),
                                           Constants.ActivityType.FormatPartialViewed);

            /*******************************************************************************************/

            return PartialView("_FormatPartial");
        }


        #endregion

        #region  Control Rooms
        public ActionResult LoadControlRoomPartial()
        {

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Control Room partial was viewed."),
                                           Constants.ActivityType.ControlRoomPartialViewed);
            /*******************************************************************************************/

            return PartialView("_ControlRoomPartial");
        }


        #endregion

        #region  Tape Description



        #endregion

        #region  Versions



        #endregion

        #region  Languages



        #endregion

        #region  Audio Description



        #endregion

        #region  TC Integration



        #endregion

        #region  Audio Bit Rate



        #endregion

        #region  Audio Codec



        #endregion

        #region  Bit Rate Mode



        #endregion

        #region Colour Encoding



        #endregion

        #region Gamut



        #endregion 

        #region GOP Structure



        #endregion 

        #region Video Bit Rate




        #endregion 

        #region Video Codec




        #endregion 

        #region Standard




        #endregion 


    }
}