using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SariSari_InventorySystem
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            // Check if the entered credentials are correct
            string username = Request.Form["username"]; // Get the entered username from the form
            string password = Request.Form["password"]; // Get the entered password from the form

            if (username == "admin" && password == "123")
            {
                // Redirect to MainPage.aspx if credentials are correct
                Response.Redirect("Home.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid credentials, please contact the admin if you want to have an account.');", true);
            }
        }
    }
}