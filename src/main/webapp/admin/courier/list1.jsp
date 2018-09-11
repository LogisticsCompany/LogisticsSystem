<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <script type = "text/javascript" src = "/Scripts/jquery-1.7.2.js"></script>
    <script type = "text/javascript" src = "/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <script type = "text/javascript" src = "/Scripts/index.js"></script>

    <script src = "/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href = "/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
    <script src = "/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href = "/css/admin.css" rel = "stylesheet">
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加派送员</title>



</head>
<body>
<div class = "panel panel-info" style = "width: 50%; margin:auto" >
    <div class = "panel-heading">
        <div class = "btn-group">
            <table>

                <tr>
                    <td width="200">
                        添加派送员：
                    </td>
                    <td>
                        <input type = "submit" value = "添加" name = "button" id = "button"
                               class = "btn btn-success" style = "height: auto;width:auto"
                        />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
           class = "table table-striped">
        <tr>
            <td class = "left_name_reinformation" style="font-size:16px">
                用户名
            </td>

        </tr>
        <tr>
            <td class = "left_name_reinformation" style="font-size:16px">
                密码
            </td>

        </tr>
    </table>
</div>



</body>
</html>