using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReservationLibrary;

public partial class CustomerRegister : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if(!this.IsPostBack)
            {

            }
        }
        catch(Exception ex)
        {

        }
    }
    protected void Page_UnLoad(object sender, EventArgs e)
    {
        try
        {
            objAdm.CloseConnection();
        }
        catch(Exception ex)
        {

        }
    }
    protected void Page_Init(object sender, EventArgs e)
    {

    }
    protected void RegisterClicked(object sender, EventArgs e)
    {
        try
        {
            if (fullname.Value == "")
            {
                DisplayMessage("Please enter your fullname.",0);
            }
            else if (email.Value == "")
            {
                DisplayMessage("Please enter your Email.", 0);
            }
            else if (telephone_no .Value == "")
            {
                DisplayMessage("Please enter your Telephone Number.", 0);
            }
            else if (username .Value == "")
            {
                DisplayMessage("Please enter your Username.", 0);
            }
            else if (password.Value == "")
            {
                DisplayMessage("Please enter your Password.", 0);
            }
            else
            {
                Session["audit_username"] = fullname.Value;
                if (objAdm.CRUDCustomer("0", fullname.Value, email.Value, telephone_no.Value, username.Value, password.Value , "INSERT") == true)
                {
                    Response.Redirect("Login");
                }
                else
                {
                    DisplayMessage (objAdm.ErrorMessage,0);
                    
                }
            }
        }
        catch(Exception ex)
        {

        }
    }
    public enum MsgType
    {
        Error = 0,
        Success = 1,
        Warning = 2
    }
    public void DisplayMessage(String sMessage, MsgType type)
    {
        try
        {
            if (sMessage.Trim() == "")
            {
                pnlAlert.Visible = false;
            }
            else
            {
                lblMsg.Text = sMessage;
                if (type == MsgType.Success)
                {
                    pnlAlert.CssClass = "alert alert-success alert-dismissible";
                    spIcon.InnerHtml = "<i class='fa fa-check-circle-o'></i>";
                }
                else if (type == MsgType.Warning)
                {
                    pnlAlert.CssClass = "alert alert-warning alert-dismissible";
                    spIcon.InnerHtml = "<i class='fa fa-exclamation-triangle'></i>";
                }
                else
                {
                    pnlAlert.CssClass = "alert alert-danger alert-dismissible";
                    spIcon.InnerHtml = "<i class='fa fa-exclamation-circle'></i>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "displayMsg", "alert('" + sMessage + "');", true);
                }
                pnlAlert.Visible = true;
                //ClientScript.RegisterStartupScript(this.GetType(), "displayMsg", "alert('" + sMessage + "');", true);
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            pnlAlert.Visible = true;
        }
    }
}