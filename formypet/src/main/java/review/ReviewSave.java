package review;

import util.DBConnectionMgr;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/review/save")
public class ReviewSave extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	req.setCharacterEncoding("UTF-8");

    	System.out.println("ReviewSave.java 서블릿 진입.");
    	//제목
        String title = req.getParameter("title");
        System.out.println(title);
        //내용
        String contents = req.getParameter("contents");
        System.out.println(contents);
        //사진
        String photo = req.getParameter("photo");
        System.out.println(photo);
      
       String[] ratingList = req.getParameterValues("rating");
    
        Integer score = Integer.parseInt(ratingList[ratingList.length-1]);
        
     
        String optionValue = req.getParameter("optionValue");
        System.out.println(optionValue);
        
    
        

        ReviewBean reviewBean = new ReviewBean();
        reviewBean.setRvTitle(title);
        reviewBean.setRvContents(contents);
        reviewBean.setRvPhoto(photo);
        reviewBean.setRvScore(score);
        reviewBean.setOptionValue(optionValue);
       
        reviewBean.setMemKey(new Integer("1"));
        reviewBean.setProductKey(new Integer("1"));



        ReviewMgr reviewMgr = new ReviewMgr();
        System.out.println("saveReview 메서드 호출전");
        int result = reviewMgr.saveReview(reviewBean);
        System.out.println("saveReview 메서드 호출후");

    

    }
}
