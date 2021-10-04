
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReservationLibrary;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Administrator_Reservation : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    DataSet ds;
    DataTable Dt;
    static string sRecValue;
    static int itrig = 0;
    public int TotalPage { get; set; }
    public int CurrentPage { get; set; }

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
    private void GetCustomer()
    {
        try
        {
            DataSet ds = objAdm.GetCustomer();
            customer_id.DataSource = ds;
            customer_id.DataValueField = "Code";
            customer_id.DataTextField = "Desc";
            customer_id.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    private void GetRoom()
    {
        try
        {
            DataSet ds = objAdm.GetRoom ();
            room_id.DataSource = ds;
            room_id.DataValueField = "Code";
            room_id.DataTextField = "Desc";
            room_id.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void AddNewRecord(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {

        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!IsPostBack)
            {
                if (Administrator() == "1")
                {
                    GetCustomer ();
                    GetRoom ();
                    LoadGrid();
                    formView.Visible = false;
                    TableView.Visible = true;
                }
                else
                {


                    Response.Redirect("index");
                }
            }
            //LoadGrid(); 






        }
        catch (Exception ex)
        {

        }
    }
    protected void AddNewRecordClicked(object sender, EventArgs e)
    {
        try
        {
            formView.Visible = true;
            TableView.Visible = false;
            LoadGrid();
            objAdm.clearPanel(PnlReservation );
            itrig = 0;
        }
        catch (Exception ex)
        {

        }
    }
    protected void ViewRecord(object sender, EventArgs e)
    {
        try
        {
            formView.Visible = false;
            TableView.Visible = true;
            LoadGrid();
            itrig = 0;
        }
        catch (Exception ex)
        {

        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {

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



    public void bindGrid(int currentPage)
    {

        TableResult.DataSource = objAdm.PopulateData(currentPage, "GetReservation");
        TableResult.DataBind();

        generatePager(objAdm._TotalRowCount, objAdm.pageSize, currentPage);


    }
    protected void dlPager_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "PageNo")
        {
            bindGrid(Convert.ToInt32(e.CommandArgument));
        }
        TableResult.UseAccessibleHeader = true;
        TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
    public void generatePager(int totalRowCount, int pageSize, int currentPage)
    {
        int totalLinkInPage = 5;
        int totalPageCount = (int)Math.Ceiling((decimal)totalRowCount / pageSize);

        int startPageLink = Math.Max(currentPage - (int)Math.Floor((decimal)totalLinkInPage / 2), 1);
        int lastPageLink = Math.Min(startPageLink + totalLinkInPage - 1, totalPageCount);

        if ((startPageLink + totalLinkInPage - 1) > totalPageCount)
        {
            lastPageLink = Math.Min(currentPage + (int)Math.Floor((decimal)totalLinkInPage / 2), totalPageCount);
            startPageLink = Math.Max(lastPageLink - totalLinkInPage + 1, 1);
        }

        List<ListItem> pageLinkContainer = new List<ListItem>();

        if (startPageLink != 1)
            pageLinkContainer.Add(new ListItem("First", "1", currentPage != 1));
        for (int i = startPageLink; i <= lastPageLink; i++)
        {
            pageLinkContainer.Add(new ListItem(i.ToString(), i.ToString(), currentPage != i));
        }
        if (lastPageLink != totalPageCount)
            pageLinkContainer.Add(new ListItem("Last", totalPageCount.ToString(), currentPage != totalPageCount));

        dlPager.DataSource = pageLinkContainer;
        dlPager.DataBind();
    }
    private void LoadGrid()
    {
        try
        {
            bindGrid(1);
            TableResult.UseAccessibleHeader = true;
            TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        catch (Exception ex)
        {

        }
    }


    protected void tableChanged(object sender, EventArgs e)
    {
        try
        {

            itrig = 1;
            GridViewRow dgi = TableResult.SelectedRow;
            rec_id.Value = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "RecID")].Text;
            GetCustomer ();
            GetRoom ();
            objAdm.getPanelByRecID(PnlReservation );
            //ckEditor.InnerText = product_description.Value;
            formView.Visible = true;
            TableView.Visible = false;


        }
        catch (Exception ex)
        {

        }
    }
    protected void TableDelete(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            GridViewRow dgi = TableResult.Rows[e.RowIndex];
            rec_id.Value = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "RecID")].Text;
            Label1.ForeColor = System.Drawing.Color.DarkRed;
            Label1.Text = "Are you sure that you want to delete Record with ID:" + " " + rec_id.Value + " " + " ?";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { showDelete(); });", true);

        }
        catch (Exception ex)
        {
        }
    }

    protected void lbDeleteYes_Click(object sender, EventArgs e)
    {
        try
        {

            string sTbl = "tbl_reservation";
            if (objAdm.DeleteRecord(rec_id.Value, sTbl) == true)
            {
                DisplaySuccess("Record deleted successfully.");
                LoadGrid();


            }
            else
            {

            }

        }
        catch (Exception ex)
        {

        }
    }

    protected void SaveChangesClicked(object sender, EventArgs e)
    {
        try
        {
            SqlTransaction sqtr = null;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString;
            con.Open();
            sqtr = con.BeginTransaction();
            int orderNum = 0;
            string sql = "SELECT MAX(orderno) AS MAXORDNO FROM tbl_reservation";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Transaction = sqtr;
            object obj = cmd.ExecuteScalar();
            if (obj == null)
            {
                orderNum = 1;
            }
            else
            {
                if (obj.ToString() != "")
                    orderNum = int.Parse(obj.ToString()) + 1;
                else
                    orderNum = 1;
            }
            Session["order"] = orderNum;
            string rm = room_id.SelectedValue;
            if (itrig == 0)
            {
                if (objAdm.CRUDReservation( rec_id.Value ,  customer_id.SelectedValue ,  room_id.SelectedValue , booking_date.Text,  DateTime.UtcNow .ToShortTimeString(), expired_date.Text , Session["order"].ToString (), "INSERT") == true)
                {
                    if (objAdm.UpdateRoomBooked(room_id.SelectedValue, "1") == true)
                    {
                        LoadGrid();
                     

                        objAdm.clearPanel(PnlReservation);
                        //ckEditor.InnerText = "";
                        itrig = 0;
                        LoadGrid();
                        //formView.Visible = false;
                        //TableView.Visible = true;
                        DisplaySuccess(objAdm.ErrorMessage);
                    }
                    else
                    {
                        DisplayError(objAdm.ErrorMessage);
                    }

                }
                else
                {
                    DisplayError(objAdm.ErrorMessage);
                    LoadGrid();
                    formView.Visible = false;
                    TableView.Visible = true;
                }
            }
            if (itrig == 1)
            {
              
                if (objAdm.CRUDReservation(rec_id.Value, customer_id.SelectedValue, room_id.SelectedValue, booking_date.Text, DateTime.UtcNow.ToShortTimeString(), expired_date.Text, Session["order"].ToString(), "UPDATE") == true)
                {

                    if (objAdm.UpdateRoomBooked(room_id.SelectedValue , "1") == true)
                    {
                        LoadGrid();
                        

                        objAdm.clearPanel(PnlReservation);
                        //ckEditor.InnerText = "";
                        itrig = 0;
                        LoadGrid();
                        //formView.Visible = false;
                        //TableView.Visible = true;
                        DisplaySuccess(objAdm.ErrorMessage);
                    }
                    else
                    {
                        DisplayError(objAdm.ErrorMessage);
                    }



                   
                }
                else
                {
                    DisplayError(objAdm.ErrorMessage);
                    LoadGrid();
                    formView.Visible = false;
                    TableView.Visible = true;
                }
            }


        }
        catch (Exception ex)
        {

        }
    }

}