<%@ page import = "com.example.logistics_system.bean.Admin" %>

<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<%@ page import = "com.example.logistics_system.bean.Deliverer" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Deliverer deliverer = (Deliverer) request.getSession().getAttribute("deliverer");
    Admin admin = (Admin) request.getSession().getAttribute("admin");
%>
<html>
<head>
    <title>物流信息管理系统</title>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/admin-all.css"/>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/base.css"/>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/bootstrap.min.css"/>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/ui-lightness/jquery-ui-1.8.22.custom.css"/>
    <script type = "text/javascript" src = "<%=path %>/Scripts/jquery-1.7.2.js"></script>
    <script type = "text/javascript" src = "<%=path %>/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <script type = "text/javascript" src = "<%=path %>/Scripts/index.js"></script>

    <script src = "<%=path %>/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href = "<%=path %>/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
    <script src = "<%=path %>/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href = "<%=path %>/css/bootstrap_extend.css" rel = "stylesheet">

    <script>
        var changeTitle = function (arg) {
            document.getElementById('frame_title').innerHTML = arg.text;
        }
    </script>
</head>
<div class = "warp">
    <!--头部开始-->
    <div class = "top_c">
        <div class = "top-nav">欢迎您:<%=admin.getUsername()%>&nbsp;&nbsp;
            <a href = "admin_login.jsp">安全退出</a>
        </div>
    </div>
    <div class = "page">
        <div class = "page_con">
            <div>
                <div class = "panel panel-info" style = "width: 100%">
                    <div class = "panel-heading">派送员信息修改</div>
                    <div class = "panel-body">
                        <form action = "/delivererInformation" method = "post">
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
                                        密码：
                                    </td>
                                    <td>
                                        <input type = "text" name = "password" id = "password"
                                               class = "form-control form-control-inline"
                                               style = "width: 200px"/>
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
            </div>


        </div>
    </div>
</div>
<script type = "text/javascript" src = "js/city.js"></script>
<%@include file = "jsp/init_address.jsp" %>
<script type = "text/javascript">
    let province_id = <%=deliverer.getProvince()%>;
    let city_id = <%=deliverer.getCity()%>;
    let country_id = <%=deliverer.getCountry()%>;
    init_address('province', 'city', 'country', province_id, city_id, country_id);
</script>
<jsp:include flush = "true" page = "/inc/foot.jsp"></jsp:include>
</body>
</html>