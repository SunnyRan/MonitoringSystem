<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login1.aspx.cs" Inherits="adminManage_Login1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Login1style.css" rel="stylesheet" type="text/css" />
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
<body>
    <form id="form1" runat="server">
    <div class="login">
		 <div class="login-main">
		 		<div class="login-top">
		 			<img src="images/head-img.png" alt=""/>
		 			<h1>用户登录</h1>
		 			<input type="text"  id="Uname" placeholder="Email" required="" runat="server"/>
		 			<input type="password"  id="Upass" placeholder="密码" required="" runat="server"/>
		 			<div class="login-bottom">
		 			  <div class="login-check">
			 		  </div>
			 			<div class="clear"> </div>
		 			</div>
                    <asp:Button ID="btnSubmit" runat="server" class="sub_button"  OnClick="btnSubmit_Click" 
                        Text="登录" OnClientClick="return chkForm()" />
		 		</div>
		 	</div>
  </div>
<div style="text-align:center;">
<p></p>
</div>
    </form>
</body>
</html>
