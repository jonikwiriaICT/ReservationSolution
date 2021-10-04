using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReservationLibrary;

public partial class Cust_CustomerDashboard : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    public string CustomerID = string.Empty;
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
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!this.IsPostBack)
            {
                CustomerID = UserID();
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void Page_Init(object sender, EventArgs e)
    {

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

    
}