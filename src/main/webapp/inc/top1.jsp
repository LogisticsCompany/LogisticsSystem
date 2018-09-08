<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.bean.User" %>

<%--<script src = "bootstrap/js/jquery/2.0.0/jquery.min.js"></script>--%>
<%--<link href = "bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">--%>
<%--<script src = "bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>--%>

<link href = "bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
<link href = "bootstrap-select/dist/css/bootstrap-select.min.css" rel = "stylesheet">

<script src = "bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
<script src = "bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script src = "bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src = "bootstrap-select/dist/js/i18n/defaults-zh_CN.min.js"></script>

<link href = "css/bootstrap_extend.css" rel = "stylesheet">

<style>
    .form-group-extend {
        display: inline;
    }
</style>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    User user = (User) request.getSession().getAttribute("user");
    Object loginError = session.getAttribute("loginError");
    Object registerError = session.getAttribute("registerError");
    if (loginError != null)
    {
%>
<script>
    alert('用户名或密码有误！');
</script>
<%
        session.removeAttribute("loginError");
    }
    if (registerError != null)
    {
%>
<script>
    alert('该账号已存在！');
</script>
<%
        session.removeAttribute("registerError");
    }
%>

<div id = "top">
    <!----------------页面头部开始-------------------->

    <!----------------页面头部结束-------------------->
    <!----------------主导航菜单开始-------------------->
    <div align = "center">
        <ul class = "nav nav-tabs">
            <li role = "presentation">
                <a href = "index.jsp"><span>首页</span> </a>
            </li>
            <li role = "presentation">
                <a href = "news.jsp"><span>新闻资讯</span> </a>
            </li>
            <li role = "presentation">
                <a href = "wd.jsp"><span>网点信息</span> </a>
            </li>
            <li role = "presentation">
                <a href = "yundan.jsp"><span>运单查询</span> </a>
            </li>
            <li role = "presentation">
                <a href = "yunfei.jsp"><span>运费查询</span> </a>
            </li>
            <li role = "presentation">
                <a href = "message.jsp"><span>留言板</span> </a>
            </li>
            <%
                if (user != null)
                {
            %>
            <li role = "presentation">
                <a href = "new_order.jsp"><span>在线下单</span> </a>
            </li>
            <li role = "presentation">
                <a href = "my_order.jsp"><span>我的订单</span> </a>
            </li>
            <li role = "presentation">
                <a href = "reinformation.jsp"><span>我的信息</span> </a>
            </li>
            <%
                }
            %>
        </ul>
        <div class = "banner">
            <img src = "images/top.jpg"/>
        </div>
    </div>
    <!----------------主导航菜单结束-------------------->
</div>
<!----------------内容区开始-------------------->
