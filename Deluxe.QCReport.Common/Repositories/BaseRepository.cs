using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Utilities;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories
{
    public class BaseRepository
    {
        readonly static string _connString = ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
        protected SqlConnection _connection = new SqlConnection(_connString);

        protected IDbConnection OpenConnection(string connectionString)
        {
            IDbConnection connection = new SqlConnection(connectionString);
            connection.Open();
            return connection;
        }

        protected ILoggerItem PopulateLoggerItem(Exception ex)
        {
            return new LoggerItem()
            {
                Details = string.Format("Error Message: {0} ", ex.GetDescription()),
                Category = Constants.LogCategory.Error,
                Source = GetType().ToString()
            };
        }


        protected SqlParameter GetSqlParameterInt(string pName, int pValue)
        {
            return new SqlParameter()
            {
                DbType = System.Data.DbType.Int32,
                ParameterName = pName,
                SqlValue = pValue
            };
        }

        protected SqlParameter GetSqlParameterString(string pName, string pValue)
        {
            return new SqlParameter()
            {
                DbType = System.Data.DbType.String,
                ParameterName = pName,
                SqlValue = pValue
            };
        }

        protected SqlParameter GetSqlParameterBool(string pName, bool pValue)
        {
            return new SqlParameter()
            {
                DbType = System.Data.DbType.Boolean,
                ParameterName = pName,
                SqlValue = pValue
            };
        }

        protected SqlParameter GetSqlParameterNullableBool(string pName, bool? pValue)
        {
            return new SqlParameter()
            {
                DbType = System.Data.DbType.Boolean,
                ParameterName = pName,
                SqlValue = pValue
            };
        }

        protected SqlParameter GetSqlParameterDateTime(string pName, DateTime pValue)
        {
            return new SqlParameter()
            {
                DbType = System.Data.DbType.DateTime,
                ParameterName = pName,
                SqlValue = pValue
            };
        }

        protected SqlParameter GetSqlParameteNullablerDateTime(string pName, DateTime? pValue)
        {
            return new SqlParameter()
            {
                DbType = System.Data.DbType.DateTime,
                ParameterName = pName,
                SqlValue = pValue
            };
        }
    }
}
