<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Views_Register_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../../Content/User/Register.css" rel="stylesheet" />
    <link href="../../../Content/User/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Scripts/User/jquery-3.4.1.min.js"></script>
    <script src="../../../Scripts/User/bootstrap.min.js"></script>
    <title>注册界面</title>
</head>
<body>
    <form id="app" runat="server">
        <div class="container-back">
            <div class="main-content">
                <div class="main-notes">
                    <div class="note">
                        <h1>SQL</h1>
                        <p>SQL结构化查询语言，1970年代起源于IBM，是对Edgar Codd关系模型的第一个商业化语言实现。它是最广泛使用的数据库语言，在不同的数据库系统中往往有不同的实现，用于管理关系数据库管理系统（RDBMS)，或在关系流数据管理系统（RDSMS）中进行流处理。</p>
                        <asp:Button ID="Bthumb" runat="server" Text="点赞" CssClass="btn btn-danger" style="margin-top: 1em;" />
                    </div>
                </div>
                <div class="main-login">
                    <div class="login-content">
                        <p style="text-align:center">注册</p>
                        <div class="input-group" style="margin-top:1.2em">
                            <span class="input-group-addon" id="basic-addon1">邮箱</span>
                            <asp:TextBox ID="TBEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ControlToValidate="TBEmail" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        <div class="input-group" style="margin-top:1.2em">
                            <span class="input-group-addon" id="basic-addon2">密码</span>
                            <asp:TextBox ID="TBPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ControlToValidate="TBPassword" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        <div class="input-group" style="margin-top:1.2em">
                            <span class="input-group-addon" id="basic-addon3">再次输入密码</span>
                            <asp:TextBox ID="TBRPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                         <asp:CompareValidator ID="CVRePassword" runat="server" ControlToCompare="TBPassword" ControlToValidate="TBRPassword" 
                            ErrorMessage="密码与确认密码不一致" SetFocusOnError="True"></asp:CompareValidator>
                        <asp:Button ID="BTNLogin" runat="server" Text="注册" style="width:22em;margin-top:2em" CssClass="btn btn-default" OnClick="BTNLogin_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
