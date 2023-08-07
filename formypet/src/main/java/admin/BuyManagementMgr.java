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
import admin.BuyManagementBean;

public class BuyManagementMgr {
		private DBConnectionMgr pool;
		
		public BuyManagementMgr() {
			try {
				pool = DBConnectionMgr.getInstance();
				} catch (Exception e) {
				e.printStackTrace();
				}
		}
	 
		//환불 리스트(product db)
		public Vector<BuyManagementBean> getbList(String keyField, String keyWord, int start, int end) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			
			Vector<BuyManagementBean> vlist = new Vector<BuyManagementBean>();
			
			try {
				
				con = pool.getConnection();
				//keyWord 값이 없는 경우 상품 조회
				if (keyWord.equals("null") || keyWord.equals("")) {
					sql = "select * from b_refund b INNER JOIN product p on b.productKey = p.productKey order by brKey desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
				} else { //keyField 와 keyWord 값이 있는 경우 상품 조회
					sql = "select * from b_refund b INNER JOIN product p on b.productKey = p.productKey where b." + keyField + " like ? ";
					sql += "order by brKey desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,keyWord);
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
				}
				rs = pstmt.executeQuery();
				while(rs.next()) {
					BuyManagementBean bean = new BuyManagementBean();
					bean.setBrKey(rs.getInt("brKey"));
					bean.setMemKey(rs.getInt("memKey"));
					bean.setProductKey(rs.getInt("productKey"));
					bean.setMemOrderKey(rs.getString("memOrderKey"));
					bean.setNonMemOrderKey(rs.getString("nonMemOrderKey"));
					bean.setOrdersKey(rs.getInt("ordersKey"));
					bean.setrYn(rs.getString("rYn"));
				 	//bean.setReCause(rs.getString("reCause"));
				 	bean.setProductName(rs.getString("productName"));
		 			vlist.add(bean);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con,pstmt,rs);
			}
			return vlist;
		}
		//상품 수	(product_file db용)
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
							sql = "select count(brKey) FROM b_refund b INNER JOIN product p on b.productKey = p.productKey";
							pstmt = con.prepareStatement(sql);
						} else { //keyField, keyWord 값이 있는 경우 총 게시물 가져오기
							sql = "select count(brKey) FROM b_refund b INNER JOIN product p on b.productKey = p.productKey where b." + keyField + " like ? ";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1,keyWord);
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
				//brKey로 상품 조회하기(b_refund)
				public BuyManagementBean getbbean(int brKey){
						
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = null;
					
					BuyManagementBean bean = new BuyManagementBean();
					
					try {
						con = pool.getConnection();
						//num 값을 기준으로 tblBoard 테이블 에서 게시물을 조회한다.
						sql = "select * from b_refund INNER JOIN product on b_refund.productKey = product.productKey where brKey = ?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, brKey);
						rs = pstmt.executeQuery();
						if (rs.next()) {
							bean.setBrKey(rs.getInt("brKey"));
							bean.setMemKey(rs.getInt("memKey"));
							bean.setProductKey(rs.getInt("productKey"));
							bean.setMemOrderKey(rs.getString("memOrderKey"));
							bean.setNonMemOrderKey(rs.getString("nonMemOrderKey"));
							bean.setOrdersKey(rs.getInt("ordersKey"));
							bean.setrYn(rs.getString("rYn"));
						 	//bean.setReCause(rs.getString("reCause"));
						 	bean.setProductName(rs.getString("productName"));
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
						
				}

				//내용 수정 (b_refund db용)
				public void ryn(BuyManagementBean bean) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					
					try {
						con = pool.getConnection();
						

						//brKey 으로 수정할 게시물을 찾아서 컬럼을 수정 한다.
						sql = "update b_refund set rYn = ? where brKey = ?";
						
						pstmt = con.prepareStatement(sql);
						
						//pstmt.setInt(1, bean.getProductKey());
						//pstmt.setInt(2, bean.getMemKey());
						//pstmt.setString(3, bean.getMemOrderKey());
						//pstmt.setString(4, bean.getNonMemOrderKey());
						//pstmt.setInt(5, bean.getOrdersKey());
						pstmt.setString(1, bean.getrYn());
						pstmt.setInt(2, bean.getBrKey());
						pstmt.executeUpdate();
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
				}
	}
