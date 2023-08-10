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
import board.BoardBean;

public class CsCenterManagementMgr {
	private DBConnectionMgr pool;
	//파일 업로드 관련 설정 작성
	private static final String  SAVEFOLDER = "C:/formypet/src/main/webapp/filestorage";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 100000*1024*1024;

	public CsCenterManagementMgr() {
		try {
		pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
	
	//게시물 리스트(board db)
	public Vector<BoardBean> getbList(String keyField, String keyWord, int start, int end) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		
		try {
			
			con = pool.getConnection();
			//keyWord 값이 없는 경우 상품 조회
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from board order by num desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else { //keyField 와 keyWord 값이 있는 경우 상품 조회
				sql = "select * from board where " + keyField + " like ? ";
				sql += "order by num desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,keyWord);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("Content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
			 	bean.setRegdate(rs.getString("regdate"));
			 	bean.setPass(rs.getString("pass"));
			 	bean.setCount(rs.getInt("count"));
	 			bean.setFilename(rs.getString("filename"));
	 			bean.setFilesize(rs.getInt("filesize"));
	 			bean.setMemKey(rs.getInt("memKey"));
	 			
	 			vlist.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vlist;
	}
	
	//게시물 수 (board db)
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
					pstmt.setString(1,keyWord );
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
		
		//게시물의 num 값을 기준으로 해당 게시물을 조회한다.
				public BoardBean getb(int num) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = null;
					
					BoardBean bean = new BoardBean();
					
					try {
						con = pool.getConnection();
						//num 값을 기준으로 board 테이블에서 게시물을 조회한다.
						sql = "select * from board where num = ?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, num);
						rs = pstmt.executeQuery();
						if (rs.next()) {
							bean.setNum(rs.getInt("num"));
							bean.setName(rs.getString("name"));
							bean.setSubject(rs.getString("subject"));
							bean.setContent(rs.getString("Content"));
							bean.setPos(rs.getInt("pos"));
							bean.setRef(rs.getInt("ref"));
							bean.setDepth(rs.getInt("depth"));
						 	bean.setRegdate(rs.getString("regdate"));
						 	bean.setPass(rs.getString("pass"));
						 	bean.setCount(rs.getInt("count"));
				 			bean.setFilename(rs.getString("filename"));
				 			bean.setFilesize(rs.getInt("filesize"));
				 			bean.setMemKey(rs.getInt("memKey"));
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				//게시물내용 수정 (board db용)
				public void udb(BoardBean bean) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					
					try {
						con = pool.getConnection();
						
						//update 쿼리로 게시물을 수정한다.
						//num 으로 수정할 게시물을 찾아서 name, subject, content 컬럼을 수정 한다.
						sql = "update board set name=?,subject=?,content=? where num=?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, bean.getName());
						pstmt.setString(2, bean.getSubject());
						pstmt.setString(3, bean.getContent());
						pstmt.setInt(4, bean.getNum());
						pstmt.executeUpdate();
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
				}
				
				// 게시물 답변
				public void reb(BoardBean bean) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					
					try {
						con = pool.getConnection();
						
						sql = "insert board (name,content,subject,ref,pos,depth,regdate,pass,count,memKey)";
						sql += "values(?,?,?,?,?,?,now(),?,0,?)";
						
						//답글 이기 때문에 depth와 pos 의 값을 1씩 증가.
						int depth = bean.getDepth() + 1;
						int pos = bean.getPos() + 1;
						
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, bean.getName());
						pstmt.setString(2, bean.getContent());
						pstmt.setString(3, bean.getSubject());
						pstmt.setInt(4, bean.getRef());
						pstmt.setInt(5, pos);
						pstmt.setInt(6, depth);
						pstmt.setString(7, bean.getPass());
						pstmt.setInt(8, bean.getMemKey());
						pstmt.executeUpdate();
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
				}
				// 답변에 위치값 증가
				public void reupb(int ref, int pos) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					
					try {
						con = pool.getConnection();
						
						//답글에 답글을 처리 하기 위해서 ref 컬럼(게시물 위치값)을 기준으로
						//해당되는 컬럼을 찾아서 pos 값 증가
						sql = "update board set pos = pos + 1 where ref=? and pos > ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, ref);
						pstmt.setInt(2, pos);
						pstmt.executeUpdate();
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
				}
				// 게시물 삭제 메서드
				public void delb(int num) {
					
						Connection con = null;
						
						PreparedStatement pstmt = null;
						
						String sql = null;
						
						ResultSet rs = null;
						
						try {
							con = pool.getConnection();
							sql = "select filename from board where num = ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, num);
							rs = pstmt.executeQuery();
							
							if (rs.next() && rs.getString(1) != null) {
								if (!rs.getString(1).equals("")) {
									File file = new File(SAVEFOLDER + "/" + rs.getString(1));
									if (file.exists())
										UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
								}
							}
							//num 을 이용하여 formypet 테이블의 컬럼을 찾아서 delete 쿼리문으로 해당 컬럼 삭제. 
							sql = "delete from board where num=?";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, num);
							pstmt.executeUpdate();
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							pool.freeConnection(con, pstmt, rs);
						}
					}
				// 조회수 증가 메서드
				public void upc(int num) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					
					try {
						con = pool.getConnection();
						sql = "update board set count=count+1 where num=?";
						//num 값으로 조회된 formypet 의 게시물 count 컬럼에 1을 더하여 값을 수정한다.
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
				}
	}
