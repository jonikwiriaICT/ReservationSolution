using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using ReservationLibrary;


using System.Web.Script.Services;
using System.Configuration;

public partial class Cust_Cart : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    Dictionary<string, string> dictionaryCart;
    DataTable dtblProducts;
    DataTable dtblCart;
    public int totalQuantity = 0;
    public double totalAmount = 0;


    public string UserID()
    {
        try
        {
            string username = ((CustomerMasterPage)this.Master).UserID;
            return username;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public string Email()
    {
        try
        {
            string username = ((CustomerMasterPage)this.Master).EmailAddress;
            return username;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public string TelephoneNo()
    {
        try
        {
            string username = ((CustomerMasterPage)this.Master).TelephoneNo;
            return username;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
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


            Session["Email"] = Email();
            Session["Telephone"] = TelephoneNo();

        }
        catch (Exception ex)
        {

        }
    }
    private void PopulateData()
    {
        dtblProducts = objAdm.PopulateViewCart("GetTopRooms");


    }
    private void CreateDataTableCart()
    {

        PopulateData();
        dtblCart = new DataTable();
        dtblCart.Columns.Add("RecID");
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
            row["RecID"] = selectedRow[0]["RecID"];
            row["Price"] = selectedRow[0]["Price"];
            row["Quantity"] = item.Value;
            row["ProductTotalAmount"] = double.Parse(row["Price"].ToString()) * int.Parse(item.Value);
            totalAmount += double.Parse(row["Price"].ToString()) * int.Parse(item.Value);
            Session["total"] = totalAmount;
            row["Pic"] = selectedRow[0]["Pic"];
            dtblCart.Rows.Add(row);
        }
        if (totalAmount == 0)
        {
            idTotal.Visible = false;
            Response.Redirect("Empty-Cart");
        }
    }

    protected void GVCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Remove From Cart":
                string itemID = e.CommandArgument.ToString();
                var cookieCart = Request.Cookies["CookieCart"];
                cookieCart.Value = objAdm.Remove(itemID, cookieCart.Value);
                Response.Cookies["CookieCart"].Value = cookieCart.Value;
                Response.Redirect("Cart");
                break;
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



    protected void NavigateToPayOut(object sender, EventArgs e)
    {
        try
        {

            Response.Redirect("Check");

        }
        catch (Exception ex)
        {

        }
    }
    private void DisplaySuccess(String sMessage)
    {
        try
        {
            (this.Master as CustomerMasterPage).DisplayMessage(sMessage, CustomerMasterPage.MsgType.Success);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }
    private void DisplayError(String sMessage)
    {
        try
        {
            (this.Master as CustomerMasterPage).DisplayMessage(sMessage, CustomerMasterPage.MsgType.Error);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }

    private void DisplayWarning(String sMessage)
    {
        try
        {
            (this.Master as CustomerMasterPage).DisplayMessage(sMessage, CustomerMasterPage.MsgType.Warning);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }




}