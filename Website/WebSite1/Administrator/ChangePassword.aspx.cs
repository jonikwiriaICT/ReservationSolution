﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReservationLibrary;

public partial class Administrator_ChangePassword : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    public string Administrator()
    {
        try
        {
            string username = ((AdminReservationMaster)this.Master).Administrator;
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
                if (Administrator() == "1")
                {
                    if (!IsPostBack)
                    {
                    }
                }
                else
                {
                    Response.Redirect("index");
                }

            }
        }
        catch (Exception ex)
        {

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
    private void DisplaySuccess(String sMessage)
    {
        try
        {
            (this.Master as AdminReservationMaster).DisplayMessage(sMessage, AdminReservationMaster.MsgType.Success);
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
            (this.Master as AdminReservationMaster).DisplayMessage(sMessage, AdminReservationMaster.MsgType.Error);
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
            (this.Master as AdminReservationMaster).DisplayMessage(sMessage, AdminReservationMaster.MsgType.Warning);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }
    protected void Page_Init(object sender, EventArgs e)
    {

    }
    protected void ChangePasswordClicked(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(username.Text) || string.IsNullOrWhiteSpace(username.Text))
            {
                DisplayError("Please enter your Username.");
            }
            if (string.IsNullOrWhiteSpace(NewPassword.Text) || string.IsNullOrEmpty(NewPassword.Text))
            {
                DisplayError("Please enter your New Password.");
            }
            if (NewPassword.Text != ConfirmPassword.Text)
            {
                DisplayError("New Password must match confirm password.");
            }
            else
            {
                if (objAdm.changePassword(username.Text, objAdm.Encrypt(NewPassword.Text)) == true)
                {
                    DisplaySuccess("Password changed successfully.");
                }
                else
                {
                    DisplayError(objAdm.ErrorMessage);
                }
            }
        }
        catch (Exception ex)
        {

        }
    }
}