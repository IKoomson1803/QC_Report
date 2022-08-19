using System.Data;
using System;
using System.IO;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Services;
using System.Web;
using ClosedXML.Excel;
using FastMember;


namespace Deluxe.QCReport.Common.Utilities
{
    public class ExcelUtil
    {
        public static void DownloadToExcel<T>(IEnumerable<T> list, string excelFilename, string workSheetName, string downloadToken, params string[] listMembers)
        {
            try
            {

                DataTable dt = ConvertListToDatatable(workSheetName, list, listMembers);

                if (dt != null)
                {
                    using (XLWorkbook wb = new XLWorkbook())
                    {
                        wb.Worksheets.Add(dt);
                        excelFilename = excelFilename + "_" + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".xlsx";
                        MemoryStream stream = GetStream(wb);
                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.AppendCookie(new HttpCookie("fileDownloadToken", downloadToken));  // This is used by exportToExcel.js on the client side
                        HttpContext.Current.Response.Buffer = true;
                        HttpContext.Current.Response.AddHeader("content-disposition",
                        "attachment; filename=\"" + excelFilename + "\"");
                        HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
                        HttpContext.Current.Response.BinaryWrite(stream.ToArray());
                        HttpContext.Current.Response.End();
                    }
                }

            }
            catch
            {
                throw;
            }

        }

        public static MemoryStream GetStream(XLWorkbook excelWorkbook)
        {
            MemoryStream fs = new MemoryStream();
            excelWorkbook.SaveAs(fs);
            fs.Position = 0;
            return fs;
        }

        /// <summary>
        /// Uses FastMember to convert Generic list to DataTable for excel creation
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        /// <param name="members"></param>
        /// <returns></returns>
        static DataTable ConvertListToDatatable<T>(string tableName, IEnumerable<T> list, params string[] members)
        {
            if (string.IsNullOrWhiteSpace(tableName))
            {
                tableName = string.Format("dataTable_{0}", DateTime.Now.ToString("ddMMyyyyHHmmss"));
            }

            if (tableName.Trim().Length > 31)
                tableName = tableName.Substring(0, 30);

            DataTable table = new DataTable(tableName);

            try
            {
                using (var reader = ObjectReader.Create(list, members))
                {
                    table.Load(reader);
                }
            }
            catch
            {
                table = null;
            }

            return table;
        }

        public static bool SaveToExcel<T>(ref string filename, string workSheetName, IEnumerable<T> list, params string[] listMembers)
        {

            bool saved = false;

            try
            {

                DataTable dt = ConvertListToDatatable(workSheetName, list, listMembers);

                if (dt != null)
                {
                    string AppLocation = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase);
                    AppLocation = AppLocation.Replace("file:\\", "");
                    var excelFiles = Path.Combine(AppLocation, "ExcelFiles");
                    FileUtil.CreateDirectory(excelFiles);
                    var filePath = Path.Combine(excelFiles, filename);
                    FileUtil.DeleteFile(filePath);

                    using (XLWorkbook wb = new XLWorkbook())
                    {
                        wb.Worksheets.Add(dt);
                        wb.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
                        wb.Style.Font.Bold = true;
                        wb.SaveAs(filePath);
                        saved = true;
                        filename = filePath;
                    }
                }

            }
            catch
            {
                throw;
            }

            return saved;

        }

        public static bool SaveToExcel<T>(IEnumerable<T> list, string fileFullPath, string workSheetName, params string[] listMembers)
        {

            bool saved = false;

            try
            {

                DataTable dt = ConvertListToDatatable(workSheetName, list, listMembers);

                if (dt != null)
                {
                    using (XLWorkbook wb = new XLWorkbook())
                    {
                        wb.Worksheets.Add(dt);
                        wb.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
                        wb.Style.Font.Bold = true;
                        wb.SaveAs(fileFullPath);
                        saved = true;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }

            return saved;

        }

    }
}
