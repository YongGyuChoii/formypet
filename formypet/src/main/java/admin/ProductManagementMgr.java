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
		private static final String  SAVEFOLDER = "C:/jsp/formypet/src/main/webapp/filestorage";
		private static final String ENCTYPE = "UTF-8";
		private static int MAXSIZE = 5*1024*1024;
	 
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
	       
	       //RegisterBean 클래스 타입의 Vector 배열 vlist 선언
	       Vector<ProductManagementBean> vlist = new Vector<ProductManagementBean>();
	       
	       try {
	    	  //DB연결 시작
	          conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
	          
	          String strQuery = "select * from product";
	          
	          stmt = conn.createStatement();
	          
	          rs = stmt.executeQuery(strQuery);
	          
	          //while 반복문을 사용하여 resultset 객체인 rs에 담긴 조회쿼리 결과를 
	          //RegisterBean 클래스에 선언된 변수에 대입 한다.
			  while (rs.next()) {
				  
				  ProductManagementBean bean = new ProductManagementBean();//RegisterBean 클래스 객체생성
	             
			 	 bean.setProductName (rs.getString("productName"));
			 	 //RegisterBean 클래스의 setter 메서드를 이용하여 변수에 데이터베이스 에서 조회된 결과 값을 담는다.
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
	    
	    
	    
	    //상품 등록 메서드 잠시 보류
//	    public void insertProduct(HttpServletRequest req) {
////	    	ProductManagementBeanvlist = new Vector<ProductManagementBean>();
//			
//	    	Connection con = null; //연결객체
//			PreparedStatement pstmt = null; //쿼리처리객체
//			ResultSet rs = null;  //결과값 담는 객체
//			
//			String sql = null; //쿼리문 저장 변수
//			
//			MultipartRequest multi = null; //파일 등록을 위한 객체
//			
//			int filesize = 0; //파일용량 변수
//			
//			String filename = null; //파일이름 변수
//			
//			try {
//				con = pool.getConnection();
//				sql = "select max(num) from product, product_file"; //상품이 총 몇개 인지 조회하는 쿼리
//				pstmt = con.prepareStatement(sql);
//				rs = pstmt.executeQuery();
//				
//				int ref = 1;
//				
//				if (rs.next())
//					ref = rs.getInt(1) + 1;
//				
//				File file = new File(SAVEFOLDER);
//				
//				//exists() 메서드 : 파일이 존재 하는지 여부를 알아 내는 메서드
//				//파일이 존재 한다면 true, 없으면 false 값을 반환.
//				if (!file.exists()) //파일이 존재 한다면
//					file.mkdirs(); //mkdirs() : 파일 디렉토리 만드는 메서드 
//				multi = new MultipartRequest(req, SAVEFOLDER,MAXSIZE, ENCTYPE,
//						new DefaultFileRenamePolicy());
//
//				if (multi.getFilesystemName("filename") != null) {
//					filename = multi.getFilesystemName("filename");
//					filesize = (int) multi.getFile("filename").length();
//				}
//				
//				String productComment = multi.getParameter("productComment");
//				
//				
//				if (multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
//					//게시글 입력시 contentType 속성이 TEXT 라면 
//					//UtilMgr 클래스 replace 메서드를 호출 하여 <(부등호) 를 &lt; 로 바꾼다.
//					productComment = UtilMgr.replace(productComment, "<", "&lt;");
//				}
//				sql = "insert product(productName,productComment,productInfo,productDetail,productCaution,"
//						+ "productPrice,productSalePrice,productCount,productKind,productImg,categoryKey)"
//						+"insert product_file (fileOriginalName,fileSaveName,size,productKey)";
//				sql += "values(?, ?, ?, ?, ?, ?,?,?, ?, ?, ?,?,?,0,?)"; //int로 바꾼후 0으로 바꾸기
//				//총 15개 Bean product 11개   product_file 4개
//				pstmt = con.prepareStatement(sql);
//				
//				pstmt.setString(1, multi.getParameter("productName"));//파일이름
//				pstmt.setString(2, productComment);//상품 내용 fileComment
// 				pstmt.setString(3, multi.getParameter("productInfo")); //productInfo img 업로드
//				pstmt.setString(4, multi.getParameter("productDetail"));//productDetail img 업로드
//				pstmt.setString(5, multi.getParameter("productCaution")); //productCaution img 업로드
//				pstmt.setString(6, multi.getParameter("productPrice")); //productPrice  int로 바꾸기
//				pstmt.setString(7, multi.getParameter("productSalePrice"));//productSalePrice int로 바꾸기
//				pstmt.setString(8, multi.getParameter("productCount")); //productCount int로 바꾸기
//				pstmt.setString(9, multi.getParameter("productKind")); //productKind 
//				pstmt.setString(10, multi.getParameter("productImg")); //productImg 
//				pstmt.setString(11, multi.getParameter("categoryKey")); //categoryKey int로 바꾸기
//				pstmt.setString(12, multi.getParameter("fileOrignalName")); //fileOrignalName
//				pstmt.setString(13, multi.getParameter("fileSaveName")); //fileSaveName
//				pstmt.setInt(14, filesize); //size
//				pstmt.setString(15, multi.getParameter("productKey")); //productKey int로 바꾸기
//				pstmt.executeUpdate(); 
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				pool.freeConnection(con, pstmt, rs);
//			}
//		}
	}
