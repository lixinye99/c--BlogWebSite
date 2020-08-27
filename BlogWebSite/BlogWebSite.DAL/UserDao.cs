using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.DAL
{
    public class UserDao : DbDao<User>
    {
        public UserDao() { }

        public User GetSingle(Guid accountId)
        {
            return GetSingle(it => it.accountId == accountId);
        }

        /// <summary>
        /// 支持模糊搜索。
        /// </summary>
        public List<User> GetList(string name)
        {
            return GetList(it => it.name.Contains(name));
        }
    }
}
