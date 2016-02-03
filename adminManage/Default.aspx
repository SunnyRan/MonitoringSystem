<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/stylesheet.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="Stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/stylemain.css" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <style type="text/css">
        .inner_navigation1
        {
            height: 174%;
            margin-top: 0px;
            
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#test11").click(function () {
                var div = $("#menudiv").css("margin-left");
                $("#main_navigation").toggle(500);
                if (div == "180px") {
                    $("#content").animate({ marginLeft: "40px" },500);
                    $("#menudiv").animate({ marginLeft: "0px" },500);
                }
                else {
                    $("#content").animate({ marginLeft: "219px" }, 500);
                    $("#menudiv").animate({ marginLeft: "180px" },500);
                }
            })

        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <header class="dark_grey">
        <div class="top" >

            <div class="logo">
            <a href="Default.aspx"><img src="images/logo.png" alt="" title="返回主页"/></a>
            </div>

            <div class="login">
            <a href="Login.aspx" onclick="javascript:return confirm('确认要退出吗?')"  >
            <asp:ImageButton ID="btnLogout" runat="server" ImageUrl="images/login.png" 
                    onclick="btnLogout_Click" Height="70px" Width="93px" ToolTip="注销登录"></asp:ImageButton>
            </a>
            </div>

            <div class="username">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="user">
            <img src="images/user.png" alt=""/>
            </div>
            <div class="front">
            <a href="View.aspx" target="_blank" title="前台显示"><img src="images/computer.jpg" alt="" /></a>
            </div>
        </div>
    </header>
    <div id="main_navigation" class="dark_navigation">
    <div style=" position:absolute; margin-top:75px;">
    <img src="images/导航.png" width="180px;" height="70px;"/>
    </div>
        <div class="inner_navigation">
            <ul class="main">
                <li><a href="#" style="text-align:center"><img src="images/meun2.png"/>案例管理</a>
                
                    <ul class="er" style="width: 175px; margin-left: 0px;">
                        <li class="e_li"><a href="ElementInfo_Manage.aspx" target="right"><img src="images/meunSub1.png"/>案例查看</a> </li>
                        <li class="e_li"><a href="ElementInfo_add.aspx" target="right"><img src="images/meunSub1.png"/>案例新增</a></li>
                    </ul>
                </li>
                <li><a href="#" style="text-align:center"><img src="images/meun0.png"/>类别管理</a>
                    <ul class="er" style="width: 175px; margin-left: 0px;">
                        <li class="e_li"><a href="ClassInfo_Manage.aspx" target="right"><img src="images/meunSub1.png"/>类别查看</a> </li>
                        <li class="e_li"><a href="ClassInfo_add.aspx" target="right"><img src="images/meunSub1.png"/>类别新增</a> </li>
                    </ul>
                </li>
                <li><a href="#" id="btnLink" runat="server" style="text-align:center"><img src="images/current.png"/>用户管理</a>
                    <ul class="er" style="width: 175px; margin-left: 0px;">
                        <li class="e_li"><a href="UserInfo_Manage.aspx" target="right"><img src="images/meunSub1.png"/>用户查看</a> </li>
                        <li class="e_li"><a href="UserInfo_add.aspx" target="right"><img src="images/meunSub1.png"/>用户新增</a> </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div id="menudiv">
    <a href="##" id="test11"><img src="images/伸缩导航.png" style="margin-top:75px; border:2px solid black"/></a>
    </div>
    <div id="content" class="no-sidebar">
        <iframe name="right" src="#" frameborder="0" width="100%" style="border-style: solid;
            border-width: 0; padding: 0; height: 905px; background-color: #DDDDDD;" scrolling="auto;">
        </iframe>
    </div>
    </form>
</body>
</html>
