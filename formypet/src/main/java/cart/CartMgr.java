package cart;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

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
	public void insertCart(int memKey, int productKey, HttpServletResponse response) {
		try {
			con = pool.getConnection();
			sql = "select * from cart where memKey = ? and productKey = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memKey);
			pstmt.setInt(2, productKey);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				response.setContentType("text/html; charset=UTF-8");
				 
				PrintWriter out = response.getWriter();
				 
				out.println("<script>alert('동일한 상품이 있습니다.');</script>");
				 
				out.flush();
				out.close();
			}else {
				sql = "insert into cart(cartCount,memKey,productKey) values(1,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, memKey);
				pstmt.setInt(2, productKey);
				pstmt.executeUpdate();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
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

}