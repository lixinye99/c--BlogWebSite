using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.Model
{
    [SugarTable("follow")]
    public class Follow : SugarBase
    {
        public Follow() { }

        [SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "account_id")]
        public Guid accountId { get; set; }
        [SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "fan_id")]
        public Guid fanId { get; set; }
    }
}
