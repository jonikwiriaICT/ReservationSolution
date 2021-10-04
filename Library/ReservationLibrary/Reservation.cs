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

        public bool CRUDReservation(string rec_id,string customer_id,string room_id,string booking_date,string booking_time,string expired_date, string orderno,   string StatementType)

        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CRUDReservation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rec_id", rec_id);
            cmd.Parameters.AddWithValue("@customer_id", customer_id);
            cmd.Parameters.AddWithValue("@room_id", room_id);
            cmd.Parameters.AddWithValue("@booking_date", booking_date);
            cmd.Parameters.AddWithValue("@booking_time", booking_time);
            cmd.Parameters.AddWithValue("@expired_date", expired_date);
            cmd.Parameters.AddWithValue("@orderno", orderno);
            cmd.Parameters.AddWithValue("@StatementType", StatementType);
            if (ExecuteNonQuery(cmd) <= 0)
            {
                ErrorMessage = "Unable to process transaction";
                return false;
            }
            ErrorMessage = "Record executed successfully .";
            return true;
        }


        public bool UpdateRoomBooked(string rec_id, string flag_on)

        {
            try
            {
                string sSQL = "update tbl_room set flag_on='" + flag_on + "'  WHERE  rec_id=@rec_id";
                SqlCommand objCmd = new SqlCommand();
                objCmd.CommandText = sSQL;
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@rec_id", rec_id);
                if (ExecuteNonQuery(objCmd) <= 0)
                {
                    ErrorMessage = "Unable to Update transaction";
                    return false;
                }
                ErrorMessage = "Record successfully executed.";
                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.ToString();
                return false;
            }
        }

       
    }
}
