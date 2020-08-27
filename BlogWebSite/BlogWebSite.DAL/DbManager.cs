using BlogWebSite.Model;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.DAL
{
    /// <summary>
    /// 用于获取数据库相关对象。
    /// 基于“多用组合，少用继承”原则，
    /// 将数据库获取提取出作为组合使用。
    /// </summary>
    public class DbManager
    {
        /// <summary>
        /// 获取数据库(SqlSugarClient)。
        /// </summary>
        /// <returns>SqlSugarClient: 相当于db，能够进行数据库操作</returns>
        public static SqlSugarClient GetClient()
        {
            return new SqlSugarClient(new ConnectionConfig() {
                ConnectionString = ConfigurationManager.ConnectionStrings["netblog"].ConnectionString,
                DbType = DbType.MySql,
                IsAutoCloseConnection = true,
                InitKeyType = InitKeyType.Attribute
            });
        }
        
        /// <summary>
        /// 获取数据表(SimpleClient)。
        /// </summary>
        /// <typeparam name="T">
        /// 要获取的表的实体类。
        /// 必须为有公共无参构造函数的类，且实现SugarBase接口。
        /// </typeparam>
        /// <returns>SimpleClient: 相当于表，能够进行表操作</returns>
        public static SimpleClient<T> GetSimpleClient<T> () where T : class, SugarBase, new()
        {
            return new SimpleClient<T>(GetClient());
        }
    }
}
