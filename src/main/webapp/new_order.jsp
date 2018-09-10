<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Object notLoggedIn = request.getSession().getAttribute("notLoggedIn");
    Object noUser = request.getSession().getAttribute("noUser");
    if (notLoggedIn != null)
    {
%>
<script>
    alert('请先登录！');
</script>
<%
        request.getSession().removeAttribute("notLoggedIn");
    }
    if (noUser != null)
    {
%>
<script>
    alert('用户' + '<%=request.getSession().getAttribute("username")%>' + '不存在！');
</script>
<%
        request.getSession().removeAttribute("noUser");
    }

    String orderNumber = (String) request.getSession().getAttribute("orderNumber");
    if (orderNumber != null)
    {
%>
<script>
    alert('<%=orderNumber%>');
</script>
<%
        request.getSession().removeAttribute("orderNumber");
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <base href = "<%=basePath%>"/>
    <meta http-equiv = "Content-Type" content = "text/html; charset=utf-8"/>
    <title>在线下单</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/tab.js"></script>
</head>

<body>

<div class = "page">
    <div class = "page_con">
        <jsp:include flush = "true" page = "/inc/top.jsp"></jsp:include>
        <!----------------内容区开始-------------------->

        <div>
            <div class = "panel panel-info" style = "width: 100%">
                <div class = "panel-heading">在线下单</div>
                <div class = "panel-body">
                    <form action = "/order" method = "post">
                        <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
                               class = "table table-striped">
                            <tr>
                                <td class = "left_name_reinformation">
                                    出发地地址：
                                </td>
                                <td>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择省份 ="
                                                data-live-search = "true" data-size = "5" data-height = "50px"
                                                id = "senderProvince" name = "senderProvince"
                                                onchange = "changeButtonState(false)">
                                        </select>
                                    </div>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择城市 ="
                                                data-live-search = "true" data-size = "5"
                                                id = "senderCity" name = "senderCity"
                                                onchange = "changeButtonState(false)">
                                        </select>
                                    </div>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择县区 ="
                                                data-live-search = "true" data-size = "5"
                                                id = "senderCountry" name = "senderCountry"
                                                onchange = "changeButtonState()">
                                        </select>
                                    </div>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td class = "left_name_reinformation">
                                    详细地址：
                                </td>
                                <td>
                                    <input type = "text" name = "senderAddress" id = "senderAddress"
                                           class = "form-control form-control-inline"
                                           style = "width: 600px" onchange = "changeButtonState()"/>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td class = "left_name_reinformation">
                                    发货人及联系方式：
                                </td>
                                <td>
                                    <input type = "text" name = "sender" id = "sender"
                                           class = "form-control form-control-inline" placeholder = "发货人姓名"
                                           style = "width: auto" onchange = "changeButtonState()"/>
                                    <span class = "red">*</span>
                                    <input type = "text" name = "senderPhoneNumber" id = "senderPhoneNumber"
                                           class = "form-control form-control-inline" placeholder = "发货人电话"
                                           style = "width: auto" onchange = "changeButtonState()"/>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                        </table>
                        <br><br>
                        <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
                               class = "table table-striped">
                            <tr>
                                <td class = "left_name_reinformation">
                                    目的地地址：
                                </td>
                                <td>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择省份 ="
                                                data-live-search = "true" data-size = "5"
                                                id = "receiverProvince" name = "receiverProvince"
                                                onchange = "changeButtonState(false)">
                                        </select>
                                    </div>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择城市 ="
                                                data-live-search = "true" data-size = "5"
                                                id = "receiverCity" name = "receiverCity"
                                                onchange = "changeButtonState(false)">
                                        </select>
                                    </div>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择县区 ="
                                                data-live-search = "true" data-size = "5"
                                                id = "receiverCountry" name = "receiverCountry"
                                                onchange = "changeButtonState()">
                                        </select>
                                    </div>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td class = "left_name_reinformation">
                                    详细地址：
                                </td>
                                <td>
                                    <input type = "text" name = "receiverAddress" id = "receiverAddress"
                                           class = "form-control form-control-inline"
                                           style = "width: 600px" onchange = "changeButtonState()"/>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td class = "left_name_reinformation">
                                    收货人及联系方式：
                                </td>
                                <td>
                                    <input type = "text" name = "receiver" id = "receiver"
                                           class = "form-control form-control-inline" placeholder = "收货人姓名"
                                           style = "width: auto" onchange = "changeButtonState()"/>
                                    <span class = "red">*</span>
                                    <input type = "text" name = "receiverPhoneNumber" id = "receiverPhoneNumber"
                                           class = "form-control form-control-inline" placeholder = "收货人电话"
                                           style = "width: auto" onchange = "changeButtonState()"/>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <input type = "submit" value = "下单" name = "button" id = "button"
                                           style = "height: auto; width: 100px"
                                    />
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>


        <!----------------内容区结束-------------------->
        <!---------------页脚开始---------------->
        <jsp:include flush = "true" page = "/inc/foot.jsp"></jsp:include>
        <!---------------页脚结束---------------->
    </div>
</div>

<script type = "text/javascript">
    function $1(val) {
        return document.getElementById(val);
    }

    function check(arg = true) {
        if (!arg)
            return false;
        if ($1('receiverProvince').value == '')
            return false;
        if ($1('receiverCity').value == '')
            return false;
        if ($1('receiverCountry').value == '')
            return false;
        if ($1('receiverAddress').value == '')
            return false;
        if ($1('receiver').value == '')
            return false;
        if ($1('receiverPhoneNumber').value == '')
            return false;
        if ($1('senderProvince').value == '')
            return false;
        if ($1('senderCity').value == '')
            return false;
        if ($1('senderCountry').value == '')
            return false;
        if ($1('senderAddress').value == '')
            return false;
        if ($1('sender').value == '')
            return false;
        if ($1('senderPhoneNumber').value == '')
            return false;
        return true;
    }

    function changeButtonState(arg = true) {
        if (check(arg)) {
            $('#button').attr('class', 'btn btn-success');
            $1('button').disabled = false;
        }
        else {
            $('#button').attr('class', 'btn btn-success disabled');
            $1('button').disabled = true;
        }
    }

    changeButtonState()
</script>

<script src = "js/city.js"></script>
<%--<script src = "js/select_city.js"></script>--%>
<%@ include file = "jsp/get_sender_info.jsp" %>
</body>
</html>
