using BlogWebSite.DAL;
using BlogWebSite.BLL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_User_UserCenter_Followlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Guid account_id;
        if (Request.Cookies["account_id"] != null)
        {
            account_id = new Guid(Request.Cookies["account_id"].Value);
            String sql = "select * from follow join users on users.account_id=follow.account_id where follow.fan_id='" + account_id.ToString() + "'";
            SqlDataSource1.SelectCommand = sql;
        }
        else
        {
            Response.Redirect("../Login/Login.aspx");
        }
        
    }
    public void Link_user(object sender, EventArgs e)
    {
        LinkButton lbtn = (LinkButton)sender;
        if (lbtn.CommandArgument != "")
        {
            //查询id
            Response.Redirect("../../Index/UserIndex.aspx?id=" + lbtn.CommandArgument);
        }
    }

    protected void BTNoff_Click(object sender, EventArgs e)
    {
        LinkButton follow_id = (LinkButton)sender;
        Follow fw = new Follow();
        fw.accountId = new Guid(follow_id.CommandArgument);
        Guid fan_id;
        fan_id = new Guid(Request.Cookies["account_id"].Value);
        fw.fanId = fan_id;
        FollowManager fm = new FollowManager();
        if(fm.Delete(fw))
        {
            Response.Redirect("Followlist.aspx");
        }
    }
}