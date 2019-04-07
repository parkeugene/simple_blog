<%@ page import="org.javalite.activejdbc.Base" %>
<%@ page import="app.model.Article" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: eugenepark
  Date: 05/04/2019
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id")==null?"":request.getParameter("id");

    String title = "";
    String content = "";
    String writer = "";

try{
    Base.open("java:comp/env/jdbc/mysql");

    Article article = Article.findFirst("deleted = 0 and id = ?", id);

    if(article != null) {
        title = article.getString("title") == null ? "" : article.getString("title");
        content = article.getString("content") == null ? "" : article.getString("content");
        writer = article.getString("writer") == null ? "" : article.getString("writer");
    }
%>
<form id="<%=id.equals("")?"new":"edit"%>-blog" action="BlogController" method="post">
    <input type="hidden" name="_method" value="<%=id.equals("")?"new":"edit"%>">
    <input type="hidden" name="_id" value="<%=id%>">
    <div class="form-group">
        <label for="title">Title</label>
        <input type="text" name="title" class="form-control" id="title" placeholder="Enter title" value="<%=title%>">
    </div>
    <div class="form-group">
        <label for="title">Content</label>
        <textarea class="form-control" name="content" cols="30" rows="10"><%=content%></textarea>
    </div>
    <div class="form-group">
        <label for="">Writer</label>
        <input type="text" name="writer" class="form-control" id="" placeholder="Enter title" value="<%=writer%>">
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
