<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Object loginError = request.getSession().getAttribute("loginError");
    if (loginError != null)
    {
%>
<script>
    alert('用户名或密码有误！');
</script>
<%
        request.getSession().removeAttribute("loginError");
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <link rel = "stylesheet" type = "text/css" href = "http://static.how2j.cn/css/front/style.css"/>
    <link rel = "shortcut icon" href = "/img/site/favicon.ico"/>
    <link href = "http://static.how2j.cn/css/all.css" rel = "stylesheet">
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/tab.js"></script>


    <link href = "bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
    <script src = "bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <script src = "bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>

    <title>派送员登录</title>

    <link rel = "stylesheet" type = "text/css" href = "http://static.how2j.cn/css/front/style.css"/>
    <link href = "http://static.how2j.cn/css/all.css" rel = "stylesheet">


    <style>
        <!--
        pre {
        --> <!-- width: 500 px;
        --> <!--
        }

        -->
    </style>
</head>


<body>
<jsp:include flush = "true" page = "/inc/top1.jsp"></jsp:include>


<div style = "max-width:400px;margin:100px auto;" id = "loginRegisterDiv">

    <div id = "errorDiv" style = "display:none" class = "alert alert-danger alert-dismissable">

        <span id = "errorMessage"></span>
    </div>

    <ul class = "nav nav-tabs">
        <li role = "presentation" id = "loginTab" class = "active"><a id = "toggleLogin" href = "#">登录</a></li>
    </ul>
    <div id = "loginDiv">
        <form class = "loginRegisterform" method = "post" action = "/delivererLogin">
            <br>
            <input name = "username" class = "form-control" placeholder = "请输入账号" required>
            <br/>
            <input type = "password" name = "password" class = "form-control" placeholder = "请输入密码" required>
            <br>
            <br>
            <button class = "btn btn-lg btn-info btn-block " type = "submit">登录</button>
        </form>
    </div>
</div>
<jsp:include flush = "true" page = "/inc/foot.jsp"></jsp:include>
</body>
</html>
