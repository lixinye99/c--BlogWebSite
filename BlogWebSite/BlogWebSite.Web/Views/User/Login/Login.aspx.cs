using BlogWebSite.DAL;
using BlogWebSite.BLL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Login_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {

        }

    }

    protected void BTNLogin_Click(object sender, EventArgs e)
    {
        AccountManager am = new AccountManager();
        // UserManager um = new UserManager();
        Account ac = am.Read(TBEmail.Text);
        if (am.HasSame(TBEmail.Text))
        {
            if (ac.password == TBPassword.Text)
            {
                Response.Write("<script>alert('登录成功')</script>");
                // User ur = um.Read(ac.accountId);
                // Response.Cookies["name"].Value = ur.name;
                // Response.Cookies["name"].Expires.AddDays(30);
                Response.Cookies["account_id"].Value = ac.accountId.ToString();
                Response.Cookies["account_id"].Expires.AddDays(30);
                Response.Redirect("../../Index/Index.aspx");
            }
            else
            {
                Response.Write("<script>alert('用户名或者密码错误')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('用户名或者密码错误')</script>");
        }
    }

    protected void Bthumb_Click(object sender, EventArgs e)
    {

    }

    protected void BTNRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Register/Register.aspx");
    }
}