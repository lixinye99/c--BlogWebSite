using BlogWebSite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.DAL
{
    public class FollowDao : DbDao<Follow>
    {
        public FollowDao() { }

        public Follow GetSingle(Guid accountId, Guid fanId)
        {
            return GetSingle(it => it.accountId == accountId && it.fanId == fanId);
        }

        /// <summary>
        /// 获取一个账号的所有关注者。
        /// </summary>
        public List<Follow> GetListByAccount(Guid accountId)
        {
            return GetList(it => it.accountId == accountId);
        }

        /// <summary>
        /// 获取一个账号关注的所有人。
        /// </summary>
        public List<Follow> GetListByFan(Guid fanId)
        {
            return GetList(it => it.fanId == fanId);
        }

        public int GetCountOfAccount(Guid accountId)
        {
            return GetCount(it => it.accountId == accountId);
        }

        public int GetCountOfFan(Guid fanId)
        {
            return GetCount(it => it.fanId == fanId);
        }
    }
}
