package review;

import util.DBConnectionMgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReviewMgr {

    private DBConnectionMgr pool;
    Connection con = null;
    PreparedStatement pstmt = null;
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
        try {
            con = pool.getConnection();
            String query = "INSERT INTO REVIEW (rvTitle, rvContents, rvScore, memKey) VALUES (?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            pstmt = con.prepareStatement(query);
            pstmt.setString(1, reviewBean.getRvTitle());
            System.out.println("getRvTitle = " + reviewBean.getRvTitle());
            pstmt.setString(2, reviewBean.getRvContents());
            System.out.println("getRvContents = " + reviewBean.getRvContents());
            pstmt.setInt(3, reviewBean.getRvScore());
            System.out.println("getRvScore = " + reviewBean.getRvScore());
            pstmt.setInt(4, 0);

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
