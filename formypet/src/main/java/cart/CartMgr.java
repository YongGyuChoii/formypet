package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Catch;

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
				sql = "select * from cart where delYn='N' order by cartKey desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					CartBean bean = new CartBean();
					bean.setCartKey(rs.getInt("cartKey"));
					bean.setCartCount(rs.getInt("cartCount"));
					bean.setMemKey(rs.getInt("memKey"));
					bean.setProductKey(rs.getInt("productKey"));
					
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