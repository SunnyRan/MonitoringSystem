<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登陆页面</title>
    <link href="~/adminManage/css/logostyle.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function chkForm() {
            if ($("#Uname").val() == "") {
                alert("请输入用户名");
                $("#Uname").focus();
                return false;
            }

            if ($("#Upass").val() == "") {
                alert("请输入密码");
                $("#Upass").focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="login">
    <form id="form1" runat="server">
    <div class="login_m">
        <div class="login_logo">
            <img src="images/logo.png" width="196" height="46" alt="" /></div>
        <div class="login_boder">
            <div class="login_padding">
                <h2>
                    用户名</h2>
                <div class="txt_input">
                    <asp:TextBox ID="Uname" runat="server" Height="29px" Width="292px"></asp:TextBox>
                </div>
                <h2>
                    密码</h2>
                <div>
                    <asp:TextBox ID="Upass" runat="server" Height="29px" Width="292px" TextMode="Password"></asp:TextBox>
                </div>
                <div class="login_padding"></div>
                <div class="rem_sub">
                    <asp:Button ID="btnSubmit" runat="server" class="sub_button"  OnClick="btnSubmit_Click" 
                        Text="登录" OnClientClick="return chkForm()" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <p align="center">
        <a href="http://sh.strongit.com.cn/" target="_blank" title="思创华信"><b>上海思创华信</b></a></p>
    </form>
</body>
</html>

