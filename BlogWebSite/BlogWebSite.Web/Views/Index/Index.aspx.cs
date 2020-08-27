using BlogWebSite.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Default : System.Web.UI.Page
{
    String sort = null;
    //用于DAL
    //netblogDatabase db = new netblogDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        //页面加载 判断两个1.cookie2.sort
        if (!IsPostBack)
        {
            //1.cookie 判断是否登录
            if (Request.Cookies["account_id"] ==null)
            {
                btn_user.Visible = false;
                btn_login.Visible = true;
            }
            else
            {
                btn_user.Visible = true;
                btn_login.Visible = false;
            }
            //2.初始化文章块
            sort = Request.QueryString["sort"];
            ArticleSort(sort);
        }
    }

    void ArticleSort(string s)
    {
        string sql = null;
        if (s != null)
        {
            sql = "select * from article join users on article.account_id=users.account_id where tag like '%" + s + "%' or category like '%" + s + "%'";
        }
        else
        {
            sql = "select * from article join users on article.account_id=users.account_id";
        }
        SqlDataSource.SelectCommand = sql;
        //初始化列表
    }
     public void titleClick(object sender, EventArgs e)
    {
        LinkButton lbtn = (LinkButton)sender;
        if (lbtn.CommandArgument != "")
        {
            //查询id
            Response.Redirect("../Blog/ReadBlog.aspx?id=" + lbtn.CommandArgument);
        }
    }
    public void userClick(object sender, EventArgs e)
    {
        
LinkButton lbtn = (LinkButton)sender;
        if (lbtn.CommandArgument != "")
        {
            //查询id
            Response.Redirect("../Index/UserIndex.aspx?id=" + lbtn.CommandArgument);
        }
    }




    protected void btn_search_Click(object sender, EventArgs e)
    {
        String sort = tb_search.Text;
        if(sort==null | sort == "")
        {
            Response.Redirect("./Index.aspx");
        }
        else
            Response.Redirect("./Index.aspx?sort=" + sort);
    }

    protected void btn_login_Click(object sender,EventArgs e)
    {
        //测试-初始化cookie
        //Response.Cookies["account_id"].Value = "025fb2f6-d213-48ea-b17b-c6b02c5e453e";
        //Response.Cookies["account_id"].Expires.AddDays(30);

        Response.Redirect("../User/Login/Login.aspx");
        
        btn_user.Visible = true;
        btn_login.Visible = false;
    }

    protected void btn_write_Click(object sender,EventArgs e)
    {
        if (Request.Cookies["account_id"] == null)
        {
            Response.Redirect("../User/Login/login.aspx");
        }
        else
        {
            Response.Redirect("../Blog/BlogEdit.aspx");
        }
    }
    protected void btn_leave_Click(object sender, EventArgs e)
    {
        Response.Cookies["account_id"].Expires = DateTime.Now.AddDays(-1);
        Response.Redirect("Index.aspx");
    }

}