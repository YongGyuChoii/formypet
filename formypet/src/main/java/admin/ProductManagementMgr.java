package admin;

import java.sql.*;
import java.util.*;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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

import util.DBConnectionMgr;
import util.UtilMgr;
import admin.ProductManagementBean;

public class ProductManagementMgr {
	//final 키워드를 사용하여 String 타입 변수를 선언한 다음, DB 연결에 필요한 정보를 대입합니다.
	
	 	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	 	
	 	private final String JDBC_URL = "jdbc:mysql://localhost:3306/formypet";
	 	
	 	private final String USER = "root";
	 
	 	private final String PASS = "0000"; 
	 	
	 	//파일 업로드 관련 설정 작성
	 	private DBConnectionMgr pool;		
		private static final String  SAVEFOLDER = "C:/Users/Administrator/git/formypet/formypet/src/main/webapp/filestorage";//수정필요
		private static final String ENCTYPE = "UTF-8";
		private static int MAXSIZE = 10*1024*1024;
	 
	 	public ProductManagementMgr() {
	 		
	 	 try{
	 	   Class.forName(JDBC_DRIVER);//변수를 이용하여 연결정보 삽입.
	 	   
	 	   }catch(Exception e){
	 	      System.out.println("Error : JDBC 드라이버 로딩 실패");
	 	   }
	     }
	 
