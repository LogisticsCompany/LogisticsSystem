<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.bean.OrderForm" %>
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

    OrderForm orderForm = (OrderForm) request.getSession().getAttribute("orderForm");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <base href = "<%=basePath%>"/>
    <meta http-equiv = "Content-Type" content = "text/html; charset=utf-8"/>
    <title>我的订单</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/tab.js"></script>
    <script src = "js/city.js"></script>
    <script src = "js/get_address.js"></script>
</head>

<body>

<div class = "page">
    <div class = "page_con">
        <jsp:include flush = "true" page = "/inc/top1.jsp"></jsp:include>
        <!----------------内容区开始-------------------->


        <div style = "width:50%;margin: auto;border-left:0;border-right:0">

            <div class = "panel panel-info" style = "width: 100%">
                <div align = "center" class = "panel-heading" style = "color:grey;font-size:30px">下单成功!</div>
                <div class = "panel-body">
                    <table width = "500%" border = "0" cellspacing = "0" cellpadding = "0" align = "center"
                           class = "table table-striped ">
                        <tr>
                            <td class = "left_name1">
                                单号：
                            </td>

                        </tr>
                        <tr>
                            <td class = "left_name1">
                                状态：
                            </td>

                        </tr>

                        <tr>
                            <td class = "left_name1">
                                发送方信息：
                            </td>
                        </tr>
                        <tr>
                            <td class = "left_name1">
                                接收方信息：
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<br> <br> <br><br> <br> <br><br> <br> <br>

<!----------------内容区结束-------------------->
<!---------------页脚开始---------------->
<jsp:include flush = "true" page = "/inc/foot.jsp"></jsp:include>
<!---------------页脚结束---------------->
</div>
</div>
</body>
</html>
