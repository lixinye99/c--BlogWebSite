using BlogWebSite.BLL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Manager_ArticleManage : System.Web.UI.Page
{
    private ArticleManager manager = new ArticleManager();
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
        pageAll = (manager.GetCountOfAccount(accountId) - 1) / articleGridView.PageSize + 1;
    }

    private void Bind()
    {
        //articleGridView.DataSource = manager.GetInfoOfAccount(accountId);
        articleGridView.DataSource = manager.GetInfoOfAccountInPage(accountId, 
            pageIndex, articleGridView.PageSize);
        articleGridView.DataBind();
    }

    protected void ArticleGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //articleGridView.PageIndex = e.NewPageIndex;
        //articleGridView.DataSource = manager.GetInfoOfAccountInPage(accountId, e.NewPageIndex, articleGridView.PageSize);
        articleGridView.DataBind();
    }

    protected void ArticleGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName) {
            case "categoryBtn":
                Response.Redirect("~/Views/Index/Index.aspx?sort=" + e.CommandArgument);
                break;
            case "titleLnk":
                Response.Redirect("~/Views/Blog/ReadBlog.aspx?id=" + e.CommandArgument);
                break;
            case "editBtn":
                Response.Redirect("~/Views/Blog/BlogChange.aspx?id=" + e.CommandArgument);
                break;
            case "deleteBtn":
                manager.Delete(new Guid(e.CommandArgument.ToString()));
                Response.Redirect("~/Views/Manage/ArticleManage.aspx");
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
        Response.Redirect("~/Views/Manage/ArticleManage.aspx?page=" + pageIndex);
    }

    protected void NextBtn_Click(object sender, EventArgs e)
    {
        if (pageIndex == pageAll) {
            return;
        }
        ++pageIndex;
        Bind();
        Response.Redirect("~/Views/Manage/ArticleManage.aspx?page=" + pageIndex);
    }
}