package review;

import util.DBConnectionMgr;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/review/save")
public class ReviewSave extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	req.setCharacterEncoding("UTF-8");

    	System.out.println("ReviewSave.java 서블릿 진입.");
        String title = req.getParameter("title");
        System.out.println(title);
        String contents = req.getParameter("contents");
        System.out.println(contents);
 //       String[] ratingList = req.getParameterValues("rating");
       
 //       Integer rating = Integer.parseInt(ratingList[ratingList.length-1]);

        ReviewBean reviewBean = new ReviewBean();
        reviewBean.setRvTitle(title);
        reviewBean.setRvContents(contents);
        reviewBean.setRvScore(0);
        reviewBean.setMemKey(0);


        ReviewMgr reviewMgr = new ReviewMgr();
        System.out.println("saveReview 메서드 호출전");
        int result = reviewMgr.saveReview(reviewBean);
        System.out.println("saveReview 메서드 호출후");

    

    }
}
