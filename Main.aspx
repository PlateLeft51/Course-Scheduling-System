<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="实验室排课系统.Main" %>

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
                <input type="text" class="border" runat="server" name="username" id="username" placeholder="用户名">
                <>
            </div>
            <div class="input-border">
                <input type="password" class="border2" runat="server" name="password" id="password" placeholder="密码">
            </div>
        </div>
        
        <div class="action">
            <asp:Button runat="server" id="submit" text="登录" style="margin:auto;" onclick="submit_login"></asp:Button>
        </div>
        
    </div>
    </form>
</body>

</html>
