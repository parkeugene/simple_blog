package kr.cric;

import app.model.Article;
import org.javalite.activejdbc.Base;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * Created by eugenepark on 05/04/2019.
 */
@WebServlet(name = "BolgController",urlPatterns = "/blogs/BlogController")
public class BolgController extends HttpServlet {

    private static final String CONTENT_TYPE = "application/json;charset=UTF-8";

    @Resource(name = "jdbc/mysql")
    private DataSource dataSource;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType(CONTENT_TYPE);
        HttpSession session = request.getSession();


        String id = request.getParameter("_id")==null?"":request.getParameter("_id");
        String method = request.getParameter("_method")==null?"":request.getParameter("_method");

        String REGEX = "^_";
        // Create a Pattern object
        Pattern r = Pattern.compile(REGEX);

        Enumeration enumber = request.getParameterNames();
        Map params = new HashMap();

        while (enumber.hasMoreElements()) {

            String key = enumber.nextElement().toString();
            String value = request.getParameter(key);

//            System.out.println("log.enumber.hasMoreElements key :"  +  key + " : " + value);

            // Now create matcher object.
            Matcher m = r.matcher(key);

            if (!m.find()) {
                params.put(key, value);
            }

        }

        try {
            Base.open("java:comp/env/jdbc/mysql");

            if(method.equals("new")){
                System.out.print("new");

                createArticle(params);

            } else if(method.equals("edit")) {
                System.out.print("edit");

                updateArticle(params, id);
            }

        }catch (Exception e){
            System.out.print(e);
        }finally {
            Base.close();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private static void createArticle(Map params){
        Article article = new Article();
        article.fromMap(params);
        article.saveIt();
    }


    private static void updateArticle(Map params, String id){
        Article article = Article.findFirst("id=?",id);
        article.fromMap(params);
        article.saveIt();
    }

}
