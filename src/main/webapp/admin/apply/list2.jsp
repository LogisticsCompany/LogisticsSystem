
<!DOCTYPE HTML >

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

    <base href = "<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理员信息列表</title>


    <link href = "bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
    <link href = "bootstrap-select/dist/css/bootstrap-select.min.css" rel = "stylesheet">

    <script src = "bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <script src = "bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <script src = "bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src = "bootstrap-select/dist/js/i18n/defaults-zh_CN.min.js"></script>

    <link href = "css/bootstrap_extend.css" rel = "stylesheet">

    <style>
        .form-group-extend {
            display: inline;
        }
    </style>
</head>
<body>
<div>

            <form action = "/order" method = "post">

                <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
                       class = "table table-striped" >
                    <tr align="center">

                        <td>

                            <div class = "form-group form-group-extend">
                                <select class = "selectpicker show-tick" title = "= 请选择单号 ="
                                        data-live-search = "true" data-size = "5"
                                        id = "senderProvince" name = "senderProvince"
                                        onchange = "changeButtonState(false)">
                                </select>
                            </div>
                            <div class = "form-group form-group-extend">
                                <select class = "selectpicker show-tick" title = "= 请选择申请者 ="
                                        data-live-search = "true" data-size = "5"
                                        id = "senderCity" name = "senderCity"
                                        onchange = "changeButtonState(false)">
                                </select>
                            </div>
                            <div class = "form-group form-group-extend">
                                <select class = "selectpicker show-tick" title = "= 请选择操作 ="
                                        data-live-search = "true" data-size = "5"
                                        id = "senderCountry" name = "senderCountry"
                                        onchange = "changeButtonState()">
                                </select>
                            </div>



                            <input type = "submit" value = "确定" name = "button" id = "button"
                                   class = "btn btn-success" style = "height: auto;width:auto"
                            />
                        </td>

                    </tr>
                </table>
            </form>

</div>



</body>
</html>