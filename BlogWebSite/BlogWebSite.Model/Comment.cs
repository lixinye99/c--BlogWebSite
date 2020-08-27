using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.Model
{
    [SugarTable("comments")]
    public class Comment : SugarBase
    {
        public Comment() { }

        [SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "comment_id")]
        public Guid commentId { get; set; }
        [SugarColumn(ColumnName = "article_id")]
        public Guid articleId { get; set; }
        [SugarColumn(ColumnName = "account_id")]
        public Guid accountId { get; set; }
        [SugarColumn]
        public string content { get; set; }
        [SugarColumn(ColumnName = "release_time")]
        public DateTime releaseTime { get; set; }

        /// <summary>
        /// 生成一个空的评论，带有commentId。
        /// articleId和accountId需要自行设置。
        /// </summary>
        public static Comment GetEmptyComment()
        {
            Comment comment = new Comment();
            comment.commentId = Guid.NewGuid();
            return comment;
        }

        /// <summary>
        /// 生成一个带有acrticleId和accountId的评论。
        /// </summary>
        public static Comment GetEmptyComment(Guid articleId, Guid accountId)
        {
            Comment comment = GetEmptyComment();
            comment.articleId = articleId;
            comment.accountId = accountId;
            return comment;
        }

        /// <summary>
        /// 包含文章标题的评论类。
        /// </summary>
        public class CommentWithTitle : SugarBase
        {
            public CommentWithTitle() { }

            public Guid commentId { get; set; }
            public Guid commentArticleId { get; set; }
            public string content { get; set; }
            public DateTime commentReleaseTime { get; set; }
            public string articleTitle { get; set; }
        }
    }
}
