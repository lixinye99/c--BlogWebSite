<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReadBlog.aspx.cs" Inherits="Views_Blog_ReadBlog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<link rel="stylesheet" type="text/css" href="/Common/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/Content/Blog/RichTextCss/editormd.preview.min.css"  />
<script type="text/javascript" src="/Common/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/Common/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Content/Blog/ReadBlog.css">
<script type="text/javascript" src="/Scripts/Blog/editormd.min.js"></script>
<script src="/RichText/lib/marked.min.js"></script>
<script src="/RichText/lib/prettify.min.js"></script>    
<script type="text/javascript" src="/Scripts/Blog/readblog.js"></script>

<body>
    <form id="form1" runat="server">
        <div class="container whole-page">
            <div class="row">               
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <!-- 这里是博客的组要内容 -->
                    <div class="col-lg-9 col-md-9 col-sm-9 blog-content">    
                        <!-- 文章的作者信息 -->
                        <div class="content">
                            <a style="display:inline" ><img src="<%=user.image %>""/>&nbsp;<strong class="align-self-center"><%=user.name %></strong></a>                            
                        </div>
                        <!-- 文章的标题、标签、发布时时间 -->
                        <div class="content">
                            <h1 class="h2 mb-3" id="sf-article_title">
                                <span class="text-body"><%=article.title %></span>
                            </h1>
                        </div>
                        <div class="content"> 
                            <div style="display:inline;">
                                <a  class="m-1 badge-tag" href=""><%=((article.tag.Split(',').Length-2)>=0?article.tag.Split(',')[0]:"") %></a>
                                <a  class="m-1 badge-tag" href=""><%=((article.tag.Split(',').Length-3)>=0?article.tag.Split(',')[1]:"") %></a>
                                <a  class="m-1 badge-tag" href=""><%=((article.tag.Split(',').Length-4)>=0?article.tag.Split(',')[2]:"") %></a>
                                <a  class="m-1 badge-tag" href=""><%=((article.tag.Split(',').Length-5)>=0?article.tag.Split(',')[3]:"") %></a> 
                                <a  class="m-1 badge-tag" href=""><%=((article.tag.Split(',').Length-6)>=0?article.tag.Split(',')[4]:"") %></a>
                            </div>     
                            <span class="text-secondary">发布于</span>&nbsp;<span class="text-secondary"><%=article.releaseTime.ToString("yyyy-MM-dd hh:mm:ss") %></span>
                        </div>
                        <hr />
                        <!-- 文章的内容信息 -->
                        <div class="test-markdown-view" id="div-content">
                            <textarea runat="server" id="blog_content" style="display:none;">  
                            </textarea>
                        </div>
                        <script type="text/javascript">
                            $(function() {
                                var testView = editormd.markdownToHTML("div-content", { });
                            });
                        </script>
                        <hr /> 
                        <!-- 文章的点赞和收藏 -->
                        <div class="content" style="text-align:center">
                            <button runat="server" id="zan" class="btn btn-outline-primary goodorcollect" type="button">
                            <svg class="svg-inline--fa fa-thumbs-up fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" ><path fill="currentColor" d="M466.27 286.69C475.04 271.84 480 256 480 236.85c0-44.015-37.218-85.58-85.82-85.58H357.7c4.92-12.81 8.85-28.13 8.85-46.54C366.55 31.936 328.86 0 271.28 0c-61.607 0-58.093 94.933-71.76 108.6-22.747 22.747-49.615 66.447-68.76 83.4H32c-17.673 0-32 14.327-32 32v240c0 17.673 14.327 32 32 32h64c14.893 0 27.408-10.174 30.978-23.95 44.509 1.001 75.06 39.94 177.802 39.94 7.22 0 15.22.01 22.22.01 77.117 0 111.986-39.423 112.94-95.33 13.319-18.425 20.299-43.122 17.34-66.99 9.854-18.452 13.664-40.343 8.99-62.99zm-61.75 53.83c12.56 21.13 1.26 49.41-13.94 57.57 7.7 48.78-17.608 65.9-53.12 65.9h-37.82c-71.639 0-118.029-37.82-171.64-37.82V240h10.92c28.36 0 67.98-70.89 94.54-97.46 28.36-28.36 18.91-75.63 37.82-94.54 47.27 0 47.27 32.98 47.27 56.73 0 39.17-28.36 56.72-28.36 94.54h103.99c21.11 0 37.73 18.91 37.82 37.82.09 18.9-12.82 37.81-22.27 37.81 13.489 14.555 16.371 45.236-5.21 65.62zM88 432c0 13.255-10.745 24-24 24s-24-10.745-24-24 10.745-24 24-24 24 10.745 24 24z"></path></svg>
                            <span runat="server" id="zan_span" class="ml-1">赞</span> <span class="mainLikeNum"><%=article.likes %></span>
                            </button>
                            <button runat="server" id="shouchang" class="btn btn-outline-secondary goodorcollect" type="button">
                            <svg class="svg-inline--fa fa-bookmark fa-w-12"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" ><path fill="currentColor" d="M336 0H48C21.49 0 0 21.49 0 48v464l192-112 192 112V48c0-26.51-21.49-48-48-48zm0 428.43l-144-84-144 84V54a6 6 0 0 1 6-6h276c3.314 0 6 2.683 6 5.996V428.43z"></path></svg><!-- <i class="far fa-thumbs-up"></i> -->
                            <span runat="server" id="shouchang_span" class="ml-1">收藏</span> <span class="mainLikeNum"><%=article.favorites %></span>
                            </button>
                        </div>
                        <hr />
                        <!-- 这里是关注作者-->
                        <div class="d-flex align-items-center row">
                            <div class="d-flex align-items-center flex-grow-1 author-left col-sm-9 col-12">
                                <a>
                                    <img style="width:64px;height:64px;margin-right:1rem;" src="<%=user.image %>"" aria-hidden="true"/>
                                </a>
                                <div>
                                    <h5><a class="text-body" style="font-size:2rem;" href="/Person/Personvisit?id=<%=user.accountId %>"><%=user.name %></a></h5>
                                    <ul class="list-inline mb-0 authentication-info">
                                        <li class="list-inline-item">
                                            <svg class="svg-inline--fa fa-dice-d8 fa-w-16" style="color: #BF7158;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" ><path fill="currentColor" d="M225.53 2.52L2.36 233.83c-4.21 4.37-2.56 11.71 3.1 13.77l234.13 85.06V8.39c-.01-7.49-8.91-11.21-14.06-5.87zm284.11 231.31L286.47 2.52C281.32-2.82 272.41.9 272.41 8.4v324.27l234.13-85.06c5.66-2.07 7.31-9.42 3.1-13.78zM33.53 310.38l192 199.1c5.15 5.34 14.06 1.62 14.06-5.88V368.29L42.13 296.61c-8.21-2.98-14.72 7.43-8.6 13.77zm436.34-13.77l-197.46 71.68V503.6c0 7.5 8.91 11.22 14.06 5.88l192-199.1c6.12-6.34-.39-16.75-8.6-13.77z"></path></svg>
                                            <span style="color: #BF7158; font-size:16px; font-weight:bold">8.3k</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-3 col-12 text-sm-right">
                                <button runat="server" id="follow" type="button" class="btn btn-primary concernwriter">关注作者</button>
                            </div>
                        </div>
                    </div>  
                    <!--这里是一些推荐的相关文章 -->
                    <div class="col-lg-3 col-md-3 col-sm-9 relative-blog">   
                        <h4>相关文章</h4>                        
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                            <LayoutTemplate>
                                <ul class="list-group">
                                        <li class="list-group-item" runat="server" id="itemPlaceholder"><a href=""></a></li>
                                </ul>
                            </LayoutTemplate>
                            <ItemTemplate>
                                    <li class="list-group-item" runat="server" id="itemPlaceholder"><a href="/Views/Blog/ReadBlog.aspx?id=<%#Eval("article_id") %>"><%#Eval("title") %></a></li>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>                        
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:netblog %>" ProviderName="<%$ ConnectionStrings:netblog.ProviderName %>"></asp:SqlDataSource>
                    </div>  
                </div>               
            </div>
            <!--这里是评论区 -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="col-lg-9 col-md-9 col-sm-9 comments">
                        <!-- 发表你的评论 -->
                        <div class="content ">
                            <div class="report-comment">
                                <a><img src="<%=user.image %>"/>&nbsp;</a>   
                                <input runat="server" class="comment-input" id="comment_input" name="comment-input" placeholder="撰写评论..." type="text"/>
                            </div>  
                            <asp:Button ID="post_comment" runat="server" Text="提交评论" class="post-comment btn" OnClick="post_comment_Click"/>                                                      
                        </div>                   
                        <!-- 文章已有的评论信息 -->
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <LayoutTemplate>
                            <div class="content" id="comment-body">
                                <div class="media mb-4" runat="server" id="itemPlaceholder">
                                </div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="media mb-4" runat="server">
                            <img class="d-block rounded-circle mr-3" width="38" height="38" src="<%#Eval("image") %>"" alt=""/>
                            <div class="media-body w-0">                                    
                                <a class="d-uname" href="/Person/Personvisit.aspx?id=<%#Eval("account_id") %>" style="display:inline;" target="_blank"><strong><%#Eval("name") %></strong></a>
                                <div class="parsedText fmt"><p><%#Eval("content") %></p></div>                                                    
                                <span class="comment-time">发布时间:<%#Eval("release_time") %></span></div>
                            </div>
                        </ItemTemplate>
                        </asp:ListView>
                        <!-- 分页控件 -->
                        <asp:DataPager ID="DataPager1" class="pager" runat="server" PagedControlID="ListView1" PageSize="5" QueryStringField="pageid">
                            <Fields>
                                <asp:TemplatePagerField>
                                <PagerTemplate>
                                    <span class="total">共<strong><%=Math.Ceiling ((double)DataPager1.TotalRowCount / DataPager1.PageSize)%></strong>页<strong><%=DataPager1.TotalRowCount%></strong>条记录</span>
                                </PagerTemplate>
                                </asp:TemplatePagerField>
                                <asp:NextPreviousPagerField ButtonType="Link"  ShowFirstPageButton="True" 
                                     ShowNextPageButton="False" ShowPreviousPageButton="False" 
                                    FirstPageText="首页" LastPageText="尾页" />
                                <asp:NumericPagerField ButtonCount="5"    CurrentPageLabelCssClass="current" />
                                  <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" 
                                     ShowNextPageButton="False" ShowPreviousPageButton="False" 
                                    FirstPageText="首页" LastPageText="尾页" />
                            </Fields>
                        </asp:DataPager>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:netblog %>" ProviderName="<%$ ConnectionStrings:netblog.ProviderName %>"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