	    public Vector<ProductManagementBean> getpmList() {
	    	
	    	//DB 연결 하는 Connection 객체생성
		   Connection conn = null;
		   
		   //SQL 쿼리 담을 Statement 객체 생성
		   Statement stmt = null;
		   
		   //결과값 담을 ResultSet 객체 생성
	       ResultSet rs = null;
	       
	       //ProductManagementBean 타입의 Vector 배열 vlist 선언
	       Vector<ProductManagementBean> vlist = new Vector<ProductManagementBean>();
	       
	       try {
	    	  //DB연결 시작
	          conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
	          
	          String strQuery = "select * from product";
	          
	          stmt = conn.createStatement();
	          
	          rs = stmt.executeQuery(strQuery);
	          
	          //while 반복문을 사용하여 resultset 객체인 rs에 담긴 조회쿼리 결과를 
	          //ProductManagementBean 클래스에 선언된 변수에 대입 한다.
			  while (rs.next()) {
				  
				  ProductManagementBean bean = new ProductManagementBean();//RegisterBean 클래스 객체생성
	             
			 	 bean.setProductName (rs.getString("productName"));
			 	 //ProductManagementBean 클래스의 setter 메서드를 이용하여 변수에 데이터베이스 에서 조회된 결과 값을 담는다.
			 	 bean.setProductPrice(rs.getInt("productPrice"));
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
	    
	    //product table 업로드 메서드
	    
	    public void uploadFile(HttpServletRequest request) {

	    	//DB 연결 하는 Connection 객체생성
			   Connection conn = null;
			   
			   //SQL 쿼리 담을 Statement 객체 생성
			   Statement stmt = null;
			   
			   //결과값 담을 ResultSet 객체 생성
		       ResultSet rs = null;
		       
				    		
		ArrayList fileSaveName = new ArrayList(); //product_file fileSaveName
		ArrayList fileOrignalName = new ArrayList(); //product_file fileOrignalName
		
		try{
			
			//MultipartRequest 객체를 이용하여 파일 업로드 처리를 합니다.
			//MultipartRequest 객체를 사용하려면 WEB-INF/lib 폴더 경로에 cos.jar 파일이 존재해야 합니다.
			//DB연결 시작
	          conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
	          
	          String strQuery = "select * from product";
	          
	          stmt = conn.createStatement();
	          
	          rs = stmt.executeQuery(strQuery);
			
			MultipartRequest multi = new MultipartRequest( request,SAVEFOLDER,MAXSIZE,ENCTYPE,new DefaultFileRenamePolicy());
			strQuery = "insert into product(productName,productComment,productInfo,productDetail,productCaution,"
					+ "productPrice,productSalePrice,productCount,productKind,productImg,categoryKey)"
					+"insert product_file (fileOriginalName,fileSaveName,size,productKey)";//하나 더 추가
			strQuery += "values(?, ?, ?, ?, ?, 0,0,0, ?, ?, 0,?,?,?,0)"; //int로 바꾼후 0으로 바꾸기
			//총 15개 Bean product 11개   product_file 4개
			stmt = conn.prepareStatement(strQuery);
			
			((PreparedStatement) stmt).setString(1, multi.getParameter("productName"));//파일이름
			((PreparedStatement) stmt).setString(2, multi.getParameter("productKind"));//상품 내용 fileComment img 업로드
			((PreparedStatement) stmt).setString(3, multi.getParameter("productInfo")); //productInfo img 업로드
			((PreparedStatement) stmt).setString(4, multi.getParameter("productDetail"));//productDetail img 업로드
			((PreparedStatement) stmt).setString(5, multi.getParameter("productCaution")); //productCaution img 업로드
			((PreparedStatement) stmt).setInt(6, Integer.parseInt(request.getParameter("productPrice"))); //productPrice  int로 바꾸기
			((PreparedStatement) stmt).setInt(7, Integer.parseInt(request.getParameter("productSalePrice")));//productSalePrice int로 바꾸기
			((PreparedStatement) stmt).setInt(8, Integer.parseInt(request.getParameter("productCount"))); //productCount int로 바꾸기
			((PreparedStatement) stmt).setString(9, multi.getParameter("productKind")); //productKind 
			((PreparedStatement) stmt).setString(10, multi.getParameter("productImg")); //productImg 
			((PreparedStatement) stmt).setInt(11, Integer.parseInt(request.getParameter("categoryKey"))); //categoryKey int로 바꾸기
			((PreparedStatement) stmt).setString(12, multi.getParameter("fileOrignalName")); //fileOrignalName
			((PreparedStatement) stmt).setString(13, multi.getParameter("fileSaveName")); //fileSaveName
			((PreparedStatement) stmt).setString(14, multi.getParameter("size")); //size
			((PreparedStatement) stmt).setInt(15, Integer.parseInt(request.getParameter("productKey"))); //productKey int로 바꾸기
			stmt.executeUpdate(strQuery, 0); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	          if(rs!=null)   try{rs.close();}  catch(SQLException e){}
			  if(stmt!=null) try{stmt.close();}catch(SQLException e){}
		      if(conn!=null) try{conn.close();}catch(SQLException e){}
	       }
		
		//prodcut_file
		try{
			
			//MultipartRequest 객체를 이용하여 파일 업로드 처리를 합니다.
			//MultipartRequest 객체를 사용하려면 WEB-INF/lib 폴더 경로에 cos.jar 파일이 존재해야 합니다.
			//DB연결 시작
	          conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
	          
	          String strQuery = "select * from product_file";
	          
	          stmt = conn.createStatement();
	          
	          rs = stmt.executeQuery(strQuery);
			
			MultipartRequest multi = new MultipartRequest( request,SAVEFOLDER,MAXSIZE,ENCTYPE,new DefaultFileRenamePolicy());
			strQuery = "insert into product_file (fileOriginalName,fileSaveName,size,productKey)";
			strQuery += "values(0, 0, 0, ? )"; 
			//총 15개 Bean product 11개   product_file 4개
			stmt = conn.prepareStatement(strQuery);
			 
			
			((PreparedStatement) stmt).setString(12, multi.getParameter("fileOrignalName")); //fileOrignalName
			((PreparedStatement) stmt).setString(13, multi.getParameter("fileSaveName")); //fileSaveName
			((PreparedStatement) stmt).setString(14, multi.getParameter("size")); //size
			((PreparedStatement) stmt).setInt(15, Integer.parseInt(request.getParameter("productKey"))); //productKey int로 바꾸기
			stmt.executeUpdate(strQuery, 0); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	          if(rs!=null)   try{rs.close();}  catch(SQLException e){}
			  if(stmt!=null) try{stmt.close();}catch(SQLException e){}
		      if(conn!=null) try{conn.close();}catch(SQLException e){}
	       }
	    }
	    
	}
