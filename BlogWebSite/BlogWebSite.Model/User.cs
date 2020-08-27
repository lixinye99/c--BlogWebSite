using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.Model
{
    [SugarTable("users")]
    public class User : SugarBase
    {
        public User() { }

        [SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "account_id")]
        public Guid accountId { get; set; }
        [SugarColumn]
        public string name { get; set; }
        [SugarColumn]
        public string gender { get; set; }
        [SugarColumn]
        public DateTime birth { get; set; }
        [SugarColumn]
        public string introduction { get; set; }
        [SugarColumn]
        public string image { get; set; }

        /// <summary>
        /// 生成一个空的用户。
        /// accountId需要自行设置。
        /// </summary>
        public static User GetEmptyUser()
        {
            User user = new User();
            return user;
        }
        /// <summary>
        /// 生成一个带有accountId的用户。
        /// </summary>
        public static User GetEmptyUser(Guid accountId)
        {
            User user = GetEmptyUser();
            user.accountId = accountId;
            return user;
        }
    }
}
