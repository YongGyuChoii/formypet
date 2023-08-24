package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import product.ProductOptionBean;

//MemberMgr 클래스는 jsp 페이지에서 자바빈즈 를 사용하여 정의된 메서드를 호출하는 DAO 와 비슷한 역할을 합니다.
//각 기능에 맞는 메서드를 정의 하여, 메서드 호출시 DB연결, 쿼리문 처리, 결과값 return 하는 클래스 입니다.
//앞으로 회원가입처리, 회원정보조회 등..기능이 추가 될수록 그에 맞는 메서드를 추가로 정의 하여 사용합니다.
public class MemberMgr {
	private DBConnectionMgr pool;

	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ID 중복확인
	public boolean checkId(String memId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select memId from member where memId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memId);
			//쿼리문 실행 후 값이 있다면 flag 변수에 true값 대입.
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag; //checkId 메서드 호출된 자리로 flag 변수 값 리턴
	}
	
	// 회원가입처리 메서드
	public boolean insertMember(MemberBean bean) {
					
		Connection con = null; 
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
					
		try {
			con = pool.getConnection();
			//tblMember 테이블 insert 쿼리
			sql = "insert member(memId,memPw,memName,memEmail1,memEmail2,memAddress,memAddress2,memPhone1"
					+ ",memPhone2,memResident1,memResident2)values(?,?,?,?,?,?,?,?,?,?,?)";
						
			pstmt = con.prepareStatement(sql);
						
			pstmt.setString(1, bean.getMemId());
			pstmt.setString(2, bean.getMemPw());
			pstmt.setString(3, bean.getMemName());
			pstmt.setString(4, bean.getMemEmail1());
			pstmt.setString(5, bean.getMemEmail2());
			pstmt.setString(6, bean.getMemAddress());
			pstmt.setString(7, bean.getMemAddress2());
			pstmt.setInt(8, bean.getMemPhone1());
			pstmt.setInt(9, bean.getMemPhone2());
			pstmt.setInt(10, bean.getMemResident1());
			pstmt.setInt(11, bean.getMemResident2());

			if (pstmt.executeUpdate() == 1) 
				//쿼리 수행결과 가 1이면 ,(1개의 레코드가 처리가 되었다면)
				flag = true; //flag 변수에 true 값 할당.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
					return flag;
		}
				
	// 로그인 처리
	public MemberBean loginMember(String memId, String memPw) {
			MemberBean bean = new MemberBean();
			
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						
		String sql = null;
						
						
		try {
			con = pool.getConnection();
							
			sql = "select * from member where memId = ? and memPw = ?";
			//id 컬럼을 찾는 select 쿼리를 작성한다. where 절 에 매개변수로 받은 id, pwd를 입력함.
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, memId);					
			pstmt.setString(2, memPw);	
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				bean.setMemKey(rs.getInt("memKey"));
				bean.setMemId(rs.getString("memId"));
				bean.setMemPw(rs.getString("memPw"));
				bean.setMemGrade(rs.getInt("memGrade"));
				bean.setMemName(rs.getString("memName"));
			}else {
				
			}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
				}
				return bean;
			}
	
	//멤버에 대한 정보 불러오기
	public MemberBean getInfoMem(int memKey) {
		Connection con = null; 
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		MemberBean bean = new MemberBean();
		
		try {
			con = pool.getConnection();
			//tblMember 테이블 insert 쿼리
			sql = "select * from member where memKey = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, memKey);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setMemKey(rs.getInt("memKey"));
				bean.setMemId(rs.getString("memId"));
				bean.setMemPhone1(rs.getInt("memPhone1"));
				bean.setMemPhone2(rs.getInt("memPhone2"));
				bean.setMemEmail1(rs.getString("memEmail1"));
				bean.setMemEmail2(rs.getString("memEmail2"));
				bean.setMemAddress(rs.getString("memAddress"));
				bean.setMemAddress2(rs.getString("memAddress2"));
				bean.setMemName(rs.getString("memName"));
				bean.setMemResident1(rs.getInt("memResident1"));
				bean.setMemResident2(rs.getInt("memResident2"));
				bean.setMemPoint(rs.getInt("memPoint"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return bean;
	}
		
	//아이디 찾기
	public MemberBean findId(String memName, int memResident1, int memResident2) {
		MemberBean bean = new MemberBean();
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
					
	String sql = null;
					
					
	try {
		con = pool.getConnection();
						
		sql = "select * from member where memName = ? and memResident1 = ?  and memResident2 = ?";
		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, memName);					
		pstmt.setInt(2, memResident1);	
		pstmt.setInt(3, memResident2);
		rs = pstmt.executeQuery();
	
		if(rs.next()) {
			bean.setMemKey(rs.getInt("memKey"));
			bean.setMemId(rs.getString("memId"));
			bean.setMemResident2(rs.getInt("memResident2"));
			bean.setMemResident1(rs.getInt("memResident1"));
			bean.setMemName(rs.getString("memName"));
			bean.setMemGrade(rs.getInt("memGrade"));
		}else {
			
		}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
	
		//비밀번호 찾기
		public MemberBean findPw(String memId, String memName, int memResident1, int memResident2) {
			MemberBean bean = new MemberBean();
			
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						
		String sql = null;
						
						
		try {
			con = pool.getConnection();
							
			sql = "select * from member where memId=? and memName = ? and memResident1 = ?  and memResident2 = ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, memId);					
			pstmt.setString(2, memName);	
			pstmt.setInt(3, memResident1);
			pstmt.setInt(4, memResident2);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				bean.setMemKey(rs.getInt("memKey"));
				bean.setMemId(rs.getString("memId"));
				bean.setMemResident2(rs.getInt("memResident2"));
				bean.setMemResident1(rs.getInt("memResident1"));
				bean.setMemName(rs.getString("memName"));
				bean.setMemGrade(rs.getInt("memGrade"));
			}else {
				
			}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
				}
				return bean;
			}
		
	
		//비밀번호 변경
		public boolean changePw(String memId, String memName, int memResident1, int memResident2, String memPw) {
			boolean flag = true;
			Connection con = null;
			
			PreparedStatement pstmt = null;
			
			String sql = null;
			
			ResultSet rs = null;
			
			try {
				con = pool.getConnection();
				sql = "UPDATE member SET memPw = ? WHERE memId=? and memName=? and  memResident1 = ?  and memResident2 = ?";			
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, memPw);
				pstmt.setString(2, memId);
				pstmt.setString(3, memName);
				pstmt.setInt(4, memResident1);
				pstmt.setInt(5, memResident2);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return flag;
		}
	
	}

				