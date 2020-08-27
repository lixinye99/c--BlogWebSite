using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using BlogWebSite.DAL;
using System.Web.UI.WebControls;
using BlogWebSite.BLL;

public partial class Views_Index_UserIndex : System.Web.UI.Page
{
    static Guid id;
    public static User user;

    protected void Page_Load(object sender, EventArgs e)
    {
        Init();
    }
    void Init() {
        //是否登录判断
        if (Request.Cookies["account_id"] == null)
        {
            btn_user.Visible = false;
            btn_login.Visible = true;
        }
        else
        {
            btn_user.Visible = true;
            btn_login.Visible = false;
        }

        //账号信息绑定
        String account_id = Request.QueryString["id"];
        UserManager userm = new UserManager();
        id = new Guid(account_id);
        //判断是否正确路由，错误转到404
        if (userm.Read(id)==null)
        {
            Response.Redirect("./404.html");
        }
        //该页面通过获取account_id获取该用户文章预览信息
        String sql = "select * from article join users on users.account_id=users.account_id where users.account_id='" + account_id+ "' order by release_time desc";
        SqlDataSource1.SelectCommand = sql;

        //获取用户信息
        user = userm.Read(id);

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
            Response.Redirect("UserIndex.aspx?id=" + lbtn.CommandArgument);
        }
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        String sort = tb_search.Text;
        if (sort == null | sort == "")
        {
            Response.Redirect("./Index.aspx");
        }
        else
            Response.Redirect("./Index.aspx?sort=" + sort);
    }
    protected void btn_write_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["name"] == null)
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
        Response.Cookies["id"].Expires = DateTime.Now.AddDays(-1);
        Response.Redirect("Index.aspx");
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        //测试-初始化cookie
        //Response.Cookies["id"].Value = "025fb2f6-d213-48ea-b17b-c6b02c5e453e";
        //Response.Cookies["id"].Expires.AddDays(30);

        Response.Redirect("../User/Login/Login.aspx");

        btn_user.Visible = true;
        btn_login.Visible = false;
    }
}