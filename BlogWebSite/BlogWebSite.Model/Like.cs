using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.Model
{
    [SugarTable("likes")]
    public class Like : SugarBase
    {
        public Like() { }

        [SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "article_id")]
        public Guid articleId { get; set; }
        [SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "account_id")]
        public Guid accountId { get; set; }
    }
}
