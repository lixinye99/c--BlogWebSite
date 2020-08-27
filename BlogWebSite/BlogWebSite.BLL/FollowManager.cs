using BlogWebSite.DAL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.BLL
{
    public class FollowManager
    {
        private FollowDao dao = new FollowDao();

        public FollowManager() { }

        public bool Save(Follow follow)
        {
            return dao.Insert(follow);
        }
        public bool Delete(Follow follow)
        {
            return dao.Delete(follow);
        }
    }
}
