package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBConnectionMgr;

public class ProductMgr {
	
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public ProductMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//목욕 인기상품 3개 가져오기
	public ArrayList<ProductBean> getBathList(){
		
		ArrayList<ProductBean> blist = new ArrayList<>();
		
		try {
			
			con = pool.getConnection();
			//주문 수대로 내림차순 정렬하고 위에서 3개 불러옴
			sql = "select * from product where categoryKey=1 and delYn='N' order by productOrderCount desc LIMIT 3";
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
	
	//음식 인기상품 3개 가져오기
	public ArrayList<ProductBean> getSnackList(){
		
		ArrayList<ProductBean> slist = new ArrayList<>();
		
		try {
			
			con = pool.getConnection();
			//주문 수대로 내림차순 정렬하고 위에서 3개 불러옴
			sql = "select * from product where categoryKey=6 and delYn='N' order by productOrderCount desc LIMIT 3";
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
				slist.add(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return slist;
	}
		
		//리빙 인기상품 3개 가져오기
		public ArrayList<ProductBean> getLivingList(){
			
			ArrayList<ProductBean> llist = new ArrayList<>();
			
			try {
				
				con = pool.getConnection();
				//주문 수대로 내림차순 정렬하고 위에서 3개 불러옴
				sql = "select * from product where categoryKey=4 and delYn='N' order by productOrderCount desc LIMIT 3";
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
					llist.add(bean);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con,pstmt,rs);
			}
			return llist;
		}
		
		//드레스 인기상품 3개 가져오기
		public ArrayList<ProductBean> getClothesList(){
			
			ArrayList<ProductBean> clist = new ArrayList<>();
			
			try {
				
				con = pool.getConnection();
				//주문 수대로 내림차순 정렬하고 위에서 3개 불러옴
				sql = "select * from product where categoryKey=7 and delYn='N' order by productOrderCount desc LIMIT 3";
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
					clist.add(bean);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con,pstmt,rs);
			}
			return clist;
		}
		
		//플레이룸 인기상품 3개 가져오기
		public ArrayList<ProductBean> getWalkList(){
			
			ArrayList<ProductBean> wlist = new ArrayList<>();
			
			try {
				
				con = pool.getConnection();
				//주문 수대로 내림차순 정렬하고 위에서 3개 불러옴
				sql = "select * from product where categoryKey=5 and delYn='N' order by productOrderCount desc LIMIT 3";
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
					wlist.add(bean);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con,pstmt,rs);
			}
			return wlist;
		}

}
