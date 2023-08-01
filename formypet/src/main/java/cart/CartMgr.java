package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

	//장바구니 상품 가져오기
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
	
	//장바구니 비우기
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
	public boolean insertCart(int memKey, int productKey, int[] cartCount, String[] optionValue) {
		boolean flag = true;
		for(int i=0; i<cartCount.length; i++) {
			try {
				con = pool.getConnection();
				sql = "select * from cart where memKey = ? and productKey = ? and optionValue = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, memKey);
				pstmt.setInt(2, productKey);
				pstmt.setString(3, optionValue[i]);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					flag = false;
				}else {
					sql = "insert into cart(cartCount,memKey,productKey,optionValue) values(?,?,?,?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, cartCount[i]);
					pstmt.setInt(2, memKey);
					pstmt.setInt(3, productKey);
					pstmt.setString(4, optionValue[i]);
					pstmt.executeUpdate();
					flag = true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con,pstmt,rs);
			}
		}
		return flag;
	}
	
	//장바구니 수량 변경
	public void cartQuantity(CartBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE cart SET cartCount=? WHERE cartKey=?;";			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getCartCount());
			pstmt.setInt(2, bean.getCartKey());	
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//장바구니 총금액
	public void cartSum(int productSalePrice, int productPrice, int cartCount) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "SELECT SUM(product.productSalePrice), SUM(product.productPrice), SUM(cart.cartCount)\r\n"
					+ "FROM cart JOIN product\r\n"
					+ "ON cart.productKey = product.productKey";			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productSalePrice);
			pstmt.setInt(2, productPrice);
			pstmt.setInt(3, cartCount);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	
	
	
	
	
	
}