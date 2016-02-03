using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class adminManage_Text : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //绑定超链接
        string sql = "select * from class where isshow = 'YES'";
        DataSet ds = SqlHelper.ExecuteDataset(sql);
        Repeater_Class.DataSource = ds;
        Repeater_Class.DataBind();
        //绑定案例
        sql = "select *,left(elementtext,30)+'...' as introduce from element";
        DataSet ds1 = SqlHelper.ExecuteDataset(sql);
        Repeater_Element.DataSource = ds1;
        Repeater_Element.DataBind();
    }
    protected void LbtClass_OnCommand(object sender, CommandEventArgs e)
    {
        string key = e.CommandArgument.ToString();
        string sql = string.Format("select *,left(elementtext,30)+'...' as introduce from element where classbelong='{0}'", key);
        DataSet ds = SqlHelper.ExecuteDataset(sql);
        Repeater_Element.DataSource = ds;
        Repeater_Element.DataBind();
    }
    protected void LbtAll_OnCommand(object sender, EventArgs e)
    {
        string sql = "select *,left(elementtext,30)+'...' as introduce from element";
        DataSet ds = SqlHelper.ExecuteDataset(sql);
        Repeater_Element.DataSource = ds;
        Repeater_Element.DataBind();
    }
}