using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.DAL
{
    public class LikeDao : DbDao<Like>
    {
        public LikeDao() { }

        public Like GetSingle(Guid articleId, Guid accountId)
        {
            return GetSingle(it => it.articleId == articleId && it.accountId == accountId);
        }

        public List<Like> GetListByArticle(Guid articleId)
        {
            return GetList(it => it.articleId == articleId);
        }

        public List<Like> GetListByAccount(Guid accountId)
        {
            return GetList(it => it.accountId == accountId);
        }

        public bool DeleteAll(Guid articleId)
        {
            return DeleteAll(it => it.articleId == articleId);
        }

        public int GetCountOfArticle(Guid articleId)
        {
            return GetCount(it => it.articleId == articleId);
        }
    }
}
