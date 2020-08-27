<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InfoModification.aspx.cs" Inherits="Views_User_UserCenter_InfoModification" %>

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
                                        <asp:Label ID="LEmail" runat="server" Text="邮箱:"></asp:Label>
                                    </span>
                                </div>`
                                <div class="csdn_info">
                                    <asp:Label ID="LInfo" runat="server" Text="关注 10 粉丝 0"></asp:Label>
                                </div>
                                <HR style="FILTER:alpha(opacity=100,finishopacity=0,style=3)" width="80%"color=#987cb9 SIZE=3>
                                <div class="cont">
                                    <p class="nick">
                                        <span class="nc">昵称:</span>
                                        <asp:TextBox ID="TBName" runat="server" CssClass="el_input"></asp:TextBox>
                                    </p>
                                    <p class="nick">
                                        <span class="nc">图片:</span>
                                        <asp:TextBox ID="TImage" runat="server" CssClass="el_input"></asp:TextBox>
                                        <span class="nc">请输入图片url</span>
                                    </p>
                                    <p class="nick">
                                        <span class="nc">性别:</span>
                                        <asp:RadioButtonList ID="Radiogender" runat="server" CssClass="el_radio">
                                            <asp:ListItem Value="男" Selected></asp:ListItem>
                                            <asp:ListItem Value="女"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </p>
                                    <p class="nick">
                                        <span class="nc">生日:</span>
                                        <asp:TextBox ID="Tbrith" runat="server" CssClass="el_input" TextMode="DateTime"></asp:TextBox>
                                        <span class="nc">格式1999-09-09</span>
                                    </p>
                                    <div class="word_introduce">
                                        <span class="nc">个人简介:</span>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="el_textarea" MultiLine="true"></asp:TextBox>
                                    </div>
                                    <div class="btn_group">
                                        <asp:Button ID="cancal"  runat="server" CssClass="Bcancal" Text="取消" OnClick="cancal_Click" />
                                        <asp:Button ID="confirm"  runat="server" CssClass="Bsave" Text="确定" OnClick="confirm_Click" />
                                    </div>
                                </div>
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
