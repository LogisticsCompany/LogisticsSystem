<%
    request.getSession().removeAttribute("deliverer");
    response.sendRedirect("del_login.jsp");
%>