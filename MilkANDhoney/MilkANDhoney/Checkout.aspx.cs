using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace MilkANDhoney
{
    public partial class Checkout : System.Web.UI.Page
    {
        String CS = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["cart"] != null)
                {
                    DataTable dt = (DataTable)Session["cart"];

                    CheckoutProducts.DataSource = dt;
                    CheckoutProducts.DataBind();

                    double CartTotal = Convert.ToDouble(Session["Total"].ToString());
                    Total.InnerText = "$" + CartTotal.ToString("N2");
                }
                else
                {
                    Response.Redirect("home.aspx");
                }
            }
        }

        public void updateQyy()
        {
            DataTable dt = (DataTable)Session["cart"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int PID = Convert.ToInt32(dt.Rows[i]["PID"]);
                int PQTY = Convert.ToInt32(dt.Rows[0]["PQuantity"]);
                SqlConnection con = new SqlConnection(CS);
                SqlDataAdapter sda = new SqlDataAdapter("Select PQuantity from Product where PID='" + PID + "'", con);
                DataTable dtbl = new DataTable();
                sda.Fill(dtbl);
                int quantity = Convert.ToInt32(dtbl.Rows[0][0]);

                if (quantity > 0)
                {
                    int newQty = quantity - PQTY;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update Product set PQuantity='" + newQty + "' where PID = '" + PID + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        protected void PURCHASE_ServerClick(object sender, EventArgs e)
        {
            DataTable cart = (DataTable)Session["cart"];
            DataTable PersonInfo = (DataTable)Session["person"];
            string personID = PersonInfo.Rows[0]["ID"].ToString();

            SqlConnection con = new SqlConnection(CS);

            con.Open();
            DateTime orderDate = DateTime.Now;
            SqlCommand cmd = new SqlCommand("insert into [order] values(@PersonID,@Odate, @FullName, @Address)", con);
            cmd.Parameters.AddWithValue("PersonID", personID);
            cmd.Parameters.AddWithValue("Odate", orderDate);
            cmd.Parameters.AddWithValue("FullName", inputFNAME.Value);
            cmd.Parameters.AddWithValue("Address", inputAddress.Value);
            cmd.ExecuteNonQuery();

            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = new SqlCommand("Select * from [Order] where Oid=(Select Max(Oid) from [Order])", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            string OrderID = "";
            if (dt.Rows.Count > 0)
            {
                OrderID = dt.Rows[0]["Oid"].ToString();
            }


            for (int i = 0; i <= cart.Rows.Count - 1; i++)
            {
                updateQyy();

                SqlCommand tblShopCart = new SqlCommand("insert into ShopCart values(@Oid,@PID,@OrderQuantity, @PPrice, @PTotal)", con);
                tblShopCart.Parameters.AddWithValue("Oid", Convert.ToInt32(OrderID));
                tblShopCart.Parameters.AddWithValue("PID", Convert.ToInt32(cart.Rows[i]["PID"]));
                tblShopCart.Parameters.AddWithValue("OrderQuantity", Convert.ToInt32((cart.Rows[i]["PQuantity"])));
                tblShopCart.Parameters.AddWithValue("PPrice", cart.Rows[i]["PPrice"]);
                tblShopCart.Parameters.AddWithValue("PTotal", cart.Rows[i]["TotalPrice"]);

                tblShopCart.ExecuteNonQuery();
            }

            Session["cart"] = null;

            string message = "Thank you, Your order has been submitted";
            string url = "home.aspx";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "');";
            script += "window.location = '";
            script += url;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }
    }
}