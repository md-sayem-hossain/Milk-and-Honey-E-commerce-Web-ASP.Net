using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace MilkANDhoney
{
    public partial class Login : System.Web.UI.Page
    {
        String CS = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Person"] != null)
                {
                    Response.Redirect("home.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM [Person] where Email=@email and Password=@password", con);
                    cmd.Parameters.AddWithValue("@email", email.Value);
                    cmd.Parameters.AddWithValue("@password", password.Value);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable datatable = new DataTable();
                    sda.Fill(datatable);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    if (datatable.Rows.Count > 0)
                    {
                        Session["Person"] = datatable;
                        Session["personName"] = datatable.Rows[0]["Name"].ToString();
                        Response.Redirect("home.aspx");
                    }
                    else
                    {
                        lableMsg.ForeColor = System.Drawing.Color.Red;
                        lableMsg.Text = "Invalid user";
                    }
                }
            }
            catch (Exception x)
            {

            }
        }
    }
}