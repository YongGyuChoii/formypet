package admin;

import java.sql.*;
import java.util.*;

public class CategoryManagementMgr {
	//final 키워드를 사용하여 String 타입 변수를 선언한 다음, DB 연결에 필요한 정보를 대입합니다.
	 	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	 	
	 	private final String JDBC_URL = "jdbc:mysql://localhost:3306/formypet";
	 	
	 	private final String USER = "root";
	 	
	 	private final String PASS = "0000";
	 
	 	public CategoryManagementMgr() {
	 		
	 	 try{
	 	   Class.forName(JDBC_DRIVER);//변수를 이용하여 연결정보 삽입.
	 	   
	 	   }catch(Exception e){
	 	      System.out.println("Error : JDBC 드라이버 로딩 실패");
	 	   }
	     }
	 
	    public Vector<CategoryManagementBean> getcategoryManagementList() {
	    	
	    	//DB 연결 하는 Connection 객체생성
		   Connection conn = null;
		   
		   //SQL 쿼리 담을 Statement 객체 생성
		   Statement stmt = null;
		   
		   //결과값 담을 ResultSet 객체 생성
	       ResultSet rs = null;
	       
	       //RegisterBean 클래스 타입의 Vector 배열 vlist 선언
	       Vector<CategoryManagementBean> vlist = new Vector<CategoryManagementBean>();
	       
	       try {
	    	  //DB연결 시작
	          conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
	          
	          String strQuery = "select * from category";
	          
	          stmt = conn.createStatement();
	          
	          rs = stmt.executeQuery(strQuery);
	          
	          //while 반복문을 사용하여 resultset 객체인 rs에 담긴 조회쿼리 결과를 
	          //RegisterBean 클래스에 선언된 변수에 대입 한다.
			  while (rs.next()) {
				  
				  CategoryManagementBean bean = new CategoryManagementBean();//RegisterBean 클래스 객체생성
	             
			 	 bean.setCategorySection (rs.getString("categorySection"));
			 	 //RegisterBean 클래스의 setter 메서드를 이용하여 변수에 데이터베이스 에서 조회된 결과 값을 담는다.
	 			 bean.setDelYn(rs.getString("delYn"));
	 			 vlist.addElement(bean);
	          }
			  //예외처리
	       } catch (Exception ex) {
	          System.out.println("Exception" + ex);
	       } finally {
	          if(rs!=null)   try{rs.close();}  catch(SQLException e){}
			  if(stmt!=null) try{stmt.close();}catch(SQLException e){}
		      if(conn!=null) try{conn.close();}catch(SQLException e){}
	       }
	       return vlist; //결과 값을 vlist 로 리턴.
	    }
	}