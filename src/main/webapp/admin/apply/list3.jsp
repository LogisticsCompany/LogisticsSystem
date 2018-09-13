<!DOCTYPE HTML>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.bean.OrderForm" %>
<%@ page import = "com.example.logistics_system.bean.Deliverer" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    List<Deliverer> deliverers = (List<Deliverer>) request.getSession().getAttribute("deliverers");
    List<OrderForm> orderForms = (List<OrderForm>) request.getSession().getAttribute("orderForms");
    request.getSession().removeAttribute("deliverers");
    request.getSession().removeAttribute("orderForms");
    Object message = request.getSession().getAttribute("message");
    if (message != null)
    {
%>
<script>
    alert('<%=(String)message%>');
</script>
<%
    }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <base href = "<%=basePath%>"/>
    <meta http-equiv = "Content-Type" content = "text/html; charset=UTF-8">
    <title>管理员信息列表</title>


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
</head>
<body>
<div>
    <form method = "post" id = "form1" action = "/assignOrder">
        <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
               class = "table table-striped">
            <tr align = "center">
                <td>
                    <div class = "form-group form-group-extend">
                        <select class = "selectpicker show-tick" title = "= 请选择单号 ="
                                data-live-search = "true" data-size = "10"
                                id = "orderForm" name = "orderFormId">
                        </select>
                    </div>
                    <div class = "form-group form-group-extend">
                        <select class = "selectpicker show-tick" title = "= 请选择派送者 ="
                                data-live-search = "true" data-size = "10"
                                id = "deliverer" name = "delivererId">
                        </select>
                    </div>

                    <input type = "submit" value = "指派订单" name = "button" id = "button"
                           class = "btn btn-success" style = "height: auto;width:auto"
                    />
                </td>
            </tr>
        </table>
    </form>

    <form id = "id_form">
        <input type = "hidden" id = "id_input" name = "orderFormId">
    </form>

</div>

<script>
    function $1(val) {
        return document.getElementById(val);
    }

    function getOption(value, text) {
        let opt = document.createElement('option');
        opt.innerText = text;
        opt.value = value;
        return opt;
    }

    function init_operation() {
        let orderForm = $1('orderForm');
        let deliverer = $1('deliverer');

        <%
        for (OrderForm orderForm : orderForms) {
        %>
        orderForm.appendChild(getOption(<%=orderForm.getId()%>, '<%=orderForm.getOrderNumber()%>'));
        <%
        }
        for (Deliverer deliverer : deliverers) {
        %>
        deliverer.appendChild(getOption(<%=deliverer.getId()%>, '<%=deliverer.getName()%>'));
        <%
        }
        %>
    }

    init_operation();
</script>

</body>
</html>