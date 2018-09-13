<%
    String[] title = {"姓名 ", "学号 ", "性别 ", "年龄 "};
%>
<script>
    let title = new Array();
    <%   for(int i = 0;i < title.length; i++){   %>
    title[<%=i%>] = " <%=title[i]%> ";
    <%   }   %>
    console.log(title);
</script>