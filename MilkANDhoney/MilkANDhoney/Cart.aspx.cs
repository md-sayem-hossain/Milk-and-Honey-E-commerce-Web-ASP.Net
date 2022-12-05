using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace MilkANDhoney
{
    public partial class Cart : System.Web.UI.Page
    {
        String CS = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Person"] != null)
                {
                    DataTable datatable = new DataTable();
                    DataRow dr;

                    datatable.Columns.Add("#");
                    datatable.Columns.Add("PID");
                    datatable.Columns.Add("PImage");
                    datatable.Columns.Add("PName");
                    datatable.Columns.Add("PPrice");
                    datatable.Columns.Add("PQuantity");
                    datatable.Columns.Add("TotalPrice");

                    if (Request.QueryString["CartPID"] != null)
                    {
                        if (Session["cart"] == null)
                        {
                            dr = datatable.NewRow();
                            SqlDataAdapter da = new SqlDataAdapter("select * from product where PID = " + Request.QueryString["CartPID"].ToString(), CS);
                            DataSet ds = new DataSet();
                            da.Fill(ds);

                            dr["#"] = 1;
                            dr["PID"] = ds.Tables[0].Rows[0]["PID"].ToString();
                            dr["PImage"] = ds.Tables[0].Rows[0]["PImage"].ToString();
                            dr["PName"] = ds.Tables[0].Rows[0]["PName"].ToString();
                            dr["PQuantity"] = Request.QueryString["quantity"];
                            dr["PPrice"] = ds.Tables[0].Rows[0]["PPrice"];

                            int Userquantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                            double price = Convert.ToDouble(ds.Tables[0].Rows[0]["PPrice"].ToString());
                            double TotalPrice = price * Userquantity;
                            dr["TotalPrice"] = TotalPrice;



                            datatable.Rows.Add(dr);
                            GridView1.DataSource = datatable;
                            GridView1.DataBind();
                            Session["cart"] = datatable;

                            GridView1.FooterRow.Cells[4].Text = "Total";
                            GridView1.FooterRow.Cells[5].Text = finalPrice().ToString();
                            Response.Redirect("Cart.aspx");

                        }
                        else
                        {
                            datatable = (DataTable)Session["cart"];
                            int tableNumber;
                            tableNumber = datatable.Rows.Count;

                            dr = datatable.NewRow();
                            SqlDataAdapter da = new SqlDataAdapter("select * from product where PID = " + Request.QueryString["CartPID"].ToString(), CS);
                            DataSet ds = new DataSet();
                            da.Fill(ds);

                            dr["#"] = tableNumber + 1;
                            dr["PID"] = ds.Tables[0].Rows[0]["PID"].ToString();
                            dr["PImage"] = ds.Tables[0].Rows[0]["PImage"].ToString();
                            dr["PName"] = ds.Tables[0].Rows[0]["PName"].ToString();
                            dr["PQuantity"] = Request.QueryString["quantity"];
                            dr["PPrice"] = ds.Tables[0].Rows[0]["PPrice"];


                            int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                            double price = Convert.ToDouble(ds.Tables[0].Rows[0]["PPrice"].ToString());
                            double TotalPrice = price * quantity;
                            dr["TotalPrice"] = TotalPrice;



                            datatable.Rows.Add(dr);
                            GridView1.DataSource = datatable;
                            GridView1.DataBind();
                            Session["cart"] = datatable;

                            GridView1.FooterRow.Cells[4].Text = "Total";
                            GridView1.FooterRow.Cells[5].Text = finalPrice().ToString();
                            Response.Redirect("Cart.aspx");
                        }
                    }
                    else
                    {
                        datatable = (DataTable)Session["cart"];
                        GridView1.DataSource = datatable;
                        GridView1.DataBind();
                        if (GridView1.Rows.Count > 0)
                        {
                            GridView1.FooterRow.Cells[4].Text = "Total";
                            GridView1.FooterRow.Cells[5].Text = "$" + finalPrice().ToString();
                            Session["Total"] = finalPrice().ToString();
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }


        public double finalPrice()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["cart"];
            int newrow = dt.Rows.Count;
            int i = 0;
            double totalAmount = 0;
            while (i < newrow)
            {
                totalAmount = totalAmount + Convert.ToDouble(dt.Rows[i]["TotalPrice"].ToString());

                i = i + 1;
            }
            return totalAmount;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["cart"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int tableNumber;
                int tableNumber2;
                string qdata;
                string dtdata;
                tableNumber = Convert.ToInt32(dt.Rows[i]["#"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = tableNumber.ToString();
                tableNumber2 = Convert.ToInt32(qdata);

                if (tableNumber == tableNumber2)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    break;
                }
            }

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["#"] = i;
                dt.AcceptChanges();
            }
            Session["cart"] = dt;
            Response.Redirect("Cart.aspx");
        }
    }
}