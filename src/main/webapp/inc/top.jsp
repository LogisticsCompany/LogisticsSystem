<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.bean.User" %>
<%@ page import = "com.example.logistics_system.utils.OrderUtil" %>

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
    Object loginError = request.getSession().getAttribute("loginError");
    Object registerError = request.getSession().getAttribute("registerError");
    if (loginError != null)
    {
%>
<script>
    alert('用户名或密码有误！');
</script>
<%
        request.getSession().removeAttribute("loginError");
    }
    if (registerError != null)
    {
%>
<script>
    alert('该账号已存在！');
</script>
<%
        request.getSession().removeAttribute("registerError");
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
                <a href = "order_query.jsp"><span>运单查询</span> </a>
            </li>


            <%
                if (user != null)
                {
            %>
            <li role = "presentation">
                <a href = "new_order.jsp"><span>在线下单</span> </a>
            </li>
            <li role = "presentation">
                <a href = "/userOrders?state=<%=OrderUtil.ORDER_ALL%>"><span>我的订单</span> </a>
            </li>

            <li role = "presentation">
                <a href = "reinformation.jsp"><span>我的信息</span> </a>
            </li>
           
            <%
                }
            %>
        </ul>
        <div class="banner">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="images/top.jpg" >
                </div>
                <div class="item">
                    <img src="img/top4.jpg" >
                </div>
                <div class="item">
                    <img src="img/top5.jpg" >
                </div>

            </div>
        </div>
        </div>

    </div>
    <!----------------主导航菜单结束-------------------->
</div>
<!----------------内容区开始-------------------->
<div align = "right" style="padding-right: 58px">
    <%
        if (user == null)
        {
    %>
    <form id = "form1" name = "form1" method = "post" action = "/userLogin">
		<span>账号： <input type = "text" name = "username" id = "username"
                         class = "form-control form-control-inline" style = "width: 150px"/> </span>
        <span>密码： <input type = "password" name = "password"
                         id = "pwd" class = "form-control form-control-inline" style = "width: 150px"/> </span>
        <span> <input type = "submit" name = "button" id = "login_btn"
                      value = "登录" class = "btn btn-success" style = "height: auto"/> </span>
        <span>  <input type = "button" name = "button" id = "register_btn"
                       value = "注册" class = "btn btn-primary" style = "height: auto"
                       onclick = "window.location.href='register.jsp'"/></span>
        <span>  <input type = "button" name = "button" id = "admin_btn"
                       value = "后台" class = "btn btn-danger" style = "height: auto"
                       onclick = "javascript:window.open('admin_login.jsp','_blank')"/></span>
        <span>  <input type = "button" name = "button" id = "del_btn"

                       value = "派送员登录" class = "btn btn-danger" style = "height: auto; width:auto"
                       onclick = "javascript:window.open('del_login.jsp','_blank')"/></span>

    </form>
    <%
    }
    else
    { %>
    <span>欢迎你：<%=user.getUsername() %></span>

    <span><a href = "logout.jsp" class = "zc">注销</a> </span>
    <%
        }
    %>
</div>