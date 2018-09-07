<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
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
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <base href = "<%=basePath%>"/>
    <meta http-equiv = "Content-Type" content = "text/html; charset=utf-8"/>
    <title>在线下单</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/tab.js"></script>

    <script type = "text/javascript">
        function check() {
            if (document.getElementById("chufa").value == "") {
                alert("请输入出发地联系方式");
                return false;
            }
            if (document.getElementById("mudi").value == "") {
                alert("请输入目的地联系方式");
                return false;
            }
            if (document.getElementById("fahuoren").value == "") {
                alert("请输入发货人信息");
                return false;
            }
            if (document.getElementById("shouhuoren").value == "") {
                alert("请输入收货人信息");
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

        <div>
            <div class = "panel panel-info" style = "width: 100%">
                <div class = "panel-heading">选择城市</div>
                <div class = "panel-body">
                    您选择的是：
                    <input readonly = readonly class = "form-control" id = "show">
                    <br>
                    <div style="height: auto;">
                        <form>
                            <div class = "form-group form-group-extend">
                                <select class = "selectpicker show-tick" title = "= 请选择省份 ="
                                        data-live-search = "true" data-size = "5"
                                        id = "province" onchange = "showCity(this)">
                                </select>
                            </div>
                            <div class = "form-group form-group-extend">
                                <select class = "selectpicker show-tick" title = "= 请选择城市 ="
                                        data-live-search = "true" data-size = "5"
                                        id = "city" onchange = "showCountry(this)">
                                </select>
                            </div>
                            <div class = "form-group form-group-extend">
                                <select class = "selectpicker show-tick" title = "= 请选择县区 ="
                                        data-live-search = "true" data-size = "5"
                                        id = "country" onchange = "selectCountry(this)">
                                </select>
                            </div>
                            <button class = "btn btn-success" style = "width: 70px" id = "btn" onclick = "showAddr()">
                                确定
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class = "sub_main">
            <div class = "sub_maincon">
                <div class = "sub_mainbox clearfix">

                    <div class = "m_border">
                        <div class = "m_title2">
                            <h3>
                                <font color = "#0a1450">在线下单</font>
                            </h3>
                        </div>
                        <div class = "m_content message_con">
                            <form id = "form1" name = "form1" method = "post"
                                  action = "AddYundanAction?type=front" onsubmit = "return check()">
                                <p class = "tips">

                                </p>
                                <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
                                       class = "table table-striped">
                                    <tr>
                                        <td class = "left_name">
                                            单号：
                                        </td>
                                        <td>
                                            <input type = "text" name = "danhao" id = "danhao"
                                                   class = "form-control form-control-inline"
                                                   style = "width: auto"
                                            <%--value = "<%=Danhao.getHao() %>"--%>
                                                   value = "233"
                                                   readonly = "readonly"/>
                                            <span class = "red">*</span>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class = "left_name">
                                            出发地联系方式：
                                        </td>
                                        <td>
                                            <input type = "text" name = "address" id = "adr" style = "width: 100px"
                                                   class = "form-control form-control-inline " placeholder = "地址"/>
                                            <span class = "red">*</span>
                                            <input type = "text" name = "name" id = "nam" style = "width: 100px"
                                                   class = "form-control form-control-inline " placeholder = "姓名"/>
                                            <span class = "red">*</span>
                                            <input type = "text" name = "number" id = "num" style = "width: 100px"
                                                   class = "form-control form-control-inline " placeholder = "电话"/>
                                            <span class = "red">*</span>
                                        </td>

                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class = "left_name">
                                            目的地联系方式：
                                        </td>
                                        <td>
                                            <input type = "text" name = "address" id = "adr1" style = "width: 100px"
                                                   class = "form-control form-control-inline " placeholder = "地址"/>
                                            <span class = "red">*</span>
                                            <input type = "text" name = "name" id = "nam1" style = "width: 100px"
                                                   class = "form-control form-control-inline " placeholder = "姓名"/>
                                            <span class = "red">*</span>
                                            <input type = "text" name = "number" id = "num1" style = "width: 100px"
                                                   class = "form-control form-control-inline " placeholder = "电话"/>
                                            <span class = "red">*</span>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class = "left_name">
                                            发货人：
                                        </td>
                                        <td>
                                            <input type = "text" name = "fahuoren" id = "fahuoren"
                                                   class = "form-control form-control-inline"
                                                   style = "width: auto"/>
                                            <span class = "red">*</span>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>


                                    <tr>
                                        <td class = "left_name">
                                            收货人：
                                        </td>
                                        <td>
                                            <input type = "text" name = "shouhuoren" id = "shouhuoren"
                                                   class = "form-control form-control-inline"
                                                   style = "width: auto"/>
                                            <span class = "red">*</span>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <input type = "submit" value = "下单" name = "button" id = "button"
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
        <!----------------内容区结束-------------------->
        <!---------------页脚开始---------------->
        <jsp:include flush = "true" page = "/inc/foot.jsp"></jsp:include>
        <!---------------页脚结束---------------->
    </div>
</div>
<script src = "js/city.js"></script>
<script src = "js/select_city.js"></script>
</body>
</html>
