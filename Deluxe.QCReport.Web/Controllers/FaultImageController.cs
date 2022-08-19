using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Security.Principal;
using Deluxe.QCReport.Common;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Services;
using Deluxe.QCReport.Common.Utilities;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Web.Utilities;
using Deluxe.QCReport.Web.Models;
using Deluxe.QCReport.Web.Fillter;

namespace Deluxe.QCReport.Web.Controllers
{
    //[Authorize]
    [CustomAuthorize]
    public class FaultImageController :  BaseController
    {
        private readonly ILoggerService _loggerService = null;
        private readonly IFaultDescriptionImageService _faultDescriptionImageService = null;

        public FaultImageController()
        {
            var conn = ConfigManager.DatabaseConnection;

            var loggerRepository = new LoggerRepository(conn);
            _loggerService = new LoggerService(loggerRepository);

            _faultDescriptionImageService = new FaultDescriptionImageService(
                                  new FaultDescriptionImageRepository(
                                      conn,
                                      _loggerService));


        }

        // GET: FaultImage
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoadFaultsImages(int qcnum, int revnum)
        {
            return PopulateImagesGrid( qcnum, revnum, "",true);
        }

        private ActionResult PopulateImagesGrid(int qcnum, int revnum, string message, bool initialLoad) 
        {
           
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
          
            model.FaultDescriptionImage = new FaultDescriptionImage();
            model.FaultDescriptionImage.QCNum = qcnum;
            model.FaultDescriptionImage.SubQCNum = revnum;
            model.Message = message;
            model.FaultDescriptionImages = _faultDescriptionImageService.GetAll(qcnum, revnum)?.ToList();
            
            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Fault details [{0}] was viewed.",
                                             qcnum),
                                            Constants.ActivityType.FaultDescriptionViewed);

            /*******************************************************************************************/

