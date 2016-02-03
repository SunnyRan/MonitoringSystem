using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


using System.Drawing.Imaging;
using ThoughtWorks.QRCode.Codec;
using ThoughtWorks.QRCode.Codec.Data;
using ThoughtWorks.QRCode.Codec.Util;
using System.Drawing;
using System.Text;
using System.Drawing.Drawing2D;

public partial class ElementInfo_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            //绑定类型
            string strSql = "select * from [class] where isshow = 'YES' order by classname ";
            MyHelper.BindDDL(ddl_ClassBelong, strSql, "classname", "idx", null);

            //查询排序最大值
            strSql = "select max(rank) from element";
            string rank = "";
            if (SqlHelper.ExecuteScalar(strSql).ToString() == "")
            {
                rank = "1";
            }
            else
            {
                rank = (int.Parse(SqlHelper.ExecuteScalar(strSql).ToString()) + 1).ToString();
            }
            TextBox_Rank.Text = rank;
            txtUrl.Text = "http://";
        }
    }




    protected void submit_Click(object sender, EventArgs e)
    {
        // 1. 检查同名 案例名
        string strSql = string.Format("select count(*) from element where elementname='{0}'", txtElementName.Text);
        if (Convert.ToInt32(SqlHelper.ExecuteScalar(strSql)) > 0)
        {
            MyHelper.JsAlert(this, "案例名称已经存在");
            return;
        }
        strSql = string.Format("select count(*) from element where rank='{0}'", TextBox_Rank.Text);
        if (Convert.ToInt32(SqlHelper.ExecuteScalar(strSql)) > 0)
        {
            MyHelper.JsAlert(this, "排序不能重复");
            return;
        }
        string codeadress = "";


        //生成二维码
        if (btnlQRCode.SelectedItem.Text == "是")
        {
            string str = txtUrl.Text;//生成二维码地址
            string path = System.Web.HttpContext.Current.Server.MapPath("../QRCode");//保存二维码文件夹路径
            string file = string.Format("{0}\\code{1}.png", path, txtElementName.Text);//文件路径和名称
            CreateQRCode.ToQRCode(FileUpload_QRCode, str, file);
            codeadress = string.Format("../QRCode/code{0}.png", txtElementName.Text);
        }


        //2. 上传图片
        string strFileNameQRCode = "";
        string imageadress = "";
        string FileType = "";
        if (btnlQRCode.SelectedItem.Text == "否")//不生成二维码
        {
            if (this.FileUpload_QRCode.HasFile)
            {

                FileType = FileUpload_QRCode.PostedFile.ContentType;
                if (FileType == "image/bmp" || FileType == "image/gif" || FileType == "image/png" || FileType == "image/jpeg")
                {
                    strFileNameQRCode = this.FileUpload_QRCode.FileName;
                    MyHelper.SaveAs(FileUpload_QRCode, Server.MapPath("../QRCode/"), strFileNameQRCode);
                    codeadress = "../QRCode/" + FileUpload_QRCode.FileName;
                }
                else
                {
                    codeadress = "../upload/NoImage.jpg";
                }
            }


            string strFileNameImage = "";
            if (this.FileUpload_caseImage.HasFile)
            {
                FileType = FileUpload_caseImage.PostedFile.ContentType;
                if (FileType == "image/bmp" || FileType == "image/gif" || FileType == "image/png" || FileType == "image/jpeg")
                {
                    strFileNameImage = this.FileUpload_caseImage.FileName;
                    MyHelper.SaveAs(FileUpload_caseImage, Server.MapPath("../upload/"), strFileNameImage);
                    imageadress = "../upload/" + FileUpload_caseImage.FileName;
                }
            }
            else
            {
                imageadress = "../upload/NoImage.jpg";
            }
        }


        //3.进入数据库
        strSql = string.Format(@"INSERT INTO element (elementname ,adress ,classbelong ,[rank],codeadress,imageadress,elementtext)" + " VALUES ( '{0}','{1}' ,'{2}','{3}','{4}','{5}','{6}' )"
                                      , this.txtElementName.Text
                                      , this.txtUrl.Text
                                      , this.ddl_ClassBelong.SelectedItem.Text
                                      , int.Parse(TextBox_Rank.Text)
                                      , codeadress
                                      , imageadress
                                      , txtcontent.Text
                                      );
        SqlHelper.ExecuteNonQuery(strSql);
        MyHelper.JsAlert(this, "ElementInfo_Manage.aspx", "案例添加成功！");
    }
}
