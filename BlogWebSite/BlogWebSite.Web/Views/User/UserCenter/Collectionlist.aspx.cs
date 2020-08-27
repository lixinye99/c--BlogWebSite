using BlogWebSite.BLL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_User_UserCenter_Collectionlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Guid account_id;
        if (Request.Cookies["account_id"] != null)
        {
            account_id = new Guid(Request.Cookies["account_id"].Value);
            String sql = "select * from likes join article on article.article_id=likes.article_id where likes.account_id='" + account_id.ToString() + "'";
            SqlDataSource1.SelectCommand = sql;
        }
        else
        {
            Response.Redirect("../Login/Login.aspx");
        }
    }

    protected void article_off_Click(object sender, EventArgs e)
    {
        LinkButton article_id = (LinkButton)sender;
        Like like = new Like();
        like.articleId = new Guid(article_id.CommandArgument);
        Guid account_id;
        account_id = new Guid(Request.Cookies["account_id"].Value);
        like.accountId = account_id;
        LikeManager lm = new LikeManager();
        if (lm.Delete(like))
        {
            Response.Redirect("Collectionlist.aspx");
        }
    }

    protected void Labeltitle_Click(object sender, EventArgs e)
    {
        LinkButton lbtn = (LinkButton)sender;
        if (lbtn.CommandArgument != "")
        {
            //查询id
            Response.Redirect("../../Blog/ReadBlog.aspx?id=" + lbtn.CommandArgument);
        }
    }
}