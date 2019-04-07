<%@ page import="org.javalite.activejdbc.Base" %>
<%@ page import="app.model.Article" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: eugenepark
  Date: 05/04/2019
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id")==null?"":request.getParameter("id");

    try {

        Base.open("java:comp/env/jdbc/mysql");
        Article article = Article.findFirst("deleted = 0 and id = ?", id);

%>
<table>
    <tr>
        <th>Title</th>
        <td><%=article.getString("title")%></td>
    </tr>

    <tr>
        <th>Content</th>
        <td><%=article.getString("content").replaceAll("\n", "<br>")%></td>
    </tr>

</table>

<a href="edit.vm?id=<%=id%>">Edit</a>

<%
    }catch (Exception e){
        System.out.print(e);
    }finally {
        Base.close();
    }
%>
