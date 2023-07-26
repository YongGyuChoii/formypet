package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Catch;

import admin.ProductManagementBean;
import product.ProductBean;
import util.DBConnectionMgr;

public class CartMgr {

	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public CartMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public ArrayList<CartBean> getCartAll(){
		ArrayList<CartBean> pla = new ArrayList<CartBean>();
			
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM cart INNER JOIN product ON cart.productKey = product.productKey WHERE cartKey";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				CartBean bean = new CartBean();
				bean.setCartKey(rs.getInt("cartKey"));
				bean.setCartCount(rs.getInt("cartCount"));
				bean.setMemKey(rs.getInt("memKey"));
				bean.setProductKey(rs.getInt("productKey"));
				bean.setProductName(rs.getString("productName"));
				bean.setProductPrice(rs.getInt("productPrice"));
				bean.setProductSalePrice(rs.getInt("productSalePrice"));
				bean.setProductImg(rs.getString("productImg"));
				pla.add(bean);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return pla;
	}
	
	public void cartDeleteAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "DELETE FROM cart";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//회원 장바구니 추가(옵션x)
	public void insertCart(int memKey, int productKey) {
		try {
			con = pool.getConnection();
			
			sql = "insert into cart(cartCount,memKey,productKey) values(1,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, memKey);
			pstmt.setInt(3, productKey);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
	}
}