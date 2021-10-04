using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _Foundation;
using System.Data;
using System.Data.SqlClient;

namespace ReservationLibrary
{
    public partial class SysAdminModel : _Database
    {
        public DataSet getMessage()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select * from tbl_message_log";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
    }
}
