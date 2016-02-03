using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
///MyDB 的摘要说明
/// </summary>
public class MyDB
{
	public MyDB()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    public static SqlConnection GetConn()
    {
        string ConnStr = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
        SqlConnection conn = new SqlConnection(ConnStr);
        return conn;
    }
    /// <summary>
    /// 获得搜索值
    /// </summary>
    /// <param name="strSQL">SQL语句</param>
    /// <param name="conn">连接</param>
    /// <param name="sorting"></param>
    /// <returns></returns>
    public static string GetScalar(string strSQL)
    {
        SqlConnection conn = MyDB.GetConn();
        conn.Open();
        SqlCommand cmd = new SqlCommand(strSQL, conn);
        string rank = "";
        rank = cmd.ExecuteScalar().ToString();
        conn.Close();
         return rank;
    }
    public static int ExecuteNonQuery(string strSQL, SqlConnection conn)
    {
        int count = -1;
        conn.Open();
        SqlCommand cmd = new SqlCommand(strSQL,conn);
         count= cmd.ExecuteNonQuery();
         conn.Close();
         return count;
    }
}