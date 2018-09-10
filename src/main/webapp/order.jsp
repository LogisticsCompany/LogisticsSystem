<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.utils.OrderUtil" %>
<%@ page import = "org.springframework.data.domain.Page" %>
<%@ page import = "com.example.logistics_system.bean.OrderForm" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <base href = "<%=basePath%>"/>
    <meta http-equiv = "Content-Type" content = "text/html; charset=utf-8"/>
    <title>订单申请</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/tab.js"></script>
    <script src = "js/city.js"></script>
    <script src = "js/get_address.js"></script>
</head>

<body>

<div class = "page">
    <div class = "page_con">
        <jsp:include flush = "true" page = "/inc/top.jsp"></jsp:include>
        <!----------------内容区开始-------------------->

        <div>
            <div class = "panel panel-info" style = "width: 100%">
                <div class = "panel-heading">
                    <div class = "btn-group">
                        <button type = "button" class = "btn btn-primary dropdown-toggle " data-toggle = "dropdown"
                                style = "width: auto">
                            <%--<script>--%>
                                <%--switch (state) {--%>
                                    <%--case <%=OrderUtil.ORDER_ALL%>:--%>
                                        <%--document.write('可申请订单');--%>
                                        <%--break;--%>
                                    <%--case <%=OrderUtil.ORDER_ARRIVED%>:--%>
                                        <%--document.write('待审核订单');--%>
                                        <%--break;--%>
                                    <%--case <%=OrderUtil.ORDER_ADMIN_ACCEPT%>:--%>
                                        <%--document.write('已通过订单');--%>
                                        <%--break;--%>
                                    <%--case <%=OrderUtil.ORDER_ADMIN_REFUSE%>:--%>
                                        <%--document.write('已拒绝订单');--%>
                                        <%--break;--%>
                                <%--}--%>
                            <%--</script>--%>
                                可申请订单
                            <span class = "caret"></span>
                        </button>
                        <ul class = "dropdown-menu" role = "menu">
                            <li>
                                <a href = "/userOrders?state=<%=OrderUtil.ORDER_ALL%>">可申请订单</a>
                            </li>
                            <li role = "presentation">
                                <a href = "/userOrders?state=<%=OrderUtil.ORDER_ARRIVED%>">待审核订单</a>
                            </li>
                            <li role = "presentation">
                                <a href = "/userOrders?state=<%=OrderUtil.ORDER_ADMIN_ACCEPT%>">已通过订单</a>
                            </li>
                            <li role = "presentation">
                                <a href = "/userOrders?state=<%=OrderUtil.ORDER_ADMIN_REFUSE%>">已拒绝订单</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class = "panel-body">
                    <table class = "table table-striped">
                        <thead>
                        <th>单号</th>
                        <th>状态</th>
                        <th>接收方信息</th>
                        <th>操作</th>
                        </thead>
                        <tbody>
                        <%--<%--%>
                            <%--for (OrderForm orderForm : orderForms)--%>
                            <%--{--%>
                        <%--%>--%>
                        <%--<tr>--%>
                            <%--<td><%=orderForm.getOrderNumber()%>--%>
                            <%--</td>--%>
                            <%--<td><%=OrderUtil.STATES[orderForm.getState()]%>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                <%--<script>--%>
                                    <%--document.write(get_address(<%=orderForm.getSenderProvince()%>, <%=orderForm.getSenderCity()%>, <%=orderForm.getSenderCountry()%>) + '\n' +--%>
                                        <%--'<%=orderForm.getSenderAddress()%>' + ' ' + '<%=orderForm.getSender()%>' + ' ' + '<%=orderForm.getSenderPhoneNumber()%>')--%>
                                <%--</script>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                <%--<script>--%>
                                    <%--document.write(get_address(<%=orderForm.getReceiverProvince()%>, <%=orderForm.getReceiverCity()%>, <%=orderForm.getReceiverCountry()%>) + '\n' +--%>
                                        <%--'<%=orderForm.getReceiverAddress()%>' + ' ' + '<%=orderForm.getReceiver()%>' + ' ' + '<%=orderForm.getReceiverPhoneNumber()%>')--%>
                                <%--</script>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                <%--<%--%>
                                    <%--if (orderForm.getState() == OrderUtil.ORDER_ORDER)--%>
                                    <%--{--%>
                                <%--%>--%>
                                <%--<a href="/deleteOrder?id=<%=orderForm.getId()%>&state=<%=state%>">申请派送</a>--%>
                                <%--<%--%>
                                <%--}--%>
                                <%--else--%>
                                <%--{--%>
                                <%--%>--%>
                                <%--申请派送--%>
                                <%--<%--%>
                                    <%--}--%>
                                <%--%>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                        <%--<%--%>
                            <%--}--%>
                        <%--%>--%>
                        </tbody>
                    </table>
                    <br>
                    <%--<div align = "center">--%>
                        <%--<a href = "/userOrders?start=0&state=<%=state%>">[首页]</a>--%>
                        <%--<a href = "/userOrders?start=<%=orderForms.getNumber()-1%>&state=<%=state%>">[上一页]</a>--%>
                        <%--<a href = "/userOrders?start=<%=orderForms.getNumber()+1%>&state=<%=state%>">[下一页]</a>--%>
                        <%--<a href = "/userOrders?start=<%=orderForms.getTotalPages()-1%>&state=<%=state%>">[末页]</a>--%>
                    <%--</div>--%>
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
