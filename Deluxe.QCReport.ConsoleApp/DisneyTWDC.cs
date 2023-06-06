using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Utilities;


namespace Deluxe.QCReport.ConsoleApp
{
    public class DisneyTWDC
    {

        public static void InsertLookups(string lookupPath, string tableName)
        {
            try
            {
                using (var connection = new SqlConnection(ConfigManager.DatabaseConnection.ConnectionString))
                {
                    connection.Open();
                    var lookups = File.ReadLines(lookupPath);

                    foreach (string lookup in lookups)
                    {

                        if (!string.IsNullOrWhiteSpace(lookup))
                        {
                            var sql = $"INSERT INTO {tableName} ";
                            sql += $" SELECT @type";
                            sql += $" WHERE NOT EXISTS( SELECT NULL FROM {tableName} WHERE Type = @type)";

                            using (var cmd = new SqlCommand(sql, connection))
                            {
                                cmd.Parameters.Add("@type", SqlDbType.VarChar).Value = lookup;
                                object res = cmd.ExecuteScalar();
                            }

                        }

                    }
                }


            }
            catch (Exception ex)
            {
                var errorMessage = ex.Message;
            }



        }


    }
}
