<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Views_User_UserCenter_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../../Content/User/Usercenter.css" rel="stylesheet" />
    <link href="../../../Content/User/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Scripts/User/jquery-3.4.1.min.js"></script>
    <script src="../../../Scripts/User/bootstrap.min.js"></script>
    <title>个人中心</title>
</head>
<body>
    <form id="App" runat="server">
        <div class="container-back">
            <div class="view-container">
                <div class="left-box">
                    <div class="list-group">
                        <a class="list-group-item active" href="Profile.aspx">个人资料</a>
                        <a class="list-group-item" href="Collectionlist.aspx">我的收藏</a>
                        <a class="list-group-item" href="Followlist.aspx">我关注的人</a>
                        <a class="list-group-item" href="Fanlist.aspx">我的粉丝</a>
                        <a class="list-group-item" href="../../Manage/ArticleManage.aspx">我的博客</a>
                    </div>
                </div>
                <div class="main-box">
                    <div class="content-view">
                        <h3 class="htittle">个人资料</h3>
                        <div class="user_info">
                            <div class="User_head">
                                <asp:Image ID="Imageico" runat="server" CssClass="head_image" ImageUrl="../../../Images/User/usricon.gif"/>
                            </div>
                            <div class="info_content">
                                <div class="id_card">
                                    <span class="email">
                                        <asp:Label ID="LEmail" runat="server" Text="邮箱"></asp:Label>
                                    </span>
                                </div>`
                                <div class="csdn_info">
                                    <asp:Label ID="LInfo" runat="server" Text="关注 10 粉丝 0"></asp:Label>
                                </div>
                                <HR style="FILTER:alpha(opacity=100,finishopacity=0,style=3)" width="80%"color=#987cb9 SIZE=3>
                                <div class="nick">
                                    <span style="float:left">
                                        <asp:Label ID="LName" runat="server" Text="昵称:"></asp:Label>
                                    </span>
                                    <span style="float:right">
                                        <a href="InfoModification.aspx">修改资料</a>
                                    </span>
                                </div>
                                <ul class="self">
                                    <li class="comon">
                                        <asp:Label ID="LGender" runat="server" Text="性别:"></asp:Label>
                                    </li>
                                    <li class="comon">
                                        <asp:Label ID="LBirthday" runat="server" Text="生日:"></asp:Label>
                                    </li>
                                    <li class="comon">
                                        <asp:Label ID="LIntroduction" runat="server" Text="个人简介:"></asp:Label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="container-footer">
                <p>CopyRight@copy2020 </p>
            </footer>
        </div>
    </form>
</body>
</html>
