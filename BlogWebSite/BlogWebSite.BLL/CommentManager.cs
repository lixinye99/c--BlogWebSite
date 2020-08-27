using BlogWebSite.DAL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.BLL
{
    public class CommentManager
    {
        private CommentDao dao = new CommentDao();

        public CommentManager() { }

        #region CD操作
        public bool Save(Comment comment)
        {
            return dao.Insert(comment);
        }
        public bool Delete(Guid commentId)
        {
            return dao.DeleteById(commentId);
        }
        #endregion
        #region R操作
        public List<Comment> GetCommentOfArticle(Guid articleId)
        {
            return dao.GetListByArticle(articleId);
        }
        public List<Comment.CommentWithTitle> GetCommentOfAccount(Guid accountId)
        {
            return dao.GetListByAccount(accountId);
        }
        public List<Comment.CommentWithTitle> GetCommentPageOfAccount(Guid accountId, int pageIndex, int pageSize)
        {
            return dao.GetPageByAccount(accountId, pageIndex, pageSize);
        }
        public int GetCountOfAccount(Guid accountId)
        {
            return dao.GetCommentCountOfAccount(accountId);
        }
        #endregion
    }
}
