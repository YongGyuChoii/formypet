package board;

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

public class BoardMgr {
	
	private DBConnectionMgr pool;
	//파일 업로드 관련 설정 작성
	private static final String  SAVEFOLDER = "C:/Users/Administrator/git/formypet/formypet/src/main/webapp/board/filestorage";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 5*1024*1024;

	public BoardMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시판 리스트
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int end) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		
		try {
			con = pool.getConnection();
			//keyWord 값이 없는 경우 게시물 조회
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from board order by ref desc, pos limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else { //keyField 와 keyWord 값이 있는 경우 게시물 조회
				sql = "select * from  board where " + keyField + " like ? ";
				sql += "order by ref desc, pos limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
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
	
	// 게시물 입력 메서드
	// 게시물 입력 메서드는 리턴타입 이 void 이므로 반환값은 없다.
	public void insertBoard(HttpServletRequest req) {
		
		Connection con = null; //연결객체
		PreparedStatement pstmt = null; //쿼리처리객체
		ResultSet rs = null;  //결과값 담는 객체
		
		String sql = null; //쿼리문 저장 변수
		
		MultipartRequest multi = null; //파일 업로드 위한 객체
		
		int filesize = 0; //파일용량 변수
		
		String filename = null; //파일이름 변수
		
		try {
			con = pool.getConnection();
			sql = "select max(num) from board"; //게시물이 총 몇개 인지 조회하는 쿼리
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int ref = 1;
			
			if (rs.next())
				ref = rs.getInt(1) + 1;
			
			File file = new File(SAVEFOLDER);
			
			//exists() 메서드 : 파일이 존재 하는지 여부를 알아 내는 메서드
			//파일이 존재 한다면 true, 없으면 false 값을 반환.
			if (!file.exists()) //파일이 존재 한다면
				file.mkdirs(); //mkdirs() : 파일 디렉토리 만드는 메서드 
			multi = new MultipartRequest(req, SAVEFOLDER,MAXSIZE, ENCTYPE,
					new DefaultFileRenamePolicy());

			if (multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int) multi.getFile("filename").length();
			}
			
			String content = multi.getParameter("content");
			
			if (multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
				//게시글 입력시 contentType 속성이 TEXT 라면 
				//UtilMgr 클래스 replace 메서드를 호출 하여 <(부등호) 를 &lt; 로 바꾼다.
				content = UtilMgr.replace(content, "<", "&lt;");
			}
			sql = "insert board(name,content,subject,ref,pos,depth,regdate,pass,count,filename,filesize,memKey)";
			sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?)";
			//작성날짜 regdate 컬럼은 now() 로 현재 날짜를 자동으로 입력 합니다.
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, content);
			pstmt.setString(3, multi.getParameter("subject"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, multi.getParameter("pass"));
			pstmt.setString(6, filename);
			pstmt.setInt(7, filesize);
			pstmt.setInt(8, Integer.parseInt(multi.getParameter("memKey")));
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// 게시물 리턴 메서드, 게시물의 num 값을 기준으로 해당 게시물을 조회한다.
	public BoardBean getBoard(int num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		BoardBean bean = new BoardBean();
		
		try {
			con = pool.getConnection();
			//num 값을 기준으로 formypet 테이블 에서 게시물을 조회한다.
			sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 조회수 증가 메서드, update 쿼리로 formypet 테이블에서 num 값으로 조회된 게시물의 count 컬럼을 변경한다.
	public void upCount(int num) {
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
	
	// 게시물 삭제 메서드
	public void deleteBoard(int num) {
		
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
	
	//파일 다운로드 메서드
	public void downLoad(HttpServletRequest req, HttpServletResponse res, JspWriter out, PageContext pageContext) {
			
		try {
				//요청 객체에 있는 filename 파라미터를 받아서 변수에 저장.
				String filename = req.getParameter("filename");
				
				//file 객체생성 , filename이 한글 일 경우 깨지지 않게 하기 위해서
				//UtilMgr 클래스의 con()메서드 호출하여 결과 값을 담는다.
				//BoardMgr 클래스 상단에 있는 savefoler 경로 와 file구분자, filename을 저장.
				File file = new File(UtilMgr.con(SAVEFOLDER + File.separator+ filename));
				
				//file.length() 는 파일의 크기를 리턴 하며, 단위는 byte 임.
				byte b[] = new byte[(int) file.length()];
				
				//res.setHeader() 메서드를 이용해서 response(응답) 객체의 header에 text를 추가.
				//첫번째 인수가 key, 두번째 인수가 value 이다.
				res.setHeader("Accept-Ranges", "bytes");
				
				//req.getHeader() 메서드를 이용해서 요청 객체의 클라이언트 브라우저 정보를 strClient 변수에 저장.
				String strClient = req.getHeader("User-Agent");
					
				//strClient 변수에 저장된 브라우저 정보를 indexOf 메서드로 검색.
				//브라우저 정보에 MSIE 가 true 이면 ms사 의 브라우저, false 면 다른 브라우저로 인식.
				//브라우저 의 버전과 정보를 구분해서 각 각 res(응답객체) 의 header 와 contentType을 설정한다.
				if (strClient.indexOf("MSIE6.0") != -1) { 
					//indexOf() 메서드를 사용하여 일치하는 값이 없으면 -1을 반환한다. 
					//이 조건문 에서는 true 상황, 즉 일치하는 값이 있는 경우 아래 내용을 수행한다.
					res.setContentType("application/smnet;charset=UTF-8");
						
					res.setHeader("Content-Disposition", "filename=" + filename + ";");
						
				} else { //indexOf() 메서드 실행결과 일치하는 값이 없으면 아래 내용 수행.
						
					res.setContentType("application/smnet;charset=UTF-8");
						
					res.setHeader("Content-Disposition", "attachment;filename="+ filename + ";");
				}
					
				out.clear(); //out.clear() : out 객체의 모든 컨텐츠 지우기
					
				out = pageContext.pushBody(); //pageContext.pushBody() : jsp 페이지 정보 저장.
					
				if (file.isFile()) { 
					//file.isFile() 메서드로 file 객체에 있는 savefolder 경로 와 filename이 일치 하면 true.   
					
					//BufferedInputStream 객체를 생성하고, FileInputStream 을 이용하여 file을 읽어들여 저장한다.
					BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
					
					//BufferedOutputStream 객체를 생성하여 응답시 출력을 한다.
					BufferedOutputStream outs = new BufferedOutputStream(res.getOutputStream());
						
					int read = 0;
						
					while ((read = fin.read(b)) != -1) {
						outs.write(b, 0, read);
					}
						
					outs.close();
						
					fin.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	// 게시물 수정
	public void updateBoard(BoardBean bean) {
		
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
	public void replyBoard(BoardBean bean) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			
			sql = "insert board (name,content,subject,ref,pos,depth,regdate,pass,count)";
			sql += "values(?,?,?,?,?,?,now(),?,0)";
			
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
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

			// 답변에 위치값 증가
			public void replyUpBoard(int ref, int pos) {
				
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
}

