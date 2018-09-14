<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<%@ page import = "com.example.logistics_system.bean.Deliverer" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Deliverer deliverer = (Deliverer) request.getSession().getAttribute("delivererT");
    request.getSession().removeAttribute("delivererT");
    Object message = request.getSession().getAttribute("message");
    request.getSession().removeAttribute("message");
    if (message != null)
    {
%>
<script>
    alert('<%=(String)message%>')
</script>
<%
    }
%>
<html>
<head>
    <title>物流信息管理系统</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>

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

    <script>
        function $1(val) {
            return document.getElementById(val);
        }

        function check() {
            if ($1('name').value == '') {
                alert('请填写姓名！');
                return false;
            }

            let tels = $1('phoneNumber').value;

            if (isNaN(tels) || tels.length != 11) {
                alert("请输入正确手机号码！");
                return false;
            }

            let em = $1('email').value;

            let szReg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            let bChk = szReg.test(em);
            if (!bChk) {
                alert("邮箱格式不正确！");
                return false;
            }

            if ($1('province').value == '') {
                alert('请选择省份！');
                return false;
            }

            if ($1('city').value == '') {
                alert('请选择城市！');
                return false;
            }

            if ($1('country').value == '') {
                alert('请选择县区！');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class = "panel panel-info" style = "width: 100%">
    <div class = "panel-heading">派送员信息修改</div>
    <div class = "panel-body">
        <form action = "/delivererInformation1" method = "post" onsubmit="return check()">
            <input type = "hidden" name = "id" value = "<%=deliverer.getId()%>"/>
            <input type = "hidden" name = "username" value = "<%=deliverer.getUsername()%>"/>
            <input type = "hidden" name = "password" value = "<%=deliverer.getPassword()%>"/>
            <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
                   class = "table table-striped">
                <tr>
                    <td class = "left_name_reinformation">
                        姓名：
                    </td>
                    <td>
                        <input type = "text" name = "name" id = "name"
                               class = "form-control form-control-inline"
                               style = "width: 200px"
                               value = "<%=deliverer.getName() == null ? "" : deliverer.getName()%>"/>
                        <span class = "red">*</span>
                    </td>
                </tr>
                <tr>
                    <td class = "left_name_reinformation">
                        电话：
                    </td>
                    <td>
                        <input type = "text" name = "phoneNumber" id = "phoneNumber"
                               class = "form-control form-control-inline"
                               style = "width: 200px"
                               value = "<%=deliverer.getPhoneNumber() == null ? "" : deliverer.getPhoneNumber()%>"/>
                        <span class = "red">*</span>
                    </td>
                </tr>
                <tr>
                    <td class = "left_name_reinformation">
                        邮箱：
                    </td>
                    <td>
                        <input type = "text" name = "email" id = "email"
                               class = "form-control form-control-inline"
                               style = "width: 200px"
                               value = "<%=deliverer.getEmail() == null ? "" : deliverer.getEmail()%>"/>
                        <span class = "red">*</span>
                    </td>
                </tr>
                <tr>
                    <td class = "left_name_reinformation">
                        地址：
                    </td>
                    <td>
                        <div class = "form-group form-group-extend">
                            <select class = "selectpicker show-tick" title = "= 请选择省份 ="
                                    data-live-search = "true" data-size = "5" data-height = "50px"
                                    id = "province" name = "province">
                            </select>
                        </div>
                        <div class = "form-group form-group-extend">
                            <select class = "selectpicker show-tick" title = "= 请选择城市 ="
                                    data-live-search = "true" data-size = "5"
                                    id = "city" name = "city">
                            </select>
                        </div>
                        <div class = "form-group form-group-extend">
                            <select class = "selectpicker show-tick" title = "= 请选择县区 ="
                                    data-live-search = "true" data-size = "5"
                                    id = "country" name = "country">
                            </select>
                        </div>
                        <span class = "red">*</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <input type = "submit" value = "修改" name = "button" id = "button"
                               class = "btn btn-success" style = "height: auto"
                        />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script type = "text/javascript" src = "js/city.js"></script>
<%@include file = "init_address.jsp" %>
<script type = "text/javascript">
    let province_id = <%=deliverer.getProvince()%>;
    let city_id = <%=deliverer.getCity()%>;
    let country_id = <%=deliverer.getCountry()%>;
    init_address('province', 'city', 'country', province_id, city_id, country_id);
</script>
</body>
</html>