using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

/// <summary>
///MyHelper 的摘要说明
/// </summary>
public class MyHelper
{
	public MyHelper()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 服务端，弹出JavaScript的Alert
    /// </summary>
    /// <param name="p">System.Web.UI.Page 示范：传值为 this</param>
    /// <param name="strMessage">字符串</param>
    public static void JsAlert(System.Web.UI.Page p,string strMessage)
    {
       p.Response.Write(string.Format("<script>alert('{0}')</script>", strMessage));
    }

    public static void JsAlert(System.Web.UI.Page p, string goUrl, string strMessage )
    {
        p.Response.Write(string.Format("<script>alert('{0}');window.location.href='{1}'</script>",strMessage,goUrl ));
    }

    /// <summary>
    /// 服务器端控件图片文件传输
    /// </summary>
    /// <param name="myFileUpload">上传控件ID</param>
    /// <param name="upFile">保存路径,如Server.MapPath("~/upload/")</param>
    /// <param name="FileName">保存文件名,如this.myfileUpload.FileName</param>
    public static string SaveAs(FileUpload myFileUpload, string upFile, string FileName)
    {
        string webFilePath =string.Format("{0}/{1}",upFile,FileName);
        myFileUpload.SaveAs(webFilePath);
        return webFilePath;
    }






    /// <summary>
    /// 绑定下拉框 \
    /// eg: string strSql = "select * from myTableName ";
    ///     MyHelper.BindDDL(ddl_ClassBelong, strSql, "classname", "idx", null);
    /// </summary>
    /// <param name="myDDL">DropDownList对象</param>
    /// <param name="strSql">strSql语句</param>
    /// <param name="textField">textField</param>
    /// <param name="valueField">valueField</param>
    /// <param name="isSelected">isSelected 如果 null,将显示"请选择"</param>
    public static void BindDDL(DropDownList myDDL, string strSql, string textField, string valueField, string SelectedValue)
    {
        //string strSql = "select * from [class] where isshow = 'YES' order by classname ";
        DataSet ds = SqlHelper.ExecuteDataset(strSql);
        myDDL.DataSource = ds.Tables[0];
        myDDL.DataTextField = textField;
        myDDL.DataValueField = valueField;
        myDDL.DataBind();
        if (string.IsNullOrEmpty(SelectedValue))
        {
            myDDL.Items.Insert(0, "请选择");
        }
        else
        {
            for (int i = 0; i < myDDL.Items.Count; i++)
            {
                if (myDDL.Items[i].Text == SelectedValue)
                {
                    myDDL.Items[i].Selected = true;
                    break;
                }
            }
        }

    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="Repeater_ReceiveParameters">Repeater控件</param>
    ///
    ///


    /// <summary>
    /// repeater控件动态合并单元格,合并单元格添加属性runat="server"
    /// </summary>
    /// <param name="Repeater_ReceiveParameters">Repeater控件</param>
    /// <param name="TableTdId">单元格ID</param>
    public static void MergeTableCells(Repeater Repeater_ReceiveParameters , string TableTdId)
    {



        for (int i = Repeater_ReceiveParameters.Items.Count - 1; i > 0; i--)
        {
            HtmlTableCell oCell_Previous = Repeater_ReceiveParameters.Items[i - 1].FindControl(TableTdId) as HtmlTableCell;
            HtmlTableCell oCell = Repeater_ReceiveParameters.Items[i].FindControl(TableTdId) as HtmlTableCell;

            oCell.RowSpan = (oCell.RowSpan == -1) ? 1 : oCell.RowSpan;
            oCell_Previous.RowSpan = (oCell_Previous.RowSpan == -1) ? 1 : oCell_Previous.RowSpan;

            if (oCell.InnerText == oCell_Previous.InnerText)
            {
                oCell.Visible = false;
                oCell_Previous.RowSpan += oCell.RowSpan;
            }
        }
    }
}