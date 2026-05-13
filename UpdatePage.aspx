<%@ Page Title="Update Categories" Language="C#" MasterPageFile="~/SiteNav.Master" AutoEventWireup="true" CodeBehind="UpdatePage.aspx.cs" Inherits="SariSari_InventorySystem.UpdatePage" %>

<asp:Content ID="UpdatePageContent" ContentPlaceHolderID="MainContent" runat="server">
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
        
        .category-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }

        input[type="text"] {
            margin-bottom: 10px;
        }

        .category-form .form-control {
            margin-bottom: 15px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
    <body>
        <div class="container">
            <!-- Update category section -->
            <div class="category-form">
                <h2>Update Categories</h2>
                <!-- Update category form -->
                <div>
                    <label for="category">Category:</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                    </asp:DropDownList>
                    <label for="updatecategory">Updated Category Name:</label>
                    <asp:TextBox ID="txtUpdatedCategory" runat="server" CssClass="form-control" placeholder="Enter updated category name"></asp:TextBox>
                    <asp:Button ID="btnUpdateCategory" runat="server" Text="Update Category" CssClass="btn btn-primary" OnClick="btnUpdateCategory_Click" />
                    <asp:Label ID="lblUpdateCategoryError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                </div>
                <!-- Add new category form -->
                <hr />
                <h2>Add New Category</h2>
                <div>
                    <label for="newCategory">New Category:</label>
                    <asp:TextBox ID="txtNewCategory" runat="server" CssClass="form-control" placeholder="Enter new category name"></asp:TextBox>
                    <asp:Button ID="btnAddNewCategory" runat="server" Text="Add New Category" CssClass="btn btn-primary" OnClick="btnAddNewCategory_Click" />
                    <asp:Label ID="lblAddNewCategoryError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</asp:Content>
