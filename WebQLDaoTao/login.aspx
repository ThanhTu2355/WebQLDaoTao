<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebQLDaoTao.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Login</h2>
                <div class="form-group">
                    <label for="email">User Name:</label>
                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="btnSubmit" CssClass="btn btn-default" OnClick="btnSubmit_Click" runat="server" Text="Login" />
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
