<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClassInfo_Edit.aspx.cs" Inherits="ClassInfo_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                var objClassName = document.getElementById("TextBox_ClassName");
                if (objClassName.value == "") {
                    alert("类别名称不能为空");
                    objClassName.focus();
                    return false;
                }

                var objSort = document.getElementById("TextBox_Sort");
                if (objSort.value == "") {
                    alert("排序不能为空");
                    objSort.focus();
                    return false;
                }
                return true;
            }


    </script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <!-- Content start -->
        <div class="inner_content">
            <div class="widgets_area">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="daohanglink" style="">
                            <span class="daohang"></span><span>首页&gt;</span> <span>类别信息管理&gt;</span> <span>
                            编辑类别信息</span>
                        </div>
                        <div class="well brown">
                            <div class="form_list">
                                <label class="lable_title">
                                    类别名称：</label>&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox_ClassName" runat="server" Width="309px" Height="33px"></asp:TextBox>
                            </div>
                            <div class="form_list">
                                <label class="lable_title">
                                    类别排序：</label>&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox_Sort" runat="server" Width="309px" Height="33px" onkeyup="value=value.replace(/[^\d]/g,'')"></asp:TextBox>
                            </div>
                            <div class="form_list">
                                <label class="lable_title">
                                    是否显示：
                                </label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButtonList ID="Seletlevel" runat="server"
                                    RepeatDirection="Horizontal" Height="35px" Width="120px"  RepeatLayout="Flow">
                                    <asp:ListItem Value="YES" Selected="True">是</asp:ListItem>
                                    <asp:ListItem Value="NO">否</asp:ListItem>
                                </asp:RadioButtonList>
                                &nbsp;&nbsp;
                            </div>
                            <div class="form_list">
                            <table>
                            <tr>
                            <td>
                                <asp:Button ID="submit" runat="server" class="submit" Text="提交" OnClick="submit_Click"
                                    OnClientClick="return checkForm()" Height="30px" Width="42px"  style="margin-left:70px"/>
                            </td>
                            <td>
                                <input id="Reset1" type="reset" class="submit" value="重 置" style="margin-left:20px"/>
                            </td>
                            <td>
                                <input type="button" class="submit" value="返 回" style="margin-left:20px" onclick="javascript:location.href='ClassInfo_Manage.aspx';" />
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
