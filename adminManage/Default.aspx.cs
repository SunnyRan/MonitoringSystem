using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["idx"] == null)
            {
                Response.Write("<script>alert('请从登陆页面进入!');location.href='login.aspx';</script>");
            }
            string Ulevel = (string)Session["userLevel"];
            string Uname = (string)Session["userName"];
            Label1.Text = string.Format("欢迎您，{0}({1})", Uname, Ulevel);
            if (Ulevel == "会员")
            {
                btnLink.Visible = false;
            }
            else if (Ulevel == "管理员")
            {
                btnLink.Visible = true;
            }
        }
    }
    protected void exit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void btnLogout_Click(object sender, ImageClickEventArgs e)
    {
        Session["idx"] = null;
        Session["userName"] = null;
        Session["userLevel"] = null;

        //清除浏览器缓存
        Response.Buffer = true;
        Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
        Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
        Response.Expires = 0;
        Response.CacheControl = "no-cache";
        Response.Cache.SetNoStore();
        Response.Redirect("Login.aspx");
    }
}