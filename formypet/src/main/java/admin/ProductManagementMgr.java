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


	//상품 리스트 product db리시트 가져오기
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
				
			bean.setProductKey(rs.getInt("productKey"));//productKey가져오기
		 	bean.setProductName (rs.getString("productName"));
		 	 //ProductManagementBean 클래스의 setter 메서드를 이용하여 변수에 데이터베이스 에서 조회된 결과 값을 담는다.
		 	bean.setProductComment(rs.getString("productComment"));
		 	bean.setProductInfo(rs.getString("productInfo"));
		 	bean.setProductDetail(rs.getString("productDetail"));
		 	bean.setProductCaution(rs.getString("productCaution"));
		 	bean.setProductPrice(rs.getInt("productPrice"));
		 	bean.setProductSalePrice(rs.getInt("productSalePrice"));
		 	bean.setProductCount(rs.getInt("productCount"));
		 	bean.setProductKind(rs.getString("productKind"));
		 	bean.setProductImg(rs.getString("productImg"));
 			bean.setDelYn(rs.getString("delYn"));
 			bean.setCategoryKey(rs.getInt("categoryKey"));
 			
 			vlist.add(bean);

		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt, rs);
	}
	return vlist;
}

	
	//상품 리스트 product_file db리시트 가져오기
		public Vector<ProductManagementBean> getpmList2() {

		Connection con  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = null;
		
		Vector<ProductManagementBean> vlist2 = new Vector<ProductManagementBean>();
		
		try {
			con = pool.getConnection();
			
			sql = "select * from product_file";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
					
				ProductManagementBean bean2 = new ProductManagementBean();
				
				bean2.setFileKey(rs.getInt("fileKey"));
				bean2.setFileOriginalName(rs.getString("fileOriginalName"));
				bean2.setFileSaveName(rs.getString("fileSaveName"));
				bean2.setSize(rs.getInt("size"));
				bean2.setProductKey(rs.getInt("productKey"));//productKey가져오기
	 			
	 			vlist2.add(bean2);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist2;
	}
	
//productKey로 상품 조회하기
public ProductManagementBean getPMBean(String productName){
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	ProductManagementBean bean = new ProductManagementBean();
	
	try {
		con = pool.getConnection();
		//num 값을 기준으로 tblBoard 테이블 에서 게시물을 조회한다.
		sql = "select * from product where productKey=?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, productName);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			bean.setProductName(rs.getString("productName"));
			bean.setProductComment(rs.getString("productComment"));
			bean.setProductInfo(rs.getString("productInfo"));
			bean.setProductDetail(rs.getString("productDetail"));
			bean.setProductCaution(rs.getString("productCaution"));
			bean.setProductPrice(rs.getInt("productPrice"));
			bean.setProductSalePrice(rs.getInt("productSalePrice"));
			bean.setProductCount(rs.getInt("productCount"));
			bean.setProductKind(rs.getString("productKind"));
			bean.setProductImg(rs.getString("producImg"));
			bean.setCategoryKey(rs.getInt("categoryKey"));
			bean.setProductKey(rs.getInt("productKey"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt, rs);
	}
	return bean;
		
}
	
//productKey로 상품 조회하기
public ProductManagementBean getpmbean(int productKey){
		
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	ProductManagementBean bean = new ProductManagementBean();
	
	try {
		con = pool.getConnection();
		//num 값을 기준으로 tblBoard 테이블 에서 게시물을 조회한다.
		sql = "select * from product_file where fileKey=?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, productKey);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			bean.setFileOriginalName(rs.getString("fileOriginalName"));
			bean.setFileSaveName(rs.getString("fileSaveName"));
			bean.setSize(rs.getInt("size"));
			bean.setProductKey(rs.getInt("productKey"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt, rs);
	}
	return bean;
		
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
	
	sql = "insert into product(productName,productComment,productInfo,productDetail,productCaution,productPrice,productSalePrice,productCount,productKind,productImg,categoryKey)";
				
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
	
	//pstmt.setInt(12, filesize); //filesize 파일 용량 변수
	
	//System.out.println("filesize = " + filesize);
	
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
	ArrayList fileSaveName = new ArrayList(); //파일 이름 변수
	ArrayList fileOrignalName = new ArrayList(); //파일 이름 변수
	MultipartRequest multi = null;
	int size = 0; //파일 용량 변수

try {
	con = pool.getConnection();
	
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
		
	File file = new File(SAVEFOLDER);
	
	Enumeration files = multi.getFileNames();
	while(files.hasMoreElements()) {
		String name = (String)files.nextElement();
		fileSaveName.add(multi.getFilesystemName(name));//파일 이름 없으면 String타입으로 이름 자동저장
		fileOrignalName.add(multi.getOriginalFileName(name));//파일 이름 없으면 String타입으로 이름 자동저장
		size = (int) multi.getFile("fileSaveName").length();//파일 savename 사이즈
		size = (int) multi.getFile("fileOriginalName").length();//파일 original 사이즈 
	}
	
	
	//exists() 메서드 : 파일이 존재 하는지 여부를 알아 내는 메서드
	//파일이 존재 한다면 true, 없으면 false 값을 반환.
	if (!file.exists()) //파일이 존재 한다면
			file.mkdirs(); //mkdirs() : 파일 디렉토리 만드는 메서드 
		multi = new MultipartRequest(request, SAVEFOLDER,MAXSIZE, ENCTYPE,new DefaultFileRenamePolicy());

	sql = "insert into product_file(fileOriginalName,fileSaveName,size,productKey)";
				
	sql += "values(?, ?, 0, ?)"; //int로 바꾼후 0으로 바꾸기
	//총 16개 Bean product 12개   product_file 4개
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1,multi.getParameter("file"));//fileOriginalName
	pstmt.setString(2,multi.getParameter("file"));//fileSaveName
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

//상품 수정 (product db용)
public void updateproduct(ProductManagementBean bean) {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try {
		con = pool.getConnection();

		//updateproduct 쿼리로 상품을 수정한다.
		//productName으로 수정 할 상품을 찾아서 컬럼을 수정한다.
		sql = "update product set productName = ?, productComment = ?, productInfo = ?, productDetail = ?, productCaution = ?, productPrice = ?, productSalePrice = ? ,productCount = ? , productKind = ?, porductImg = ?, categoryKey = ? where productKey=?";
		
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


//상품 상세 내용 수정 (product_file db용)
public void updateproduct_file(ProductManagementBean bean) {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try {
		con = pool.getConnection();

		//updateproduct_file 쿼리로 상품을 수정한다.
		//productKey로 상품을 찾아서 컬럼을 수정한다.
		sql = "update product_file set fileSaveName = ?, fileOriginalName = ?, size = ?, productKey = ? where fileKey = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getFileSaveName());
		pstmt.setString(2, bean.getFileOriginalName());	
		pstmt.setInt(3, bean.getSize());
		pstmt.setInt(4, bean.getProductKey());
		pstmt.executeUpdate();
	}catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt);
	}
}


	}
