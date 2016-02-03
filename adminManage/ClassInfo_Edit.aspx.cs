using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ClassInfo_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["Idx"]);
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Request["Idx"]))
            {
                Response.Redirect("ClassInfo_Manage.aspx");
            }
            string SelectSql = string.Format("select * from class where idx ={0}",id);
            DataSet ds = SqlHelper.ExecuteDataset(SelectSql);
            if (ds.Tables[0].Rows.Count>0)
            {
                var iRow = ds.Tables[0].Rows[0];
                TextBox_ClassName.Text = iRow["classname"].ToString();
                TextBox_Sort.Text = iRow["rank"].ToString();
                Seletlevel.SelectedValue = iRow["isshow"].ToString();
                
            }
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["Idx"]);
            string StrSQL = "select count(*) from class where classname='" + TextBox_ClassName.Text + "'and idx !='" + id + "'";
            if (Convert.ToInt32(SqlHelper.ExecuteScalar(StrSQL)) > 0)
            {
                MyHelper.JsAlert(this, "类别信息已经存在");
                return;
            }
            StrSQL = string.Format("select count(*) from class where rank='{0}' and idx!='{1}'", TextBox_Sort.Text,id);
            if (Convert.ToInt32(SqlHelper.ExecuteScalar(StrSQL)) > 0)
            {
               MyHelper.JsAlert(this, "排序不能重复");
               return;
            }
            StrSQL = string.Format(@"UPDATE  [class] SET classname= '{0}' ,rank='{1}' ,isshow='{2}' WHERE idx={3}"
                                            , this.TextBox_ClassName.Text
                                            , int.Parse(this.TextBox_Sort.Text)
                                            , this.Seletlevel.SelectedItem.Value
                                            , id
                                            );
            SqlHelper.ExecuteNonQuery(StrSQL);
            MyHelper.JsAlert(this, "ClassInfo_Manage.aspx", "类别信息编辑成功！");
    }
}