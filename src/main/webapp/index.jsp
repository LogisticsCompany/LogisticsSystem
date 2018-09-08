<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <base href = "<%=basePath%>"/>
    <meta http-equiv = "Content-Type" content = "text/html; charset=utf-8"/>
    <title>物流信息管理系统</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/tab.js">
    </script>
</head>

<body>

<div class = "page">
    <div class = "page_con">
        <jsp:include flush = "true" page = "/inc/top.jsp"></jsp:include>

        <div class="image" >
            <a href="http://baidu.com" >
                <img src="images/2.png">
            </a>
            <div class="font">
                <a href="http://baidu.com" >
                    系统背景
                </a>
            </div>
        </div>
        <div class="image" >
            <a href="http://baidu.com" >
                <img src="images/1.png">
            </a>
            <div class="font">
                <a href="http://baidu.com" >
                    新闻资讯
                </a>
            </div>
        </div>
        <div class="image" >
            <a href="http://baidu.com" >
                <img src="images/3.png">
            </a>
            <div class="font">
                <a href="http://baidu.com" >
                    网点信息
                </a>
            </div>
        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br>









        <!----------------内容区结束-------------------->
        <!---------------页脚开始---------------->
        <jsp:include flush = "true" page = "/inc/foot.jsp"></jsp:include>
        <!---------------页脚结束---------------->
    </div>
</div>
</body>
</html>
