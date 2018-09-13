<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "org.springframework.data.domain.Page" %>
<%@ page import = "com.example.logistics_system.bean.DelivererOrder" %>
<%@ page import = "com.example.logistics_system.utils.DelivererOrderUtil" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Page<DelivererOrder> delivererOrders = (Page<DelivererOrder>) request.getSession().getAttribute("delivererOrders");
    request.getSession().removeAttribute("delivererOrders");
    int state = (int) request.getSession().getAttribute("state");
    request.getSession().removeAttribute("state");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <script src = "<%=path %>/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href = "<%=path %>/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
    <script src = "<%=path %>/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href = "<%=path %>/css/admin.css" rel = "stylesheet">
    <base href = "<%=basePath%>">
    <meta http-equiv = "Content-Type" content = "text/html; charset=UTF-8">
    <title>用户信息列表</title>

</head>
<body>

<div class = "panel panel-info" style = "width: 50%; margin:auto">
    <div class = "panel-heading" style = "margin:auto">
        <div class = "btn-group">
            <table>
                <tr>
                    通过申请订单列表
                </tr>
            </table>
        </div>
    </div>
    <div class = "panel-body">
        <table class = "table table-striped">
            <thead>
            <th>单号</th>
            <th>申请人</th>
            <th>状态</th>
            </thead>
            <tbody>
            <%
                for (DelivererOrder delivererOrder : delivererOrders)
                {
            %>
            <tr>
                <td><%=delivererOrder.getOrderForm().getOrderNumber()%>
                </td>
                <td><%=delivererOrder.getDeliverer().getName()%>
                </td>
                <td><%=DelivererOrderUtil.STATES[delivererOrder.getState()]%>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <br>
        <div align = "center">
            <a href = "/courierOrders?start=0&state=<%=state%>">[首页]</a>
            <a href = "/courierOrders?start=<%=delivererOrders.getNumber()-1%>&state=<%=state%>">[上一页]</a>
            <a href = "/courierOrders?start=<%=delivererOrders.getNumber()+1%>&state=<%=state%>">[下一页]</a>
            <a href = "/courierOrders?start=<%=delivererOrders.getTotalPages()-1%>&state=<%=state%>">[末页]</a>
        </div>
    </div>
</div>

</body>
</html>