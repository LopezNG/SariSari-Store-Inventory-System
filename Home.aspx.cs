using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SariSari_InventorySystem
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Establish connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";

            // Initialize variables for total inventory value, total inventory items, and total categories
            decimal totalInventoryValue = 0;
            int totalInventoryItems = 0;
            int totalCategories = 0;

            try
            {
                // Create SqlConnection using the connection string
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Open the connection
                    connection.Open();

                    // Query to get total inventory value from Product table
                    string inventoryValueQuery = "SELECT SUM(prod_price) FROM [dbo].[PRODUCT]";
                    SqlCommand inventoryValueCmd = new SqlCommand(inventoryValueQuery, connection);
                    object inventoryValueObj = inventoryValueCmd.ExecuteScalar();
                    if (inventoryValueObj != DBNull.Value)
                    {
                        totalInventoryValue = Convert.ToDecimal(inventoryValueObj);
                    }

                    // Query to get total inventory items from Product table
                    string inventoryItemsQuery = "SELECT COUNT(*) FROM [dbo].[PRODUCT]";
                    SqlCommand inventoryItemsCmd = new SqlCommand(inventoryItemsQuery, connection);
                    totalInventoryItems = Convert.ToInt32(inventoryItemsCmd.ExecuteScalar());

                    // Query to get total categories from Category table
                    string categoriesQuery = "SELECT COUNT(*) FROM [dbo].[CATEGORY]";
                    SqlCommand categoriesCmd = new SqlCommand(categoriesQuery, connection);
                    totalCategories = Convert.ToInt32(categoriesCmd.ExecuteScalar());

                    // Close the connection
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions, for example, display "Empty" if tables are empty
                lblInventoryValue.Text = "Empty";
                lblInventoryItems.Text = "Empty";
                lblCategories.Text = "Empty";
                return; // Exit the method to prevent setting labels to actual values if an exception occurs
            }

            // Set the text of the labels to display the actual values
            lblInventoryValue.Text = "Php " + totalInventoryValue.ToString();
            lblInventoryItems.Text = totalInventoryItems.ToString();
            lblCategories.Text = totalCategories.ToString();
        }
    }
}