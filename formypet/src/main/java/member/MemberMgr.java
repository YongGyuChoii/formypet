package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberMgr {

	private Connection conn; //db 접근 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체
	
	public MemberMgr() { // dao 생성자에서 db connection 
		try {
			String URL = "jdbc:mysql://localhost:3306/formypet"; //mySQL 서버의 formypet DB 접근 경로
			String ID = "root";
			String Password = "0000";
			Class.forName("com.mysql.jdbc.Driver"); //mysql에 접속을 도와주는 라이브러리 
			conn = DriverManager.getConnection(URL, ID, Password);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//로그인 기능 구현
	
	public int login(String memId, String memPw) {
		
		System.out.println(memId);
		System.out.println(memPw);
				
		String SQL = "SELECT memPw FROM member WHERE memId = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memId); 
			rs = pstmt.executeQuery(); // 쿼리 실행 
			if (rs.next()) {
				if (rs.getString(1).equals(memPw)) // rs.getString(1) : select된 첫번째 컬럼
					return 1; //로그인 성공
				else
					return 0; // 비밀번호 틀림
			}
			return -1; // 아이디 없음 
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -2; //DB 오류 
	}
	
	//회원가입 기능 구현
	public int join(MemberBean member) {
		String SQL = "INSERT INTO member(memId, memPw, memPhone1, memPhone2, memEmail1"
				+ "memEmail2, memAddress, memName, memResident1, memResident2) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setInt(3, member.getPhone1());
			pstmt.setInt(4, member.getPhone2());
			pstmt.setString(5, member.getEmail1());
			pstmt.setString(6, member.getEmail2());
			pstmt.setString(7, member.getAddr());
			pstmt.setString(8, member.getName());
			pstmt.setInt(9, member.getResident1());
			pstmt.setInt(10, member.getResident2());

			return pstmt.executeUpdate(); // 0이상 값이 return된 경우 성공 
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1; //DB 오류 
	}
}
