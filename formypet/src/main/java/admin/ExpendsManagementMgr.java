package admin;

import java.sql.*;
import java.util.*;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.DBConnectionMgr;

public class ExpendsManagementMgr {
		private DBConnectionMgr pool;
		//파일 업로드 관련 설정 작성
		private static final String  SAVEFOLDER = "C:/jsp/myapp4/src/main/webapp/filestorage";
		private static final String ENCTYPE = "UTF-8";
		private static int MAXSIZE = 5*1024*1024;

		public ExpendsManagementMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
	    public Vector<ExpendsManagementBean> geteMList(String keyField, String keyWord, int start, int end) {
	    	
	    	Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
	       
	       //ExpendsManagementBean 클래스 타입의 Vector 배열 vlist 선언
	       Vector<ExpendsManagementBean> vlist = new Vector<ExpendsManagementBean>();
	       
	       try {
				con = pool.getConnection();
				//keyWord 값이 없는 경우 게시물 조회
				if (keyWord.equals("null") || keyWord.equals("")) {
					sql = "SELECT * FROM (expends INNER JOIN product p ON expends.productKey = p.productKey)"
							+ "INNER JOIN orders o ON expends.ordersKey = o.ordersKey WHERE expendsKey order by expendsKey desc limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
				} else { //keyField 와 keyWord 값이 있는 경우 게시물 조회
					sql = "SELECT * FROM (expends INNER JOIN product p ON expends.productKey = p.productKey)"
							+"INNER JOIN orders o ON expends.ordersKey = o.ordersKey WHERE expendsKey" + keyField + " like ? ";
					sql += "order by expendsKey desc limit ? , ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + keyWord + "%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
				}
				rs = pstmt.executeQuery();
			  while (rs.next()) {
				  
				 ExpendsManagementBean bean = new ExpendsManagementBean();
	             bean.setExpendsKey(rs.getInt("expendsKey"));
	             bean.setMemKey(rs.getInt("memKey"));
	             bean.setOrdersKey(rs.getInt("ordersKey"));
	             bean.setMemOrderKey(rs.getInt("memOrderKey"));
	             bean.setNonMemOrderKey(rs.getInt("nonMemOrderKey"));
	             bean.setProductKey(rs.getInt("productKey"));
	             bean.setCategoryKey(rs.getInt("categoryKey"));
	             bean.setoPrice(rs.getInt("oPrice"));
	             bean.setProductName(rs.getString("productName"));
	             bean.seteDate(rs.getString("eDate"));
	 			 vlist.add(bean);
	          }
			  //예외처리
	       } catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
	       return vlist; //결과 값을 vlist 로 리턴.
	    }
	    
	 // memKey값을 기준으로 해당 게시물을 조회한다.
		public ExpendsManagementBean getBoard(int expendsKey) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			
			ExpendsManagementBean bean = new ExpendsManagementBean();
			
			try {
				con = pool.getConnection();
				//expendsKey 값을 기준으로 e 테이블 에서 게시물을 조회한다.
				sql = "SELECT * FROM (expends INNER JOIN product p ON expends.productKey = p.productKey)"
						+"INNER JOIN orders o ON expends.ordersKey = o.ordersKey WHERE expendsKey = ? ";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, expendsKey);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					 bean.setExpendsKey(rs.getInt("expendsKey"));
		             bean.setMemKey(rs.getInt("memKey"));
		             bean.setOrdersKey(rs.getInt("ordersKey"));
		             bean.setMemOrderKey(rs.getInt("memOrderKey"));
		             bean.setNonMemOrderKey(rs.getInt("nonMemOrderKey"));
		             bean.setProductKey(rs.getInt("productKey"));
		             bean.setCategoryKey(rs.getInt("categoryKey"));
		             bean.setoPrice(rs.getInt("oPrice"));
		             bean.setProductName(rs.getString("productName"));
		             bean.seteDate(rs.getString("eDate"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}

		//총 목록
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
					sql =  "SELECT * FROM (expends INNER JOIN product p ON expends.productKey = p.productKey)"
							+"INNER JOIN orders o ON expends.ordersKey = o.ordersKey WHERE expendsKey";
					pstmt = con.prepareStatement(sql);
				} else { //keyField, keyWord 값이 있는 경우 총 게시물 가져오기
					sql =  "SELECT * FROM (expends INNER JOIN product p ON expends.productKey = p.productKey)"
							+"INNER JOIN orders o ON expends.ordersKey = o.ordersKey WHERE expendsKey "+ keyField + " like ? ";
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
	}
