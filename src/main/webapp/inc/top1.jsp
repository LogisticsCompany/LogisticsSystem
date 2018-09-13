<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.bean.Deliverer" %>

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
    Object deliverer = request.getSession().getAttribute("deliverer");
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
            <%
                if (deliverer != null)
                {
            %>
            <li role = "presentation">
                <a href = "/delivererOrders"><span>订单申请</span> </a>
            </li>
            <li role = "presentation">
                <a href = "courier_inf.jsp"><span>我的信息</span> </a>
            </li>
            <%
                }
            %>
        </ul>
        <div class = "banner">
            <div id = "carousel-example-generic" class = "carousel slide" data-ride = "carousel">

                <!-- Wrapper for slides -->
                <div class = "carousel-inner" role = "listbox">
                    <div class = "item active">
                        <img src = "images/top.jpg">
                    </div>
                    <div class = "item">
                        <img src = "img/top4.jpg">
                    </div>
                    <div class = "item">
                        <img src = "img/top5.jpg">
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!----------------主导航菜单结束-------------------->
</div>
<!----------------内容区开始-------------------->
<div align = "right" style = "padding-right: 58px">
    <%
        if (deliverer != null)
        {
    %>
    <span>欢迎你：<%=((Deliverer) deliverer).getUsername() %></span>

    <span><a href = "del_logout.jsp" class = "zc">注销</a> </span>
    <%
        }
    %>
</div>
