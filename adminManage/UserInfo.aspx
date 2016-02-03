<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserInfo.aspx.cs" Inherits="UserInfo" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/stylesheet.css" rel="stylesheet" />
    <link href="icon/font-awesome.css" rel="stylesheet" />
    <link href="css/StyleSheet2.css" rel="Stylesheet" />
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.3.min.js"></script>
    <style type="text/css">
        .input
        {
            width: 40px;
            text-align: center;
        }
        .daohanglink
        {
            height: 40px;
            line-height: 40px;
            vertical-align: middle;
            width: 100%;
            background-color: rgb(248,248,248);
            margin-bottom: 15px;
        }
        .daohanglink span
        {
            margin-left: 5px;
            font-size:14px;
            font-weight:900;
        }
        .daohang
        {
            float: left;
            height: 15px;
            width: 5px;
            border-left-width: 5px;
            border-left-style: solid;
            border-left-color: #036;
            margin-top: 12px;
            margin-left: 15px;
        }
        </style>
        <script type="text/javascript">
            function TimeSorting() {
                var sort = document.getElementById("SortHidden");
                if (sort.value == "asc")
                    sort.value = "desc";
                else
                    sort.value = "asc";
            }
        </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Content start -->
        <input type="hidden" id="SortHidden" runat="server" value="desc" />
        <div class="inner_content" style="width: 99%">
            <div class="widgets_area">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="daohanglink" style="">
                            <span class="daohang"></span><span>首页</span><span>></span> <span>用户信息管理</span> 
                        </div>
                        <div style="width: 1615px">
                            <div class="well-content" style="border: 0px;">
                                <div class="well-content" style="border: 0px;">
                                    <table>
                                        <tr>
                                        <th>关键字：</th>
                                        <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="TextBox_Key" runat="server"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <th>开始日期：</th>
                                        <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txtStartDate" runat="server" OnClick="WdatePicker()"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <th>结束日期：</th>
                                        <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txtEndDate" runat="server" OnClick="WdatePicker()"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>
                                        <asp:Button ID="Button_Select" runat="server" class="submit" Text="查询" 
                                                onclick="Button_Select_Click"/>
                                        </td>
                                        <td><a href="UserInfo_add.aspx" class="label label-warning" style="float: right; margin-left: 330px; width: 42px; height: 18px;" onmouseover="this.style.background='Orange'" onmouseout="this.style.background=''">
                                &nbsp;&nbsp;新增</a></td>
                                        </tr>
                                    </table>
                                </div>
                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                    <HeaderTemplate>
                                        <table class="table table-striped table-bordered datatable table-hover">
                                        <thead>
                                            <tr class="th">
                                                <th width="3%" style="text-align:center;">
                                                    序号
                                                </th>
                                                <th width="10%">
                                                    登陆账号
                                                </th>
                                                <th width="10%">
                                                    密码
                                                </th>
                                                <th width="10%">
                                                    用户名
                                                </th>
                                                <th width="10%">
                                                    权限
                                                </th>
                                                <th width="10%">
                                                    <asp:LinkButton ID="lbtnSortTime" OnClientClick="TimeSorting()" runat="server" CommandName="sort" ForeColor="White" style="text-decoration:underline;"><i>创建时间</i></asp:LinkButton>
                                                </th>
                                                <th width="20%">
                                                    管理操作
                                                </th>
                                            </tr>
                                            
                                    </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="td" style="text-align:center;">
                                                <%#Container.ItemIndex+1 %>
                                            </td>
                                            <td>
                                                <%#Eval("uname")%>
                                            </td>
                                            <td>
                                                <label title='<%#Eval("upassword") %>'>******</label>
                                            </td>
                                            <td>
                                                <%#Eval("urealname")%>
                                            </td>
                                            <td id="<%#Eval("ulevel")%>" >
                                                <%#Eval("ulevel") %>
                                            </td>
                                            <td>
                                                <%#Eval("time") %>
                                            </td>
                                            <td>
                                                <asp:Button ID="ButtonEdit" runat="server" Text="编辑" CommandName="update" CommandArgument='<%#Eval("idx")%>' />
                                                <asp:Button ID="ButtonDelete" runat="server" Text="删除" CommandName="delete" CommandArgument='<%#Eval("idx")%>'
                                                    OnClientClick="javascript:return confirm('确认要删除吗?')" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                                <div class="well-content" style="border: 0px;">
                                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" 
                ShowPageIndexBox="Always" 
                FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" 
                PrevPageText="上一页" AlwaysShow="true" onpagechanging="AspNetPager1_PageChanging" style="float:left;"
               >
            </webdiyer:AspNetPager> 
            
            <span >共<%=this.AspNetPager1.PageCount%>页</span>
           <span > | <b>共<%=this.AspNetPager1.RecordCount%>条记录</b> </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>
