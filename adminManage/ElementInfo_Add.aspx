<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ElementInfo_Add.aspx.cs" 
    Inherits="ElementInfo_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/stylesheet.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />

    
    <link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor/kindeditor.js" type=""></script>
	<script charset="utf-8" src="../kindeditor/lang/zh_CN.js" type=""></script>
	<script charset="utf-8" src="../kindeditor/plugins/code/prettify.js" type=""></script>
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <style type="text/css">
        .daohanglink span
        {
            margin-left: 5px;
            font-size:11px;
            font-weight:600;
        }
    </style>
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
            var objElementName = document.getElementById("txtElementName");
            if (objElementName.value == "") {
                alert("元素名称不能为空");
                objElementName.focus();
                return false;
            }

            var objUrl = document.getElementById("txtUrl");
            if (objUrl.value == "") {
                alert("链接不能为空");
                objUrl.focus();
                return false;
            }
            var objRank = document.getElementById("TextBox_Rank");
            if (objRank.value == "") {
                alert("排序不能为空");
                objRank.focus();
                return false;
            }
            var objClass = document.getElementById("ddl_ClassBelong")
            if (objClass.value == "请选择") {
                alert("请选择类别");
                objClass.focus();
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
                    alert("阅览图上传文件不正确");
                    objImage.focus();
                    return false;
                }
            }
            return true;
        }
        function GetURL() {
            document.getElementById("preview").href = document.getElementById("txtUrl").value;
        }
</script>  
</head>
<body>
    <form id="form1" name="form1" runat="server" enctype="multipart/form-data">
        <!-- Content start -->
        <div class="inner_content">
            <div class="widgets_area"> 
                <div class="row-fluid">
                    <div class="span12">
                        <div class="daohanglink" style="">
                            <span class="daohang"></span><span>首页&gt;</span> <span>案例信息管理&gt;</span> <span>添加案例信息</span>
                        </div>
                        <div class="well brown">
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
                                <label style="width:65px; height:29px;">
                                    是否生成：</label>
                                    &nbsp;&nbsp;
                                    <asp:RadioButtonList ID="btnlQRCode" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Selected="True">是</asp:ListItem>
                                        <asp:ListItem>否</asp:ListItem>
                                </asp:RadioButtonList>
                                &nbsp;&nbsp;
                                <label style="width:300px; height:29px; color:Gray;">
                                    选择是:二维码栏为上传二维码中心LOGO<br />选择否:二维码栏为上传二维码</label>&nbsp;&nbsp;
                            </div>
                            <div class="form_list">
                                <label id="QRCode" class="lable_title">
                                    二维码图：</label>&nbsp;&nbsp;
                                <asp:FileUpload ID="FileUpload_QRCode" runat="server" Height="21px" Width="277px" />
                            </div>
                            <div class="form_list">
                                <label class="lable_title">
                                    预览图片：</label>&nbsp;&nbsp;
                                <asp:FileUpload ID="FileUpload_caseImage" runat="server" Height="21px" Width="277px" />
                            </div>
                            <div class="form_list">
                                <label class="lable_title">
                                    案例排序：</label>&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox_Rank" runat="server" Width="304px" Height="33px" onkeyup="value=value.replace(/[^\d]/g,'')"></asp:TextBox>
                            </div>
                             <label class="lable_title">
                                    案例简介：</label>&nbsp;&nbsp;
        <asp:TextBox id="txtcontent" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;" runat="server"></asp:TextBox>
                                </div>
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
                                <input type="button" class="submit" value="返 回" style="margin-left:20px" onclick="javascript:location.href='ElementInfo_Manage.aspx';" />
                            </td>
                            </tr>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
