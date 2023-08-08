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
import admin.CsManagementBean;

public class CsManagementMgr {
		private DBConnectionMgr pool;
		
		public CsManagementMgr() {
			try {
				pool = DBConnectionMgr.getInstance();
				} catch (Exception e) {
				e.printStackTrace();
				}
		}
	 
		//회원 리스트(member db)
		public Vector<CsManagementBean> getcList(String keyField, String keyWord, int start, int end) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			
			Vector<CsManagementBean> vlist = new Vector<CsManagementBean>();
			
			try {
				
				con = pool.getConnection();
				//keyWord 값이 없는 경우 상품 조회
				if (keyWord.equals("null") || keyWord.equals("")) {
					sql = "select * from member order by memKey desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
				} else { //keyField 와 keyWord 값이 있는 경우 상품 조회
					sql = "select * from member where " + keyField + " like ? ";
					sql += "order by memKey desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,keyWord);
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
				}
				rs = pstmt.executeQuery();
				while(rs.next()) {
					CsManagementBean bean = new CsManagementBean();
					bean.setMemKey(rs.getInt("memKey"));
					bean.setMemId(rs.getString("memId"));
					bean.setMemPw(rs.getString("memPw"));
					bean.setMemPhone1(rs.getInt("memPhone1"));
					bean.setMemPhone2(rs.getInt("memPhone1"));
					bean.setMemEmail1(rs.getString("memEmail1"));
					bean.setMemEmail2(rs.getString("memEmail2"));
				 	bean.setMemAddress(rs.getString("memAddress"));
				 	bean.setMemAddress2(rs.getString("memAddress2"));
				 	bean.setMemName(rs.getString("memName"));
				 	bean.setMemResident1(rs.getInt("memResident1"));
				 	bean.setMemResident2(rs.getInt("memResident2"));
				 	bean.setDelYn(rs.getString("delYn"));
				 	bean.setMemPoint(rs.getInt("memPoint"));
		 			vlist.add(bean);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con,pstmt,rs);
			}
			return vlist;
		}
		//회원 수	(member db용)
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
							sql = "select count(memKey) FROM member";
							pstmt = con.prepareStatement(sql);
						} else { //keyField, keyWord 값이 있는 경우 총 게시물 가져오기
							sql = "select count(memKey) FROM member where " + keyField + " like ? ";
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
				//memKey로 상품 조회하기(member)
				public CsManagementBean getcbean(int memKey){
						
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = null;
					
					CsManagementBean bean = new CsManagementBean();
					
					try {
						con = pool.getConnection();
						//memKey 값을 기준으로 member 테이블 에서 게시물을 조회한다.
						sql = "select * from member where memKey = ?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, memKey);
						rs = pstmt.executeQuery();
						if (rs.next()) {
							
							bean.setMemKey(rs.getInt("memKey"));
							bean.setMemId(rs.getString("memId"));
							bean.setMemPw(rs.getString("memPw"));
							bean.setMemPhone1(rs.getInt("memPhone1"));
							bean.setMemPhone2(rs.getInt("memPhone1"));
							bean.setMemEmail1(rs.getString("memEmail1"));
							bean.setMemEmail2(rs.getString("memEmail2"));
						 	bean.setMemAddress(rs.getString("memAddress"));
						 	bean.setMemAddress2(rs.getString("memAddress2"));
						 	bean.setMemName(rs.getString("memName"));
						 	bean.setMemResident1(rs.getInt("memResident1"));
						 	bean.setMemResident2(rs.getInt("memResident2"));
						 	bean.setDelYn(rs.getString("delYn"));
						 	bean.setMemPoint(rs.getInt("memPoint"));
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
						
				}

				//내용 수정 (member db용)
				public void mup(CsManagementBean bean) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					
					try {
						con = pool.getConnection();
						

						//memKey 으로 수정할 게시물을 찾아서 컬럼을 수정 한다.
						sql = "update member set memId = ?, memPw = ?, memPhone1 = ?, memPhone2 = ?, memEmail1 = ?, memEmail2 = ?,"
								+ "memAddress = ?, memAddress2 = ?, memName = ?, memResident1 = ?, memResident2 = ?,"
								+ "delYn = ?, memPoint = ? where memKey = ?";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, bean.getMemId());
						pstmt.setString(2, bean.getMemPw());
						pstmt.setInt(3, bean.getMemPhone1());
						pstmt.setInt(4, bean.getMemPhone2());
						pstmt.setString(5, bean.getMemEmail1());
						pstmt.setString(6, bean.getMemEmail2());
						pstmt.setString(7, bean.getMemAddress());
						pstmt.setString(8, bean.getMemAddress2());
						pstmt.setString(9, bean.getMemName());
						pstmt.setInt(10, bean.getMemResident1());
						pstmt.setInt(11, bean.getMemResident2());
						pstmt.setString(12, bean.getDelYn());
						pstmt.setInt(13, bean.getMemPoint());
						pstmt.setInt(14, bean.getMemKey());
						pstmt.executeUpdate();
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
				}
	}
