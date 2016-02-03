using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //实现分页
                AspNetPager1.AlwaysShow = true;
                AspNetPager1.PageSize = 5;
                RepeaterDataBind();
        }
    }
    private void RepeaterDataBind()
    {
        //分页绑定
        using (SqlConnection conn = new SqlConnection(SqlHelper._ConnectionString))
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar(GetSql("GetNumber", "asc"));//记录个数
            SqlDataAdapter dr = new SqlDataAdapter(GetSql("NO",SortHidden.Value), conn);
            DataSet ds = new DataSet();
            dr.Fill(ds, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize, "member");
            this.Repeater1.DataSource = ds.Tables["member"];
            this.Repeater1.DataBind();
        }
    }
    protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        RepeaterDataBind();
    }


    protected void Button_Select_Click(object sender, EventArgs e)
    {
        AspNetPager1.CurrentPageIndex = 1;
        RepeaterDataBind();
    }
    /// <summary>
    /// 获取SQL语句
    /// </summary>
    /// <param name="IsNumber">NO获得数据内容，GetNumber获取数据数量</param>
    /// <param name="sort">desc倒序排列，asc正序排列,获取数量时无影响</param>
    /// <returns></returns>
    protected string GetSql(string IsNumber,string sort)
    {
        string Sql = "";
        if (IsNumber == "GetNumber")
        {
            Sql = "select count(*) from member where 1=1 ";
        }
        else if (IsNumber == "NO")
        {

            Sql = "select *,CONVERT(varchar(20), createdate, 120) as time from member where 1=1 ";
        }
        if (txtStartDate.Text != "")
        {
            Sql = Sql + string.Format(" and createdate >= '{0}' ", txtStartDate.Text);
        }
        if (txtEndDate.Text != "")
        {
            Sql = Sql + string.Format(" and createdate <= '{0}'", txtEndDate.Text);
        }
        if (TextBox_Key.Text != "")
        {
            Sql = Sql + string.Format(" and urealname like '%{0}%' or ulevel like '%{0}%' or uname like '%{0}%' ", TextBox_Key.Text);
        }
        if (IsNumber == "NO")
        {
            if (sort == "desc")
            {
                Sql = Sql + " order by createdate desc ";
            }
            else if( sort == "asc")
            {
                Sql = Sql + " order by createdate asc ";
            }
        }
        return Sql;
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string sql = "delete from member where idx= " + e.CommandArgument;
            int row = SqlHelper.ExecuteNonQuery(CommandType.Text, sql);
            if (row > 0)
            {
                MyHelper.JsAlert(this, "UserInfo_Manage.aspx", "删除成功!");
                return;
            }
            else
            {
                MyHelper.JsAlert(this, "UserInfo_Manage.aspx", "删除失败!");
                return;
            }
        }
        else if (e.CommandName == "update")
        {
            Response.Redirect("UserInfo_edit.aspx?Idx=" + e.CommandArgument.ToString());
        }
        else if(e.CommandName == "sort")
        {
            RepeaterDataBind();
        }
    }
}
