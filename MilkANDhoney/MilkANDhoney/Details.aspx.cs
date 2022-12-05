using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace MilkANDhoney
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["PID"] != null)
            {
                if (!IsPostBack)
                {
                    Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

                    String CS = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT PID, PName, PDescription, PPrice, PQuantity, PImage from product where PID= " + PID + "", con))
                        {
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                DataTable dtBrands = new DataTable();
                                sda.Fill(dtBrands);
                                DetailsRepeater.DataSource = dtBrands;
                                DetailsRepeater.DataBind();
                            }
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("~/home.aspx");
            }
        }

        protected void addtocart_Click(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

            if (Session["Person"] != null)
            {
                foreach (RepeaterItem item in DetailsRepeater.Items)
                {

                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT PQuantity FROM product where PID= " + Request.QueryString["PID"] + "", con))
                        {
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                DataTable products = new DataTable();
                                sda.Fill(products);

                                int personqty = Convert.ToInt32(quantity.Value);
                                int tableqty = Convert.ToInt32(products.Rows[0]["PQuantity"].ToString());

                                if (tableqty < 1)
                                {
                                    Label1.Text = "Sorry, we do not have enough product";
                                }
                                else if (personqty > tableqty)
                                {
                                    Label1.Text = "Sorry, the quantity you need is greater than what is available";
                                }
                                else
                                {
                                    if (quantity.Value != null)
                                    {
                                        Response.Redirect("Cart.aspx?CartPID=" + Request.QueryString["PID"].ToString() + "&quantity=" + quantity.Value);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}