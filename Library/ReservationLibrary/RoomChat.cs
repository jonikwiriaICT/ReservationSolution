using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _Foundation;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web;

namespace ReservationLibrary
{
    public partial class SysAdminModel : _Database
    {
        public string ProductPrice = string.Empty;
        public List<RoomClass > CommentNews(string text)
        {
            List<RoomClass> objmenu = new List<RoomClass>();
            DataTable _objdt = new DataTable();
            string querystring = "SELECT DISTINCT top (1) [RecID],  [Room Type],[Room Name],[Pic],[Price], fms.score, SOUNDEX([Room Type] + [Room Name]) AS SoundexCode from qryNonBookRoom CROSS APPLY(select dbo.FuzzyMatchString(" + text  + ", [Room Type] + [Room Name]) AS score) AS fms ORDER by fms.score desc";
            SqlConnection _objcon = new SqlConnection(connectionstring);
            SqlDataAdapter _objda =
                new SqlDataAdapter(querystring, _objcon);
            _objcon.Open();
            _objda.Fill(_objdt);
            if (_objdt.Rows.Count > 0)
            {
                for (int i = 0; i < _objdt.Rows.Count; i++)
                {
                    objmenu.Add(new RoomClass {RoomType = _objdt.Rows[i]["Room Type"].ToString(), RoomID = _objdt.Rows[i]["RecID"].ToString(), RoomName  = _objdt.Rows[i]["Room Name"].ToString(), RoomProfile = _objdt.Rows[i]["Pic"].ToString(), Price = _objdt.Rows[i]["Price"].ToString() });
                }
            }
            return objmenu;
        }
       

        public string GetProduct(string text)
        {
            StringBuilder objstr = new StringBuilder();
            List<RoomClass > objpmenu = new List<RoomClass>();
            objpmenu = CommentNews(text);
            foreach (RoomClass _pitem in objpmenu)
            {
                HttpContext.Current.Session["ConsumerAmount"] = _pitem.Price ;
                objstr.Append("<div class='panel'><div class='panel-body'><section class='product-area li-laptop-product pt-60 pb-45'><div class='container'><div class='row'><div class='col-lg-12'><div class='shop-products-wrapper'><div class='tab-content'><div id='grid-view' class='tab-pane fade active show' role='tabpanel'><div class='product-area shop-product-area'><div class='row'><div class='col-lg-3 col-md-3 col-sm-3 mt-40'><div class='single-product-wrap'><div class='product-image'><a href='#'><img src='" + _pitem.RoomProfile + "' style='width:20em; height:20em' runat ='server'  alt='Li's Product Image'/></a></div><div class='product_desc'><div class='product_desc_info'><div class='product-review'><h5 class='manufacturer'><a href='#'>" + _pitem.RoomType + "</a></h5></div><h4><a class='product_name' href='#'>" + _pitem.RoomName  + "</a></h4><div class='price-box'><span class='new-price'>" + _pitem.Price  + "</span></div></div><div class='add-actions'><ul class='add-actions-link'><li class='add-cart active'><a href='Client-Pay' class='add-to-cart'><i class='fa fa-paypal'></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>");
            }
            return objstr.ToString();
        }
    }
    public class RoomClass
    {      
        public string RoomID { get; set; }
        public string RoomType { get; set; }
        public string RoomName { get; set; }
        public string Price { get; set; }
        public string RoomProfile { get; set; }
    }
}
