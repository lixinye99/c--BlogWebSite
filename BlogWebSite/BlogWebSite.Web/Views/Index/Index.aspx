<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Views_Default" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>BlogWebSite</title>
    <link type="text/css" rel="stylesheet" href="../../Common/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="../../Content/Index/index.css" />
    <link rel="shortcut icon" href="../../Images/Index/index_blog2.png" />
</head>
<body>
    <form runat="server">
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
                    <li><a role="menuitem" href="../Manage/ArticleManage.aspx">博客管理</a></li>
                    <li><a role="menuitem" href="../Manage/CommentManage.aspx">评论管理</a></li>
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
                <!-- 主体 侧栏，文章，侧栏-->
                <aside class="col-md-2">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active"><a href="./Index.aspx?sort=前端"><span class="glyphicon glyphicon-th"></span>前端</a></li>
                        <li><a href="./Index.aspx?sort=html">html</a></li>
                        <li class="divider"></li>
                        <li><a href="./Index.aspx?sort=html5">html5</a></li>
                        <li><a href="./Index.aspx?sort=css3">css3</a></li>
                        <li><a href="./Index.aspx?sort=js">javascript</a></li>
                        <li><a href="./Index.aspx?sort=jQuery">jQuery</a></li>
                        <li><a href="./Index.aspx?sort=bootstrap">bootstrap</a></li>
                        <li><a href="./Index.aspx?sort=vue">vue</a></li>
                    </ul>
                    <ul class="nav nav-pills nav-stacked ">
                        <li class="active "><a href="./Index.aspx?sort=后端"><span class="		glyphicon glyphicon-th-large"></span>后端</a></li>
                        <!-- 这里的active属性就是使得所在的li的背景色变为蓝色-->
                        <li><a href="./Index.aspx?sort=java">Java</a></li>
                        <li><a href="./Index.aspx?sort=py">Python</a></li>
                        <li><a href="./Index.aspx?sort=c#">C#</a></li>
                        <li><a href="./Index.aspx?sort=c">C/C++</a></li>
                        <li><a href="./Index.aspx?sort=SpringBoot">SpringBoot</a></li>
                        <li><a href="./Index.aspx?sort=SpringCloud">SpringCloud</a></li>
                        <li><a href="./Index.aspx?sort=SSM">SSM</a></li>
                        <li><a href="./Index.aspx?sort=Ruby">Ruby</a></li>
                    </ul>
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active"><a href="./Index.aspx?sort=移动端"><span class="		glyphicon glyphicon-phone"></span>移动端</a></li>
                        <!-- 这里的active属性就是使得所在的li的背景色变为蓝色-->
                        <li><a href="#">more</a></li>

                    </ul>
                </aside>
                <!-- 文章 -->
                <section class="col-md-7">
                    <!--轮播图-->
                    <div id="slidershow" class="carousel slide" data-ride="carousel" data-interval="2000" data-pause="hover" data-wrap="true">
                        <!-- 设置图片轮播的顺序 -->
                        <ol class="carousel-indicators">
                            <li class="active" data-target="#slidershow" data-slide-to="0"></li>
                            <li data-target="#slidershow" data-slide-to="1"></li>
                            <li data-target="#slidershow" data-slide-to="2"></li>
                            <li data-target="#slidershow" data-slide-to="3"></li>
                            <li data-target="#slidershow" data-slide-to="4"></li>
                            <li data-target="#slidershow" data-slide-to="5"></li>
                        </ol>
                        <!--设置轮播的图片-->
                        <div class="carousel-inner">
                            <div class="item active">
                                <a href="../Blog/ReadBlog.aspx?id=1f55bcd6-cd03-440e-a497-8b3a56f68106">
                                    <img src="../../images/index/cat0.jpg" alt="cat1" />
                                    <div class="carousel-caption">标题 1</div>
                                </a>
                          </div>
                            <div class="item">
                                <a href="../Blog/ReadBlog.aspx?id=7273e64b-934e-4638-baca-fb6ae733d9f1">
                                    <img src="../../images/index/cat1.jpg" alt="cat2" />
                                    <div class="carousel-caption">标题 2</div>
                                </a>
                            </div>
                            <div class="item">
                                <a href="../Blog/ReadBlog.aspx?id=b3a902c0-d18e-48e2-a0f4-2f148beb7e76">
                                    <img src="../../images/index/cat2.jpg" alt="cat3" />
                                    <div class="carousel-caption">标题 3</div>
                                </a>
                            </div>
                            <div class="item">
                                <a href="../Blog/ReadBlog.aspx?id=b3a902c0-d18e-48e2-a0f4-2f148beb7e76">
                                    <img src="../../images/index/cat4.jpg" alt="cat3" />
                                    <div class="carousel-caption">标题 4</div>
                                </a>
                            </div>
                            <div class="item">
                                <a href="../Blog/ReadBlog.aspx?id=b3a902c0-d18e-48e2-a0f4-2f148beb7e76">
                                    <img src="../../images/index/cat5.jpg" alt="cat3" />
                                    <div class="carousel-caption">标题 5</div>
                                </a>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#slidershow" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#slidershow" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                    <!-- 文章预览 -->
                    <article>
                         <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:netblog %>" 
                             ProviderName="<%$ ConnectionStrings:netblog.ProviderName %>" 
                             SelectCommand="select * from article join users on article.account_id"></asp:SqlDataSource>
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="title" DataSourceID="SqlDataSource">                     
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
                <aside class="col-md-3">
                    <div class="alert alert-warning">
                        <p>这里是多人在线博客网站</p>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">Blog是什么</div>
                        <div class="panel-body">Blog是继Email、BBS、ICQ之后出现的第四种网络交流方式，至今已十分受大家的欢迎，是网络时代的个人“读者文摘”，是以超级链接为入口的网络日记，是代表着新的生活方式和新的工作方式，更代表着新的学习方式。</div>
                        <div class="panel-footer">编者：chx</div>
                    </div>
                    <div class="panel panel-success">
                        <div class="panel-heading">名人语录</div>
                        <div class="panel-body">生活赋予我们一种巨大的和无限高贵的礼品，这就是青春：充满着力量，充满着期待志愿，充满着求知和斗争的志向，充满着希望信心和青春。</div>
                        <div class="panel-footer">作者：奥斯特洛夫斯基 </div>
                    </div>
                    <div class="list-group">
                        <a href="##" class="list-group-item  ">编程语言排行：2020 年 5 月</a>
                        <a href="##" class="list-group-item list-group-item-success"><span class="badge">17.07%</span>C</a>
                        <a href="##" class="list-group-item list-group-item-info"><span class="badge">16.28%</span>Java</a>
                        <a href="##" class="list-group-item list-group-item-warning"><span class="badge">9.12%</span>Python</a>
                        <a href="##" class="list-group-item list-group-item-danger"><span class="badge">6.13%</span>C++</a>
                    </div>

                </aside>
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
