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
    <script type = "text/javascript" src = "<%=path %>/Scripts/jquery-1.7.2.js"></script>
    <script type = "text/javascript" src = "<%=path %>/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <script type = "text/javascript" src = "<%=path %>/Scripts/index.js"></script>

    <script src = "<%=path %>/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href = "<%=path %>/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
    <script src = "<%=path %>/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href = "<%=path %>/css/admin.css" rel = "stylesheet">
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>派送员信息列表</title>



</head>
<body>

<div class = "panel panel-info" style = "width: 100%;">
    <div class = "panel-heading">
        <div class = "btn-group">
            <table>

                <tr>
                    <td width="200">
                        请输入账号：
                    </td>
                    <td width="250">
                        <input type = "text" name = "dh" id = "dh"
                               class = "form-control form-control-inline"
                               style = "width:auto;height:auto"/>
                    </td>
                    <td>
                        <input type = "submit" value = "查询" name = "button" id = "button"
                               class = "btn btn-success" style = "height: auto;width:auto"
                        />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class = "panel-body">
        <table class = "table table-striped">
            <thead>
            <th>账号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>电话</th>
            <th>邮箱</th>
            <th>操作</th>
            </thead>
            <tbody>

            </tbody>
        </table>

    </div>
</div>

</body>
</html>