using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReservationLibrary;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net;
using System.Net.Mail;

public partial class Cust_CheckOut : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    public string RetailerID = string.Empty;
    public string ManufacturerID = string.Empty;
    public string PurchaseTypeID = string.Empty;
    public string WareHouse = string.Empty;
    public string productID = string.Empty;
    public string remark = string.Empty;
    public string Email = string.Empty;
    public string TelephoneNo = string.Empty;
    Dictionary<string, string> dictionaryCart;
    DataTable dtblProducts;
    DataTable dtblCart;
    public int totalQuantity = 0;
    public double totalAmount = 0;
    public int tot;
    public int OrderItemNo;

    public object RecID { get; private set; }


    //private void checkAll()
    //{
    //    try
    //    {
    //        foreach (GridViewRow grow in GVCart.Rows)
    //        {
    //            CheckBox chkVerified = (CheckBox)grow.FindControl("chkcheck");
    //            if (chkVerified.Checked == false)
    //            {
    //                chkVerified.Checked = true;
    //                lblCheck.Text = "Uncheck";
    //            }

    //        }

    //    }
    //    catch(Exception ex)
    //    {

    //    }
    //}
    protected void Page_Load(object sender, EventArgs e)
    {


        var cookieCart = Request.Cookies["CookieCart"];

        if (cookieCart != null)
        {
            dictionaryCart = objAdm.ToDictionary(cookieCart.Value);

            CreateDataTableCart();

            if (dtblCart.Rows.Count > 0)
            {
                GVCart.DataSource = dtblCart;
                GVCart.DataBind();

            }
        }

    }
    protected void Page_UnLoad(object sender, EventArgs e)
    {
        try
        {
            objAdm.CloseConnection();
        }
        catch (Exception ex)
        {

        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {

    }

    private void PopulateData()
    {
        dtblProducts = objAdm.PopulateViewCart("GetTopRooms");
    }
    private void InsertRecord()
    {

    }
    public string UserID()
    {
        try
        {
            string username = Session["ID"].ToString();
            return username;
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    private void CreateDataTableCart()
    {
        PopulateData();
        dtblCart = new DataTable();
        dtblCart.Columns.Add("RecID");
        dtblCart.Columns.Add("RoomID");
        dtblCart.Columns.Add("Room Type");
        dtblCart.Columns.Add("Room Name");
        dtblCart.Columns.Add("Price");
        dtblCart.Columns.Add("Quantity");
        dtblCart.Columns.Add("ProductTotalAmount");
        dtblCart.Columns.Add("Pic");
        foreach (KeyValuePair<string, string> item in dictionaryCart)
        {
            DataRow[] selectedRow = dtblProducts.Select("RecID = " + item.Key);
            DataRow row = dtblCart.NewRow();
            row["RecID"] = int.Parse(item.Key);
            row["Room Name"] = selectedRow[0]["Room Name"];
            row["RoomID"] = selectedRow[0]["RoomID"];
            row["Price"] = selectedRow[0]["Price"];
            row["Quantity"] = item.Value;
            row["ProductTotalAmount"] = double.Parse(row["Price"].ToString()) * int.Parse(item.Value);
            totalAmount += double.Parse(row["Price"].ToString()) * int.Parse(item.Value);
            Session["total"] = totalAmount;
            row["Pic"] ="/" + selectedRow[0]["Pic"];
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString;
            con.Open();
            
            using (SqlCommand newCmd = new SqlCommand())
            {
                newCmd.Connection = con;
                newCmd.CommandType = CommandType.Text;
                newCmd.CommandText = "INSERT INTO tbl_reservation (customer_id  ,room_id ,booking_date,booking_time,expired_date,orderno) values ('" + UserID() + "', '" + row ["RoomID"].ToString() + "', '" + DateTime.UtcNow.ToShortDateString() + "', '" + DateTime.UtcNow.ToShortTimeString() + "' ,'" + DateTime.Now.Date.AddDays(1).ToShortDateString() + "', '" + Session["order"].ToString() + "')";
                newCmd.ExecuteNonQuery();
                if (objAdm.UpdateRoomBooked(row["RoomID"].ToString (), "1") == true)
                {
                }
                else
                {
                    Response.Redirect("Paid-Error");
                }

            }
            con.Close();
            dtblCart.Rows.Add(row);
        }
        Response.Redirect("Payment-Success");


    }
}