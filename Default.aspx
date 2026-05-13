<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SariSari_InventorySystem.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Login </title>
    <style>
         @import url(https://fonts.googleapis.com/css?family=Poppins:300);

          body{
              height: 100vh;
              overflow: hidden;
              font-family: "Poppins";
            background: #0e2941;
          }
          .login-page {
            width: 400px;
            padding: 8% 0 0;
            margin: auto;
          }
          .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 400px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
          }
          .form .input {
            font-family: "Poppins", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            border-radius: 7px;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
    
          }
          .form .btn {
            font-family: "Poppins", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #234666;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            border-radius: 7px;
            font-size: 14px;
            -webkit-transition: all 0.3s ease;
            transition: all 0.3s ease;
            cursor: pointer;
          }
          .form .btn:hover,.form .btn:active,.form .btn:focus {
            background: #0e2941;
          }
          .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
          }
          .form .message a {
            color: #234666;
            text-decoration: none;
          }
          .form .register-form {
            display: none;
          }
    </style>
</head>
<body>
    <div class="login-page">
        <div class="form">
            <form class="login-form" method="post" runat="server">
                <h2><i class="fas fa-lock"></i> Login</h2>
                <asp:TextBox ID="username" runat="server" TextMode="SingleLine" placeholder="Username" CssClass="input" required></asp:TextBox>
                <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Password" CssClass="input" required></asp:TextBox>
                <asp:Button ID="loginButton" runat="server" Text="Login" CssClass="btn" OnClick="LoginButton_Click" />
            </form>
        </div>
    </div>
</body>
</html>
