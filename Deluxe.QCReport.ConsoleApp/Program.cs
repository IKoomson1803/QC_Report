using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Deluxe.QCReport.Common.Repositories;

namespace Deluxe.QCReport.ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {

            Insert_Disney_TWDC_LookupS();
        }

        static void Insert_Disney_TWDC_LookupS()
        {
            try
            {
                string lookupPath = @"D:\DevFiles\QC\Disney\TWDC\Lookups\Lookups.txt";
                var tableName = "[bward].[DisneyTWDCQCEvaluation]";
                DisneyTWDC.InsertLookups(lookupPath, tableName);

                Console.WriteLine("Done");
                Console.Read();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.Read();

            }



        }
    }
}
