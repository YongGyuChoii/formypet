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

import admin.DBConnectionMgr;
import util.UtilMgr;
import admin.ProductManagementBean;

public class ProductManagementMgr {

	private DBConnectionMgr pool;
	//파일 업로드 관련 설정 작성
	private static final String  SAVEFOLDER = "C:/formypet/src/main/webapp/filestorage";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 100000*1024*1024;

	public ProductManagementMgr() {
		try {
		pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
		e.printStackTrace();
		}
	}


	//상품 리스트
	public Vector<ProductManagementBean> getpmList() {

	Connection con  = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = null;
	
	Vector<ProductManagementBean> vlist = new Vector<ProductManagementBean>();
	
	try {
		con = pool.getConnection();
		
		sql = "select * from product";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
				
			ProductManagementBean bean = new ProductManagementBean();
				
		 	 bean.setProductName (rs.getString("productName"));
		 	 //ProductManagementBean 클래스의 setter 메서드를 이용하여 변수에 데이터베이스 에서 조회된 결과 값을 담는다.
		 	 bean.setProductPrice(rs.getInt("productPrice"));
 			 bean.setDelYn(rs.getString("delYn"));
 			 vlist.add(bean);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt, rs);
	}
	return vlist;
}
//상품 등록 페이지 (product db용)
public void uploadproduct(HttpServletRequest request) {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	MultipartRequest multi = null;
	int filesize = 0; //파일 용량 변수
	String productInfo = null;
	String productDetail = null;
	String productCaution = null;
	String productImg = null;
	
try {
	con = pool.getConnection();
	//sql =  "select * from product";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
		
	File file = new File(SAVEFOLDER);
	
	//exists() 메서드 : 파일이 존재 하는지 여부를 알아 내는 메서드
	//파일이 존재 한다면 true, 없으면 false 값을 반환.
	if (!file.exists()) //파일이 존재 한다면
		file.mkdirs(); //mkdirs() : 파일 디렉토리 만드는 메서드 
	multi = new MultipartRequest(request, SAVEFOLDER,MAXSIZE, ENCTYPE,
			new DefaultFileRenamePolicy());

	if (multi.getFilesystemName("productInfo") != null) {
		productInfo = multi.getFilesystemName("productInfo");
		filesize = (int) multi.getFile("productInfo").length();
	}
	if (multi.getFilesystemName("productDetail") != null) {
		productDetail = multi.getFilesystemName("productDetail");
		filesize = (int) multi.getFile("productDetail").length();
	}
	if (multi.getFilesystemName("productCaution") != null) {
		productCaution = multi.getFilesystemName("productCaution");
		filesize = (int) multi.getFile("productCaution").length();
	}
	if (multi.getFilesystemName("productImg") != null) {
		productImg = multi.getFilesystemName("productImg");
		filesize = (int) multi.getFile("productImg").length();
	}
	
	System.out.println("쿼리 입력 전.");
	
	System.out.println(request.getParameter("productInfo"));
	
	sql = "insert into product(productName,productComment,productInfo,productDetail,productCaution,productPrice,productSalePrice,productCount,productKind,productImg,categoryKey,filesize)";
				
	sql += "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)"; //int로 바꾼후 0으로 바꾸기
	//총 15개 Bean product 11개   product_file 4개
	pstmt = con.prepareStatement(sql);

	pstmt.setString(1, multi.getParameter("productName"));//파일이름
	
	System.out.println("productName = " + multi.getParameter("productName"));
	
	pstmt.setString(2, multi.getParameter("productComment"));//상품 내용 fileComment 
	
	System.out.println("productComment = " + multi.getParameter("productComment"));
	
	pstmt.setString(3, productInfo); //productInfo img 업로드
	
	System.out.println("productInfo = " + productInfo);
	
	pstmt.setString(4, productDetail);//productDetail img 업로드
	
	System.out.println("productDetail = " + productDetail);
	
	pstmt.setString(5, productCaution); //productCaution img 업로드
	
	System.out.println("productCaution = " + productCaution);
	
	pstmt.setInt(6, Integer.parseInt(multi.getParameter("productPrice"))); //productPrice  int로 바꾸기
	
	System.out.println("productPrice = " + multi.getParameter("productPrice"));
	
	pstmt.setInt(7, Integer.parseInt(multi.getParameter("productSalePrice")));//productSalePrice int로 바꾸기
	
	System.out.println("productSalePrice = " + multi.getParameter("productSalePrice"));
	
	pstmt.setInt(8, Integer.parseInt(multi.getParameter("productCount"))); //productCount int로 바꾸기
	
	System.out.println("productCount = " + multi.getParameter("productCount"));
	
	pstmt.setString(9, multi.getParameter("productKind")); //productKind 
	
	System.out.println("productKind = " + multi.getParameter("productKind"));
	
	pstmt.setString(10, productImg); //productImg 
	
	System.out.println("productImg = " + productImg);
	
	pstmt.setInt(11, Integer.parseInt(multi.getParameter("categoryKey"))); //categoryKey int로 바꾸기
	
	System.out.println("categoryKey = " + multi.getParameter("categoryKey"));
	
	pstmt.setInt(12, filesize); //filesize 파일 용량 변수
	
	System.out.println("filesize = " + filesize);
	
	pstmt.executeUpdate(); 
}catch (Exception e) {
	e.printStackTrace();
}	
finally {
	pool.freeConnection(con,pstmt,rs);
}
}

