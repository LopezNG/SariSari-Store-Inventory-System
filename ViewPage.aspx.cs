using System;
using System.Data.SqlClient;

namespace SariSari_InventorySystem
{
    public partial class ViewPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindInventory("ProductID"); // Default sort by ProductID
                BindTransfers("DeliveryID"); // Default sort by Delivery ID
            }
        }

        protected void ddlSortByInventory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sortBy = ddlSortByInventory.SelectedValue;
            BindInventory(sortBy);
        }

        protected void ddlSortByTransfer_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sortBy = ddlSortByTransfer.SelectedValue;
            BindTransfers(sortBy);
        }

        // Bind inventory method
        private void BindInventory(string sortBy)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";
            string query = @"SELECT p.product_id, p.prod_name, p.prod_price, p.prod_quantity, p.description, c.category_name, s.supp_name 
                     FROM PRODUCT p
                     LEFT JOIN CATEGORY c ON p.category_name = c.category_name
                     LEFT JOIN SUPPLIER s ON p.supplier_id = s.supplier_id
                     ORDER BY ";

            switch (sortBy)
            {
                case "ProductID":
                    query += "p.product_id";
                    break;
                case "ProductName":
                    query += "p.prod_name";
                    break;
                case "Category":
                    query += "c.category_name";
                    break;
                case "SupplierName":
                    query += "s.supp_name";
                    break;
                case "PriceLowToHigh":
                    query += "p.prod_price ASC";
                    break;
                case "PriceHighToLow":
                    query += "p.prod_price DESC";
                    break;
                case "QuantityLowToHigh":
                    query += "p.prod_quantity ASC";
                    break;
                case "QuantityHighToLow":
                    query += "p.prod_quantity DESC";
                    break;
                default:
                    query += "p.product_id"; // Default sort by ProductID
                    break;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        InventoryRepeater.DataSource = reader;
                        InventoryRepeater.DataBind();
                    }
                }
            }
        }

        // Bind transfer method
        private void BindTransfers(string sortBy)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Sari_SariDatabase.mdf;Integrated Security=True";
            string query = @"SELECT t.delivery_id, s.supp_name, t.sent_date, t.receive_date, t.transportation_mode 
                     FROM TRANSFER t
                     LEFT JOIN SUPPLIER s ON t.supplier_id = s.supplier_id
                     ORDER BY ";

            switch (sortBy)
            {
                case "DeliveryID":
                    query += "t.delivery_id";
                    break;
                case "SentDateEarliest":
                    query += "t.sent_date ASC";
                    break;
                case "ReceiveDateEarliest":
                    query += "t.receive_date ASC";
                    break;
                case "TransportationMode":
                    query += "t.transportation_mode";
                    break;
                default:
                    query += "t.delivery_id"; // Default sort by DeliveryID
                    break;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        TransferRepeater.DataSource = reader;
                        TransferRepeater.DataBind();
                    }
                }
            }
        }
    }
}
