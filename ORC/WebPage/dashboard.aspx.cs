using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Data;
using System.Text;

public partial class WebPage_dashboard : System.Web.UI.Page
{
    DAL dal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            stop();
        }
    }
    protected void BindData()
    {
        DataTable dt = dal.GetCLnet();
        DataTable dt1 = dal.GetCLDate(dt.Rows[dt.Rows.Count-1]["docno"].ToString());
        DataTable dt_date = dal.GetData(@"SELECT oDate,oTime FROM OrcMS.parameter order by id desc limit 1");
        string lastdate = "最新資料時間: "+dt_date.Rows[0]["oDate"].ToString()+ dt_date.Rows[0]["oTime"].ToString();
        List<string> net = new List<string>();
        List<string> tnet = new List<string>();
        List<string> date = new List<string>();
        for (int i=dt.Rows.Count-1;i>=0;i--)
        {
            net.Add(dt.Rows[i]["net"].ToString());
            tnet.Add(dt.Rows[i]["nets"].ToString());
        }
        for (int i = dt1.Rows.Count - 1; i >= 0; i--)
        {
            date.Add(dt1.Rows[i]["oDate"].ToString());
        }
        netarray = net.ToArray();
        datearray = date.ToArray();
        tnetarray = tnet.ToArray();
        lbl_date1.Text = lastdate;
        lbl_date2.Text = lastdate;
        lbl_date3.Text = lastdate;
    }
    protected void stop()
    {
        DataTable dt = dal.GetData(@"SELECT oDate,max(id) as id FROM OrcMS.parameter where NET_P=0 group by oDate order by id desc limit 10;");
        DataTable dt1 = new DataTable();
        List<string> stopdate = new List<string>();
        List<string> stoptime = new List<string>();
        for (int i = dt.Rows.Count - 1; i >= 0; i--)
        {
            stopdate.Add(dt.Rows[i]["oDate"].ToString());
            dt1 = dal.GetData(@"select min(oTime) as min,max(oTime) as max FROM OrcMS.parameter where NET_P=0 and oDate='"+ dt.Rows[i]["oDate"].ToString() + " '");
            string max = dt1.Rows[0]["max"].ToString();
            string min = dt1.Rows[0]["min"].ToString();
            TimeSpan ts = TimeSpan.Parse(max)- TimeSpan.Parse(min);
            string time = Math.Round((ts.TotalMinutes),2).ToString();
            stoptime.Add(time);
        }
        stopdatearray = stopdate.ToArray();
        stoptimearray = stoptime.ToArray();
    }
    public static class JavaScript
    {
        public static string Serialize(object o)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(o);
        }
    }
    //平均淨發電功率
    protected string[] netarray = { };
    //當日累積淨發電功率
    protected string[] tnetarray = { };
    //平均淨發電功率日期
    protected string[] datearray = { };
    //停機日期
    protected string[] stopdatearray = { };
    //停機時間
    protected string[] stoptimearray = { };
}