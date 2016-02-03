using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

public partial class ClassInfo_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strSql = "select max(rank) from class";
            string rank = "";
            if (SqlHelper.ExecuteScalar(strSql).ToString() == "")
            {
                rank = "1";
            }
            else
            {
                rank = (Convert.ToInt32(SqlHelper.ExecuteScalar(strSql)) + 1).ToString();
            }
            TextBox_Sort.Text = rank;
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
            string StrSQL = string.Format("select count(*) from class where classname='{0}'", TextBox_ClassName.Text);
            if (Convert.ToInt32(SqlHelper.ExecuteScalar(StrSQL)) > 0)
            {
                MyHelper.JsAlert(this, "类别已经存在");
                return;
            }
            StrSQL = string.Format("select count(*) from class where rank='{0}'", TextBox_Sort.Text);
            if (Convert.ToInt32(SqlHelper.ExecuteScalar(StrSQL)) > 0)
            {
                MyHelper.JsAlert(this, "排序不能重复");
                return;
            }
            StrSQL = string.Format(@"INSERT INTO class (classname ,rank ,isshow  )" + " VALUES ( '{0}','{1}' ,'{2}' )"
                                                   , this.TextBox_ClassName.Text
                                                   , int.Parse(this.TextBox_Sort.Text)
                                                   , this.Seletlevel.SelectedItem.Value
                                                   );
            SqlHelper.ExecuteNonQuery(StrSQL);
            MyHelper.JsAlert(this, "ClassInfo_Manage.aspx", "类别信息添加成功！");
    }
}