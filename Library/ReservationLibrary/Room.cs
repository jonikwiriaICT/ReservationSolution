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
        //Get Room
        public DataSet GetRoom()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select room_typeID as Code, room_name as [Desc] from tbl_room";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public bool CRUDRoom(string rec_id,string room_typeID,string room_name,string no_of_persons,string price ,string room_description,string profile_pic,string StatementType)

            {
            con.Open();
            SqlCommand cmd = new SqlCommand("CRUDRoom", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rec_id", rec_id);
            cmd.Parameters.AddWithValue("@room_typeID", room_typeID);
            cmd.Parameters.AddWithValue("@room_name", room_name);
            cmd.Parameters.AddWithValue("@no_of_persons", no_of_persons);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@room_description", room_description);
            cmd.Parameters.AddWithValue("@profile_pic", profile_pic);
            cmd.Parameters.AddWithValue("@StatementType", StatementType);
            if (ExecuteNonQuery(cmd) <= 0)
            {
                ErrorMessage = "Unable to process transaction";
                return false;
            }
            ErrorMessage = "Record executed successfully .";
            return true;
        }


    }
}
