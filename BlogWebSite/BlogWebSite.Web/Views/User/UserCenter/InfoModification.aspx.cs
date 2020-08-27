using BlogWebSite.DAL;
using BlogWebSite.BLL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_User_UserCenter_InfoModification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Guid account_id;
        if (Request.Cookies["account_id"]!= null)
        {
            account_id = new Guid(Request.Cookies["account_id"].Value);
            UserManager um = new UserManager();
            User ur = um.Read(account_id);
            AccountManager am = new AccountManager();
            Account ac = am.Read(account_id);
            LEmail.Text += ac.email;
            Imageico.ImageUrl = ur.image;
            TBName.Text = ur.name;
        }
        else
        {
            Response.Redirect("../Login/Login.aspx");
        }
    }

    protected void cancal_Click(object sender, EventArgs e)
    {
        Response.Redirect("Profile.aspx");
    }

    protected void confirm_Click(object sender, EventArgs e)
    {
        Guid account_id;
        account_id = new Guid(Request.Cookies["account_id"].Value);
        UserManager um = new UserManager();
        User ur = um.Read(account_id);
        ur.birth = DateTime.Parse(Tbrith.Text);
        ur.introduction = TextBox1.Text;
        ur.gender = Radiogender.SelectedValue;
        ur.name = TBName.Text;
        ur.image = TImage.Text;
        if (um.Update(ur))
        {
            Response.Redirect("Profile.aspx");
        }
        else
        {
            Response.Write("<script>alert('保存失败')</script>");
        }
    }
}