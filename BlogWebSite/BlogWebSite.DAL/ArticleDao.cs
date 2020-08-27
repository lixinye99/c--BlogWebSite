using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using BlogWebSite.Model;

namespace BlogWebSite.DAL
{
    /// <summary>
    /// 只有GetSingle才能取得完整的文章，
    /// 查询集合都只会获得文章的部分信息。
    /// 详细可以查看Article.ArticleBase类。
    /// </summary>
    /// <see cref="Article.ArticleBase"/>
    public class ArticleDao : DbDao<Article>
    {
        public ArticleDao() { }

        /// <summary>
        /// 只有GetSingle才能取得完整的文章，
        /// 查询集合都只会获得文章的部分信息。
        /// 详细可以查看Article.ArticleBase类。
        /// </summary>
        /// <see cref="Article.ArticleBase"/>
        public Article GetSingle(Guid articleId)
        {
            return GetSingle(it => it.articleId == articleId);
        }

        #region GetArticleBase
        public List<Article.ArticleBase> GetBaseList(Expression<Func<Article, bool>> whereExpression)
        {
            return currentTable.AsQueryable().Where(whereExpression).
                Select<Article.ArticleBase>().ToList();
        }

        public List<Article.ArticleBase> GetBasePage(Expression<Func<Article, bool>> whereExpression, int pageIndex, int pageSize)
        {
            return currentTable.AsQueryable().Where(whereExpression).OrderBy("release_time").
                Select<Article.ArticleBase>().ToPageList(pageIndex, pageSize);
        }

        public List<Article.ArticleBase> GetBaseOfAccount(Guid accountId)
        {
            return GetBaseList(it => it.accountId == accountId);
        }

        public List<Article.ArticleBase> GetBaseOfCategory(string category)
        {
            return GetBaseList(it => it.category == category);
        }

        /// <summary>
        /// 支持模糊查询
        /// </summary>
        public List<Article.ArticleBase> GetBaseOfTitleFuzzy(string word)
        {
            return GetBaseList(it => it.title.Contains(word));
        }

        /// <summary>
        /// 支持模糊查询
        /// </summary>
        public List<Article.ArticleBase> GetBaseOfTagFuzzy(string tag)
        {
            return GetBaseList(it => it.tag.Contains(tag));
        }
        #endregion
        public int GetArticleCountOfAccount(Guid accountId)
        {
            return GetCount(it => it.accountId == accountId);
        }
    }
}
