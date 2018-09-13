<%@ page import = "com.example.logistics_system.bean.Admin" %>
<%@ page import = "com.example.logistics_system.utils.OrderUtil" %>
<%@ page import = "com.example.logistics_system.utils.DelivererOrderUtil" %><%--
  Created by IntelliJ IDEA.
  User: dell-pc
  Date: 2018/9/4
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<%
    String path = request.getContextPath();
    Admin admin = (Admin) request.getSession().getAttribute("admin");
%>
<html>
<head>
    <title>物流信息管理系统</title>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/admin-all.css"/>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/base.css"/>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/bootstrap.min.css"/>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/ui-lightness/jquery-ui-1.8.22.custom.css"/>
    <script type = "text/javascript" src = "<%=path %>/Scripts/jquery-1.7.2.js"></script>
    <script type = "text/javascript" src = "<%=path %>/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <script type = "text/javascript" src = "<%=path %>/Scripts/index.js"></script>

    <script src = "<%=path %>/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href = "<%=path %>/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
    <script src = "<%=path %>/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href = "<%=path %>/css/bootstrap_extend.css" rel = "stylesheet">

    <script>
        var changeTitle = function (arg) {
            document.getElementById('frame_title').innerHTML = arg.text;
        }
    </script>
</head>
<body>

<div class = "warp">
    <!--头部开始-->
    <div class = "top_c">
        <div class = "top-nav">欢迎您:<%=admin.getUsername()%>&nbsp;&nbsp;
            <a href = "admin_login.jsp">安全退出</a>
        </div>
    </div>
    <!--头部结束-->

    <div align = "right">

        <div class = "btn-group">
            <button type = "button" class = "btn btn-default dropdown-toggle " data-toggle = "dropdown">
                员工维护
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "/deliverers" target = "Conframe"
                       onclick = "changeTitle(this)">派送员</a>
                </li>
                <li>
                    <a href = "<%=path %>/admin/courier/list1.jsp" target = "Conframe"
                       onclick = "changeTitle(this)">添加派送员</a>
                </li>
            </ul>
        </div>

        <div class = "btn-group" style = "align:right">
            <button type = "button" class = "btn btn-default dropdown-toggle " data-toggle = "dropdown">
                指派订单
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "/delivererAndOrder" target = "Conframe"
                       onclick = "changeTitle(this)">指派订单</a>
                </li>
            </ul>
        </div>

        <div class = "btn-group" style = "align:right">
            <button type = "button" class = "btn btn-default dropdown-toggle " data-toggle = "dropdown">
                管理申请
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "/allRequestOrders" target = "Conframe" onclick = "changeTitle(this)">所有申请</a>
                </li>
                <li>
                    <a href = "/courierOrders?state=<%=DelivererOrderUtil.ORDER_ADMIN_ACCEPT%>" target = "Conframe"
                       onclick = "changeTitle(this)">通过订单</a>
                </li>
                <li>
                    <a href = "/courierOrders?state=<%=DelivererOrderUtil.ORDER_ADMIN_REFUSE%>" target = "Conframe"
                       onclick = "changeTitle(this)">拒绝订单</a>
                </li>

            </ul>
        </div>


        <div class = "btn-group">
            <button type = "button" class = "btn btn-default dropdown-toggle " data-toggle = "dropdown">
                订单管理
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "/orders?state=<%=OrderUtil.ORDER_ORDER%>" target = "Conframe"
                       onclick = "changeTitle(this)">已下单</a>
                </li>
                <li>
                    <a href = "/orders?state=<%=OrderUtil.ORDER_REFUSE_SIGN%>" target = "Conframe"
                       onclick = "changeTitle(this)">拒收</a>
                </li>
                <li>
                    <a href = "/orders?state=<%=OrderUtil.ORDER_DELIVERY%>" target = "Conframe"
                       onclick = "changeTitle(this)">已派送</a>
                </li>
                <li>
                    <a href = "/orders?state=<%=OrderUtil.ORDER_ARRIVED%>" target = "Conframe"
                       onclick = "changeTitle(this)">已到达</a>
                </li>
                <li>
                    <a href = "/orders?state=<%=OrderUtil.ORDER_SIGN%>" target = "Conframe"
                       onclick = "changeTitle(this)">已确认收货</a>
                </li>
            </ul>
        </div>


    </div>

    <div class = "panel panel-info">
        <div class = "panel-heading" id = "frame_title">基本信息</div>
        <div class = "panel-body">
            <iframe name = "Conframe" id = "Conframe" src = "<%=path %>/admin/sysPro.jsp"
                    style = "height: 410px"></iframe>
        </div>
    </div>

</div>
<br> <br> <br> <br> <br>
<!--底部开始-->
<div class = "bottom_c">联系我们：
    <a href = "https://github.com/LogisticsCompany/LogisticsManagementSystem" target = "_blank"
       style = "color: white">LogisticsCompany</a></div>
<!--底部结束-->

</body>
</html>
