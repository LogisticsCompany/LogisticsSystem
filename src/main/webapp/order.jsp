<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.utils.OrderUtil" %>
<%@ page import = "org.springframework.data.domain.Page" %>
<%@ page import = "com.example.logistics_system.bean.OrderForm" %>
<%@ page import = "com.example.logistics_system.utils.DelivererOrderUtil" %>
<%@ page import = "com.example.logistics_system.bean.DelivererOrder" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Object orderFormsObject = request.getSession().getAttribute("orderForms");
    request.getSession().removeAttribute("orderForms");
    Object delivererOrdersObject = request.getSession().getAttribute("delivererOrders");
    request.getSession().removeAttribute("delivererOrders");
    int state = (int) request.getSession().getAttribute("state");
    request.getSession().removeAttribute("state");

    List<Object> messages = new ArrayList<>();
    Object requestMessage = request.getSession().getAttribute("requestMessage");
    request.getSession().removeAttribute("requestMessage");
    messages.add(requestMessage);

    Object cancelMessage = request.getSession().getAttribute("cancelMessage");
    request.getSession().removeAttribute("cancelMessage");
    messages.add(cancelMessage);

    Object modifyResult = request.getSession().getAttribute("modifyResult");
    request.getSession().removeAttribute("modifyResult");
    messages.add(modifyResult);

    Object deliveryMessage = request.getSession().getAttribute("deliveryMessage");
    request.getSession().removeAttribute("deliveryMessage");
    messages.add(deliveryMessage);

    for (Object message : messages)
    {
        if (message != null)
        {
%>
<script>
    alert('<%=(String)message%>');
</script>
<%
        }
    }
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
                            <script>
                                let state = <%=state%>;
                                switch (state) {
                                    case <%=OrderUtil.ORDER_ORDER%>:
                                        document.write('可申请订单');
                                        break;
                                    case <%=DelivererOrderUtil.ORDER_DELIVERER_REQUEST%>:
                                        document.write('待审核订单');
                                        break;
                                    case <%=DelivererOrderUtil.ORDER_ADMIN_ACCEPT%>:
                                        document.write('已通过订单');
                                        break;
                                    case <%=DelivererOrderUtil.ORDER_ADMIN_REFUSE%>:
                                        document.write('已拒绝订单');
                                        break;
                                    case <%=DelivererOrderUtil.ORDER_DELIVERY%>:
                                        document.write('已派送订单');
                                        break;
                                }
                            </script>
                            <span class = "caret"></span>
                        </button>
                        <ul class = "dropdown-menu" role = "menu">
                            <li role = "presentation">
                                <a href = "/delivererOrders">可申请订单</a>
                            </li>
                            <li role = "presentation">
                                <a href = "/delivererStateOrders?state=<%=DelivererOrderUtil.ORDER_DELIVERER_REQUEST%>">待审核订单</a>
                            </li>
                            <li role = "presentation">
                                <a href = "/delivererStateOrders?state=<%=DelivererOrderUtil.ORDER_ADMIN_ACCEPT%>">已通过订单</a>
                            </li>
                            <li role = "presentation">
                                <a href = "/delivererStateOrders?state=<%=DelivererOrderUtil.ORDER_ADMIN_REFUSE%>">已拒绝订单</a>
                            </li>
                            <li role = "presentation">
                                <a href = "/delivererStateOrders?state=<%=DelivererOrderUtil.ORDER_DELIVERY%>">已派送订单</a>
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
                        <%
                            if (orderFormsObject != null)
                            {
                                Page<OrderForm> orderForms = (Page<OrderForm>) orderFormsObject;
                                for (OrderForm orderForm : orderForms)
                                {
                        %>
                        <tr>
                            <td><%=orderForm.getOrderNumber()%>
                            </td>
                            <td><%=OrderUtil.STATES[orderForm.getState()]%>
                            </td>
                            <td>
                                <script>
                                    document.write(get_address(<%=orderForm.getReceiverProvince()%>, <%=orderForm.getReceiverCity()%>, <%=orderForm.getReceiverCountry()%>) + '\n' +
                                        '<%=orderForm.getReceiverAddress()%>' + ' ' + '<%=orderForm.getReceiver()%>' + ' ' + '<%=orderForm.getReceiverPhoneNumber()%>')
                                </script>
                            </td>
                            <td>
                                <a href = "/requestOrder?orderFormId=<%=orderForm.getId()%>">申请</a>
                            </td>
                        </tr>
                        <%
                            }
                        }
                        else if (delivererOrdersObject != null)
                        {
                            Page<DelivererOrder> delivererOrders = (Page<DelivererOrder>) delivererOrdersObject;
                            for (DelivererOrder delivererOrder : delivererOrders)
                            {
                                OrderForm orderForm = delivererOrder.getOrderForm();
                        %>
                        <td><%=orderForm.getOrderNumber()%>
                        </td>
                        <td><%=DelivererOrderUtil.STATES[delivererOrder.getState()]%>
                        </td>
                        <td>
                            <script>
                                document.write(get_address(<%=orderForm.getReceiverProvince()%>, <%=orderForm.getReceiverCity()%>, <%=orderForm.getReceiverCountry()%>) + '\n' +
                                    '<%=orderForm.getReceiverAddress()%>' + ' ' + '<%=orderForm.getReceiver()%>' + ' ' + '<%=orderForm.getReceiverPhoneNumber()%>')
                            </script>
                        </td>
                        <%
                            if (delivererOrder.getState() == DelivererOrderUtil.ORDER_DELIVERER_REQUEST)
                            {
                        %>
                        <td>
                            <a href = "/cancelRequest?orderFormId=<%=orderForm.getId()%>">撤销请求</a>
                        </td>
                        <%
                        }
                        else if (delivererOrder.getState() == DelivererOrderUtil.ORDER_ADMIN_ACCEPT)
                        {
                        %>
                        <td>
                            <a href = "/deliveryOrder?orderFormId=<%=orderForm.getId()%>">派送</a>
                        </td>
                        <%
                        }
                        else if (delivererOrder.getState() == DelivererOrderUtil.ORDER_DELIVERY)
                        {
                        %>
                        <td>
                            <a href="/accomplishOrder?orderFormId=<%=orderForm.getId()%>">送达</a>
                        </td>
                        <%
                                    }
                                }
                            }
                        %>
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
