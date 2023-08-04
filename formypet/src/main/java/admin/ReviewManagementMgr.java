package admin;

import java.sql.*;
import java.util.*;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.DBConnectionMgr;
import util.UtilMgr;
import admin.ReviewManagementBean;

public class ReviewManagementMgr {
	
	private DBConnectionMgr pool;
	//파일 업로드 관련 설정 작성
	private static final String  SAVEFOLDER = "C:/formypet/src/main/webapp/filestorage";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 100000*1024*1024;

	public ReviewManagementMgr() {
		try {
		pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
	//리뷰 리스트(review db)
		public Vector<ReviewManagementBean> getrvList(String keyField, String keyWord, int start, int end) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			
			Vector<ReviewManagementBean> vlist = new Vector<ReviewManagementBean>();
			
			try {
				
				con = pool.getConnection();
				//keyWord 값이 없는 경우 상품 조회
				if (keyWord.equals("null") || keyWord.equals("")) {
					sql = "select * from review order by rvKey desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
				} else { //keyField 와 keyWord 값이 있는 경우 상품 조회
					sql = "select * from  review where " + keyField + " like ? ";
					sql += "order by rvKey desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + keyWord + "%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
				}
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ReviewManagementBean bean = new ReviewManagementBean();
					bean.setRvTitle(rs.getString("rvTitle")); //제목
					bean.setRvContents(rs.getString("rvContents")); //내용
					bean.setRvPhoto(rs.getString("rvPhoto")); //사진
					bean.setRvScore(rs.getInt("rvScore")); //별점
					bean.setMemKey(rs.getInt("memKey")); //회원키
					bean.setOptionValue(rs.getString("optionValue")); //
					bean.setRvKey(rs.getInt("rvKey")); //리뷰 고유 번호
		 			bean.setProductKey(rs.getInt("productKey"));
		 			vlist.add(bean);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con,pstmt,rs);
			}
			return vlist;
		}	
		//리스트 수 (review db)
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
					sql = "select count(rvKey) from review";
					pstmt = con.prepareStatement(sql);
				} else { //keyField, keyWord 값이 있는 경우 총 게시물 가져오기
					sql = "select count(rvKey) from  review where " + keyField + " like ? ";
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
		//  rvKey 값을 기준으로 해당 게시물을 조회한다.
				public ReviewManagementBean getrm(int rvKey) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = null;
					
					ReviewManagementBean bean = new ReviewManagementBean();
					
					try {
						con = pool.getConnection();
						//productName 값을 기준으로 product 테이블에서 게시물을 조회한다.
						sql = "select * from review where rvKey=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, rvKey);
						rs = pstmt.executeQuery();
						if (rs.next()) {
							bean.setRvTitle(rs.getString("rvTitle"));
							bean.setRvContents(rs.getString("rvContents"));
							bean.setRvPhoto(rs.getString("rvPhoto"));
							bean.setRvScore(rs.getInt("rvScore"));
							bean.setMemKey(rs.getInt("memKey"));
							bean.setOptionValue(rs.getString("OptionValue"));
							bean.setRvKey(rs.getInt("rvKey"));
							bean.setProductKey(rs.getInt("productKey"));
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				// 게시물 삭제 메서드
				public void delrv(int rvKey) {
					
						Connection con = null;
						
						PreparedStatement pstmt = null;
						
						String sql = null;
						
						ResultSet rs = null;
						
						try {
							con = pool.getConnection();
							sql = "select rvPhoto from review where rvKey = ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, rvKey);
							rs = pstmt.executeQuery();
							
							if (rs.next() && rs.getString(1) != null) {
								if (!rs.getString(1).equals("")) {
									File file = new File(SAVEFOLDER + "/" + rs.getString(1));
									if (file.exists())
										UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
								}
							}
							//rvKey 을 이용하여 review 테이블의 컬럼을 찾아서 delete 쿼리문으로 해당 컬럼 삭제. 
							sql = "delete from review where rvKey = ?";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, rvKey);
							pstmt.executeUpdate();
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							pool.freeConnection(con, pstmt, rs);
						}
					}
}
