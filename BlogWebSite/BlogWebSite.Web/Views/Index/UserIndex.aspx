<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserIndex.aspx.cs" Inherits="Views_Index_UserIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" href="../../Common/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="../../Content/Index/index.css" />
    <link href="../../Content/Index/UserIndex.css" rel="stylesheet" type="text/css"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <!-- 头部 -->
        <header>
            <!--首页按钮-->
            <a href="Index.aspx"></a>
            <!-- 搜索框 -->
            <div>
                <div class="navbar-form header_form">
                    <div class="form-group">
                        <asp:TextBox ID="tb_search" runat="server" class="form-control" placeholder="请输入关键词"></asp:TextBox>
                    </div>
                    <asp:Button ID="btn_search" runat="server" class="btn btn-danger" Text="搜索" OnClick="btn_search_Click" />
                </div>
            </div>
            <!-- 个人中心按钮 -->
            <div class="header_btngroup">
                <asp:Button ID="btn_write" runat="server" class="btn btn-danger" Text="开始创作" OnClick="btn_write_Click"/>
                <asp:Button id="btn_user" runat="server" Text="个人中心" class="btn btn-default dropdown logined" type="button"  data-toggle="dropdown" />
                <ul class="dropdown-menu" role="menu" aria-labelledby="btn_user">
                    <li><a role="menuitem" href="../User/UserCenter/Profile.aspx">我的主页</a></li>
                    <li><a role="menuitem" href="../User/UserCenter/Collectionlist.aspx">我的收藏</a></li>
                    <li><a role="menuitem" href="../User/UserCenter/Fanlist.aspx">我的粉丝</a></li>
                    <li><a role="menuitem" href="../User/UserCenter/Followlist.aspx">我的关注</a></li>
                    <li class="divider"></li>
                    <li><a role="menuitem" href="../Manage/ArticleManager.aspx">博客管理</a></li>
                    <li><a role="menuitem" href="../Manage/CommentManager.aspx">评论管理</a></li>
                    <li class="divider"></li>
                    <li><a role="menuitem" href="about.html">关于我们</a></li>
                    <li><a role="menuitem" href="https://gitee.com/heureux-1">联系我们</a></li>
                    <li class="divider"></li>
                    <li><asp:Button runat="server" ID="btn_leave" src="Index.aspx" role="menuitem" style="width:100%;height:100%;display:inline-block;border: none;background-color: transparent;outline: none;text-align:left;margin-left:14px;" Text="退出登录" onClick="btn_leave_Click"/></li>
                </ul>
                <asp:Button id="btn_login" runat="server" class="btn btn-info unlogin"  Text="立即登录" onClick="btn_login_Click"/>
            </div>
        </header>
        <div class="container">
            <div class="row">
                <aside class="col-md-3">
                    <div class="aside_user">
                        <img src="<%=user.image %>"/>
                        <span>用户：<%=user.name %></span>                       
                        <span>性别：<%=user.gender %></span>
                    </div>
                </aside>
                <section class="col-md-9">
                    <article>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:netblog %>" 
                        ProviderName="<%$ ConnectionStrings:netblog.ProviderName %>" SelectCommand="SELECT * FROM users INNER JOIN article ON users.account_id=article.account_id "></asp:SqlDataSource>
                    
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="title" DataSourceID="SqlDataSource1">                     
                            <ItemTemplate>
                                <div style="padding:10px 20px 10px 20px;" id="div_article" onclick='Response.Redirect("../article/article.aspx?id='<%# Eval("article_id") %>")'>
                                    <asp:LinkButton ID="article_title" runat="server" CommandArgument='<%#Eval("article_id")%>' onclick="titleClick" Text='<%# Eval("title") %>'  style="font-size: 25px;" ></asp:LinkButton>     
                                <br />
                                    <span style="font-size: 15px;" >简介：</span>
                                <asp:Label ID="article_content" runat="server" Text='<%# Eval("introduction") %>'  style="font-size: 15px;"/>
                                <br />   <span style="font-size: 15px;color:gray;" >用户:</span>
                                    <asp:LinkButton id="article_user" runat="server" CommandArgument='<%#Eval("account_id")%>'  onclick="userClick" Text='<%# Eval("name") %>'></asp:LinkButton>
                                    <span style="font-size: 15px;color:gray;" >收藏数:</span>
                                <asp:Label ID="article_collections" runat="server" Text=' <%# Eval("favorites") %>'  style="font-size: 15px;color:gray;"/>
                                <span style="font-size: 15px;color:gray;" >点赞数:</span>
                                <asp:Label ID="Label1" runat="server" Text=' <%# Eval("likes") %>'  style="font-size: 15px;color:gray;"/>
                                 <span style="font-size: 15px;color:gray;" >文章类型:</span>
                                <asp:Label ID="article_likes" runat="server" Text='<%# Eval("category") %>' style="font-size: 15px;color:gray;"/>
                                <span style="font-size: 15px;color:gray;" >文章标签:</span>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("tag") %>' style="font-size: 15px;color:gray;"/>
                                <br />
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div id="itemPlaceholderContainer" runat="server" style="">
                                    <span runat="server" id="itemPlaceholder" />
                                </div>
                                <div id="section_field" style=" text-align:center;padding-top:5px;" >
                                    <asp:DataPager ID="DataPager1" runat="server" style="text-align:center;">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"/>
                                            <asp:NumericPagerField CurrentPageLabelCssClass="current" />
                                            <asp:NextPreviousPagerField ButtonType="Button"  ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                        </article>
                </section>
            </div>
        </div>
           
        <!--  footer -->
        <footer>
             <p>CopyRight@copy2020 </p>
        </footer>
    </form>

    
    <script src="../../Common/jquery-3.4.1.min.js"></script>
    <script src="../../Common/bootstrap.min.js"></script>
     <script>
        $(document).ready(function () {
            $("section #section_field input").addClass("btn");
            $("section #section_field input").addClass("btn-default");
        });
     </script>
</body>
</html>
