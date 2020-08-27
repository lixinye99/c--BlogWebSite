<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Views_Login_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../../Content/User/Login.css" rel="stylesheet" />
    <link href="../../../Content/User/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Scripts/User/jquery-3.4.1.min.js"></script>
    <script src="../../../Scripts/User/bootstrap.min.js"></script>
    <title>登录界面</title>
</head>
<body>
    <form id="app" runat="server">
        <div class="container-back">
            <div class="main-content">
                <div class="main-notes">
                    <div class="note">
                        <h1>SQL</h1>
                        <p>SQL结构化查询语言，1970年代起源于IBM，是对Edgar Codd关系模型的第一个商业化语言实现。它是最广泛使用的数据库语言，在不同的数据库系统中往往有不同的实现，用于管理关系数据库管理系统（RDBMS)，或在关系流数据管理系统（RDSMS）中进行流处理。</p>
                        <asp:Button ID="Bthumb" runat="server" Text="点赞" CssClass="btn btn-danger" style="margin-top: 1em;" OnClick="Bthumb_Click" />
                    </div>
                </div>
                <div class="main-login">
                    <div class="login-content">
                        <p style="text-align:center">登录</p>
                        <div class="input-group" style="margin-top:1.5em">
                            <span class="input-group-addon" id="basic-addon1">邮箱</span>
                            <asp:TextBox ID="TBEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="input-group" style="margin-top:1.5em">
                            <span class="input-group-addon" id="basic-addon2">密码</span>
                            <asp:TextBox ID="TBPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <asp:Button ID="BTNLogin" runat="server" Text="登录" style="width:22em;margin-top:1.5em" CssClass="btn btn-default" OnClick="BTNLogin_Click"/>
                        <asp:Button ID="BTNRegister" runat="server" Text="注册" style="width:22em;margin-top:1.5em" CssClass="btn btn-success" OnClick="BTNRegister_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
