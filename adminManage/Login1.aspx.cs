using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class adminManage_Login1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string StrSQL = string.Format("select idx,ulevel,urealname from member where uname='{0}' and upassword='{1}'", this.Uname.Value, this.Upass.Value);
        SqlDataReader dr = SqlHelper.ExecuteReader(CommandType.Text, StrSQL);
        if (dr.Read())
        {
            //把用户信息加入到Session
            Session["idx"] = dr["idx"].ToString();              //用户Idx
            Session["userName"] = dr["urealname"].ToString();    //用户名
            Session["userLevel"] = dr["ulevel"].ToString();  //用户级别

            Response.Redirect("Default.aspx");
        }
        else
        {
            MyHelper.JsAlert(this, "用户名或密码错误，请重新输入!");
            return;
        }
    }
}