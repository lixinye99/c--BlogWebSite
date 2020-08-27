using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.Model
{
    [SugarTable("article")]
    public class Article : SugarBase
    {
        public Article() { }

        [SugarColumn(IsPrimaryKey = true, IsIdentity =false, ColumnName = "article_id")]
        public Guid articleId { get; set; }
        [SugarColumn(ColumnName = "account_id")]
        public Guid accountId { get; set; }
        [SugarColumn(ColumnName = "release_time")]
        public DateTime releaseTime { get; set; }
        [SugarColumn]
        public string title { get; set; }

        private string _content;
        [SugarColumn]
        public string content { 
            get { return _content; }
            set {
                _content = value;
                if (_content.Length >= 100) {
                    introduction = _content.Substring(0, 100);
                } else {
                    introduction = _content;
                }
            }
        }
        [SugarColumn]
        public int favorites { get; set; }
        [SugarColumn]
        public int likes { get; set; }
        [SugarColumn]
        public string category { get; set; }
        [SugarColumn]
        public string tag { get; set; }
        [SugarColumn]
        public string introduction { get; set; }

        /// <summary>
        /// 生成一个空的文章，带有ArticleId。
        /// accountId需要自行设置。
        /// </summary>
        public static Article GetEmptyArticle()
        {
            Article article = new Article();
            article.articleId = Guid.NewGuid();
            article.favorites = 0;
            article.likes = 0;
            return article;
        }
        /// <summary>
        /// 生成一个带有accountId的文章。
        /// </summary>
        public static Article GetEmptyArticle(Guid accountId)
        {
            Article article = GetEmptyArticle();
            article.accountId = accountId;
            return article;
        }

        /// <summary>
        /// 包含文章的部分信息，用于文章列表显示。
        /// </summary>
        public class ArticleBase : SugarBase
        {
            public ArticleBase() { }

            [SugarColumn(ColumnName = "article_id")]
            public Guid articleId { get; set; }
            [SugarColumn(ColumnName = "release_time")]
            public DateTime releaseTime { get; set; }
            [SugarColumn]
            public string title { get; set; }
            [SugarColumn]
            public string category { get; set; }
            [SugarColumn]
            public string introduction { get; set; }
        }
    }
}
