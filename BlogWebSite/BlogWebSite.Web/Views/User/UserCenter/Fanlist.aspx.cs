using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_User_UserCenter_Fanlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Guid account_id;
        if (Request.Cookies["account_id"] != null)
        {
            account_id = new Guid(Request.Cookies["account_id"].Value);
            String sql = "select * from follow join users on users.account_id=follow.fan_id where follow.account_id='" + account_id.ToString() + "'";
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
}