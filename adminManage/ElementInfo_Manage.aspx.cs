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
            AspNetPager1.AlwaysShow = true;
            AspNetPager1.PageSize = 5;
            RepeaterDataBind();
        }
    }
    private void RepeaterDataBind()
    {
        using (SqlConnection conn = new SqlConnection(SqlHelper._ConnectionString))
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar(GetSql("GetNumber", SortHidden.Value));//记录个数
            SqlDataAdapter dr = new SqlDataAdapter(GetSql("NO", SortHidden.Value), conn);
            DataSet ds = new DataSet();
            dr.Fill(ds, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize, "element");
            this.Repeater1.DataSource = ds.Tables["element"];
            this.Repeater1.DataBind();
        }

    }
        protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        RepeaterDataBind();
    }
        protected string GetSql(string IsNumber, string sort)
        {
            string Sql = "";
            if (IsNumber == "GetNumber")
            {
                Sql = "select count(*) from element where 1=1 ";
            }
            else if (IsNumber == "NO")
            {

                Sql = "select *,left(elementtext,50)+'...' as Introduction,CONVERT(varchar(20), createdate, 120) as time from element where 1=1 ";
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
                Sql = Sql + string.Format(" and elementname like '%{0}%' or classbelong like '%{0}%' or rank like '%{0}%' ", TextBox_Key.Text);
            }
            if (IsNumber == "NO")
            {
                if (sort == "desc")
                {
                    Sql = Sql + " order by " + testHidden.Value + " desc ";
                }
                else if (sort == "asc")
                {
                    Sql = Sql + " order by " + testHidden.Value + " asc ";
                }
            }
            return Sql;
        }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string sql = "delete from element where idx= " + e.CommandArgument;
            if (SqlHelper.ExecuteNonQuery(sql) > 0)
            {

                Response.Write("<script>alert('删除成功!');window.location.href='ElementInfo_Manage.aspx';</script>");
                return;
            }
            else
            {
                Response.Write("<script>alert('删除失败!');window.location.href='ElementInfo_Manage.aspx';</script>");
                return;
            }
        }
        else if (e.CommandName == "update")
        {
            Response.Redirect("ElementInfo_edit.aspx?passValue=" + e.CommandArgument);
        }
        else if (e.CommandName == "sort")
        {
            RepeaterDataBind();
        }
    }

    protected void Button_Select_Click(object sender, EventArgs e)
    {
        AspNetPager1.CurrentPageIndex = 1;
        RepeaterDataBind();
    }
}