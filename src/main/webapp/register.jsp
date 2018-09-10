<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <base href = "<%=basePath%>">
    <meta http-equiv = "Content-Type" content = "text/html; charset=utf-8"/>
    <title>用户注册</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/tab.js">
    </script>

    <script type = "text/javascript">
        function check() {

            if (document.getElementById("pwds").value.length < 6
                || document.getElementById("pwds").value.length > 12) {
                alert("密码必须是6到12位！");
                return false;
            }

            var tels = document.getElementById("tel").value;

            if (isNaN(tels) || tels.length != 11) {
                alert("请输入正确手机号码！");
                return false;
            }

            var em = document.getElementById("email").value;

            var szReg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            var bChk = szReg.test(em);
            if (bChk == false) {
                alert("邮箱格式不正确！");
                return false;
            }

            return true;

        }
    </script>
</head>

<body>

<div class = "page">
    <div class = "page_con">
        <jsp:include flush = "true" page = "/inc/top.jsp"></jsp:include>
        <!----------------内容区开始-------------------->
            <div class = "panel panel-info" style = "width: 100%">
                <div class = "panel-heading">信息修改</div>
                <div class = "panel-body">

                            <form id = "form1" name = "form1" method = "post"
                                  action = "/register" onSubmit = "return check()">

                                <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
                                       class = "table table-striped ">
                                    <tr>
                                        <td class = "left_name1">
                                            账号：
                                        </td>
                                        <td>

                                            <input type = "text" name = "username" id = "uname"
                                                   class = "form-control form-control-inline"
                                                   style = "width: 150px"/>
                                            <span class = "red">*</span>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td class = "left_name1">
                                            密码：
                                        </td>
                                        <td>
                                            <input type = "password" name = "password" id = "pwds"
                                                   class = "form-control form-control-inline"
                                                   style = "width: 150px"/>
                                            <span class = "red">*</span>
                                        </td>

                                    </tr>

                                    <tr>
                                        <td class = "left_name1">
                                            姓名：
                                        </td>
                                        <td>

                                            <input type = "text" name = "name" id = "rname"
                                                   class = "form-control form-control-inline"
                                                   style = "width: 150px"/>
                                            <span class = "red">*</span>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td class = "left_name1">
                                            性别：
                                        </td>
                                        <td>

                                            <span>
                                                <input type = "radio" checked = "checked" name = "sex"
                                                       id = "sex1" value = "男"/>男
                                            </span>
                                            <span>
                                                <input type = "radio" name = "sex" id = "sex2"
                                                       value = "女"/>女
                                            </span>
                                        </td>

                                    </tr>

                                    <tr>
                                        <td class = "left_name1">
                                            手机：
                                        </td>
                                        <td>

                                            <input type = "text" name = "phoneNumber" id = "tel"
                                                   class = "form-control form-control-inline"
                                                   style = "width: 150px"/>
                                            <span class = "red">*</span>

                                        </td>
                                    </tr>


                                    <tr>
                                        <td class = "left_name1">
                                            邮箱：
                                        </td>
                                        <td>

                                            <input type = "text" name = "email" id = "email"
                                                   class = "form-control form-control-inline"
                                                   style = "width: 150px"/>
                                            <span class = "red">*</span>

                                        </td>
                                    </tr>


                                    <tr>
                                        <td>

                                        </td>

                                        <td>

                                            <input type = "submit" value = "立即注册" name = "button" id = "button"
                                                   class = "btn btn-success" style = "height: auto;width:auto"
                                            />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!----------------内容区结束-------------------->
        <!---------------页脚开始---------------->
        <jsp:include flush = "true" page = "/inc/foot.jsp"></jsp:include>
        <!---------------页脚结束---------------->
    </div>
</div>
</body>
</html>
