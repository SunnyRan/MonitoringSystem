<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="adminManage_Text"
    EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/viewstyle.css" type="text/css" rel="stylesheet" />
    <link href="css/comm.css" type="text/css" rel="stylesheet" />
    <link href="css/focus.css" type="text/css" rel="stylesheet" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-1.1.3.1.pack.js" type="text/javascript"></script>
    <script src="js/thickbox-compressed.js" type="text/javascript"></script>
    <script src="js/global.js" type="text/javascript"></script>
    <link href="css/thickbox.css" rel="stylesheet" type="text/css" />

    <script type="">
        function quit(obj) {
            $(obj).parent().parent().css("display", "none");
        }
        function imgClik(obj) {
            $(obj).parent().parent().next().css("display", "block");
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page_style lanmupage page_l61">
        <div class="top_box">
            <div class="top_box_inner" style="background-color: White; height: 95px; border-bottom: 2px solid Black;">
                <div class="logo">
                    <a href="/">
                        <img src="images/logo.png" border="0" alt="" /></a>
                </div>
                <div class="menu_box" id="Menu">
                    <ul>
                        <li class="menu_style_homepage menu_current" id="MenuItem61" name="MenuItem"><a href="http://sh.strongit.com.cn/index.aspx"
                            class="menu" target='_blank'>关于我们</a></li>
                        <li class="menu_style" id="MenuItem89" name="MenuItem"><a href="http://sh.strongit.com.cn/index.aspx"
                            class="menu" target='_blank'>联系我们</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="main_box main_box_style1">
        <div class="main_box_inner">
            <div class="main_box_inner_left" style="border-bottom: 2px solid Black;">
                <div id="nav_138" class="nav_box nav_box_menu">
                    <div id="nav_menu_138" class="nav_menu">
                        <asp:Repeater ID="Repeater_Class" runat="server">
                            <HeaderTemplate>
                                <ul id="rootul_138">
                                    <li id="s1668">
                                        <asp:LinkButton ID="LbtAll" runat="server" Class="sla669" OnCommand="LbtAll_OnCommand">所有</asp:LinkButton>
                                    </li>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li id="sl669">
                                    <asp:LinkButton ID="LbtClass" runat="server" Class="sla669" OnCommand="LbtClass_OnCommand"
                                        CommandArgument='<%#Eval("classname") %>'><%#Eval("classname") %></asp:LinkButton>
                                </ul>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <div class="main_box_inner_right">
                <div class="current_location" id="current_location">
                </div>
                <div id="module_193" class="module_box">
                    <div class="module_box_inner">
                        <div id="module_content_193" class="module_content">
                            <asp:Repeater ID="Repeater_Element" runat="server">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div>
                                        <table>
                                            <tr>
                                                <div style="float: left; width: 25%; text-align: center;">
                                                <a href="#TB_inline?height=500&width=900&inlineId=divEject<%#Eval("elementname") %>" class="thickbox">
                                                    <img id="image1" src='<%#Eval("imageadress") %>' onmouseover="this.src='<%#Eval("codeadress") %>'"
                                                        onmouseout="this.src='<%#Eval("imageadress") %>'"  class="pic" /></a>
                                                    <br />
                                                    <label>
                                                        <%#Eval("elementname") %></label>
                                                    <a href='<%#Eval("adress") %>' target="_blank">[浏览网站]</a>
                                                    <br />
                                                    <asp:Label ID="Introduction" Width="200px" Height="50px" runat="server"><%#Eval("introduce")%></asp:Label>
                                                    <br />
                                                </div>
                                            </tr>
                                        </table>
                                    </div>
                                    <div id="divEject<%#Eval("elementname") %>" style=" display:none;">
                                        <div class="beijing">
                                        </div>
                                        <div id="text">
                                            <div>
                                                <b>简介:</b><%#Eval("elementtext") %>
                                            </div>
                                            <br />
                                            <br />
                                            <label>
                                                <b>链接:</b><a href='<%#Eval("adress") %>' target="_blank"><%#Eval("adress") %></a></label>
                                            <br />
                                            <br />
                                            <br />
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                            <div id="module_194" class="module_box">
                                <div class="module_box_inner">
                                    <div id="module_content_194" class="module_content module_content_introduct">
                                    </div>
                                    <div class="module_footer">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom_box">
        <div class="home-bottom" align="center">
            <a href="view.aspx">首页</a> <a href="http://sh.strongit.com.cn/index.aspx" target='_blank'>
                关于我们</a> <a href="http://sh.strongit.com.cn/index.aspx" target='_blank'>联系我们</a><br />
        </div>
    </div>
    <div align="center" style="padding: 5px;">
        Powered by <a href='http://www.pageadmin.net' target='_blank'><strong>思创华信</strong></a></div>
    </form>
</body>
</html>
