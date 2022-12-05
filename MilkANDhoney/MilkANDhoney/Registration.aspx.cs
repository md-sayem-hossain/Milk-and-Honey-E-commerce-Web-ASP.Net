using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace MilkANDhoney
{
    public partial class Registration : System.Web.UI.Page
    {
        String CS = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistration_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                bool exists = false;
                string user = "SELECT count(*) FROM [Person] where Email='" + email.Value + "'";
                SqlCommand cmd = new SqlCommand(user, con);
                cmd.Parameters.AddWithValue("Email", email.Value);
                exists = (int)cmd.ExecuteScalar() == 1;
                if (exists)
                {
                    lblMsg.ForeColor = Color.Red;
                    lblMsg.Text = "This email is Already Exists";
                }
                else
                {
                    DateTime joinedDate = DateTime.Now;
                    string gender = RadioButtonGender.SelectedItem.Text;

                    SqlCommand cmdInsert = new SqlCommand("insert into Person" + "(Name, Email, Password, Gender, JoinedDate) values (@Name, @Email, @Password, @Gender, @JoinedDate)", con);
                    cmdInsert.Parameters.AddWithValue("@Name", Name.Value);
                    cmdInsert.Parameters.AddWithValue("@Email", email.Value);
                    cmdInsert.Parameters.AddWithValue("@Password", password.Value);
                    cmdInsert.Parameters.AddWithValue("@Gender", gender);
                    cmdInsert.Parameters.AddWithValue("@JoinedDate", joinedDate.ToString());
                    cmdInsert.ExecuteNonQuery();
                    lblMsg.Text = "Registered Successfully";
                    lblMsg.ForeColor = Color.Green;
                }
            }
        }
    }
}