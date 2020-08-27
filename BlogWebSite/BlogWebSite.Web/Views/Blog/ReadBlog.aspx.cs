using System;
using System.Collections.Generic;
using System.Web.Services;
using BlogWebSite.Model;
using BlogWebSite.DAL;

public partial class Views_Blog_ReadBlog : System.Web.UI.Page
{
    static ArticleDao articleDao = new ArticleDao();
    static LikeDao likeDao = new LikeDao();
    static FavoriteDao favoriteDao = new FavoriteDao();
    static FollowDao followDao = new FollowDao();
    static UserDao userDao = new UserDao();
    static CommentDao commentDao = new CommentDao();
    static Guid id;
    public static Article article = new Article();
    public static User user = new User();
    //登录的用户id
    static Guid user_id;
    protected void Page_Load(object sender, EventArgs e)
    {

        //初始化页面，根据url中的id获取文章内容
        //获取用户的登录状态        
        string blog_id = Request["id"];
        id = new Guid(blog_id);
        //查询的评论时候要指定查询的文章id
        SqlDataSource1.SelectCommand = "SELECT comments.account_id, users.name, users.image, comments.content, comments.release_time FROM users INNER JOIN comments ON users.account_id = comments.account_id where article_id = '" + id + "'ORDER BY comments.release_time DESC";
        //绑定模糊查询的查询语句，查询相关文章的时候排除自己
        SqlDataSource2.SelectCommand = "select title,article_id from article where article_id != '"+ id +"' and category = '"+ article.category +"' order by likes desc limit 0,5";
        article = articleDao.GetSingle(id);
        if (article == null)
        {
            Response.Write("<script type='text/javascript'>alert('这篇博客不翼而飞了!');location.href='/Views/Index/Index.aspx'</scritp>");
        }
        user = userDao.GetSingle(article.accountId);
        this.blog_content.InnerText = article.content;
        if (Request.Cookies["account_id"] != null)
        {
            user_id = new Guid(Request.Cookies["account_id"].Value);
        }        
           
        if (user_id == new Guid())
        {
            return;
        }
        //判断登录的用户是不是点赞过
        List<Like> likes = likeDao.GetListByAccount(user_id);
        foreach (Like like in likes)
        {
            if (like.articleId == id)
            {
                this.zan.Style.Add("background-color", "#00965e");
                this.zan.Style.Add("color", "white");
                this.zan_span.InnerText = "已赞";
            }
        }
        //判断登录的用户是不是收藏过
        List<Favorite> favorites = favoriteDao.GetListByAccount(user_id);
        foreach (Favorite favorite in favorites)
        {
            if (favorite.articleId == id)
            {
                this.shouchang.Style.Add("background-color", "#6c757d");
                this.shouchang.Style.Add("color", "white");
                this.shouchang_span.InnerText = "已收藏";
            }
        }
        //判断登录的用户是不是关注过作者或者就是作者本人
        if (article.accountId == user_id)
        {
            this.follow.Style.Add("display", "none");
        }
        List<Follow> follows = followDao.GetListByFan(user_id);
        foreach (Follow follow in follows)
        {
            if (follow.accountId == article.accountId)
            {
                this.follow.InnerText = "已关注";
            }
        }        

    }

    //点赞数更新并删除点赞表中信息
    [WebMethod]
    static public void updatelikeviews(string str,string count)
    {       
        if(user_id == null)
        {
            System.Web.HttpContext.Current.Response.Write("<script>alert('你还没有登录！先去登录吧');location.href='/Views/Index/Index.aspx'</script>");
        }
        Like like_two = new Like();
        like_two.articleId = article.articleId;
        like_two.accountId = user_id;
        article.likes = Int32.Parse(count);
        articleDao.Update(article);       
        List<Like> likes = likeDao.GetListByAccount(user_id);
        foreach (Like like in likes)
        {
            if (like.articleId == id)
            {
                likeDao.Delete(like);
                return;
            }
        }        
        if(str == "已赞")
        {
            likeDao.Delete(like_two);
        }
        if(str == "赞")
        {
            likeDao.Insert(like_two);
        }
    }
    //收藏数更新并删除收藏表中信息
    [WebMethod]
    static public void updatecollectviews(string str,string count)
    {
        if (user_id == null)
        {
            System.Web.HttpContext.Current.Response.Write("<script>alert('你还没有登录！先去登录吧');location.href='/Views/Index/Index.aspx'</script>");
        }
        Favorite favorite_two = new Favorite();
        favorite_two.accountId = user_id;
        favorite_two.articleId = article.articleId;
        article.favorites = Int32.Parse(count);
        articleDao.Update(article);
        List<Favorite> favorites = favoriteDao.GetListByAccount(user_id);
        foreach (Favorite favorite in favorites)
        {
            if (favorite.articleId == id)
            {
                favoriteDao.Delete(favorite);
            }
        }
        if(str == "收藏")
        {
            favoriteDao.Insert(favorite_two);
        }
        if(str == "已收藏")
        {
            favoriteDao.Delete(favorite_two);
        }
    }
    //关注作者或者取消关注并对关注表进行操作
    [WebMethod]
    static public void followorcancel(string str)
    {
        if (user_id == null)
        {
            System.Web.HttpContext.Current.Response.Write("<script>alert('你还没有登录！先去登录吧');location.href='/Views/Index/Index.aspx'</script>");
        }
        Follow follow = new Follow();
        follow.fanId = user_id;
        follow.accountId = article.accountId;
        if (str == "关注作者")
        {          
            followDao.Insert(follow);
        }
        else if(str == "取消关注"){
            followDao.Delete(follow);
        }
    }
    //发表评论
    protected void post_comment_Click(object sender, EventArgs e)
    {
        if (user_id == null)
        {
            System.Web.HttpContext.Current.Response.Write("<script>alert('你还没有登录！先去登录吧');location.href='/Views/Index/Index.aspx'</script>");
        }
        if (this.comment_input.Value == "") {
            Response.Write("<script>alert('不能发表空评论!');</script>");
            return;
        }
        Comment comment = new Comment();
        Guid comment_id = new Guid();
        comment.commentId = comment_id;
        comment.articleId = id;
        comment.accountId = user_id;
        comment.content = this.comment_input.Value;
        comment.releaseTime = DateTime.Now;
        bool flag = commentDao.Insert(comment);
        if (flag)
        {
            Response.Redirect(Request.Url.ToString().Split('&')[0]);
        }
        else
        {
            Response.Write("<script>alert('发表评论失败了！')</script>");
        }
    }
}