            if (initialLoad)
            {
                return PartialView("_FaultImage", model);
            }
            else
            {
                var partialView = RenderPartialViewToString(
                                   "_FaultImage",
                                   model);
                
                JsonResult jsonResult = Json(
                partialView
                , JsonRequestBehavior.AllowGet);

             
                //  The default is 102400 characters: http://msdn.microsoft.com/en-us/library/system.web.configuration.scriptingjsonserializationsection.maxjsonlength(v=vs.110).aspx
                jsonResult.MaxJsonLength = int.MaxValue;  //The value of this constant is 2,147,483,647
                return jsonResult;

            }
        }

        [HttpPost]
        public ActionResult SaveFaultImage(FormCollection formCollection)  // FaultDescriptionImageVM model
        {
            var resultMsg = "Image update failed !";
            var result = false;
            var model = new FaultDescriptionImageVM();
            // var id = 0;
           //  var qcNum = 0; // model.FaultDescriptionImage.QCNum;
          //  var subQCNum = 0; // model.FaultDescriptionImage.SubQCNum;
            //var description = string.Empty; // model.FaultDescriptionImage.SubQCNum;
            //var imageName = string.Empty; //model.FaultDescriptionImage.ImageName;

          

            
            try
            {
                /********* TO DO:: Save images to a storeage server by impersonating a domain user. 
                * The domain user should have read/write access to the upload folder on the storeage server. Use the Impersonator.cs module  ****************************/

                //id = ParseUtil.ParseNumeric(formCollection["Id"]);  
                //qcNum = ParseUtil.ParseNumeric(formCollection["QCNum"]);  
                //subQCNum = ParseUtil.ParseNumeric(formCollection["SubQCNum"]);  
                //var  description =  formCollection["Description"];  //model.FaultDescriptionImage.Description;
                var imageName =  formCollection["ImageName"]; // model.FaultDescriptionImage.ImageName

               //HttpPostedFileBase imageFile = null;  //model.FaultDescriptionImage.ImageFile;
                var imageUploaded = false;


                HttpFileCollectionBase files = Request.Files;
                if (!string.IsNullOrWhiteSpace(imageName) || (Request.Files != null && Request.Files.Count <= ConfigManager.MaxFilesPerUpload))
                {

                    imageUploaded = (files != null && files.Count > 0);

                    if (!imageUploaded)
                    {
                        model.FaultDescriptionImage = PopulateFaultDescription(formCollection, imageName);

                        if (!string.IsNullOrWhiteSpace(model.FaultDescriptionImage.Description)
                          && !string.IsNullOrWhiteSpace(model.FaultDescriptionImage.ImageName))
                        {
                            result = _faultDescriptionImageService.Save(model.FaultDescriptionImage);
                        }
                        else
                        {
                            resultMsg = "Please supply a description or upload an image and continue...";
                        }
                    }
                    else
                    {
                        if (Request.Files.Count <= ConfigManager.MaxFilesPerUpload)  // TO DO :: Add this to config
                        {
                            for (int i = 0; i < files.Count; i++)
                            {
                                HttpPostedFileBase imageFile = files[i];
                                imageName = Path.GetFileName(imageFile.FileName);
                              
                                var validImagesExtensions = ConfigManager.ImageExtensions;  // new string[] { ".jpg", ".jpeg", ".png", ".gif" };

                                if (validImagesExtensions.Contains(Path.GetExtension(imageName.ToLower())))
                                {
                                    model.FaultDescriptionImage = PopulateFaultDescription(formCollection, imageName);

                                    if (!string.IsNullOrWhiteSpace(model.FaultDescriptionImage.Description)
                                        && !string.IsNullOrWhiteSpace(model.FaultDescriptionImage.ImageName))
                                    {
                                        if (imageUploaded)
                                        {
                                            string path = Path.Combine(Server.MapPath("~/UploadedImages"), imageName);
                                            imageFile.SaveAs(path);
                                            result = _faultDescriptionImageService.Save(model.FaultDescriptionImage);
                                        }
                                    }
                                    else
                                    {
                                        resultMsg = "Please supply a description or upload an image and continue...";
                                    }

                                }
                                else
                                {
                                    resultMsg = "Invalid Image !";
                                }

                                

                            }
                        }
                        else
                        {
                            return Json(new { success = false, msg = $"You have uploaded {Request.Files.Count} images." +
                                $" Maximum of 2 images allowed per upload, please check and try again... " });
                        }

                    }

                }
                else
                {
                    return Json(new { success = false, msg = "Please upload image(s) and continue..." });
                }
               

                if (result)
                {
                    resultMsg = "";  //"Image data saved successfully.";

                    /****************Log User Activity******************************************************/

                    var activityTye = Constants.ActivityType.FaultDescriptionAdded;

                    if(model.FaultDescriptionImage.Id > 0)
                    {
                        activityTye = Constants.ActivityType.FaultDescriptionUpdated;
                    }


                WebSystemUtility.LogUserActivity(
                                                string.Format(
                                                    "Fault Image  QC [Id: {0}]; Rev No; {1}",
                                                     model.FaultDescriptionImage.QCNum,
                                                    model.FaultDescriptionImage.SubQCNum),
                                                activityTye);

                    /*******************************************************************************************/
                }

            }
            catch(Exception ex)
            {
                var errorMessage = ex.Message;
                resultMsg = "Image update failed !";

                var loggerItem = new LoggerItem()
                {
                    ActivityType = Constants.ActivityType.FaultDescriptionAdded,
                    Category = Constants.LogCategory.Fatal,
                    Details = ex.GetDescription(),
                    Source = GetType().ToString()
                };

                _loggerService.LogSystemActivity(loggerItem);
            }

            
            return PopulateImagesGrid(model.FaultDescriptionImage.QCNum, model.FaultDescriptionImage.SubQCNum, resultMsg,false);
                  
        }

        private FaultDescriptionImage PopulateFaultDescription(FormCollection formCollection, string imageName)
        {
           var id = ParseUtil.ParseNumeric(formCollection["Id"]);
           var qcNum = ParseUtil.ParseNumeric(formCollection["QCNum"]);
           var subQCNum = ParseUtil.ParseNumeric(formCollection["SubQCNum"]);
            var description = formCollection["Description"]; 
           //var imageName = formCollection["ImageName"]; 


            return new FaultDescriptionImage()
            {
                Id = id,
                QCNum = qcNum,
                SubQCNum = subQCNum,
                ImageName = imageName,
                ImagePath = string.Format(@"{0}/UploadedImages/{1}", ConfigManager.WebsiteUrl, imageName),
                Description = description
            };

        }



        public ActionResult GetFaultDetails(int id)
        {   
            var faultDetails = _faultDescriptionImageService.GetById(id);
           

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Fault details [{0}] was updated.",
                                             faultDetails.Id),
                                            Constants.ActivityType.FaultDescriptionSearched);

            /*******************************************************************************************/

            return Json(faultDetails, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult DeleteFaultDetails(int id)
        {
            var resultMsg = "Failed to delete Image!";
            var qcNum = 0;
            var subQCNum = 0;

            try
            {
                var faultDetails = _faultDescriptionImageService.GetById(id);
                qcNum = faultDetails.QCNum;
                 subQCNum = faultDetails.SubQCNum;

                var deleted = _faultDescriptionImageService.Delete(id);
                resultMsg = "Image successfully deleted!";

                try
                {
                    /********* Delete file from the server **************************************/

                    if (deleted)
                    {
                        string path = Path.Combine(Server.MapPath("~/UploadedImages"), faultDetails.ImageName);
                        FileUtil.DeleteFile(path);
                    }
                   
                }
                catch
                {
                    // do nothing
                }

                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Fault details [{0}] was deleted.",
                                                id),
                                                Constants.ActivityType.FaultDescriptionDeleted);

                /*******************************************************************************************/


            }
            catch (Exception ex)
            {
                var errorMessage = ex.Message;
            }
            

            return PopulateImagesGrid(qcNum, subQCNum, resultMsg, false);

        }


    }
}