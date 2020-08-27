using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.DAL
{
    public class AccountDao : DbDao<Account>
    {
        public AccountDao() { }

        public Account GetSingle(Guid accountId)
        {
            return GetSingle(it => it.accountId == accountId);
        }

        public Account GetSingle(string email)
        {
            return GetSingle(it => it.email == email);
        }

        public bool IsAccountRepeat(Guid accountId)
        {
            return GetSingle(accountId) == null ? false : true;
        }

        public bool IsEmailRepeat(string email)
        {
            return GetSingle(email) == null ? false : true;
        }
    }
}
