package review;

import util.DBConnectionMgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.oreilly.servlet.MultipartRequest;

public class ReviewMgr {

    private DBConnectionMgr pool;
    Connection con = null;
    PreparedStatement pstmt = null;
    MultipartRequest multi = null;
    ResultSet rs = null;
    String sql = null;

    public ReviewMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 저장하기
    public Integer saveReview(ReviewBean reviewBean) {
    	 System.out.println("Mgr 메서드 진입");
    	 

         PreparedStatement pstmt = null;

    	 
        try {
            con = pool.getConnection();
            String query = "INSERT INTO REVIEW (rvTitle, rvContents,rvPhoto ,rvScore,optionValue ,memKey,productKey) VALUES (?,?,?,?,?,?,?)";
         
            pstmt = con.prepareStatement(query);
       

        
            pstmt.setString(1, reviewBean.getRvTitle());
            System.out.println("getRvTitle = " + reviewBean.getRvTitle());
            
            pstmt.setString(2, reviewBean.getRvContents());
            System.out.println("getRvContents = " + reviewBean.getRvContents());
            
            pstmt.setString(3, reviewBean.getRvPhoto());
            System.out.println("getRvPhoto = " + reviewBean.getRvPhoto());
            
            pstmt.setInt(4, reviewBean.getRvScore());
            System.out.println("getRvScore = " + reviewBean.getRvScore());
            
            pstmt.setString(5, reviewBean.getOptionValue());
            System.out.println("getOptionValue = " + reviewBean.getOptionValue());
            
            pstmt.setBigDecimal(6, reviewBean.getMemKey());
            pstmt.setBigDecimal(7, reviewBean.getProductKey());

            System.out.println(pstmt.toString());
            return pstmt.executeUpdate();
          
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("saveReview error ()" + e);
        } finally {
            pool.freeConnection(con,pstmt,rs);
        }
        System.out.println("진입");

        return 0;
    }


}
