using BlogWebSite.DAL;
using BlogWebSite.BLL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_User_UserCenter_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Guid account_id;
        if (Request.Cookies["account_id"] != null)
        {
            account_id = new Guid(Request.Cookies["account_id"].Value);
            UserManager um = new UserManager();
            User ur = um.Read(account_id);
            AccountManager am = new AccountManager();
            Account ac = am.Read(account_id);
            LEmail.Text += ac.email;
            Imageico.ImageUrl = ur.image;
            LName.Text += ur.name;
            String str = ur.birth.ToString();
            LGender.Text += ur.gender;
            LBirthday.Text += str.Substring(0, str.Length - 8);
            LIntroduction.Text += ur.introduction;
        }
        else
        {
            Response.Redirect("../Login/Login.aspx");
        }
    }
}