//상품 등록 페이지 (product_file db용)
public void uploadFile(HttpServletRequest request) {//product_file db 업로드 설정

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	String fileSaveName = null; //파일 이름 변수
	String fileOrignalName = null; //파일 이름 변수
	MultipartRequest multi = null;
	int size = 0; //파일 용량 변수

try {
	con = pool.getConnection();
	
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
		
	File file = new File(SAVEFOLDER);
	

	if (multi.getFilesystemName("fileSaveName") != null) {
		fileSaveName = multi.getFilesystemName("fileSaveName");
		size = (int) multi.getFile("fileSaveName").length();
	}
	if (multi.getFilesystemName("fileOrignalName") != null) {
		fileOrignalName = multi.getFilesystemName("fileOrignalName");
		size = (int) multi.getFile("fileOrignalName").length();
	}
	
	//exists() 메서드 : 파일이 존재 하는지 여부를 알아 내는 메서드
	//파일이 존재 한다면 true, 없으면 false 값을 반환.
	if (!file.exists()) //파일이 존재 한다면
			file.mkdirs(); //mkdirs() : 파일 디렉토리 만드는 메서드 
		multi = new MultipartRequest(request, SAVEFOLDER,MAXSIZE, ENCTYPE,new DefaultFileRenamePolicy());

	sql = "insert into product_file(fileOrignalName,fileSaveName,size,productKey)";
				
	sql += "values(?, ?, 0, ?)"; //int로 바꾼후 0으로 바꾸기
	//총 16개 Bean product 12개   product_file 4개
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, fileOrignalName);//파일 이름
	pstmt.setString(2, fileSaveName);//파일 이름  
	pstmt.setInt(3, size); //파일 용량
	pstmt.setInt(4, Integer.parseInt(multi.getParameter("productKey"))); //상품 고유  키 꼭 입력 바람
	pstmt.executeUpdate(); 
}catch (Exception e) {
	e.printStackTrace();
}	
finally {
	pool.freeConnection(con,pstmt,rs);
}
}

//상품 수정
public void updateproduct(ProductManagementBean bean) {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try {
		con = pool.getConnection();

		//updateproduct 쿼리로 상품을 수정한다.
		//num으로 수정할 상품을 찾아서 수정
		sql = "update product set productName = ?, productComment = ?, productInfo = ?, productDetail = ?, productCaution = ?, productPrice = ?, productSalePrice = ? ,productCount = ? , productKind = ?, porductImg = ?, categoryKey = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getProductName());
		pstmt.setString(2, bean.getProductComment());	
		pstmt.setString(3, bean.getProductInfo());
		pstmt.setString(4, bean.getProductDetail());
		pstmt.setString(5, bean.getProductCaution());	
		pstmt.setInt(6, bean.getProductPrice());
		pstmt.setInt(7, bean.getProductSalePrice());
		pstmt.setInt(8, bean.getProductCount());
		pstmt.setString(9, bean.getProductKind());	
		pstmt.setString(10, bean.getProductImg());
		pstmt.setInt(11, bean.getCategoryKey());
		pstmt.executeUpdate();
	}catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt);
	}
}

	}
