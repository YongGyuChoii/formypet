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
	
	//상품 리스트(product db)
	public Vector<ProductManagementBean> getpmList(String keyField, String keyWord, int start, int end) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		Vector<ProductManagementBean> vlist = new Vector<ProductManagementBean>();
		
		try {
			
			con = pool.getConnection();
			//keyWord 값이 없는 경우 상품 조회
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from product order by productKey desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else { //keyField 와 keyWord 값이 있는 경우 상품 조회
				sql = "select * from  product where " + keyField + " like ? ";
				sql += "order by productKey desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductManagementBean bean = new ProductManagementBean();
				bean.setProductName(rs.getString("productName"));
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
	 			bean.setProductKey(rs.getInt("productKey"));
	 			
	 			vlist.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vlist;
	}
	//상품 리스트 product_file db리시트 가져오기
			public Vector<ProductManagementBean> getpmList2(String keyField, String keyWord, int start, int end) {

			Connection con  = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = null;
			
			Vector<ProductManagementBean> vlist2 = new Vector<ProductManagementBean>();
			
			try {
				
				con = pool.getConnection();
				//keyWord 값이 없는 경우 상품 조회
				if (keyWord.equals("null") || keyWord.equals("")) {
					sql = "select * from product_file order by fileKey desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
				} else { //keyField 와 keyWord 값이 있는 경우 상품 조회
					sql = "select * from  product_file where " + keyField + " like ? ";
					sql += "order by fileKey desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + keyWord + "%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
				}
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
	//상품 옵션 리스트 option_code db리시트 가져오기
			public Vector<ProductManagementBean> getpmList3(String keyField, String keyWord, int start, int end) {

			Connection con  = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = null;
			
			Vector<ProductManagementBean> vlist3 = new Vector<ProductManagementBean>();
			
			try {
				
				con = pool.getConnection();
				//keyWord 값이 없는 경우 상품 조회
				if (keyWord.equals("null") || keyWord.equals("")) {
					sql = "select * from option_code order by ocKey desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
				} else { //keyField 와 keyWord 값이 있는 경우 상품 조회
					sql = "select * from  option_code where " + keyField + " like ? ";
					sql += "order by ocKey desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + keyWord + "%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
				}
				rs = pstmt.executeQuery();
				while (rs.next()) {
						
					ProductManagementBean bean3 = new ProductManagementBean();
					
					bean3.setOcKey(rs.getInt("ocKey"));
					bean3.setOc1(rs.getString("oc1"));
					bean3.setOc2(rs.getString("oc2"));
					bean3.setOc3(rs.getString("oc3"));
					bean3.setOc4(rs.getString("oc4"));
					bean3.setOc5(rs.getString("oc5"));
					bean3.setProductKey(rs.getInt("productKey"));
		 			
		 			vlist3.add(bean3);

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist3;
		}

	//상품 수	(product db)
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
				sql = "select count(productKey) from product";
				pstmt = con.prepareStatement(sql);
			} else { //keyField, keyWord 값이 있는 경우 총 게시물 가져오기
				sql = "select count(productKey) from  product where " + keyField + " like ? ";
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
	//상품 수	(product_file db용)
		public int getTotalCount2(String keyField, String keyWord) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int totalCount = 0;
			try {
				con = pool.getConnection();
				//keyField , keyWord 값이 없는 경우 총 게시물 가져오기
				if (keyWord.equals("null") || keyWord.equals("")) {
					sql = "select count(fileKey) from product_file";
					pstmt = con.prepareStatement(sql);
				} else { //keyField, keyWord 값이 있는 경우 총 게시물 가져오기
					sql = "select count(fileKey) from  product_file where " + keyField + " like ? ";
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
		//상품 수	(option_code db용)
				public int getTotalCount3(String keyField, String keyWord) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						//keyField , keyWord 값이 없는 경우 총 게시물 가져오기
						if (keyWord.equals("null") || keyWord.equals("")) {
							sql = "select count(ocKey) from option_code";
							pstmt = con.prepareStatement(sql);
						} else { //keyField, keyWord 값이 있는 경우 총 게시물 가져오기
							sql = "select count(ocKey) from  option_code where " + keyField + " like ? ";
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
	//상품 등록 메서드
	//상품 등록 메서드는 리턴타입이 void 이므로 반환값은 없다.
		public void uplpro(HttpServletRequest request) {
			
			Connection con = null; //연결객체
			PreparedStatement pstmt = null; //쿼리처리객체
			ResultSet rs = null;  //결과값 담는 객체
			
			String sql = null; //쿼리문 저장 변수
			
			MultipartRequest multi = null; //파일 업로드 위한 객체
			
			int filesize = 0; //파일용량 변수
			
			String productInfo = null; //파일이름 변수 productInfo
			
			String productDetail = null; //파일이름 변수 productDetail

			String productCaution = null; //파일이름 변수 productCaution
			
			String productImg = null; //파일이름 변수 productImg
			
			try {
				con = pool.getConnection();
				sql = "select max(productKey) from product"; //게시물이 총 몇개 인지 조회하는 쿼리
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
				
				sql = "insert product(productName,productComment,productInfo,productDetail,productCaution,productPrice,productSalePrice,productCount,productKind,productImg,categoryKey,productKey)";
				sql += "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				//작성날짜 regdate 컬럼은 now() 로 현재 날짜를 자동으로 입력 합니다.
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, multi.getParameter("productName"));
				pstmt.setString(2, multi.getParameter("productComment"));
				pstmt.setString(3, productInfo);//
				pstmt.setString(4, productDetail);//
				pstmt.setString(5, productCaution );//
				pstmt.setInt(6, Integer.parseInt(multi.getParameter("productPrice")));
				pstmt.setInt(7, Integer.parseInt(multi.getParameter("productSalePrice")));
				pstmt.setInt(8, Integer.parseInt(multi.getParameter("productCount")));
				pstmt.setString(9, multi.getParameter("productKind"));
				pstmt.setString(10, productImg);//
				pstmt.setInt(11, Integer.parseInt(multi.getParameter("categoryKey")));
				pstmt.setInt(12, Integer.parseInt(multi.getParameter("productKey")));
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
		//상품 등록 페이지 (product_file db용)
		public void upprof(HttpServletRequest request) {//product_file db 업로드 설정

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			String fileOriginalName = null;//fileOriginalName
			String fileSaveName = null;//fileSaveName
			MultipartRequest multi = null;
			int size = 0; //파일 용량 변수
			

		try {
			con = pool.getConnection();
			sql = "select max(fileKey) from product_file"; //게시물이 총 몇개 인지 조회하는 쿼리
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
				multi = new MultipartRequest(request, SAVEFOLDER,MAXSIZE, ENCTYPE,new DefaultFileRenamePolicy());
			
				if (multi.getFilesystemName("fileOriginalName") != null) {
					fileOriginalName = multi.getFilesystemName("fileOriginalName");
					size = (int) multi.getFile("fileOriginalName").length();
				}
				
				if (multi.getFilesystemName("fileSaveName") != null) {
					fileSaveName = multi.getFilesystemName("fileSaveName");
					size = (int) multi.getFile("fileSaveName").length();
				}
				
			sql = "insert into product_file(fileOriginalName,fileSaveName,size,productKey,fileKey)";
						
			sql += "values(?, ?, ?, ?, ?)"; //int로 바꾼후 0으로 바꾸기
			//총 16개 Bean product 12개   product_file 5개
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,fileOriginalName);//
			pstmt.setString(2,fileSaveName);//
			pstmt.setInt(3, size); //파일 용량
			pstmt.setInt(4, Integer.parseInt(multi.getParameter("productKey"))); //상품 고유  키 꼭 입력 바람
			pstmt.setInt(5, Integer.parseInt(multi.getParameter("fileKey")));
			pstmt.executeUpdate(); 
		}catch (Exception e) {
			e.printStackTrace();
		}	
		finally {
			pool.freeConnection(con, pstmt, rs);
		}
		}
		
		//상품 등록 페이지 (option_code db용)
				public void upoc(HttpServletRequest request) {//option_code db 업로드 설정

					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = null;
					MultipartRequest multi = null;
					
					

				try {
					con = pool.getConnection();
					sql = "select max(ocKey) from option_code"; 
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
						
					int ref = 1;
					
					if (rs.next())
						ref = rs.getInt(1) + 1;
					
					multi = new MultipartRequest(request, SAVEFOLDER,MAXSIZE, ENCTYPE,new DefaultFileRenamePolicy());
					sql = "insert into option_code(ocKey, oc1, oc2, oc3, oc4, oc5, productKey)";
								
					sql += "values(?, ?, ?, ?, ?, ?, ?)"; 
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1,multi.getParameter("ocKey"));
					pstmt.setString(2,multi.getParameter("oc1"));
					pstmt.setString(3, multi.getParameter("oc2")); 
					pstmt.setString(4, multi.getParameter("oc3")); 
					pstmt.setString(5, multi.getParameter("oc4")); 
					pstmt.setString(6, multi.getParameter("oc5")); 
					pstmt.setInt(7, Integer.parseInt(multi.getParameter("productKey")));
					pstmt.executeUpdate(); 
				}catch (Exception e) {
					e.printStackTrace();
				}	
				finally {
					pool.freeConnection(con, pstmt, rs);
				}
				}
		
		// 상품 리스트 리턴 메서드, 상품의 productKey 값을 기준으로 해당 게시물을 조회한다.
		public ProductManagementBean getpm(int productKey) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			
			ProductManagementBean bean = new ProductManagementBean();
			
			try {
				con = pool.getConnection();
				//productName 값을 기준으로 product 테이블에서 게시물을 조회한다.
				sql = "select * from product where productKey=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, productKey);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					bean.setProductName(rs.getString("productName"));
					//System.out.println(productKey);
					bean.setProductComment(rs.getString("productComment"));
					bean.setProductInfo(rs.getString("productInfo"));
					bean.setProductDetail(rs.getString("productDetail"));
					bean.setProductCaution(rs.getString("productCaution"));
					bean.setProductPrice(rs.getInt("productPrice"));
					bean.setProductSalePrice(rs.getInt("productSalePrice"));
					bean.setProductCount(rs.getInt("productCount"));
					bean.setProductKind(rs.getString("productKind"));
					bean.setProductImg(rs.getString("productImg"));
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
		
		//productKey로 상품 조회하기(product_file)
		public ProductManagementBean getpmbean(int fileKey){
				
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
				
				pstmt.setInt(1, fileKey);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					bean.setFileOriginalName(rs.getString("fileOriginalName"));
					bean.setFileSaveName(rs.getString("fileSaveName"));
					bean.setSize(rs.getInt("size"));
					bean.setProductKey(rs.getInt("productKey"));
					bean.setFileKey(rs.getInt("fileKey"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
				
		}

		// 상품 리스트 리턴 메서드, 상품의 productKey 값을 기준으로 해당 게시물을 조회한다.
		public ProductManagementBean getpm3(int ocKey) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			
			ProductManagementBean bean = new ProductManagementBean();
			
			try {
				con = pool.getConnection();
				//productKey 값을 기준으로 option_code 테이블에서 게시물을 조회한다.
				sql = "select * from option_code where ocKey=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, ocKey);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					bean.setOcKey(rs.getInt("ocKey"));
					
					bean.setOc1(rs.getString("oc1"));
					bean.setOc2(rs.getString("oc2"));
					bean.setOc3(rs.getString("oc3"));
					bean.setOc4(rs.getString("oc4"));
					bean.setOc5(rs.getString("oc5"));
					bean.setProductKey(rs.getInt("productKey"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
		//상품내용 수정 (product db용)
		public void udfile(ProductManagementBean bean) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			try {
				con = pool.getConnection();
				
				//udfile 쿼리로 게시물을 수정한다.
				//productKey 으로 수정할 게시물을 찾아서 컬럼을 수정 한다.
				sql = "update product set productName = ?, productComment = ?, productInfo = ?, productDetail = ?, productCaution = ?, productPrice = ?, productSalePrice = ? ,productCount = ? , productKind = ?, productImg = ?, categoryKey = ? where productKey = ?";
				
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
				pstmt.setInt(12, bean.getProductKey());
				pstmt.executeUpdate();
				
			} catch (Exception e) {
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
				//fileKey로 상품을 찾아서 컬럼을 수정한다.
				sql = "update product_file set fileOriginalName = ?, fileSaveName = ?,  size = ?, productKey = ? where fileKey = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getFileOriginalName());
				pstmt.setString(2, bean.getFileSaveName());	
				pstmt.setInt(3, bean.getSize());
				pstmt.setInt(4, bean.getProductKey());
				pstmt.setInt(5, bean.getFileKey());
				pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		//상품 상세 내용 수정 (option_code db용)
				public void updateoc(ProductManagementBean bean) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					
					try {
						con = pool.getConnection();

						//updateproduct_file 쿼리로 상품을 수정한다.
						//fileKey로 상품을 찾아서 컬럼을 수정한다.
						sql = "update option_code set oc1 = ?, oc2 = ?,  oc3 = ?, oc4 = ?, oc5 = ?, productKey = ? where ocKey = ?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, bean.getOc1());
						pstmt.setString(2, bean.getOc2());	
						pstmt.setString(3, bean.getOc3());
						pstmt.setString(4, bean.getOc4());
						pstmt.setString(5, bean.getOc5());
						pstmt.setInt(6, bean.getProductKey());
						pstmt.setInt(7, bean.getOcKey());
						pstmt.executeUpdate();
					}catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
				}
}