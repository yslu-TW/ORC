using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

/// <summary>
/// DAL 的摘要描述
/// </summary>
public class DAL
{
    /// <summary>
    /// 抓取data
    /// </summary>
    /// <returns></returns>
    public DataTable GetData(string sql)
    {
        //連接字串
        String conString = System.Configuration.ConfigurationManager.AppSettings["ConnString"];
        //取得MySQLConnection
        MySqlConnection conn = new MySqlConnection();

        conn.ConnectionString = conString;

        DataTable dt = new DataTable();
        MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
        adapter.Fill(dt);
        return dt;
    }
    /// <summary>
    /// 抓取正隆的row data
    /// </summary>
    /// <returns></returns>
    public DataTable GetCLData()
    {
        string sql = @"SELECT oDate,oTime,Millitm,HZ,KWH,NET_P,PF,PSUM,PT101A,PT102,TT101A,TT102,TT103,TT106 FROM OrcMS.parameter order by oDate desc,oTime desc limit 1000";
        //連接字串
        String conString = System.Configuration.ConfigurationManager.AppSettings["ConnString"];
        //取得MySQLConnection
        MySqlConnection conn = new MySqlConnection();

        conn.ConnectionString = conString;

        DataTable dt = new DataTable();
        MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
        adapter.Fill(dt);
        return dt;
    }
    /// <summary>
    /// 抓取正隆近10日日期
    /// </summary>
    /// <returns></returns>
    public DataTable GetCLDate(string date)
    {
        string sql = @"select oDate from OrcMS.parameter  where docno >= @date group by oDate desc;";
        //連接字串
        String conString = System.Configuration.ConfigurationManager.AppSettings["ConnString"];
        //取得MySQLConnection
        MySqlConnection conn = new MySqlConnection();

        conn.ConnectionString = conString;
        DataTable dt = new DataTable();
        MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
        adapter.SelectCommand.Parameters.AddWithValue("@date",date);
        adapter.Fill(dt);
        return dt;
    }
    /// <summary>
    /// 抓取正隆近10日平均淨發電功率
    /// </summary>
    /// <returns></returns>
    public DataTable GetCLnet()
    {
        string sql = @"SELECT docno ,truncate(avg(NET_P),2) as net,truncate(sum(NET_P),2) as nets FROM OrcMS.parameter group by docno order by docno desc limit 10;";
        //連接字串
        String conString = System.Configuration.ConfigurationManager.AppSettings["ConnString"];
        //取得MySQLConnection
        MySqlConnection conn = new MySqlConnection();

        conn.ConnectionString = conString;

        DataTable dt = new DataTable();
        MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
        adapter.Fill(dt);
        return dt;
    }
}