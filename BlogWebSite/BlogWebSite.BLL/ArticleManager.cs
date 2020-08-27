using BlogWebSite.DAL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.BLL
{
    /// <summary>
    /// 进行逻辑处理和Dao操作的类。
    /// 显示层应调用Manager类，而不要直接调用Dao类。
    /// </summary>
    public class ArticleManager
    {
        private ArticleDao dao = new ArticleDao();

        public ArticleManager() { }

        #region CUD操作
        public bool Save(Article article)
        {
            return dao.Insert(article);
        }
        public bool Update(Article article)
        {
            return dao.Update(article);
        }
        /// <summary>
        /// 需要删除相关的评论、收藏、点赞。
        /// </summary>
        public bool Delete(Guid articleId)
        {
            MultiTran mt = new MultiTran();
            try {
                mt.DeleteArticle(articleId);
            } catch (Exception e) {
                return false;
            }
            return true;
        }
        #endregion
        #region R操作
        public Article GetArticle(Guid articleId)
        {
            return dao.GetSingle(articleId);
        }
        public List<Article.ArticleBase> GetInfoOfAccount(Guid accountId)
        {
            return dao.GetBaseOfAccount(accountId);
        }
        /// <summary>
        /// 支持模糊查询，
        /// </summary>
        public List<Article.ArticleBase> GetInfoOfTitle(string title)
        {
            return dao.GetBaseOfTitleFuzzy(title);
        }
        public List<Article.ArticleBase> GetInfoOfCategory(string category)
        {
            return dao.GetBaseOfCategory(category);
        }
        /// <summary>
        /// 支持模糊搜搜
        /// </summary>
        public List<Article.ArticleBase> GetInfoOfTag(string tag)
        {
            return dao.GetBaseOfTagFuzzy(tag);
        }
        public List<Article.ArticleBase> GetInfoOfAccountInPage(Guid accountId, int pageIndex, int pageSize)
        {
            return dao.GetBasePage(it => it.accountId == accountId, pageIndex, pageSize);
        }
        public int GetCountOfAccount(Guid accountId)
        {
            return dao.GetArticleCountOfAccount(accountId);
        }
        #endregion
    }
}
