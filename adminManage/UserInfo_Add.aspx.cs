using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class UserInfo_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_Click(object sender, EventArgs e)//密码验证语句
    {
        using (SqlConnection conn = new SqlConnection(SqlHelper._ConnectionString))
        {

            string strSql = string.Format("select count(*) from member where uname='{0}'", TextBox_Name.Text);
            if (Convert.ToInt32(SqlHelper.ExecuteScalar(strSql)) > 0)
            {
                MyHelper.JsAlert(this, "登录帐户已经存在");
                return;
            }
            strSql = string.Format(@"INSERT INTO member (uname,upassword,urealname,ulevel )" + " VALUES ( '{0}','{1}' ,'{2}' , '{3}')"
                                            , this.TextBox_Name.Text
                                            , this.TextBox_Pwd.Text
                                            , this.TextBox_RealName.Text
                                            , this.Seletlevel.SelectedItem.Text
                                            );
            SqlHelper.ExecuteNonQuery(strSql);
            MyHelper.JsAlert(this, "UserInfo_Manage.aspx", "用户添加成功！");
        }

    }
}