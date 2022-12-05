using System;


namespace MilkANDhoney
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["personName"] != null)
                {
                    username.Visible = true;
                    username.InnerText = Session["personName"].ToString();
                    loginheader.Visible = false;
                    btnsignout.Visible = true;  
                }
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("home.aspx");
        }
    }
}