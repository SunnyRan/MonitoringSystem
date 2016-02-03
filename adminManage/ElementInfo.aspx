<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ElementInfo.aspx.cs" Inherits="UserInfo" %>

<%@ Register assembly="AspNetPager" namespace="Wuqi.Webdiyer" tagprefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/stylesheet.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
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
        .trclass
        {
            background-color:Blue;
            }
    </style>
    
    <script type="text/javascript">
        function TimeSorting() {
            var sort = document.getElementById("SortHidden");
            if (sort.value == "asc")
                sort.value = "desc";
            else if (sort.value == "desc")
                sort.value = "asc";
            document.getElementById("testHidden").value = "createdate";
        }
        function RankSorting() {

            var sort = document.getElementById("SortHidden");
            if (sort.value == "asc")
                sort.value = "desc";
            else if (sort.value == "desc")
                sort.value = "asc";
            document.getElementById("testHidden").value = "rank";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Content start -->
        <input type="hidden" id="SortHidden" runat="server" value="desc" />
        <input type="hidden" id="testHidden" runat="server" value="createdate" />
        <div class="inner_content" style="width: 99%">
            <div class="widgets_area">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="daohanglink" style="">
                            <span class="daohang"></span><span>首页</span><span>></span> <span>案例信息管理</span> 
                        </div>
                        <div style="width: 1615px">
                            <div class="well-content" style="border: 0px;">
                                <div class="well-content" style="border: 0px;">
                                    <table>
                                        <tr>
                                        <th>关键字:</th>
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
                                        <td>
                            <a href="ElementInfo_add.aspx" class="label label-warning" style="float: right;
                                margin-left: 400px; width: 42px; height: 19px;" onmouseover="this.style.background='Orange'" onmouseout="this.style.background=''">&nbsp;&nbsp; 新增</a></td>
                                        </tr>
                                    </table>
                                </div>
                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                    <HeaderTemplate>
                                        <table class="table table-striped table-bordered table-hover datatable">
                                         <thead>
                                            <tr class="th">
                                                <th width="3%" style="text-align:center;">
                                                    序号
                                                </th>
                                                <th width="7%">
                                                    案例名称
                                                </th>
                                                <th width="10%">
                                                    案例地址
                                                </th>
                                                <th width="5%">
                                                    案例类别
                                                </th>
                                                <th width="7%">
                                                    预览图
                                                </th>
                                                <th width="7%">
                                                    二维码
                                                </th>
                                                <th width="15%">
                                                    案例简介
                                                </th>
                                                <th width="3%">
                                                     <asp:LinkButton ID="lbtnSort" OnClientClick="RankSorting()" runat="server" CommandName="sort" ForeColor="White" style=" text-decoration:underline;" ><i>排序</i></asp:LinkButton>
                                                </th>
                                                <th width="10%">
                                                     <asp:LinkButton ID="lbtnSortTime" OnClientClick="TimeSorting()" runat="server" CommandName="sort" ForeColor="White" style=" text-decoration:underline;"><i>创建时间</i></asp:LinkButton>
                                                </th>
                                                <th width="20%">
                                                    管理操作
                                                </th>
                                            </tr>
                                            </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td style="text-align:center;">
                                                <%#Container.ItemIndex+1 %>
                                            </td>
                                            <td>
                                                <%#Eval("elementname")%>
                                            </td>
                                            <td>
                                                <%#Eval("adress")%>
                                            </td>
                                            <td id="<%#Eval("classbelong")%>">
                                                <%#Eval("classbelong")%>
                                            </td>
                                            <td >
                                                <asp:Image ImageUrl='<%#Eval("imageadress") %>' runat="server" Width="50px" Height="50px"
                                                   />
                                            </td>
                                            <td>
                                                <asp:Image ImageUrl='<%#Eval("codeadress") %>' runat="server" Width="50px" Height="50px"
                                                     />
                                            </td>
                                            <td style=" word-wrap:break-word; word-break:break-all;"><%#Eval("Introduction")%></td>
                                            <td>
                                                <%#Eval("rank") %>
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
                PrevPageText="上一页" AlwaysShow="true" onpagechanging="AspNetPager1_PageChanging"  style="float:left;"
               >
            </webdiyer:AspNetPager> 
            
            共<span><%=this.AspNetPager1.PageCount%></span>页

            | <b>共<span><%=this.AspNetPager1.RecordCount%></span>条记录</b> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
        </div>
    </form>
</body>
</html>
