using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SariSari_InventorySystem
{
    public partial class UpdatePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories(); // Load categories into dropdown list
            }
        }

        // Method to load categories into the dropdown list
        private void LoadCategories()
        {
            ddlCategory.Items.Clear(); // Clear existing items
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";
            string query = "SELECT DISTINCT category_name FROM CATEGORY";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        // Add each category to the dropdown list if available
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                string category = reader["category_name"].ToString();
                                ddlCategory.Items.Add(new ListItem(category));
                            }
                        }
                        else
                        {
                            ddlCategory.Items.Add(new ListItem("No Category to Update"));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception if there's an error loading categories
                Response.Write($"Error loading categories: {ex.Message}");
            }
        }

        // Dropdown list selected index changed event handler
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCategory = ddlCategory.SelectedValue;
            txtUpdatedCategory.Text = selectedCategory; // Set the updated category text box with the selected category
        }

        // Button click event to update category
        protected void btnUpdateCategory_Click(object sender, EventArgs e)
        {
            string oldCategory = ddlCategory.SelectedValue;
            string newCategory = txtUpdatedCategory.Text;

            // Check if a category is selected to update
            if (oldCategory == "No Category to Update")
            {
                Response.Write("Please select a category to update.");
                return;
            }

            // Check if updated category name is empty
            if (string.IsNullOrWhiteSpace(newCategory))
            {
                Response.Write("Please enter a new category name.");
                return;
            }

            // Check if the new category already exists
            if (IsCategoryExists(newCategory))
            {
                Response.Write("Category already exists. Please try again.");
                return;
            }

            try
            {
                // Update category in the CATEGORY table
                UpdateCategoryInDatabase(oldCategory, newCategory);

                // Update category in the PRODUCT table
                UpdateProductCategoryInDatabase(oldCategory, newCategory);


                // Refresh the dropdown list
                LoadCategories();

                // Display success message with alert
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Category {oldCategory} updated to {newCategory} successfully.'); window.location.href = window.location.href;", true);
            }
            catch (Exception ex)
            {
                // Handle exception if there's an error updating category
                Response.Write($"Error updating category: {ex.Message}");
            }
        }

        // Method to check if the category already exists
        private bool IsCategoryExists(string category)
        {
            // Connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";

            // SQL query to check if the category exists in the CATEGORY table
            string query = "SELECT COUNT(*) FROM CATEGORY WHERE category_name = @Category";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the query to prevent SQL injection
                    command.Parameters.AddWithValue("@Category", category);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        // Button click event to add new category
        protected void btnAddNewCategory_Click(object sender, EventArgs e)
        {
            string newCategory = txtNewCategory.Text;

            // Check if new category name is empty
            if (string.IsNullOrWhiteSpace(newCategory))
            {
                Response.Write("Please enter a new category name.");
                return;
            }

            try
            {
                // Insert new category into the CATEGORY table
                InsertNewCategoryIntoDatabase(newCategory);

                // Refresh the dropdown list
                LoadCategories();

                // Display success message with alert
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('New Category {newCategory} added successfully.'); window.location.href = window.location.href;", true);
            }
            catch (Exception ex)
            {
                // Handle exception if there's an error adding new category
                Response.Write($"Error adding new category: Category already exists. Please try again.");
            }
        }

        // Method to update category in the CATEGORY table
        private void UpdateCategoryInDatabase(string oldCategory, string newCategory)
        {
            // Connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";

            // SQL query to update category in the CATEGORY table
            string query = "UPDATE CATEGORY SET category_name = @NewCategory WHERE category_name = @OldCategory";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the query to prevent SQL injection
                    command.Parameters.AddWithValue("@NewCategory", newCategory);
                    command.Parameters.AddWithValue("@OldCategory", oldCategory);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        // Method to update category in the PRODUCT table
        private void UpdateProductCategoryInDatabase(string oldCategory, string newCategory)
        {
            // Connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";

            // SQL query to update category in the PRODUCT table
            string query = "UPDATE PRODUCT SET category_name = @NewCategory WHERE category_name = @OldCategory";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the query to prevent SQL injection
                    command.Parameters.AddWithValue("@NewCategory", newCategory);
                    command.Parameters.AddWithValue("@OldCategory", oldCategory);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        // Method to insert new category into the CATEGORY table
        private void InsertNewCategoryIntoDatabase(string newCategory)
        {
            // Connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";

            // SQL query to insert new category into the CATEGORY table
            string query = "INSERT INTO CATEGORY (category_name) VALUES (@NewCategory)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the query to prevent SQL injection
                    command.Parameters.AddWithValue("@NewCategory", newCategory);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}