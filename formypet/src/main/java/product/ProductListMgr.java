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
	
}
