using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _Foundation;

namespace ReservationLibrary
{
    public partial class SysAdminModel : _Database
    {
        //Get Customer
        public DataSet GetCustomer()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select customer_id as [Code], fullname as [Desc] from tbl_customer";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public bool CRUDCustomer(string rec_id, string fullname, string email, string telephone_no, string username, string userpassword, string StatementType)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CRUDCustomer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rec_id", rec_id);
            cmd.Parameters.AddWithValue("@fullname", fullname);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@telephone_no", telephone_no);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@userpassword", userpassword);
            cmd.Parameters.AddWithValue("@StatementType", StatementType);
            if (ExecuteNonQuery(cmd) <= 0)
            {
                ErrorMessage = "Unable to process transaction";
                return false;
            }
            ErrorMessage = "Record executed successfully .";
            return true;

        }
        public bool getCustomerProfile(string username, string sPassword)
        {
            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "SELECT * FROM tbl_customer WHERE [username]=@username ";
                SqlCommand objCmd = new SqlCommand();
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@username", username);
                objCmd.CommandText = sSQL;
                ds = ExecuteDataSet(objCmd);
                if (ds.Tables[0].Rows.Count <= 0)
                {
                    ErrorMessage = "Invalid User. Contact Administrator.";
                    return false;
                }
                sPasswordDB = ds.Tables[0].Rows[0]["userpassword"].ToString();
                if (sPasswordDB.Trim() == string.Empty)
                {
                    ErrorMessage = "Password Not found in the database.";
                }
                else
                {

                    if (sPassword != sPasswordDB)
                    {
                        ErrorMessage = "Invalid password.";
                        return false;
                    }
                }
                UserPassword = sPasswordDB;
                Username = ds.Tables[0].Rows[0]["username"].ToString();
                RoleName = "Customer";
                EmailAddress = ds.Tables[0].Rows[0]["email"].ToString();
                TelephoneNo = ds.Tables[0].Rows[0]["telephone_no"].ToString();
                FullNames = ds.Tables[0].Rows[0]["fullname"].ToString();
                UpdatedDate = ds.Tables[0].Rows[0]["updated_date"].ToString();
                UpdatedTime = ds.Tables[0].Rows[0]["updated_time"].ToString();
                RecID = ds.Tables[0].Rows[0]["rec_id"].ToString();
                UserID = ds.Tables[0].Rows[0]["customer_id"].ToString();
                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = "No Login Connection.";
                return false;
            }
        }
    }
}
