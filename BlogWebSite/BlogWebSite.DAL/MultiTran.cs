using BlogWebSite.Model;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.DAL
{
    public class MultiTran
    {
        private SqlSugarClient db = DbManager.GetClient();

        public MultiTran() { }

        /// <summary>
        /// 删除文章，即相关联的内容。
        /// </summary>
        public void DeleteArticle(Guid articleId)
        {
            try {
                db.Ado.BeginTran();
                //删除点赞
                db.Deleteable<Like>(articleId).ExecuteCommand();
                //删除收藏
                db.Deleteable<Favorite>(articleId).ExecuteCommand();
                //删除评论
                db.Deleteable<Comment>(it => it.articleId == articleId).ExecuteCommand();
                //删除文章
                db.Deleteable<Article>(articleId).ExecuteCommand();
                db.Ado.CommitTran();
            } catch (Exception e) {
                db.Ado.RollbackTran();
                throw e;
            }
        }
    }
}
