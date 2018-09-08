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

    <script type = "text/javascript">
        function check() {
            // if (document.getElementById("chufa").value == "") {
            //     alert("请输入出发地联系方式");
            //     return false;
            // }
            // if (document.getElementById("mudi").value == "") {
            //     alert("请输入目的地联系方式");
            //     return false;
            // }
            // if (document.getElementById("fahuoren").value == "") {
            //     alert("请输入发货人信息");
            //     return false;
            // }
            // if (document.getElementById("shouhuoren").value == "") {
            //     alert("请输入收货人信息");
            //     return false;
            // }

            // alert($1('senderProvince').value);
            return true;
        }
    </script>
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
                    <form action = "/order" method = "post" onsubmit = "return check()">
                        <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
                               class = "table table-striped">
                            <tr>
                                <td class = "left_name">
                                    出发地地址：
                                </td>
                                <td>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择省份 ="
                                                data-live-search = "true" data-size = "5" data-height = "50px"
                                                id = "senderProvince" name = "senderProvince">
                                        </select>
                                    </div>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择城市 ="
                                                data-live-search = "true" data-size = "5"
                                                id = "senderCity" name = "senderCity">
                                        </select>
                                    </div>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择县区 ="
                                                data-live-search = "true" data-size = "5"
                                                id = "senderCountry" name = "senderCountry">
                                        </select>
                                    </div>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td class = "left_name">
                                    详细地址：
                                </td>
                                <td>
                                    <input type = "text" name = "senderAddress" id = "senderAddress"
                                           class = "form-control form-control-inline"
                                           style = "width: 600px"/>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td class = "left_name">
                                    发货人及联系方式：
                                </td>
                                <td>
                                    <input type = "text" name = "sender" id = "sender"
                                           class = "form-control form-control-inline" placeholder = "发货人姓名"
                                           style = "width: auto"/>
                                    <span class = "red">*</span>
                                    <input type = "text" name = "senderPhoneNumber" id = "senderPhoneNumber"
                                           class = "form-control form-control-inline" placeholder = "发货人电话"
                                           style = "width: auto"/>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                        </table>
                        <br><br>
                        <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
                               class = "table table-striped">
                            <tr>
                                <td class = "left_name">
                                    目的地地址：
                                </td>
                                <td>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择省份 ="
                                                data-live-search = "true" data-size = "5"
                                                id = "receiverProvince" name = "receiverProvince">
                                        </select>
                                    </div>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择城市 ="
                                                data-live-search = "true" data-size = "5"
                                                id = "receiverCity" name = "receiverCity">
                                        </select>
                                    </div>
                                    <div class = "form-group form-group-extend">
                                        <select class = "selectpicker show-tick" title = "= 请选择县区 ="
                                                data-live-search = "true" data-size = "5"
                                                id = "receiverCountry" name = "receiverCountry">
                                        </select>
                                    </div>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td class = "left_name">
                                    详细地址：
                                </td>
                                <td>
                                    <input type = "text" name = "receiverAddress" id = "receiverAddress"
                                           class = "form-control form-control-inline"
                                           style = "width: 600px"/>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td class = "left_name">
                                    收货人及联系方式：
                                </td>
                                <td>
                                    <input type = "text" name = "receiver" id = "receiver"
                                           class = "form-control form-control-inline" placeholder = "收货人姓名"
                                           style = "width: auto"/>
                                    <span class = "red">*</span>
                                    <input type = "text" name = "receiverPhoneNumber" id = "receiverPhoneNumber"
                                           class = "form-control form-control-inline" placeholder = "收货人电话"
                                           style = "width: auto"/>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <input type = "submit" value = "下单" name = "button" id = "button"
                                           class = "btn btn-success" style = "height: auto; width: 100px"
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
<script src = "js/city.js"></script>
<%--<script src = "js/select_city.js"></script>--%>
<%@ include file = "jsp/get_sender_info.jsp" %>
</body>
</html>
