    <%@ Page Title="Add Records" Language="C#" MasterPageFile="~/SiteNav.Master" AutoEventWireup="true" CodeBehind="InsertPage.aspx.cs" Inherits="SariSari_InventorySystem.InsertPage" %>

<asp:Content ID="InsertPageContent" ContentPlaceHolderID="MainContent" runat="server">
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
        .form-group {
            margin-bottom: 40px;
        }
        .bold-label {
            font-weight: bold;
        }
        .panel-group .form-group label,
        .panel-group .form-group select,
        .panel-group .form-group input[type="text"],
        .panel-group .form-group input[type="date"],
        .panel-group .form-group input[type="number"] {
            margin-bottom: 15px;
        }
        .supplier-panel-group .form-group label,
        .supplier-panel-group .form-group input[type="text"]{
            margin-bottom: 15px;
        }

        .transfer-panel-group .form-group label,
        .transfer-panel-group .form-group input[type="text"], 
        .transfer-panel-group .form-group input[type="date"],
        .transfer-panel-group .form-group select {
            margin-bottom: 15px;
        }

    </style>
    <body>
        <div class="container">
            <!-- Add Record section -->
            <h2>Add Records</h2>
            <div class="form-group">
                <label for="tableName">Select Table:</label>
                <asp:DropDownList ID="tableName" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="TableName_SelectedIndexChanged">
                    <asp:ListItem Text="Select a Record" disabled Selected></asp:ListItem>
                    <asp:ListItem Value="Supplier">Supplier</asp:ListItem>
                    <asp:ListItem Value="Transfer">Transfer</asp:ListItem>
                    <asp:ListItem Value="Product">Product</asp:ListItem>
                </asp:DropDownList>
            </div> 

            <!-- Supplier Panel -->
            <div class="panel-group">
                <asp:Panel ID="supplierPanel" runat="server" Value="Supplier" Visible="false">
                    <div class="form-group">
                        <asp:Label ID="lblSupplier" runat="server" AssociatedControlID="txtSupplier" Text="Supplier ID:" CssClass="bold-label" />
                        <asp:TextBox ID="txtSupplier" type="text" runat="server" CssClass="form-control" placeholder="Ex. 01234" pattern="[0-9]{5}" maxlength="5" required/>

                        <asp:Label ID="lblSupplierName" runat="server" AssociatedControlID="txtSupplierName" Text="Supplier Name:" CssClass="bold-label" />
                        <asp:TextBox ID="txtSupplierName" runat="server" CssClass="form-control" placeholder="Enter Supplier Name" maxlength="255" required/>

                        <asp:Label ID="lblAddress" runat="server" AssociatedControlID="txtAddress" Text="Address:" CssClass="bold-label" />
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" maxlength="255" required/>

                        <asp:Label ID="lblContactNo" runat="server" AssociatedControlID="txtContactNo" Text="Contact No.:" CssClass="bold-label" />
                        <asp:TextBox ID="txtContactNo" type="text" runat="server" CssClass="form-control" placeholder="Enter Contact No." pattern="[0-9]{11}" maxlength="11" required />
                    </div>
                    <asp:Button ID="Button1" runat="server" CssClass="btn-primary" Text="Add Supplier" OnClick="SupplierAddButton_Click" />
                </asp:Panel>
            </div>

            <!-- Transfer Panel -->
            <div class="panel-group">
                <asp:Panel ID="transferPanel" runat="server" Value="Transfer" Visible="false">
                    <div class="form-group">
                        <asp:Label ID="lblDeliveryID" runat="server" AssociatedControlID="txtDeliveryID" Text="Delivery ID:" CssClass="bold-label" />
                        <asp:TextBox ID="txtDeliveryID" type="text" runat="server" CssClass="form-control" placeholder="Delivery ID" pattern="[0-9]{5}" maxlength="5" required/>

                        <asp:Label ID="lblDateSent" runat="server" AssociatedControlID="txtDateSent" Text="Date sent:" CssClass="bold-label" />
                        <asp:TextBox ID="txtDateSent" type="date" runat="server" CssClass="form-control" placeholder="Enter Sent Date" required/>

                        <asp:Label ID="lblDateReceived" runat="server" AssociatedControlID="txtDateReceived" Text="Date received:" CssClass="bold-label" />
                        <asp:TextBox ID="txtDateReceived" type="date" runat="server" CssClass="form-control" placeholder="Enter Received Date" required/>

                        <asp:Label ID="lvlTransportMode" runat="server" Text="Mode of Transportation:" CssClass="bold-label" />
                        <asp:DropDownList ID="TransportationMode" runat="server" CssClass="form-control" AutoPostBack="true">
                            <asp:ListItem Text="Select a transport mode" disabled Selected></asp:ListItem>
                            <asp:ListItem Value="Motorcycle">Motorcycle</asp:ListItem>
                            <asp:ListItem Value="Car">Car</asp:ListItem>
                            <asp:ListItem Value="Truck">Truck</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblSupplierIDTransfer" runat="server" AssociatedControlID="ddlSupplierIDTransfer" Text="Supplier ID:" CssClass="bold-label"/>
                        <asp:DropDownList ID="ddlSupplierIDTransfer" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <asp:Button ID="Button2" runat="server" CssClass="btn-primary" Text="Add Transfer Record" OnClick="TransferAddButton_Click" />
                </asp:Panel>
            </div>

            <!-- Product Panel -->
            <div class="panel-group">
                <asp:Panel ID="productPanel" runat="server" Value="Product" Visible="false">
                    <div class="form-group">
                        <asp:Label ID="lblProductID" runat="server" AssociatedControlID="txtProductID" Text="Product ID:" CssClass="bold-label" />
                        <asp:TextBox ID="txtProductID" type="text" runat="server" CssClass="form-control" placeholder="Enter Product ID" pattern="[0-9]{5}" maxlength="5" required />

                        <asp:Label ID="lblSupplierID" runat="server" AssociatedControlID="ddlSupplierID" Text="Supplier ID:" CssClass="bold-label" />
                        <asp:DropDownList ID="ddlSupplierID" runat="server" CssClass="form-control" required>
                        </asp:DropDownList>

                        <asp:Label ID="lblProductName" runat="server" AssociatedControlID="txtProductName" Text="Name of the Product:" CssClass="bold-label" />
                        <asp:TextBox ID="txtProductName" type="text" runat="server" CssClass="form-control" placeholder="Enter Product Name" required />

                        <asp:Label ID="lblPrice" runat="server" AssociatedControlID="txtProdPrice" Text="Price of the Product:" CssClass="bold-label" />
                        <asp:TextBox ID="txtProdPrice" type="number" runat="server" CssClass="form-control" placeholder="Enter the Price" min="1" max="50000" required />

                        <asp:Label ID="lblQuantity" runat="server" AssociatedControlID="txtQuantity" Text="Quantity:" CssClass="bold-label" />
                        <asp:TextBox ID="txtQuantity" type="number" runat="server" CssClass="form-control" placeholder="Enter Quantity" min="1" max="500" required />

                        <asp:Label ID="lblDescription" runat="server" AssociatedControlID="txtDescription" Text="Description:" CssClass="bold-label" />
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Description" maxlength="255" />

                        <asp:Label ID="lblCategoryName" runat="server" AssociatedControlID="ddlCategoryName" Text="Category Name:" CssClass="bold-label" />
                        <asp:DropDownList ID="ddlCategoryName" runat="server" CssClass="form-control" required>                           
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn-primary" Text="Add Product" OnClick="ProductAddButton_Click" />
                </asp:Panel>
            </div>
        </div>
        <!-- Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                // Load record form based on selected table
                $('#tableName').change(function () {
                    var tableName = $(this).val();
                    $.ajax({
                        url: 'RecordForms/' + tableName + 'Form.html',
                        method: 'GET',
                        success: function (response) {
                            $('#recordForm').html(response);
                        }
                    });
                });
            });
        </script>
    </body>
</asp:Content>