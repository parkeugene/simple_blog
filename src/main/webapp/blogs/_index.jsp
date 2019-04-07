<%@ page import="app.model.Article" %>
<%@ page import="org.javalite.activejdbc.Base" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: eugenepark
  Date: 05/04/2019
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    try {

        Base.open("java:comp/env/jdbc/mysql");
        List<Article> list;

%>
<table>
    <tr>
        <th>No.</th>
        <th>Title</th>
        <th>created At</th>
    </tr>
    <%
        list = Article.where("deleted = 0");

        for(Article article : list){
    %>
    <tr>
        <td><%=article.getString("id")%></td>
        <td><a href="show.vm?id=<%=article.get("id")%>"><%=article.getString("title")%></a></td>
        <td><%=article.getString("created_at")%></td>
    </tr>
    <%
        }
    %>
</table>
<%
    }catch (Exception e){
        System.out.print(e);
    }finally {
        Base.close();
    }
%>
