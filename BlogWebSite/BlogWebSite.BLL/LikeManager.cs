using BlogWebSite.DAL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.BLL
{
    public class LikeManager
    {
        private LikeDao dao = new LikeDao();

        public LikeManager() { }

        public bool Save(Like like)
        {
            return dao.Insert(like);
        }
        public bool Delete(Like like)
        {
            return dao.Delete(like);
        }
    }
}
