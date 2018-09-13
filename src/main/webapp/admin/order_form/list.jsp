<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "org.springframework.data.domain.Page" %>
<%@ page import = "com.example.logistics_system.bean.OrderForm" %>
<%@ page import = "com.example.logistics_system.utils.OrderUtil" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Page<OrderForm> orderForms = (Page<OrderForm>) request.getSession().getAttribute("orderForms");
    request.getSession().removeAttribute("orderForms");
    int state = (int) request.getSession().getAttribute("state");
    request.getSession().removeAttribute("state");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv = "Content-Type" content = "text/html; charset=UTF-8">
    <title>已下单订单</title>

    <script src = "<%=path %>/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href = "<%=path %>/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
    <script src = "<%=path %>/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href = "<%=path %>/css/admin.css" rel = "stylesheet">
    <base href = "<%=basePath%>">

    <script src = "js/city.js"></script>
    <script src = "js/get_address.js"></script>
</head>
<body>

<div class = "panel panel-info" style = "width: 100%;">
    <div class = "panel-heading">
        <div class = "btn-group">
            已下单订单列表
        </div>
    </div>
    <div class = "panel-body">
        <table class = "table table-striped">
            <thead>
            <th>单号</th>
            <th>状态</th>
            <th>发送方信息</th>
            <th>接收方信息</th>
            </thead>
            <tbody>
            <%
                for (OrderForm orderForm : orderForms)
                {
            %>
            <tr>
                <td><%=orderForm.getOrderNumber()%></td>
                <td><%=OrderUtil.STATES[orderForm.getState()]%></td>
                <td>
                    <script>
                        document.write(get_address(<%=orderForm.getSenderProvince()%>, <%=orderForm.getSenderCity()%>, <%=orderForm.getSenderCountry()%>) + '\n' +
                            '<%=orderForm.getSenderAddress()%>' + ' ' + '<%=orderForm.getSender()%>' + ' ' + '<%=orderForm.getSenderPhoneNumber()%>')
                    </script>
                </td>
                <td>
                    <script>
                        document.write(get_address(<%=orderForm.getReceiverProvince()%>, <%=orderForm.getReceiverCity()%>, <%=orderForm.getReceiverCountry()%>) + '\n' +
                            '<%=orderForm.getReceiverAddress()%>' + ' ' + '<%=orderForm.getReceiver()%>' + ' ' + '<%=orderForm.getReceiverPhoneNumber()%>')
                    </script>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <br>
        <div align = "center">
            <a href = "/userOrders?start=0&state=<%=state%>">[首页]</a>
            <a href = "/userOrders?start=<%=orderForms.getNumber()-1%>&state=<%=state%>">[上一页]</a>
            <a href = "/userOrders?start=<%=orderForms.getNumber()+1%>&state=<%=state%>">[下一页]</a>
            <a href = "/userOrders?start=<%=orderForms.getTotalPages()-1%>&state=<%=state%>">[末页]</a>
        </div>
    </div>
</div>

</body>
</html>