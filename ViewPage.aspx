<%@ Page Title="View Inventory" Language="C#" MasterPageFile="~/SiteNav.Master" AutoEventWireup="true" CodeBehind="ViewPage.aspx.cs" Inherits="SariSari_InventorySystem.ViewPage" %>

<asp:Content ID="ViewPageContent" ContentPlaceHolderID="MainContent" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <style>
        /* Custom styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
        }
        
        .inventory {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
    <body>
        <div class="container">
            <!-- Sorting dropdown for Inventory -->
            <div>
                <label for="ddlSortByInventory">Sort By Inventory:</label>
                <asp:DropDownList ID="ddlSortByInventory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSortByInventory_SelectedIndexChanged">
                    <asp:ListItem Text="Sort by ProductID" Value="ProductID"></asp:ListItem>
                    <asp:ListItem Text="Sort by Product Name" Value="ProductName"></asp:ListItem>
                    <asp:ListItem Text="Sort by Category" Value="Category"></asp:ListItem>
                    <asp:ListItem Text="Sort by Supplier Name" Value="SupplierName"></asp:ListItem>
                    <asp:ListItem Text="Sort by Price Lowest to Highest" Value="PriceLowToHigh"></asp:ListItem>
                    <asp:ListItem Text="Sort by Price Highest to Lowest" Value="PriceHighToLow"></asp:ListItem>
                    <asp:ListItem Text="Sort by Quantity Lowest to Highest" Value="QuantityLowToHigh"></asp:ListItem>
                    <asp:ListItem Text="Sort by Quantity Highest to Lowest" Value="QuantityHighToLow"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Inventory section -->
            <div class="inventory">
                <h2>Inventory Details</h2>
                <div class="table-responsive">
                    <asp:Repeater ID="InventoryRepeater" runat="server">
                        <HeaderTemplate>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Category</th>
                                        <th>Supplier Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("product_id") %></td>
                                <td><%# Eval("prod_name") %></td>
                                <td><%# Eval("category_name") %></td>
                                <td><%# Eval("supp_name") %></td>
                                <td>Php <%# Eval("prod_price") %></td>
                                <td><%# Eval("prod_quantity") %></td>
                                <td><%# Eval("description") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <!-- Sorting dropdown for Transfer -->
            <div>
                <label for="ddlSortByTransfer">Sort By Transfer:</label>
                <asp:DropDownList ID="ddlSortByTransfer" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSortByTransfer_SelectedIndexChanged">
                    <asp:ListItem Text="Sort by Delivery ID" Value="DeliveryID"></asp:ListItem>
                    <asp:ListItem Text="Sort by Sent Date (Earliest First)" Value="SentDateEarliest"></asp:ListItem>
                    <asp:ListItem Text="Sort by Receive Date (Earliest First)" Value="ReceiveDateEarliest"></asp:ListItem>
                    <asp:ListItem Text="Sort by Transportation Mode" Value="TransportationMode"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Transfer section -->
            <div class="inventory">
                <h2>Transfer Details</h2>
                <div class="table-responsive">
                    <asp:Repeater ID="TransferRepeater" runat="server">
                        <HeaderTemplate>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Delivery ID</th>
                                        <th>Supplier Name</th>
                                        <th>Sent Date</th>
                                        <th>Receive Date</th>
                                        <th>Transportation Mode</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("delivery_id") %></td>
                                <td><%# Eval("supp_name") %></td>
                                <td><%# Eval("sent_date") %></td>
                                <td><%# Eval("receive_date") %></td>
                                <td><%# Eval("transportation_mode") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</asp:Content>
