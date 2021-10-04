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
        public bool CRUDRoomType(string rec_id,string room_type,string StatementType)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CRUDRoomType", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rec_id", rec_id);
            cmd.Parameters.AddWithValue("@room_type", room_type);
            cmd.Parameters.AddWithValue("@StatementType", StatementType);
            if (ExecuteNonQuery(cmd) <= 0)
            {
                ErrorMessage = "Unable to process transaction";
                return false;
            }
            ErrorMessage = "Record executed successfully .";
            return true;
        }
        //GetRoom Type
        public DataSet GetRoomType()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select room_typeID as [Code], room_type as [Desc] from tbl_roomType";
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
