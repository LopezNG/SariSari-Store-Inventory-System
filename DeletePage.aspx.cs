using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SariSari_InventorySystem
{
    public partial class DeletePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductIds(); // Load product IDs into dropdown list
            }
        }

        private void LoadProductIds()
        {
            ddlProductId.Items.Clear(); // Clear existing items
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";
            string query = "SELECT product_id FROM PRODUCT";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        // Add each product ID to the dropdown list if available
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                int productId = Convert.ToInt32(reader["product_id"]);
                                ddlProductId.Items.Add(new ListItem(productId.ToString()));
                            }
                        }
                        else
                        {
                            ddlProductId.Items.Add(new ListItem("No Product ID to Delete"));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception if there's an error loading product IDs
                Response.Write($"Error loading product IDs: {ex.Message}");
            }
        }
        protected void ddlProductId_SelectedIndexChanged(object sender, EventArgs e)
        {
            int productId;
            if (int.TryParse(ddlProductId.SelectedValue, out productId))
            {
                LoadProductDetails(productId);
            }
        }

        private void LoadProductDetails(int productId)
        {
            // Implement logic to load product details from the database based on the productId
            // Example: Fetch product details from the database and assign them to labels in the recordDetailsPanel
            // Replace the example code with your actual database retrieval logic
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";
            string query = "SELECT * FROM PRODUCT WHERE product_id = @ProductId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ProductId", productId);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read(); // Assuming only one record is fetched
                        lblProductID.Text = $"Product ID: {reader["product_id"]}";
                        lblProductName.Text = $"Product Name: {reader["prod_name"]}";
                        // Assign other details to respective labels
                        // Example: lblSupplier.Text = $"Supplier: {reader["supplier_name"]}";
                        recordDetailsPanel.Visible = true; // Show the record details panel
                    }
                    else
                    {
                        recordDetailsPanel.Visible = false; // Hide the panel if no record found
                        Response.Write("Product ID does not exist! Please select a valid Product ID.");
                    }
                }
            }
        }

        protected void DeleteRecordButton_Click(object sender, EventArgs e)
        {
            int productId;
            if (int.TryParse(ddlProductId.SelectedValue, out productId))
            {
                DeleteProductFromDatabase(productId);
            }
            else
            {
                Response.Write("Invalid Product ID! Please select a valid Product ID.");
            }
        }

        private bool ProductExists(int productId)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";
            string query = "SELECT COUNT(*) FROM PRODUCT WHERE product_id = @ProductId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ProductId", productId);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private void DeleteProductFromDatabase(int productId)
        {
            if (ProductExists(productId))
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";
                string query = "DELETE FROM PRODUCT WHERE product_id = @ProductId";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@ProductId", productId);
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Product with ID {productId} deleted successfully.'); window.location.href = window.location.href;", true);
            }
            else
            {
                Response.Write("Product ID does not exist! Please select a valid Product ID.");
            }
        }
    }
}