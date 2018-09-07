<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.bean.User" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    String prov = user.getProvince();
    String city = user.getCity();
    String country = user.getCountry();
%>

<script src = "../js/city.js"></script>
<script>
    let current
</script>