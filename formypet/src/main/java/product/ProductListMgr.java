package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Catch;

import util.DBConnectionMgr;

public class ProductListMgr {

	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public ProductListMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//전체상품 불러오기
	public ArrayList<ProductBean> getProductListAll(){
		ArrayList<ProductBean> pla = new ArrayList<ProductBean>();
		
		try {
			con = pool.getConnection();
			sql = "select * from product where delYn='N' order by productKey desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();
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
				pla.add(bean);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return pla;
	}
	
	//카테고리별 상품 가져오기
	public ArrayList<ProductBean> getCateList(int categoryKey){
				
	ArrayList<ProductBean> clist = new ArrayList<>();
	
		try {
		
		con = pool.getConnection();
		
		sql = "select * from product where categoryKey=? and delYn='N' order by productDate desc";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, categoryKey);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ProductBean bean = new ProductBean();
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
			clist.add(bean);
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return clist;
	}
	
	//베스트 카테고리 가져오기
	public ArrayList<ProductBean> getBestList(){
				
	ArrayList<ProductBean> blist = new ArrayList<>();
	
		try {
		
		con = pool.getConnection();
		
		sql = "select * from product where productOrderCount >= 500 and delYn='N' order by productDate desc";
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ProductBean bean = new ProductBean();
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
			blist.add(bean);
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return blist;
	}
	
	//product kind 가져오기
	public ArrayList<ProductBean> getKindList(String productKind, String productKind2){
				
	ArrayList<ProductBean> klist = new ArrayList<>();
	
		try {
		
		con = pool.getConnection();
		
		sql = "select * from product where productKind IN (?,?) and delYn='N' order by productDate DESC";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, productKind);
		pstmt.setString(2, productKind2);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ProductBean bean = new ProductBean();
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
			klist.add(bean);
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return klist;
	}
	
	//리뷰 갯수 가져오기
	public int getReviewCount(int productKey){
				
		int count = 0;
	
		try {
		
		con = pool.getConnection();
		//주문 수대로 내림차순 정렬하고 위에서 3개 불러옴
		sql = "SELECT COUNT(*) AS count FROM review WHERE productKey=?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, productKey);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			count = rs.getInt("count");
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return count;
	}
	
}
