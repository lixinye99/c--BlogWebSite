<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArticleManage.aspx.cs" Inherits="Views_Manager_ArticleManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>文章管理列表</title>

    <link rel="stylesheet" type="text/css" href="../../Common/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/Manage/ArticleManage.css" />
    <script type="text/javascript" src="../../Common/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../Common/bootstrap.min.js"></script>
</head>

<body>
    <form id="articleListForm" runat="server">
        <div class="container-back">
            <div class="view-container">
                <div class="left-box">
                    <div class="list-group">
                        <a class="list-group-item" href="../User/UserCenter/Profile.aspx">个人资料</a>
                        <a class="list-group-item" href="../User/UserCenter/Collectionlist.aspx">我的收藏</a>
                        <a class="list-group-item" href="../User/UserCenter/Followlist.aspx">我关注的人</a>
                        <a class="list-group-item" href="../User/UserCenter/Fanlist.aspx">我的粉丝</a>
                        <a class="list-group-item active" href="ArticleManage.aspx">我的博客</a>
                        <a class="list-group-item" href="CommentManage.aspx">我的评论</a>
                    </div>
                </div>
                <div class="main-box">
                    <div>
                        <h3 id="mainTitle" class="htittle">我的博客</h3>
                        <HR style="FILTER:alpha(opacity=100,finishopacity=0,style=3)" width="80%"color=#987cb9 SIZE=3>
                        <div>
                            <asp:GridView ID="articleGridView" runat="server" 
                                ShowHeader="false" ShowFooter="true" 
                                AutoGenerateColumns="false" DataKeyNames="articleId" 
                                OnRowCommand="ArticleGridView_RowCommand" 
                                BorderStyle="None" GridLines="None" Width="100%" 
                                AllowPaging="false" PageSize="5" 
                                OnPageIndexChanging="ArticleGridView_PageIndexChanging">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="outer_div">
                                                <div class="inner-div">
                                                    <!--category title-->
                                                    <div class="head-line">
                                                        <asp:Button ID="btnCategory" runat="server" Text='<%# Eval("category") %>' 
                                                            BorderStyle="Solid" BorderColor="Gray" BorderWidth="1px" 
                                                            CommandName="categoryBtn" CommandArgument='<%# Eval("category") %>' 
                                                            CssClass="category-block" />
                                                        <asp:LinkButton ID="lnkTitle" runat="server" 
                                                            CommandName="titleLnk" CommandArgument='<%# Eval("articleId") %>' 
                                                            Font-Bold="true" Font-Size="Larger" CssClass="title-text">
                                                            <%# Eval("title") %></asp:LinkButton>
                                                    </div>
                                                    <!--introduction-->
                                                    <div class="middle-line">
                                                        <asp:Label ID="lblIntroduction" runat="server" 
                                                            Text='<%# Eval("introduction") %>'></asp:Label>
                                                    </div>
                                                    <!--releaseTime button-->
                                                    <div class="foot-line row">
                                                        <div class="col-sm-9">
                                                            <asp:Label ID="lblReleaseTime" runat="server" 
                                                                Text='<%# Eval("releaseTime") %>'></asp:Label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:Button ID="btnEdit" runat="server" Text="编辑" 
                                                                CssClass="btn btn-default control-btn" 
                                                                CommandName="editBtn" CommandArgument='<%# Eval("articleId") %>' />
                                                            <asp:Button ID="btnDelete" runat="server" Text="删除" 
                                                                CssClass="btn btn-default control-btn" 
                                                                CommandName="deleteBtn" CommandArgument='<%# Eval("articleId") %>' 
                                                                OnClientClick="{if(confirm('Delete?')){return true;}return false;}" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="gridview-footer">
                                                <asp:Button ID="btnPrev" runat="server" Text="上一页" CssClass="btn btn-default" OnClick="PrevBtn_Click" />
                                                <asp:Label ID="lblPage" runat="server" Text="第页" CssClass="page-lable" OnDataBinding="PageLbl_DataBinding"></asp:Label>
                                                <asp:Label ID="lblPageAll" runat="server" Text="共页" CssClass="page-lable" OnDataBinding="PageAllLbl_DataBinding"></asp:Label>
                                                <asp:Button ID="btnNext" runat="server" Text="下一页" CssClass="btn btn-default" OnClick="NextBtn_Click" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <footer class="container-footer">
        <p>CopyRight@copy2020 </p>
    </footer>
</body>
</html>
