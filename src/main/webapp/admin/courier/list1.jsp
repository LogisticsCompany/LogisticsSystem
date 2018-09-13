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
<div style = "width:30%;margin: auto;border-left:0;border-right:0">
    <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
           class = "table table-striped ">
        <tr>
            <span style="font-size:16px">每次只能添加一个派送员</span>
        </tr>
        <tr>
            <td>
                <input type = "submit" value = "添加" name = "button" id = "button"
                       class = "btn btn-success" style = "height: auto;width:auto"
                />
            </td>
        </tr>
    </table>


    <div class = "panel panel-info" style = "width: 100%">
        <div align = "center" class = "panel-heading" style = "color:grey;font-size:25px">派送员信息</div>
        <div class = "panel-body">
            <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0" align = "center"
                   class = "table table-striped " style="font-size:16px">
                <tr>
                    <td class = "left_name">
                       用户名:
                    </td>

                </tr>
                <tr>
                    <td class = "left_name">
                        密码：
                    </td>

                </tr>

            </table>
        </div>
    </div>
</div>
</body>
</html>