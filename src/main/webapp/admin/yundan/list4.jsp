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
    <title>已派送订单1</title>



</head>
<body>

<div class = "panel panel-info" style = "width: 100%;">
    <div class = "panel-heading">
        <div class = "btn-group">
            已派送订单列表
        </div>
    </div>
    <div class = "panel-body">
        <table class = "table table-striped">
            <thead>
            <th>单号</th>
            <th>状态</th>
            <th>发送方信息</th>
            <th>接收方信息</th>
            <th>操作</th>
            </thead>
            <tbody>

            </tbody>
        </table>

    </div>
</div>

</body>
</html>