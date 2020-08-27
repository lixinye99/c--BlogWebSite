using BlogWebSite.Model;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BlogWebSite.DAL
{
    /// <summary>
    /// 实现基本的增删改查，
    /// 子类Dao可以直接使用，
    /// 也可以自定义函数。
    /// </summary>
    /// <typeparam name="T">
    /// 要操作的表的实体类。
    /// 必须为有公共无参构造函数的类，且实现SugarBase接口。
    /// </typeparam>
    public class DbDao<T> where T : class, SugarBase, new()
    {
        /// <summary>
        /// 能提供基于SqlSugar的最灵活的数据库操作。
        /// </summary>
        public SimpleClient<T> currentTable { get; set; }

        public DbDao()
        {
            currentTable = DbManager.GetSimpleClient<T>();
        }

        #region 能够直接使用
        /*插入*/
        public bool Insert(T obj)
        {
            return currentTable.Insert(obj);
        }
        public bool InsertAll(List<T> objs)
        {
            return currentTable.InsertRange(objs);
        }
        public bool InsertAll(T[] objs)
        {
            return currentTable.InsertRange(objs);
        }
        /*更新*/
        public bool Update(T obj)
        {
            return currentTable.Update(obj);
        }
        public bool UpdateAll(List<T> objs)
        {
            return currentTable.UpdateRange(objs);
        }
        public bool UpdateAll(T[] objs)
        {
            return currentTable.UpdateRange(objs);
        }
        /*删除*/
        public bool Delete(T obj)
        {
            return currentTable.Delete(obj);
        }
        public bool DeleteById(dynamic id)
        {
            return currentTable.DeleteById(id);
        }
        /*查询*/
        public List<T> GetAll()
        {
            return currentTable.GetList();
        }
        /// <summary>
        /// 获取一页的列。
        /// </summary>
        public List<T> GetPage(int pageIndex, int pageSize)
        {
            return currentTable.AsQueryable().ToPageList(pageIndex, pageSize);
        }
        #endregion
        #region 需要编写linq表达式
        /*删除*/
        public bool DeleteAll(Expression<Func<T, bool>> whereExpression)
        {
            return currentTable.Delete(whereExpression);
        }
        /*查询*/
        /// <summary>
        /// 给定条件获取一个对象。
        /// 条件必须是主键或唯一约束的列。
        /// </summary>
        /// <param name="whereExpression">查询条件</param>
        /// <example>it => it.id == id</example>
        public T GetSingle(Expression<Func<T, bool>> whereExpression)
        {
            return currentTable.GetSingle(whereExpression);
        }
        /// <summary>
        /// 给定条件获取一个链表。
        /// </summary>
        /// <param name="whereExpression">查询条件</param>
        /// <example>it => it.name == "xx"</example>
        public List<T> GetList(Expression<Func<T, bool>> whereExpression)
        {
            return currentTable.GetList(whereExpression);
        }
        /// <summary>
        /// 获取查询到的数据量。
        /// </summary>
        /// <param name="whereExpression">查询条件</param>
        /// <example>it => it.id == id</example>
        public int GetCount(Expression<Func<T, bool>> whereExpression)
        {
            return currentTable.Count(whereExpression);
        }
        #endregion
    }
}
