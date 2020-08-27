using System;
using BlogWebSite.DAL;
using BlogWebSite.Model;

public partial class Views_Blog_BlogChange : System.Web.UI.Page
{
    static ArticleDao articleDao = new ArticleDao();
    static Article article = new Article();
    Guid blog_id;
    Guid user_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        blog_id = new Guid(Request["id"]);        
        if(Request.Cookies["account_id"] != null)
        {
            user_id = new Guid(Request.Cookies["account_id"].Value);
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('你还没有登录！先去登录吧');location.href='/Views/Index/Index.aspx'</scritp>");
        }
        article = articleDao.GetSingle(blog_id);
        if(article == null)
        {
            Response.Write("<script type='text/javascript'>alert('这篇博客不翼而飞了!');location.href='/Views/Index/Index.aspx'</scritp>");
        }
        if(user_id != article.accountId)
        {
            Response.Write("<script type='text/javascript'>alert('兄弟你要修改别人的文章?');location.href='/Views/Index/Index.aspx'</scritp>");
        }        
        if (!IsPostBack) {
            title.Text = article.title;
            selecttype.Value = article.category;
            mytag.InnerText = article.tag;
            content.InnerText = article.content;
        }         
    }



    protected void Change_Click(object sender, EventArgs e)
    {
        string blogtitle = title.Text;
        string blogcontent = content.Value;
        string blogtags = mytag.Value;
        string blogtype = selecttype.Value;
        if (blogcontent == "")
        {
            Response.Write("<script type='text/javascript'>alert('你的博客内容没有了')</scritp>");
            return;
        }
        if (blogtitle == "")
        {
            Response.Write("<script type='text/javascript'>alert('你把博客的标题丢掉了')</scritp>");
            return;
        }
        if (blogtags == "")
        {
            Response.Write("<script type='text/javascript'>alert('你是不是忘记给文章添加标签了')</scritp>");
            return;
        }
        //插入文章接口
        article.title = blogtitle;
        article.content = blogcontent;
        article.tag = blogtags;
        article.category = blogtype;
        article.releaseTime = DateTime.Now;
        article.introduction = article.content.Length > 100 ? article.content.Substring(0, 100) : article.content.Substring(0, article.content.Length - 1);
        bool flag = articleDao.Update(article);
        if (flag == true)
        {
            Response.Write("<script type='text/javascript'>alert('修改文章成功！');setTimeout(function(){location.href='/Views/Index/Index.aspx'},3000);</script>");
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('修改文章失败！');</scritp>");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //【1】判断文件是否存在
        if (!this.ful.HasFile)
        {
            this.ltaMsg.Text = "<script type='text/javascript'>alert('未选择需要上传的文件')</script>";
            return;
        }
        //【2】获取文件大小，判断是否符合设置要求（变成MB）
        double fileLength = this.ful.FileContent.Length / (1024.0 * 1024.0);
        //获取配置文件中上传文件大小的限制
        double limitedLength = Convert.ToDouble(System.Configuration.ConfigurationManager.AppSettings["PhysicsObjectLength"]);
        limitedLength = limitedLength / 1024.0;//转换成MB单位
                                               //判断实际文件大小是否符合要求
        if (fileLength > limitedLength)
        {
            //  this.ltaMsg.Text = "上传文件大小不能超过" + limitedLength + "MB";
            this.ltaMsg.Text = "<script type='text/javascript'>alert('上传文件最大不能超过" + limitedLength + "M')</script>";
            return;
        }
        //【3】获取文件名，判断文件扩展是否符合要求
        string fileName = this.ful.FileName;
        //判断文件名是否是exe文件
        if (fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower() == "exe")
        {
            this.ltaMsg.Text = "<script type='text/javascript'>alert('上传文件不能是exe文件')</script>";
            return;
        }
        //修改文件名  
        fileName = DateTime.Now.ToString("yyyyMMddhhssms") + "_" + fileName;

        //【4】获取服务器文件夹路径
        string path = Server.MapPath("~/Images/Blog/upload");
        //【5】上传文件
        try
        {
            this.ful.SaveAs(path + "/" + fileName);
            string pathfile = "";
            if (imglink.Value == "https://")
            {
                pathfile = "![](http://localhost:56235/Images/Blog/upload" + "/" + fileName + ")";
            }
            else
            {
                pathfile = "[![](http://localhost:56235/Images/Blog/upload/" + fileName + ")]" + "(" + imglink.Value + " " + "'" + imgdes.Value + "')";
            }
            content.InnerText = content.InnerText + pathfile;
        }
        catch (Exception ex)
        {
            this.ltaMsg.Text = "<script type='text/javascript'>alert('文件上传失败！" + ex.Message + "')</script>";
        }
    }
}