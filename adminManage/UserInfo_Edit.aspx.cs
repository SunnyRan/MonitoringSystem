using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class UserInFo_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request["Idx"];
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(id))
                {
                    Response.Redirect("UserInfo_Manage.aspx");
                }
                DataSet dss = SqlHelper.ExecuteDataset(string.Format("select * from member where idx={0} ", id));
                if (dss.Tables[0].Rows.Count > 0)
                {

                    var iRow = dss.Tables[0].Rows[0];


                    DataRow MyRow = dss.Tables[0].Rows[0];
                    TextBox_Name.Text = MyRow[1].ToString();
                    TextBox_RealName.Text = MyRow[3].ToString();
                    Seletlevel.SelectedValue = MyRow[4].ToString();
                }
            }
        }
    }


    protected void submit_Click(object sender, EventArgs e)
    {
        string id = Request["Idx"];
        string strSql = string.Format(@"UPDATE  member SET uname='{0}',upassword='{1}',urealname='{2}',ulevel='{3}' WHERE idx={4}"
                                    , this.TextBox_Name.Text
                                    , this.TextBox_Pwd.Text
                                    , this.TextBox_RealName.Text
                                    , this.Seletlevel.SelectedItem.Text
                                    , id
                                    );//图片
        SqlHelper.ExecuteNonQuery(strSql);
        MyHelper.JsAlert(this, "UserInfo_Manage.aspx", "用户信息编辑成功！");

    }
}