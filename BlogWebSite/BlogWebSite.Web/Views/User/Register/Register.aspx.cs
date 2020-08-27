using BlogWebSite.DAL;
using BlogWebSite.BLL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Register_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BTNLogin_Click(object sender, EventArgs e)
    {
        AccountManager am = new AccountManager();
        if (am.HasSame(TBEmail.Text))
        {
            Response.Write("<script>alert('邮箱已注册，请更换新的邮箱')</script>");
        }
        else
        {
            Account ac = Account.GetEmptyAccount();
            ac.email = TBEmail.Text;
            ac.password = TBPassword.Text;
            am.Save(ac);
            UserManager um = new UserManager();
            User ur = BlogWebSite.Model.User.GetEmptyUser(ac.accountId);
            ur.image = "https://avatar-static.segmentfault.com/311/143/3111436489-5e9b140a51f93_big64";
            ur.gender = "男";
            string bd = "1999-01-01 00:00:00";
            ur.birth = DateTime.Parse(bd);
            ur.name = "萌新";
            um.Save(ur);
            Response.Write("<script>alert('注册成功')</script>");
            Response.Redirect("../Login/Login.aspx");
        }
    }
}