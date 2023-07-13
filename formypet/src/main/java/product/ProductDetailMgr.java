package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBConnectionMgr;

public class ProductDetailMgr {
	
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public ProductDetailMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//상품키로 상품 가져오기
	public ProductBean getProduct(int productKey) {
		ProductBean bean = new ProductBean();
		
		try {
			con = pool.getConnection();
			//productKey 값을 기준으로 product 테이블 에서 상품을 조회한다.
			sql = "select * from product where productKey=? and delYn='N'";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, productKey);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setProductKey(rs.getInt("productKey"));
				bean.setProductName(rs.getString("productName"));
				bean.setProductComment(rs.getString("productComment"));
				bean.setProductInfo(rs.getString("productInfo"));
				bean.setProductDetail(rs.getString("productDetail"));
				bean.setProductCaution(rs.getString("productCaution"));
				bean.setProductPrice(rs.getInt("productPrice"));
				bean.setProductSalePrice(rs.getInt("productSalePrice"));
				bean.setProductCount(rs.getInt("productCount"));
				bean.setProductOrderCount(rs.getInt("productOrderCount"));
				bean.setProductKind(rs.getString("productKind"));
				bean.setProductImg(rs.getString("productImg"));
				bean.setProductDate(rs.getString("productDate"));
				bean.setDelYn(rs.getString("delYn"));
				bean.setCategoryKey(rs.getInt("categoryKey"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return bean;
	}
	
	//상품키로 상품사진 파일들 가져오기
	public ArrayList<ProductFileBean> getProductFile(int productKey){
		ArrayList<ProductFileBean> pfbList = new ArrayList<>();
		
		try {
			con = pool.getConnection();
			//productKey 값을 기준으로 product_file 테이블 에서 파일을 조회한다.
			sql = "select * from product_file where productKey=? and delYn='N'";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, productKey);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductFileBean pfb = new ProductFileBean();
				pfb.setFileKey(rs.getInt("fileKey"));
				pfb.setFileOriginalName(rs.getString("fileOriginalName"));
				pfb.setFileSaveName(rs.getString("fileSaveName"));
				pfb.setSize(rs.getInt("size"));
				pfb.setDelYn(rs.getString("delYn"));
				pfb.setFileCreatedDate(rs.getString("fileCreatedDate"));
				pfb.setFileDeletedDate(rs.getString("fileDeletedDate"));
				pfb.setProductKey(rs.getInt("productKey"));
				pfbList.add(pfb);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return pfbList;
	}
	
}
