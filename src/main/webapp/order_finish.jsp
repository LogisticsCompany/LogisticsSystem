<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.utils.OrderUtil" %>
<%@ page import = "org.springframework.data.domain.Page" %>
<%@ page import = "com.example.logistics_system.bean.OrderForm" %>
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


            <div  style = "width:50%;margin: auto;border-left:0;border-right:0" >

                <div class = "panel panel-info" style = "width: 100%">
                    <div class = "panel-heading"  style="color:grey;font-size:30px">下单成功!</div>
                    <div class = "panel-body">

                        <%--<form id = "form1" name = "form1" method = "post"--%>
                              <%--action = "/register" onSubmit = "return check()">--%>

                            <table width = "500%" border = "0" cellspacing = "0" cellpadding = "0" align="center"
                                   class = "table table-striped ">
                                <tr>
                                    <td class = "left_name1">
                                        单号：
                                    </td>
                                    <%--<td>--%>

                                        <%--<input type = "text" name = "username" id = "uname"--%>
                                               <%--class = "form-control form-control-inline"--%>
                                               <%--style = "width: 150px"/>--%>
                                        <%--<span class = "red">*</span>--%>
                                    <%--</td>--%>

                                </tr>
                                <tr>
                                    <td class = "left_name1">
                                        状态：
                                    </td>
                                    <%--<td>--%>
                                        <%--<input type = "password" name = "password" id = "pwds"--%>
                                               <%--class = "form-control form-control-inline"--%>
                                               <%--style = "width: 150px"/>--%>
                                        <%--<span class = "red">*</span>--%>
                                    <%--</td>--%>

                                </tr>

                                <tr>
                                    <td class = "left_name1">
                                        发送方信息：
                                    </td>
                                    <%--<td>--%>

                                        <%--<input type = "text" name = "name" id = "rname"--%>
                                               <%--class = "form-control form-control-inline"--%>
                                               <%--style = "width: 150px"/>--%>
                                        <%--<span class = "red">*</span>--%>
                                    <%--</td>--%>
                                </tr>
                                <tr>
                                    <td class = "left_name1">
                                        接收方信息：
                                    </td>
                                    <%--<td>--%>

                                    <%--<input type = "text" name = "name" id = "rname"--%>
                                    <%--class = "form-control form-control-inline"--%>
                                    <%--style = "width: 150px"/>--%>
                                    <%--<span class = "red">*</span>--%>
                                    <%--</td>--%>
                                </tr>


                                <%--<tr>--%>
                                    <%--<td class = "left_name1">--%>
                                        <%--性别：--%>
                                    <%--</td>--%>
                                    <%--<td>--%>

                                            <%--<span>--%>
                                                <%--<input type = "radio" checked = "checked" name = "sex"--%>
                                                       <%--id = "sex1" value = "男"/>男--%>
                                            <%--</span>--%>
                                        <%--<span>--%>
                                                <%--<input type = "radio" name = "sex" id = "sex2"--%>
                                                       <%--value = "女"/>女--%>
                                            <%--</span>--%>
                                    <%--</td>--%>

                                <%--</tr>--%>

                                <%--<tr>--%>
                                    <%--<td class = "left_name1">--%>
                                        <%--手机：--%>
                                    <%--</td>--%>
                                    <%--<td>--%>

                                        <%--<input type = "text" name = "phoneNumber" id = "tel"--%>
                                               <%--class = "form-control form-control-inline"--%>
                                               <%--style = "width: 150px"/>--%>
                                        <%--<span class = "red">*</span>--%>

                                    <%--</td>--%>
                                <%--</tr>--%>


                                <%--<tr>--%>
                                    <%--<td class = "left_name1">--%>
                                        <%--邮箱：--%>
                                    <%--</td>--%>
                                    <%--<td>--%>

                                        <%--<input type = "text" name = "email" id = "email"--%>
                                               <%--class = "form-control form-control-inline"--%>
                                               <%--style = "width: 150px"/>--%>
                                        <%--<span class = "red">*</span>--%>

                                    <%--</td>--%>
                                <%--</tr>--%>


                                <%--<tr>--%>
                                    <%--<td>--%>

                                    <%--</td>--%>

                                    <%--<td>--%>

                                        <%--<input type = "submit" value = "立即注册" name = "button" id = "button"--%>
                                               <%--class = "btn btn-success" style = "height: auto;width:auto"--%>
                                        <%--/>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                            </table>
                        </form>
                    </div>


                        <%--<%--%>
                            <%--for (OrderForm orderForm : orderForms)--%>
                            <%--{--%>
                        <%--%>--%>
                        <%--<tr>--%>
                            <%--<td><%=orderForm.getOrderNumber()%>--%>
                            <%--</td>--%>
                            <%--<td><%=OrderUtil.STATES[orderForm.getState()]%>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                <%--<script>--%>
                                    <%--document.write(get_address(<%=orderForm.getSenderProvince()%>, <%=orderForm.getSenderCity()%>, <%=orderForm.getSenderCountry()%>) + '\n' +--%>
                                        <%--'<%=orderForm.getSenderAddress()%>' + ' ' + '<%=orderForm.getSender()%>' + ' ' + '<%=orderForm.getSenderPhoneNumber()%>')--%>
                                <%--</script>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                <%--<script>--%>
                                    <%--document.write(get_address(<%=orderForm.getReceiverProvince()%>, <%=orderForm.getReceiverCity()%>, <%=orderForm.getReceiverCountry()%>) + '\n' +--%>
                                        <%--'<%=orderForm.getReceiverAddress()%>' + ' ' + '<%=orderForm.getReceiver()%>' + ' ' + '<%=orderForm.getReceiverPhoneNumber()%>')--%>
                                <%--</script>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                <%--<%--%>
                                    <%--if (orderForm.getState() == OrderUtil.ORDER_ORDER)--%>
                                    <%--{--%>
                                <%--%>--%>
                                <%--<a href="/deleteOrder?id=<%=orderForm.getId()%>&state=<%=state%>">取消订单</a>--%>
                                <%--<%--%>
                                <%--}--%>
                                <%--else--%>
                                <%--{--%>
                                <%--%>--%>
                                <%--取消订单--%>
                                <%--<%--%>
                                    <%--}--%>
                                <%--%>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                        <%--<%--%>
                            <%--}--%>
                        <%--%>--%>
                        <%--</tbody>--%>

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
