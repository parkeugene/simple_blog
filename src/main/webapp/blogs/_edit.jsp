<%@ page import="org.javalite.activejdbc.Base" %>
<%@ page import="app.model.Article" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: eugenepark
  Date: 05/04/2019
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id")==null?"":request.getParameter("id");

    try {

        Base.open("java:comp/env/jdbc/mysql");

        List<Article> article = Article.where("id = ?", id);

%>
<form id="new-blog" action="BlogController" method="post">
    <div class="form-group">
        <label for="title">Title</label>
        <input type="text" name="title" class="form-control" id="title" value="<%=article.get(0).getString("title")%>">
    </div>
    <div class="form-group">
        <label for="title">Content</label>
        <textarea class="form-control" name="content" id="" cols="30" rows="10"><%=article.get(0).getString("content")%></textarea>
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-primary"> Submit</button>
    </div>
</form>

<%
    }catch (Exception e){
        System.out.print(e);
    }finally {
        Base.close();
    }
%>
