<%@ Page Title="Delete Records" Language="C#" MasterPageFile="~/SiteNav.Master" AutoEventWireup="true" CodeBehind="DeletePage.aspx.cs" Inherits="SariSari_InventorySystem.DeletePage" %>

<asp:Content ID="DeletePageContent" ContentPlaceHolderID="MainContent" runat="server">
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
        
        .delete-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .delete-form input[type="text"],
        .delete-form button[type="submit"] {
            margin-bottom: 10px;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        /* FOR RECORD DETAILS */
        .record-details {
            width: 20rem; 
            margin: 20px auto; /* Center horizontally with top margin */
            text-align: center;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .record-details-content {
            max-width: 600px;
            margin: 0 auto;
        }

        .record-details-row {
            margin-bottom: 10px;
        }

        .bold-label {
            font-weight: bold;
        }

        .record-value {
            margin-left: 10px;
        }
    </style>
    <body>
        <div class="container">
            <!-- Delete record section -->
            <div class="delete-form">
                <h2>Delete Records</h2>
                <div class="form-group">
                    <label for="ddlProductId">Select Product ID to delete:</label>
                    <asp:DropDownList ID="ddlProductId" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlProductId_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete Record" OnClick="DeleteRecordButton_Click"/>
            </div>
        </div>

        <!-- Record Details Panel -->
        <asp:Panel ID="recordDetailsPanel" runat="server" Visible="false" CssClass="record-details">
            <!-- Design your record details here -->
            <!-- Example: -->
            <div class="record-details-content">
                <div class="record-details-row">
                    <asp:Label ID="lblProductID" runat="server" Text="Product ID:" CssClass="bold-label" />
                    <asp:Label ID="lblProductIDValue" runat="server" CssClass="record-value" />
                </div>
                <div class="record-details-row">
                    <asp:Label ID="lblProductName" runat="server" Text="Product Name:" CssClass="bold-label" />
                    <asp:Label ID="lblProductNameValue" runat="server" CssClass="record-value" />
                </div>
                <!-- Add more labels as needed -->
            </div>
        </asp:Panel>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</asp:Content>

