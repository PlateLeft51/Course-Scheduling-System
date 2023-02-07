<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="实验室排课系统.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/login.css">
    <title>登录界面</title>
</head>

<body>
    <form id="login_form" runat="server">
    <div class="image">
    <img src="./Images/Login.jpg" alt="">
    </div>
    <div class="login">
        <div class="header">实验室排课系统</div>
        
        <div class="input">
            <div class="input-border">
                <asp:TextBox ID="username" runat="server" class="border" placeholder="用户名" Type="text" ></asp:TextBox>
            </div>
            <div class="input-border">
                <asp:TextBox ID="password" runat="server" class="border2" placeholder="密码" Type="password" ></asp:TextBox>
            </div>
        </div>
        
        <div class="action">
            <asp:Button runat="server" id="submit" text="登录" style="margin:auto;" onclick="submit_login"></asp:Button>
        </div>
    </div>
    </form>
</body>
</html>
