<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserInfo_Edit.aspx.cs" Inherits="UserInFo_edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/stylesheet.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <style type="text/css">
        .daohanglink span
        {
            margin-left: 5px;
            font-size:11px;
            font-weight:600;
        }
    </style>
    <script type="text/javascript">
        function checkForm() {
            var objUserName = document.getElementById("TextBox_Name");
            if (objUserName.value == "") {
                alert("登陆账号不能为空");
                objUserName.focus();
                return false;
            }

            var objRealName = document.getElementById("TextBox_RealName");
            if (objRealName.value == "") {
                alert("用户名称不能为空");
                objRealName.focus();
                return false;
            }
            var objPwd = document.getElementById("TextBox_Pwd");
            var objPwdSure = document.getElementById("TextBox_PwdSure")
            if (objPwd.value == "" || objPwdSure.value == "") {
                alert("密码不能为空");
                objPwd.focus();
                return false;
            }
            if (objPwd.value != objPwdSure.value) {
                alert("您输入的密码不一致");
                objPwdSure.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="inner_content">
            <div class="widgets_area">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="daohanglink" style="">
                            <span class="daohang"></span><span>首页&gt;</span> <span>用户信息管理&gt;</span> <span>
                            编辑用户信息</span>
                        </div>
                        <div class="well brown">
                            <div class="form_list">
                                <label class="lable_title">
                                登录账户：</label>&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox_Name" runat="server" Width="309px" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="form_list">
                                <label class="lable_title">
                                用户名称：</label>&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox_RealName" runat="server" 
                                    Width="309px" ></asp:TextBox>
                            </div>
                            <div class="form_list">
                                <label class="lable_title">
                                重置密码：</label>&nbsp;&nbsp; 
                                <asp:TextBox ID="TextBox_Pwd" runat="server" TextMode="Password" 
                                    Width="309px" Height="33px" ></asp:TextBox>
                              </div>
                            <div class="form_list">
                                <label class="lable_title">
                                确认密码：</label>&nbsp;&nbsp; 
                                <asp:TextBox ID="TextBox_PwdSure" runat="server" TextMode="Password"
                                    Width="309px" Height="33px" ></asp:TextBox>
                                <asp:CompareValidator ID="PassSure" runat="server" ControlToCompare="TextBox_Pwd" 
                                    ControlToValidate="TextBox_PwdSure" ErrorMessage="两次输入的密码不同！请重新输入"></asp:CompareValidator>
                            </div>
                            <div class="form_list">
                                <label class="lable_title">
                                用户等级：</label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButtonList ID="Seletlevel" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="1">管理员</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">会员</asp:ListItem>
                                </asp:RadioButtonList>&nbsp;&nbsp;
                                </div>
                            <div class="form_list">
                            <table>
                            <tr>
                            <td>
                                <asp:Button ID="submit" runat="server" class="submit" Text="提交" OnClick="submit_Click"
                                    OnClientClick="return checkForm()" Height="30px" Width="42px"  style="margin-left:70px;"/>
                            </td>
                            <td>
                                <input id="Reset1" type="reset" class="submit" value="重 置" style="margin-left:20px;"/>
                            </td>
                            <td>
                                <input type="button" class="submit" value="返 回" style="margin-left:20px;" onclick="javascript:location.href='UserInfo_Manage.aspx';" />
                            </td>
                            </tr>
                            </table>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </form>


  </body>
</html>
