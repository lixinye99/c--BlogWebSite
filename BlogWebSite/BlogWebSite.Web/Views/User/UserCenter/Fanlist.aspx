<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fanlist.aspx.cs" Inherits="Views_User_UserCenter_Fanlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../../Content/User/Usercenter.css" rel="stylesheet" />
    <link href="../../../Content/User/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Scripts/User/jquery-3.4.1.min.js"></script>
    <script src="../../../Scripts/User/bootstrap.min.js"></script>
    <title></title>
</head>
<body>
    <form id="App" runat="server">
        <div class="container-back">
            <div class="view-container">
                <div class="left-box">
                    <div class="list-group">
                        <a class="list-group-item" href="Profile.aspx">个人资料</a>
                        <a class="list-group-item" href="Collectionlist.aspx">我的收藏</a>
                        <a class="list-group-item" href="Followlist.aspx">我关注的人</a>
                        <a class="list-group-item active" href="Fanlist.aspx">我的粉丝</a>
                        <a class="list-group-item" href="../../Manage/ArticleManage.aspx">我的博客</a>
                    </div>
                </div>
                <div class="main-box">
                    <div class="content-view">
                        <h3 class="htittle">我的粉丝</h3>
                        <HR style="FILTER:alpha(opacity=100,finishopacity=0,style=3)" width="80%"color=#987cb9 SIZE=3>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:netblog %>" ProviderName="<%$ ConnectionStrings:netblog.ProviderName %>" >
                        </asp:SqlDataSource>

                        <asp:ListView ID="ListView1" runat="server"  DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="followlist">
                                    <asp:Image CssClass="listitemimage"  runat="server" ImageUrl='<%# Eval("image") %>' />
                                    <span class="listitemname">
                                        <asp:LinkButton ID="itemname" runat="server" CommandArgument='<%#Eval("account_id")%>' onclick="Link_user" Text='<%# Eval("name") %>'></asp:LinkButton> 
                                    </span>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
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
