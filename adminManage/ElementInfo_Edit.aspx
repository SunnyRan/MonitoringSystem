<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ElementInfo_Edit.aspx.cs"
    ValidateRequest="False" Inherits="ElementInfo_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/stylesheet.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/stylesheet.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="css/StyleSheet2.css" rel="Stylesheet" />
    <link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="../kindeditor/kindeditor.js" type=""></script>
    <script charset="utf-8" src="../kindeditor/lang/zh_CN.js" type=""></script>
    <script charset="utf-8" src="../kindeditor/plugins/code/prettify.js" type=""></script>
    <style type="text/css">
        .daohanglink span
        {
            margin-left: 5px;
            font-size: 11px;
            font-weight: 600;
        }
    </style>
    <script type="text/javascript">
    

$(function(){
    $(".main > li > a").click(function(){
	     $(this).addClass("xz").parents().siblings().find("a").removeClass("xz");
		 $(this).parents().siblings().find(".er").hide(300);
		 $(this).siblings(".er").toggle(300);
		 $(this).parents().siblings().find(".er > li > .thr").hide().parents().siblings().find(".thr_nr").hide();
		
	})
    </script>
    <script type="">
        KindEditor.ready(function (K) {
            var editor = K.create('#txtcontent', {
                //上传管理
                uploadJson: 'kindeditor/asp.net/upload_json.ashx',
                //文件管理
                fileManagerJson: 'kindeditor/asp.net/file_manager_json.ashx',
                allowFileManager: true,
                //设置编辑器创建后执行的回调函数
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        K('form[name=example]')[0].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        K('form[name=example]')[0].submit();
                    });
                },
                //上传文件后执行的回调函数,获取上传图片的路径
                afterUpload: function (url) {
                    alert(url);
                },
                //编辑器高度
                width: '700px',
                //编辑器宽度
                height: '200px;',
                //配置编辑器的工具栏
                items: [
                'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
                'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
                'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
                'anchor', 'link', 'unlink', '|', 'about'
                ]
            });
            prettyPrint();
        });
    </script>
    <script type="text/javascript">
        function checkForm() {
            var objElementName = $("txtElementName");
            if (objElementName.value == "") {
                alert("元素名称不能为空");
                objElementName.focus();
                return false;
            }

            var objUrl = document.getElementById("txtUrl");
            if (objUrl.value == "") {
                alert("案例链接不能为空");
                objUrl.focus();
                return false;
            }
            var objRank = document.getElementById("TextBox_Rank");
            if (objRank.value == "") {
                alert("排序不能为空");
                objUrl.focus();
                return false;
            }
            var objQRCode = document.getElementById("FileUpload_QRCode")
            if (objQRCode.value.length != 0) {
                var stuff = objQRCode.value.match(/^(.*)(\.)(.{1,8})$/)[3];
                if (stuff != 'bmp' && stuff != 'gif' && stuff != 'png' && stuff != 'jpg') {
                    alert("二维码上传文件不正确");
                    objQRCode.focus();
                    return false;
                }
            }
            var objImage = document.getElementById("FileUpload_caseImage")
            if (objImage.value.length != 0) {
                var stuff = objImage.value.match(/^(.*)(\.)(.{1,8})$/)[3];
                if (stuff != 'bmp' && stuff != 'gif' && stuff != 'png' && stuff != 'jpg') {
                    alert("预览图上传文件不正确");
                    objImage.focus();
                    return false;
                }
            }
            return true;
        }
        function checkimage() {
            if (document.getElementById("txtImageSort").value == "") {
                alert("图片排序不能为空");
                return false;
            }
            var objImage = document.getElementById("File1")
            if (objImage.value.length != 0) {
                var stuff = objImage.value.match(/^(.*)(\.)(.{1,8})$/)[3];
                if (stuff != 'bmp' && stuff != 'gif' && stuff != 'png' && stuff != 'jpg') {
                    alert("预览图上传文件不正确");
                    objImage.focus();
                    return false;
                }
            }
            return true;

        }
        function imageclick() {
            if (document.getElementById("Imagecase").style.display == "block")
                document.getElementById("Imagecase").style.display = "none";
            else if(document.getElementById("Imagecase").style.display == "none")
                document.getElementById("Imagecase").style.display = "block";
        }
        function $(idName) {
            return document.getElementById(idName);
        }

        function GetURL() {
            document.getElementById("preview").href = document.getElementById("txtUrl").value;
        }
    </script>
