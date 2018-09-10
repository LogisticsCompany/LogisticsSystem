<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.bean.User" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    User user = (User) request.getSession().getAttribute("user");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <base href = "<%=basePath%>"/>
    <meta http-equiv = "Content-Type" content = "text/html; charset=utf-8"/>
    <title>修改信息</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
</head>

<body>

<div class = "page">
    <div class = "page_con">
        <jsp:include flush = "true" page = "/inc/top.jsp"></jsp:include>
        <!----------------内容区开始-------------------->

        <div>
            <div class = "panel panel-info" style = "width: 100%">
                <div class = "panel-heading">信息修改</div>
                <div class = "panel-body">
                    <form action = "/userInformation" method = "post">
                        <input type = "hidden" name = "id" value = "<%=user.getId()%>"/>
                        <input type = "hidden" name = "username" value = "<%=user.getUsername()%>"/>
                        <input type = "hidden" name = "password" value = "<%=user.getPassword()%>"/>

                        <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
                               class = "table table-striped">
                            <tr>
                                <td class = "left_name_reinformation">
                                    姓名：
                                </td>
                                <td>
                                    <input type = "text" name = "name" id = "name"
                                           class = "form-control form-control-inline"
                                           style = "width: 200px" value = "<%=user.getName()%>"/>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td class = "left_name_reinformation">
                                    性别：
                                </td>
                                <td>
                                    <div class = "radio">
                                        <label>
                                            <input type = "radio" name = "sex" id = "sex1"
                                                   value = "男">
                                            男
                                        </label>
                                    </div>
                                    <div class = "radio">
                                        <label>
                                            <input type = "radio" name = "sex" id = "sex2"
                                                   value = "女">
                                            女
                                        </label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class = "left_name_reinformation">
                                    电话：
                                </td>
                                <td>
                                    <input type = "text" name = "phoneNumber" id = "phoneNumber"
                                           class = "form-control form-control-inline"
                                           style = "width: 200px" value = "<%=user.getPhoneNumber()%>"/>
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
                                           style = "width: 200px" value = "<%=user.getEmail()%>"/>
                                    <span class = "red">*</span>
                                </td>
                            </tr>
                            <tr>
                                <td class = "left_name_reinformation">
                                    收货地址：
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
                                <td class = "left_name_reinformation">
                                    详细地址：
                                </td>
                                <td>
                                    <input type = "text" name = "address" id = "address"
                                           class = "form-control form-control-inline"
                                           style = "width: 600px" value = "<%=user.getAddress()%>"/>
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
        </div>


        <!----------------内容区结束-------------------->
        <!---------------页脚开始---------------->
        <jsp:include flush = "true" page = "/inc/foot.jsp"></jsp:include>
        <!---------------页脚结束---------------->
    </div>
</div>
<script type = "text/javascript" src = "js/city.js"></script>
<%@include file = "jsp/init_address.jsp" %>
<script type = "text/javascript">
    let province_id = <%=user.getProvince()%>;
    let city_id = <%=user.getCity()%>;
    let country_id = <%=user.getCountry()%>;
    init_address('province', 'city', 'country', province_id, city_id, country_id);

    $("input[name='sex'][value='" + '<%=user.getSex()%>' + "']").attr("checked", true);
</script>
</body>
</html>
