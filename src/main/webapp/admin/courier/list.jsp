<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.bean.Deliverer" %>
<%@ page import = "org.springframework.data.domain.Page" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Page<Deliverer> deliverers = (Page<Deliverer>) request.getSession().getAttribute("deliverers");
    request.getSession().removeAttribute("deliverers");
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <script src = "<%=path %>/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href = "<%=path %>/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
    <script src = "<%=path %>/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href = "<%=path %>/css/admin.css" rel = "stylesheet">
    <base href = "<%=basePath%>">
    <meta http-equiv = "Content-Type" content = "text/html; charset=UTF-8">
    <title>派送员信息列表</title>
</head>
<body>

<div class = "panel panel-info" style = "width: 100%;">
    <div class = "panel-heading">
        <div class = "btn-group">
            <table>
                <tr>
                    <td width = "200">
                        请输入账号：
                    </td>
                    <td width = "250">
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
            <th>电话</th>
            <th>邮箱</th>
            <th>操作</th>
            </thead>
            <tbody>
            <%
                for (Deliverer deliverer : deliverers)
                {
            %>
            <tr>
                <td><%=deliverer.getUsername()%>
                </td>
                <td><%=deliverer.getName()%>
                </td>
                <td><%=deliverer.getPhoneNumber()%>
                </td>
                <td><%=deliverer.getEmail()%>
                </td>
                <td>
                    <a href = "/editDeliverer?id=<%=deliverer.getId()%>">编辑</a>
                    <a href = "/deliverer?id=<%=deliverer.getId()%>">删除</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

    </div>
</div>

</body>
</html>