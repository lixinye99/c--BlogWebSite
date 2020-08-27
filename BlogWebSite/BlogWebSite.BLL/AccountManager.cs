using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BlogWebSite.DAL;
using BlogWebSite.Model;

namespace BlogWebSite.BLL
{
    /// <summary>
    /// 进行逻辑处理和Dao操作的类。
    /// 显示层应调用Manager类，而不要直接调用Dao类。
    /// </summary>
    public class AccountManager
    {
        private AccountDao dao = new AccountDao();

        public AccountManager() { }

        #region CU操作
        public bool Save(Account account)
        {
            return dao.Insert(account);
        }
        public bool Update(Account account)
        {
            return dao.Update(account);
        }
        #endregion
        #region R操作
        public Account Read(Guid accountId)
        {
            return dao.GetSingle(accountId);
        }
        public Account Read(string email)
        {
            return dao.GetSingle(email);
        }
        #endregion

        public bool HasAccount(Guid accountId)
        {
            return dao.IsAccountRepeat(accountId);
        }

        public bool HasSame(string emil)
        {
            return dao.IsEmailRepeat(emil);
        }
    }
}
