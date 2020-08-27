using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.Model
{
    [SugarTable("account")]
    public class Account : SugarBase
    {
        public Account() { }

        [SugarColumn(IsPrimaryKey = true, IsIdentity =false, ColumnName = "account_id")]
        public Guid accountId { get; set; }
        [SugarColumn]
        public string email { get; set; }
        [SugarColumn]
        public string password { get; set; }

        /// <summary>
        /// 生成一个空的的账号，带有accountId。
        /// </summary>
        public static Account GetEmptyAccount()
        {
            Account account = new Account();
            account.accountId = Guid.NewGuid();
            return account;
        }
    }
}
