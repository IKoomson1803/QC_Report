using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Deluxe.QCReport.Common.Utilities
{
    public class FileUtil
    {
        public static void DeleteFile(string path)
        {
            try
            {
                if (File.Exists(path)) File.Delete(path);
            }
            catch(Exception ex)
            {
                var errorMessage = ex.Message;
            }
        }
        public static void CreateDirectory(string directoryPath)
        {

            try
            {
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

            }
            catch
            {
                throw;
            }
        }

        
    }
}
