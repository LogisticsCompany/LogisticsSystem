<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.utils.OrderUtil" %>
<%@ page import = "com.example.logistics_system.bean.OrderForm" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Object orderFormObject = request.getSession().getAttribute("orderForm");
    request.getSession().removeAttribute("orderForm");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <base href = "<%=basePath%>"/>
    <meta http-equiv = "Content-Type" content = "text/html; charset=utf-8"/>
    <title>运单查询</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/get_address.js"></script>
    <script type = "text/javascript" src = "js/city.js"></script>

    <script type = "text/javascript">
        function check() {
            if (document.getElementById("orderNumber").value == "") {
                alert("请输入单号");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>

<div class = "page">
    <div class = "page_con">
        <jsp:include flush = "true" page = "/inc/top.jsp"></jsp:include>
        <!----------------内容区开始-------------------->
        <div class = "panel panel-info" style = "width: 100%;height:600px">
            <div class = "panel-heading">运单查询</div>
            <div class = "panel-body">
                <div class = "sub_mainbox clearfix">


                    <div class = "m_border">

                        <div class = "m_content message_con">
                            <form id = "form1" name = "form1" method = "get"
                                  action = "/order" onsubmit = "return check()">
                                <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
                                                class = "table table-striped ">
                                    <tr>
                                        <td class = "left_name1">
                                            单号：
                                        </td>
                                        <td>
                                            <input type = "text" name = "orderNumber" id = "orderNumber"
                                                   class = "form-control form-control-inline"
                                                   style = "width: 200px"/>
                                            <span class = "red">*</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <input type = "submit" value = "查询" name = "button" id = "button"
                                                   class = "btn btn-success" style = "height: auto;width:auto"
                                            />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <%
                        if (orderFormObject != null)
                        {
                            OrderForm orderForm = (OrderForm) orderFormObject;
                    %>
                    <div class = "panel panel-info" style = "width: 100%">
                        <div class = "panel-heading">
                            <div class = "btn-group">
							<span>  <input type = "button" name = "button" id = "register_btn"
                                           value = "订单信息" class = "btn btn-primary" style = "height: auto;width: auto"/></span>
                            </div>
                        </div>
                        <div class = "panel-body">
                            <table class = "table table-striped">
                                <thead>
                                <th>单号</th>
                                <th>状态</th>
                                <th>发送方信息</th>
                                <th>接收方信息</th>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><%=orderForm.getOrderNumber()%>
                                    </td>
                                    <td><%=OrderUtil.STATES[orderForm.getState()]%>
                                    </td>
                                    <td>
                                        <script>
                                            document.write(get_address(<%=orderForm.getSenderProvince()%>, <%=orderForm.getSenderCity()%>, <%=orderForm.getSenderCountry()%>) + '\n' +
                                                '<%=orderForm.getSenderAddress()%>' + ' ' + '<%=orderForm.getSender()%>' + ' ' + '<%=orderForm.getSenderPhoneNumber()%>')
                                        </script>
                                    </td>
                                    <td>
                                        <script>
                                            document.write(get_address(<%=orderForm.getReceiverProvince()%>, <%=orderForm.getReceiverCity()%>, <%=orderForm.getReceiverCountry()%>) + '\n' +
                                                '<%=orderForm.getReceiverAddress()%>' + ' ' + '<%=orderForm.getReceiver()%>' + ' ' + '<%=orderForm.getReceiverPhoneNumber()%>')
                                        </script>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <br>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <!----------------内容区结束-------------------->
        <!---------------页脚开始---------------->
        <jsp:include flush = "true" page = "/inc/foot.jsp"></jsp:include>
        <!---------------页脚结束---------------->
    </div>
</div>
</body>
</html>
