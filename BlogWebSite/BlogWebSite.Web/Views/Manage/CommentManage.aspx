<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CommentManage.aspx.cs" Inherits="Views_Manage_CommentManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>评论管理列表</title>

    <link rel="stylesheet" type="text/css" href="../../Common/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../../Content/Manage/CommentManage.css" />
    <script type="text/javascript" src="../../Common/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../Common/bootstrap.min.js"></script>
</head>
<body>
    <form id="commentListForm" runat="server">
        <div class="container-back">
            <div class="view-container">
                <div class="left-box">
                    <div class="list-group">
                        <a class="list-group-item" href="../User/UserCenter/Profile.aspx">个人资料</a>
                        <a class="list-group-item" href="../User/UserCenter/Collectionlist.aspx">我的收藏</a>
                        <a class="list-group-item" href="../User/UserCenter/Followlist.aspx">我关注的人</a>
                        <a class="list-group-item" href="../User/UserCenter/Fanlist.aspx">我的粉丝</a>
                        <a class="list-group-item" href="ArticleManage.aspx">我的博客</a>
                        <a class="list-group-item active" href="CommentManage.aspx">我的评论</a>
                    </div>
                </div>
                <div class="main-box">
                    <div>
                        <h3 id="mainTitle" class="htittle">我的评论</h3>
                        <HR style="FILTER:alpha(opacity=100,finishopacity=0,style=3)" width="80%"color=#987cb9 SIZE=3>
                        <div>
                            <asp:GridView ID="commentGridView" runat="server" 
                                ShowHeader="false" ShowFooter="true"
                                AutoGenerateColumns="false" DataKeyNames="commentId" 
                                OnRowCommand="CommentGridView_RowCommand" 
                                BorderStyle="None" GridLines="None" Width="100%" 
                                AllowPaging="false" PageSize="5" >
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="outer_div">
                                                <div class="inner-div">
                                                    <div class="head-line">
                                                        <asp:LinkButton ID="lnkTitle" runat="server" 
                                                            CommandName="titleLnk" CommandArgument='<%# Eval("commentArticleId") %>'
                                                            Font-Bold="true" Font-Size="Larger" CssClass="title-text">
                                                            <%# Eval("articleTitle") %></asp:LinkButton>
                                                    </div>
                                                    <div class="middle-line">
                                                        <asp:Label ID="lblContent" runat="server" 
                                                            Text='<%# Eval("content") %>'></asp:Label>
                                                    </div>
                                                    <div class="foot-line row">
                                                        <div class="col-md-11 col-sm-10">
                                                            <asp:Label ID="lblReleaseTime" runat="server" 
                                                                Text='<%# Eval("commentReleaseTime") %>'></asp:Label>
                                                        </div>
                                                        <div class="col-md-1 col-sm-2">
                                                            <asp:Button ID="btnDelete" runat="server" Text="删除" 
                                                                CssClass="btn btn-default" 
                                                                CommandName="deleteBtn" CommandArgument='<%# Eval("commentId") %>' 
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
                                <PagerSettings Mode="Numeric" PageButtonCount="5" />
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
