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
using System.Runtime.InteropServices;
using ThoughtWorks.QRCode.Codec;
using ThoughtWorks.QRCode.Codec.Data;
using ThoughtWorks.QRCode.Codec.Util;
using System.Drawing;
using System.Text;
using System.Net;
using System.Drawing.Drawing2D;

public partial class ElementInfo_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string idx = Request["passValue"];
        if (!IsPostBack)
        {

            if (string.IsNullOrEmpty(idx))
            {
                Response.Redirect("ElementInfo_Manage.aspx");
            }

            string strSql = string.Format("select top 1 *  from element where idx ='{0}'", idx);
            DataSet ds = SqlHelper.ExecuteDataset(strSql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                var iRow = ds.Tables[0].Rows[0];
                //文本框赋值
                txtElementName.Text = iRow["elementname"].ToString();
                txtUrl.Text = iRow["adress"].ToString();
                TextBox_Rank.Text = iRow["rank"].ToString();
                txtcontent.Value = iRow["elementtext"].ToString();
                QRCode.ImageUrl = iRow["codeadress"].ToString();
                caseImage.ImageUrl = iRow["imageadress"].ToString();


                string strSql_class = "select * from [class] where isshow = 'YES' order by 2";
                MyHelper.BindDDL(this.ddl_ClassBelong, strSql_class, "classname", "idx", iRow["classbelong"].ToString());//绑定下拉框
                ddl_ClassBelong.SelectedItem.Text = iRow["classbelong"].ToString();
            }

            //图片案例
            string id = idx;
            strSql = string.Format(@"select *,left(imageinfo,50)+'...' as Introduction,CONVERT(varchar(20),createdate, 120) as time from [imagecase] where caseidx_Fx='{0}' order by createdate desc", id);
            ds = SqlHelper.ExecuteDataset(strSql);
            this.Repeater1.DataSource = ds;
            this.Repeater1.DataBind();
            strSql = string.Format("select max(sorting) from imagecase where caseidx_Fx='{0}'", id);
            if (SqlHelper.ExecuteScalar(strSql).ToString() == "")
            {
                txtImageSort.Value = "1";
            }
            else
            {
                txtImageSort.Value = (Convert.ToInt32(SqlHelper.ExecuteScalar(strSql)) + 1).ToString();
            }
            //图片案例编辑赋值
            if (Request["imageidx"] != null)
            {
                string imageidx = Request["imageidx"];
                strSql = string.Format("select * from [imagecase] where idx={0}", imageidx);
                DataSet dss = SqlHelper.ExecuteDataset(strSql);
                if (dss.Tables[0].Rows.Count > 0)
                {

                    var iRow = dss.Tables[0].Rows[0];
                    smallimage.ImageUrl = iRow["imageurl"].ToString();
                    txtImageSort.Value = iRow["sorting"].ToString();
                    txtcontent1.Value = iRow["imageinfo"].ToString();
                    submit_image.Text = "编辑案例图片";
                    smallimage.Visible = true;
                }
            }

        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        //     1. 检查同名 案例名
        string id = Request["passValue"];
        string strSql = string.Format("select count(*) from element where elementname='{0}'and idx!='{1}'", txtElementName.Text, id);
        int iResult = Convert.ToInt32(SqlHelper.ExecuteScalar(strSql));
        if (iResult > 0)
        {
            MyHelper.JsAlert(this, "案例名称已经存在");
            return;
        }
        strSql = string.Format("select count(*) from element where rank='{0}'and idx!='{1}'", TextBox_Rank.Text, id);
        iResult = Convert.ToInt32(SqlHelper.ExecuteScalar(strSql));
        if (iResult > 0)
        {
            MyHelper.JsAlert(this, "排序不能重复");
            return;
        }
        string codeadress = "";
        if (btnlQRCode.SelectedItem.Text == "是")
        {
            //        生成二维码;
            string str = txtUrl.Text;
            string path = System.Web.HttpContext.Current.Server.MapPath("../QRCode");
            string file = string.Format("{0}\\code{1}.png", path, txtElementName.Text);
            CreateQRCode.ToQRCode(FileUpload_QRCode, str, file);
            Random rand = new Random();//更新图片
            codeadress = string.Format("../QRCode/code{0}.png?{1}", txtElementName.Text, rand.Next(100).ToString());
            strSql = string.Format("update element set codeadress = '{0}' where idx={1}", codeadress, id);
            SqlHelper.ExecuteNonQuery(strSql);
        }
        //    2. 上传图片
        string strFileNameQRCode = "";
        if (btnlQRCode.SelectedItem.Text == "否")
        {
            if (this.FileUpload_QRCode.HasFile)
            {
                    strFileNameQRCode = this.FileUpload_QRCode.FileName;
                    MyHelper.SaveAs(FileUpload_QRCode, Server.MapPath("../QRCode/"), strFileNameQRCode);
                    strFileNameQRCode = "../QRCode/" + strFileNameQRCode;
                    strSql = string.Format("update element set codeadress = '{0}' where idx={1}", strFileNameQRCode, id);
                    SqlHelper.ExecuteNonQuery(strSql);
            }
        }
        string strFileNameImage = "";
        if (this.FileUpload_caseImage.HasFile)//导航图片
        {
                strFileNameImage = this.FileUpload_caseImage.FileName;
                MyHelper.SaveAs(FileUpload_caseImage, Server.MapPath("../upload/"), strFileNameImage);
                strFileNameImage = "../upload/" + strFileNameImage;
                strSql = string.Format("update element set imageadress = '{0}' where idx={1}", strFileNameImage, id);
                SqlHelper.ExecuteNonQuery(strSql);
        }

        //    3.进入数据库
        strSql = string.Format(@"UPDATE  element SET elementname='{0}' ,adress='{1}' ,classbelong='{2}' ,[rank]='{3}' ,elementtext='{5}' WHERE idx={4}"
                                        , this.txtElementName.Text
                                        , this.txtUrl.Text
                                        , this.ddl_ClassBelong.SelectedItem.Text
                                        , int.Parse(TextBox_Rank.Text)
                                        , id
                                        , txtcontent.Value
                                        );
        SqlHelper.ExecuteNonQuery(CommandType.Text, strSql);
        MyHelper.JsAlert(this, "ElementInfo_Manage.aspx", "案例修改成功！");
    }
    
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["passValue"]);
        if (e.CommandName == "delete")
        {
            string sql = "delete from imagecase where idx= " + e.CommandArgument;
            int row = SqlHelper.ExecuteNonQuery(CommandType.Text, sql);
            if (row > 0)
            {

                Response.Redirect("ElementInfo_edit.aspx?passValue=" + id + "#anchor");
                return;
            }
            else
            {

                Response.Redirect("ElementInfo_edit.aspx?passValue=" + id + "#anchor");
                return;
            }
        }
        else if (e.CommandName == "update")
        {
            Response.Write("<script>window.location.href='ElementInfo_edit.aspx?passValue=" + id + "&imageidx=" + e.CommandArgument + "#anchor'</script>");
        }
    }
    protected void submit_image_Click(object sender, EventArgs e)
    {
        string imageurl = "";
        int imageidx = Convert.ToInt32(Request["imageidx"]);
        int id = Convert.ToInt32(Request["passValue"]);
        if (submit_image.Text == "新增案例图片")
        {
            if (File1.HasFile)
            {
                imageurl = this.File1.FileName;
                MyHelper.SaveAs(File1, Server.MapPath("../upload/"), imageurl);
                imageurl = "../upload/" + imageurl;
            }
            else
            {
                imageurl = "../upload/NoImage.jpg";
            }
            string StrSql = string.Format(@"insert into imagecase (caseidx_Fx,imageurl,imageinfo,sorting)" + " values ('{0}','{1}','{2}','{3}')    "
                , id
                , imageurl
                , txtcontent1.Value
                , txtImageSort.Value);
            SqlHelper.ExecuteNonQuery(StrSql);
            Response.Redirect("ElementInfo_edit.aspx?passValue=" + id + "#anchor");
        }
        if (submit_image.Text == "编辑案例图片")
        {
            if (File1.HasFile)
            {
                imageurl = this.File1.FileName;
                MyHelper.SaveAs(File1, Server.MapPath("../upload/"), imageurl);
                imageurl = "../upload/" + imageurl;
            }
            else
            {
                imageurl = smallimage.ImageUrl;
            }
            string StrSql = string.Format(@"UPDATE imagecase SET imageurl = '{0}',imageinfo = '{1}',sorting = '{2}'WHERE idx = '{3}'"
                , imageurl
                , txtcontent1.Value
                , txtImageSort.Value
                , imageidx);
            SqlHelper.ExecuteNonQuery(StrSql);
            Response.Write("<script>window.location.href='ElementInfo_edit.aspx?passValue=" + id + "#anchor';</script>");
        }
    }
}
