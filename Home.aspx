<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/SiteNav.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SariSari_InventorySystem.Home" %>

<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet"/>
    <style>
        body {
            font-family: "Lato", sans-serif
        }

        a {
          color: #1e1e1e;
          transition: all 0.5s ease-in-out;
        }

        a:hover {
          color: #0078ff;
          text-decoration: none;
          transition: all 0.5s ease-in-out;
        }

        /*------/ Ico Circle /------*/
        .ico-circle {
          height: 100px;
          width: 100px;
          font-size: 2rem;
          border-radius: 50%;
          line-height: 1.55;
          margin: 0 auto;
          text-align: center;
          box-shadow: 0 0 0 2px #2e5984;
          display: block;
        }


        /*======================================
        //--//-->   FUNCTIONS
        ======================================*/

        .service-box {
          background-color: #fff;
          padding: 0.5rem 1.3rem;
          border-radius: 1rem;
          margin-bottom: 2rem;
        }

        .service-box:hover .ico-circle {
          transition: all 500ms ease;
          color: #fff;
          background-color: #2e5984;
          box-shadow: 0 0 0 2px #cde1f8;
        }

        .service-box .service-ico {
          margin-bottom: 1rem;
          color: #1e1e1e;
        }

        .service-box .ico-circle {
          transition: all 500ms ease;
          font-size: 4rem;
        }

        .service-box .s-title {
          font-size: 1.2rem;
          text-transform: uppercase;
          text-align: center;
          padding: .4rem 0;
        }

        .service-box .s-description {
          color: #4e4e4e;
        }

    </style>
    <body>    
        <!-- Page content -->
        <div class="w3-content" style="max-width:2000px;margin-top:0px">
            <!-- The Sari-Sari Store About Section -->
            <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="band">
                <h2 class="w3-wide">Ellana's Store</h2>
                <p class="w3-opacity"><i>Established since 2021</i></p>
                <p class="w3-justify">Welcome to Ellana's Sari-Sari Store. The Ellana's Store Inventory System Database is a meticulously crafted 
                    digital infrastructure tailored to streamline the management of products and resources within the esteemed Ellana's Store. 
                    Established amidst the challenges of the pandemic in 2021, Ellana's Store has emerged as a store that aims to serve its customers
                    in Sta. Rosa Laguna, Philippines. This database serves as the backbone of the store's operations, efficiently tracking inventory 
                    levels, sales data, and supplier information with precision. By harnessing cutting-edge technology, Ellana's Store ensures optimal 
                    stock levels, and facilitates seamless operations, all while embodying a commitment to quality and service excellence.</p>
                <div class="w3-row w3-padding-32">
                    <div class="w3-third">
                        <p>Total Inventory Value:</p>
                        <asp:Label ID="lblInventoryValue" runat="server"> </asp:Label>
                    </div>
                        <div class="w3-third">
                        <p>Total Inventory Items:</p>
                        <asp:Label ID="lblInventoryItems" runat="server"></asp:Label>
                    </div>
                        <div class="w3-third">
                        <p>Total Categories:</p>
                        <asp:Label ID="lblCategories" runat="server"></asp:Label>
                    </div>
                </div>
                <br /> <br />
                <!--/ Section Function Star /-->
                <asp:Panel ID="servicePanel" runat="server" CssClass="services-mf route">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="title-box text-center">
                                    <h2 class="title-a">
                                        Function
                                    </h2>
                                    <div class="line-mf"></div>
                                </div>
                            </div>
                        </div>
                        <br /> 
                        <!-- Row 1 -->
                        <div class="row">
                            <div class="col-md-4">
                                <asp:HyperLink ID="viewLink" runat="server" NavigateUrl="ViewPage.aspx" CssClass="service-box">
                                    <div href="#" class="service-box">
                                        <div class="service-ico">
                                            <span class="ico-circle"><i class="icon ion-md-briefcase"></i></span>
                                        </div>
                                        <div class="service-content">
                                            <h2 class="s-title">View Inventory</h2>
                                        </div>
                                    </div>
                                </asp:HyperLink>
                            </div>
                            <div class="col-md-4">
                                <asp:HyperLink ID="insertLink" runat="server" NavigateUrl="InsertPage.aspx" CssClass="service-box">
                                    <div class="service-box">
                                        <div class="service-ico">
                                            <span class="ico-circle"><i class="icon ion-md-create"></i></span>
                                        </div>
                                        <div class="service-content">
                                            <h2 class="s-title">Add Records</h2>
                                        </div>
                                    </div>
                                </asp:HyperLink>
                            </div>
                            <div class="col-md-4">
                                <asp:HyperLink ID="updateLink" runat="server" NavigateUrl="UpdatePage.aspx" CssClass="service-box">
                                    <div class="service-box">
                                        <div class="service-ico">
                                            <span class="ico-circle"><i class="icon ion-md-albums"></i></span>
                                        </div>
                                        <div class="service-content">
                                            <h2 class="s-title">Update Category</h2>
                                        </div>
                                    </div>
                                </asp:HyperLink>
                            </div>
                        </div>
                        <!-- Row 2 -->
                        <div class="row">
                            <div class="col-md-4 offset-md-4">
                                <asp:HyperLink ID="deleteLink" runat="server" NavigateUrl="DeletePage.aspx" CssClass="service-box">
                                    <div class="service-box">
                                        <div class="service-ico">
                                            <span class="ico-circle"><i class="icon ion-md-remove-circle"></i></span>
                                        </div>
                                        <div class="service-content">
                                            <h2 class="s-title">Delete Records</h2>
                                        </div>
                                    </div>
                                </asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </body>
</asp:Content>