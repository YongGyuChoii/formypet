package review;

import util.DBConnectionMgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

import com.oreilly.servlet.MultipartRequest;

import board.BoardBean;
import product.ProductBean;




public class ReviewMgr {

    private DBConnectionMgr pool;
   
    private static final String  SAVEFOLDER = "C:/Users/Administrator/git/formypet/formypet/src/main/webapp/images/review";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 5*1024*1024;
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
    public Integer saveReview(ReviewBean reviewBean, int ordersKey) {
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
            
            pstmt.setInt(6, reviewBean.getMemKey());
            pstmt.setInt(7, reviewBean.getProductKey());

            System.out.println(pstmt.toString());
            pstmt.executeUpdate();
          
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("saveReview error ()" + e);
        } finally {
            pool.freeConnection(con,pstmt,rs);
        }
        
        try {
            con = pool.getConnection();
            String query = "update orders set reviewYn = 'Y' where ordersKey = ?";
         
            pstmt = con.prepareStatement(query);
       
            pstmt.setInt(1, ordersKey);

            System.out.println(pstmt.toString());
            pstmt.executeUpdate();
          
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("saveReview error ()" + e);
        } finally {
            pool.freeConnection(con,pstmt,rs);
        }
        
        System.out.println("진입");

        return 0;
    }
    
	// 게시판 리스트
	public Vector<ReviewBean> getReviewList() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		Vector<ReviewBean> vlist = new Vector<ReviewBean>();
		
		try {
			con = pool.getConnection();
			//keyField 와 keyWord 값이 있는 경우 게시물 조회
			sql = "SELECT rvKey,rvTitle,rvContents,rvScore,memKey FROM review";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewBean bean = new ReviewBean();
				bean.setRvKey(rs.getInt("rvKey"));
				bean.setRvTitle(rs.getString("rvTitle"));
				bean.setRvContents(rs.getString("rvContents"));
				bean.setRvScore(rs.getInt("rvScore"));
				bean.setMemKey(rs.getInt("memKey"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//총 게시물수
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			
			//keyField , keyWord 값이 없는 경우 총 게시물 가져오기
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(num) from board";
				pstmt = con.prepareStatement(sql);
			} else { //keyField, keyWord 값이 있는 경우 총 게시물 가져오기
				sql = "select count(num) from  board where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}

	// 상품 상세페이지 리뷰 가져오기
	public ArrayList<ReviewBean> getReviewProductList(int productKey, int start, int end){
				
	ArrayList<ReviewBean> rlist = new ArrayList<>();
	
		try {
		
		con = pool.getConnection();
		
		sql = "select * from review AS r INNER JOIN member AS m ON r.memKey = m.memKey where productKey=? order by rvKey desc LIMIT ?, ?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, productKey);
		pstmt.setInt(2, start);
		pstmt.setInt(3, end);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReviewBean bean = new ReviewBean();
			bean.setRvKey(rs.getInt("rvKey"));
			bean.setRvTitle(rs.getString("rvTitle"));
			bean.setRvContents(rs.getString("rvContents"));
			bean.setRvPhoto(rs.getString("rvPhoto"));
			bean.setRvScore(rs.getInt("rvScore"));
			bean.setMemKey(rs.getInt("memKey"));
			bean.setOptionValue(rs.getString("optionValue"));
			bean.setProductKey(rs.getInt("productKey"));
			bean.setMemName(rs.getString("memName"));
			rlist.add(bean);
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return rlist;
	}
	
	//총 리뷰수 가져오기
	public int getReviewCount(int productKey) {
		int totalCount = 0;
		try {
			con = pool.getConnection();
			sql = "select count(rvKey) from review where productKey = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, productKey);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
}
