using BlogWebSite.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Manage_CommentManage : System.Web.UI.Page
{
    private CommentManager manager = new CommentManager();
    private Guid accountId;
    private int pageIndex;
    private int pageAll;

    protected void Page_Load(object sender, EventArgs e)
    {
        Init();
        if (!IsPostBack) {
            Bind();
        }
    }

    private void Init()
    {
        if (Request.Cookies["account_id"] != null) {
            accountId = new Guid(Request.Cookies["account_id"].Value);
        } else {
            Response.Write("<script type='text/javascript'>alert('请先登录账号。');location.href='/Views/Index/Index.aspx'</scritp>");
        }
        pageIndex = Convert.ToInt32(Request["page"]);
        if (pageIndex == 0)
            pageIndex = 1;
        pageAll = (manager.GetCountOfAccount(accountId) - 1) / commentGridView.PageSize + 1;
    }

    private void Bind()
    {
        //commentGridView.DataSource = manager.GetCommentOfAccount(accountId);
        commentGridView.DataSource = manager.GetCommentPageOfAccount(accountId,
            pageIndex, commentGridView.PageSize);
        commentGridView.DataBind();
    }

    /*protected void CommentGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        commentGridView.PageIndex = e.NewPageIndex;
        commentGridView.DataBind();
    }*/

    protected void CommentGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName) {
            case "titleLnk":
                Response.Redirect("~/Views/Blog/ReadBlog.aspx?id=" + e.CommandArgument.ToString());
                break;
            case "deleteBtn":
                manager.Delete(new Guid(e.CommandArgument.ToString()));
                Response.Redirect("~/Views/Manage/CommentManage.aspx");
                break;
        }
    }

    protected void PageLbl_DataBinding(object sender, EventArgs e)
    {
        Label lbl = sender as Label;
        lbl.Text = "第" + pageIndex + "页";
    }

    protected void PageAllLbl_DataBinding(object sender, EventArgs e)
    {
        Label lbl = sender as Label;
        lbl.Text = "共" + pageAll + "页";
    }

    protected void PrevBtn_Click(object sender, EventArgs e)
    {
        if (pageIndex == 1) {
            return;
        }
        --pageIndex;
        Bind();
        Response.Redirect("~/Views/Manage/CommentManage.aspx?page=" + pageIndex);
    }

    protected void NextBtn_Click(object sender, EventArgs e)
    {
        if (pageIndex == pageAll) {
            return;
        }
        ++pageIndex;
        Bind();
        Response.Redirect("~/Views/Manage/CommentManage.aspx?page=" + pageIndex);
    }
}