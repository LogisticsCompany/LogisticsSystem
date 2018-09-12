<!DOCTYPE HTML>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "org.springframework.data.domain.Page" %>
<%@ page import = "com.example.logistics_system.bean.DelivererOrder" %>
<%@ page import = "com.example.logistics_system.bean.OrderForm" %>
<%@ page import = "com.example.logistics_system.bean.Deliverer" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Set<DelivererOrder> delivererOrders = (Set<DelivererOrder>) request.getSession().getAttribute("delivererOrders");
    Map<Integer, OrderForm> map = new HashMap<>();
    for (DelivererOrder delivererOrder : delivererOrders)
        map.put(delivererOrder.getOrderForm().getId(), delivererOrder.getOrderForm());
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

    <form action = "/order" method = "post">

        <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
               class = "table table-striped">
            <tr align = "center">

                <td>

                    <div class = "form-group form-group-extend">
                        <select class = "selectpicker show-tick" title = "= 请选择单号 ="
                                data-live-search = "true" data-size = "10"
                                id = "orderForm" name = "orderForm">
                        </select>
                    </div>
                    <div class = "form-group form-group-extend">
                        <select class = "selectpicker show-tick" title = "= 请选择申请者 ="
                                data-live-search = "true" data-size = "10"
                                id = "deliverer" name = "deliverer">
                        </select>
                    </div>
                    <div class = "form-group form-group-extend">
                        <select class = "selectpicker show-tick" title = "= 请选择操作 ="
                                data-live-search = "true" data-size = "5"
                                id = "operation" name = "operation">
                        </select>
                    </div>


                    <input type = "submit" value = "确定" name = "button" id = "button"
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

        <%
        Collection<OrderForm> orderForms = map.values();
        for (OrderForm orderForm : orderForms) {
        %>
        orderForm.appendChild(getOption(<%=orderForm.getId()%>, '<%=orderForm.getOrderNumber()%>'));
        <%
        }
        %>

        orderForm.addEventListener("change", function () {
            $1('id_input').value = orderForm.options[orderForm.selectedIndex].value;
            let value = $("#id_form").serialize();
            $.ajax(
                {
                    method: "post",
                    url: '/optionDeliverers',
                    data: value,
                    success: function (data) {
                        let resultJson = JSON.parse(data);
                        let deliverer = $1('deliverer');
                        for (x in resultJson) {
                            let tmp = JSON.parse(resultJson[x]);
                            deliverer.appendChild(getOption(tmp.id, tmp.name));
                        }
                        $("#deliverer").selectpicker("refresh");
                    }
                }
            );
        });
    }

    init_operation();
</script>

</body>
</html>