</head>
<body>
    <form id="form2" runat="server" enctype="multipart/form-data">
    <div id="content" style="margin-left: 0; top: 0px;">
        <!-- Content start -->
        <div class="inner_content">
            <div class="widgets_area">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="daohanglink" style="">
                            <span class="daohang"></span><span>首页&gt;</span> <span>案例信息管理&gt;编辑案例信息</span>
                        </div>
                        <fieldset style="width: 900px; margin: 10px; border: 2px solid #0099CC; margin-top: auto;">
                            <legend style="background-color: Green; width: 66px; margin: 20px; color: White;
                                padding: 3px 0px 4px 6px;">案例信息</legend>
                            <div class="well brown" style="padding: 0px 0px 0px 20px;">
                                <div class="form_list">
                                    <label class="lable_title">
                                        案例名称：</label>&nbsp;&nbsp;
                                    <asp:TextBox ID="txtElementName" runat="server" Width="304px"></asp:TextBox>
                                </div>
                                <div class="form_list">
                                    <label class="lable_title">
                                        类别名称：</label>&nbsp;&nbsp;
                                    <asp:DropDownList ID="ddl_ClassBelong" runat="server" Height="36px" Width="304px">
                                    </asp:DropDownList>
                                </div>
                                <div class="form_list">
                                    <label class="lable_title">
                                        案例链接：</label>&nbsp;&nbsp;
                                    <asp:TextBox ID="txtUrl" runat="server" Width="304px"></asp:TextBox>
                                    <a href="" id="preview" onclick="GetURL()" target="_blank">网站预览</a>
                                </div>
                                <div class="form_list">
                                    <label class="lable_title">
                                        是否生成：</label>
                                    &nbsp;&nbsp;
                                    <asp:RadioButtonList ID="btnlQRCode" runat="server" RepeatDirection="Horizontal"
                                        RepeatLayout="Flow">
                                        <asp:ListItem>是</asp:ListItem>
                                        <asp:ListItem Selected="True">否</asp:ListItem>
                                    </asp:RadioButtonList>
                                    &nbsp;&nbsp;
                                    <label style="width: 350px; height: 29px; color: Gray;">
                                        选择是：二维码栏为上传二维码中心LOGO<br />
                                        选择否：二维码栏为上传二维码图片，注：未上传图片则不改变</label>&nbsp;&nbsp;
                                </div>
                                <div style="margin-bottom: 10px;">
                                    <label style="width: auto;">
                                        二维码图：</label>&nbsp;&nbsp;
                                    <asp:FileUpload ID="FileUpload_QRCode" runat="server" Height="21px" on="" Width="277px" />
                                    <asp:Image ID="QRCode" runat="server" Width="100px" Height="100px" />
                                </div>
                                <div>
                                    <label style="width: auto;">
                                        预览图片：</label>&nbsp;&nbsp;
                                    <asp:FileUpload ID="FileUpload_caseImage" runat="server" Height="22px" Width="277px" />
                                    <asp:Image ID="caseImage" runat="server" Width="100px" Height="100px" />
                                </div>
                                <div class="form_list">
                                    <label class="lable_title">
                                        案例排序：</label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="TextBox_Rank" runat="server" Height="33px" Width="304px" onkeyup="value=value.replace(/[^\d]/g,'')"></asp:TextBox>
                                </div>
                                <label class="lable_title">
                                    案例简介：</label>&nbsp;&nbsp;
                                <textarea id="txtcontent" runat="server" cols="100" rows="8" style="width: 700px;
                                    height: 200px; visibility: hidden;"></textarea>
                                <div style="padding: 30px 0px 0px 0px;">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="submit" runat="server" class="submit" Text="提交" OnClick="submit_Click"
                                                    OnClientClick="return checkForm()" Height="30px" Width="42px" Style="margin-left: 60px" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td>
                                                <input id="Reset1" type="reset" class="submit" value="重 置" style="margin-left: 0" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td>
                                                <input type="button" class="submit" value="返 回" style="margin-left: 0" onclick="javascript:location.href='ElementInfo_Manage.aspx';" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <fieldset style="width: 900px; margin: 30px; border: 2px solid #0099CC;">
            <legend style="background-color: Green; width: 66px; margin: 20px; color: White;
                padding: 3px 0px 4px 6px;"><a href="#anchor" onclick="imageclick()" style=" color:White;">图片案例</a><a name="anchor"></a></legend>
                <div id="Imagecase" style=" display:block;">
            <table style="margin: 20px;">
                <tr>
                    <td>
                        图片：
                    </td>
                    <td>
                        <asp:FileUpload ID="File1" runat="server" Width="304px" Height="25px" />
                        <asp:Image ID="smallimage" runat="server" Width="100px" Height="100px" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        排序：
                    </td>
                    <td>
                        <input type='text' style='width: 304px; height: 30px;' name='txtImageSort"' id="txtImageSort"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        简介：
                    </td>
                    <td>
                        <textarea id="txtcontent1" name="txtcontent" style='width: 500px; height: 100px;'
                            runat="server"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="submit_image" runat="server" Text="新增案例图片" Width="100px" OnClick="submit_image_Click"
                            OnClientClick="return checkimage()" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
            <div style="margin-left: 20px;">
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <HeaderTemplate>
                        <table border="1" width="800px" class="testtable" style="margin: 0px 0px 20px 0px;">
                            <tr class="th" style="height:32px;">
                                <th style="text-align: center; width: 5%;">
                                    序号
                                </th>
                                <th style="width:10%;">
                                    图片
                                </th>
                                <th style="width:10%;">
                                    图片简介
                                </th>
                                <th style="width:5%;">
                                    排序
                                </th>
                                <th style="width:15%;">
                                    创建时间
                                </th>
                                <th style="width:10%;">
                                    管理操作
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="text-align: center;">
                                <%#Container.ItemIndex+1 %>
                            </td>
                            <td>
                                <img id="images" src='<%#Eval("imageurl") %>' style="width: 70px; height: 70px;" />
                            </td>
                            <td style=" word-wrap:break-word; word-break:break-all;">
                                <%#Eval("Introduction")%>   
                            </td>
                            <td>
                                <%#Eval("sorting")%>
                            </td>
                            <td>
                                <%#Eval("time")%>
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
            </div>
            </div>
        </fieldset>
    </div>
    </form>
</body>
</html>
