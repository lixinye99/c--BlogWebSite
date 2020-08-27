using BlogWebSite.Model;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.DAL
{
    public class CommentDao : DbDao<Comment>
    {
        public CommentDao() { }

        public Comment GetSingle(Guid commentId)
        {
            return GetSingle(it => it.commentId == commentId);
        }

        public List<Comment> GetListByArticle(Guid articleId)
        {
            return GetList(it => it.articleId == articleId);
        }

        /// <summary>
        /// 多表查询，返回附带文章标题的评论。
        /// </summary>
        public List<Comment.CommentWithTitle> GetListByAccount(Guid accountId)
        {
            return currentTable.AsSugarClient().Queryable<Comment, Article>((c, a) => new Object[] {
                JoinType.Left, c.articleId == a.articleId}).Where(c => c.accountId == accountId).
                Select<Comment.CommentWithTitle>((c, a) => new Comment.CommentWithTitle {
                    commentId = c.commentId, commentArticleId = a.articleId, content = c.content, 
                    commentReleaseTime = c.releaseTime, articleTitle = a.title}).ToList();
        }

        public List<Comment.CommentWithTitle> GetPageByAccount(Guid accountId, int pageIndex, int pageSize)
        {
            return currentTable.AsSugarClient().Queryable<Comment, Article>((c, a) => new Object[] {
                JoinType.Left, c.articleId == a.articleId}).Where(c => c.accountId == accountId).
                Select<Comment.CommentWithTitle>((c, a) => new Comment.CommentWithTitle {
                    commentId = c.commentId,
                    commentArticleId = a.articleId,
                    content = c.content,
                    commentReleaseTime = c.releaseTime,
                    articleTitle = a.title
                }).ToPageList(pageIndex, pageSize);
        }

        public bool DeleteAll(Guid articleId)
        {
            return DeleteAll(it => it.articleId == articleId);
        }

        public int GetCommentCountOfAccount(Guid accountId)
        {
            return GetCount(it => it.accountId == accountId);
        }
    }
}
