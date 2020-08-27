using BlogWebSite.DAL;
using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.BLL
{
    public class UserManager
    {
        private UserDao dao = new UserDao();

        public UserManager() { }

        #region CUD操作
        public bool Save(User user)
        {
            return dao.Insert(user);
        }
        public bool Update(User user)
        {
            return dao.Update(user);
        }
        public bool Delete(Guid accountId)
        {
            return dao.DeleteById(accountId);
        }
        #endregion
        #region R操作
        public User Read(Guid accountId)
        {
            return dao.GetSingle(accountId);
        }
        /// <summary>
        /// 支持模糊搜索。
        /// </summary>
        public List<User> ReadUsersByName(string name)
        {
            return dao.GetList(name);
        }
        #endregion
        public bool HasUser(Guid accountId)
        {
            return Read(accountId) == null ? false : true;
        }
    }
}
