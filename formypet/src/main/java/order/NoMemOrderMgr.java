package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;
import java.util.Vector;

import util.DBConnectionMgr;

public class NoMemOrderMgr {
	
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	
	
	public NoMemOrderMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원구매
	public boolean insertMemOrder(String rName, String rAddress, String rPhone, String requestPro, int pointPrice, 
									int productPrice, int memKey, int[] productKey, 
									int[] oCount, int[] oPrice, int[] oPoint, String[] optionValue) {
		boolean flag = true;
	    
	    PreparedStatement pstmt = null;
	    
		//랜덤 주문번호 생성
	    String trade_code = "";
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        Calendar dateTime = Calendar.getInstance();
        trade_code = sdf.format(dateTime.getTime());
        
        int leftLimit = 48; // numeral '0'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = 10;
        Random random = new Random();
        String generatedString = random.ints(leftLimit, rightLimit + 1)
                                       .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                                       .limit(targetStringLength)
                                       .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                                       .toString();
        trade_code += generatedString;
	    
        //배송비여부 판단
	    String yOrN;
	    if(productPrice >= 50000) {
	    	yOrN = "Y";
	    }else {
	    	yOrN = "N";
	    }
	    		
		try { //mem_order 테이블 추가
			con = pool.getConnection();
			sql = "insert into mem_order(memOrderKey,rName,rAddress,rPhone,request,pointPrice,productPrice,deliveryFreeYn,memKey)"
				+ " values('"+trade_code+"',?,?,?,?,?,?,'"+yOrN+"',?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rName);
			pstmt.setString(2, rAddress);
			pstmt.setString(3, rPhone);
			pstmt.setString(4, requestPro);
			pstmt.setInt(5, pointPrice);
			pstmt.setInt(6, productPrice);
			pstmt.setInt(7, memKey);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		
		for(int i=0; i<productKey.length; i++) {
			try { //orders 테이블 추가
				con = pool.getConnection();
				sql = "insert into orders(memOrderKey,productKey,oCount,oPrice,oStatus,oPoint,optionValue)"
					+ " values('"+trade_code+"',?,?,?,'상품준비중',?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, productKey[i]);
				pstmt.setInt(2, oCount[i]);
				pstmt.setInt(3, oPrice[i]);
				pstmt.setInt(4, oPoint[i]);
				pstmt.setString(5, optionValue[i]);
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con,pstmt,rs);
			}
		}
		
		return flag;
	}
	
	//구매시 회원 포인트 관리
	public void memPoint(int pointPrice, int[] oPoint, int memKey) {
		
		try { //회원 포인트에서 사용한 포인트 빼주기
			con = pool.getConnection();
			sql = "UPDATE member set memPoint = memPoint-? WHERE memKey = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pointPrice);
			pstmt.setInt(2, memKey);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		
		for(int i=0; i<oPoint.length; i++) {
			try { //회원 포인트에서 적립된 포인트 더하기
				con = pool.getConnection();
				sql = "UPDATE member set memPoint = memPoint+? WHERE memKey = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, oPoint[i]);
				pstmt.setInt(2, memKey);
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con,pstmt);
			}
		}
	}
	
	//상품 구매시 상품재고량, 상품 주문수량 관리
	public void productCount(int[] productKey, int[] oCount) {
		for(int i=0; i<productKey.length; i++) {
			try { //회원 포인트에서 적립된 포인트 더하기
				con = pool.getConnection();
				sql = "UPDATE product set productCount = productCount-? WHERE productKey = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, oCount[i]);
				pstmt.setInt(2, productKey[i]);
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con,pstmt);
			}
		}
		for(int i=0; i<productKey.length; i++) {
			try { //회원 포인트에서 적립된 포인트 더하기
				con = pool.getConnection();
				sql = "UPDATE product set productOrderCount = productOrderCount+1 WHERE productKey = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, productKey[i]);
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con,pstmt);
			}
		}
		}
	
	

		public Vector<NoMemOrderBean> getOrderList() {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			
			Vector<NoMemOrderBean> vlist = new Vector<NoMemOrderBean>();
			
			try {
				con = pool.getConnection();
				//keyField 와 keyWord 값이 있는 경우 게시물 조회
				sql = "SELECT * FROM orders INNER JOIN product ON orders.productKey = product.productKey INNER JOIN non_mem_order ON orders.nonMemOrderKey = non_mem_order.nonMemOrderKey order by ordersKey ";
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					NoMemOrderBean bean = new NoMemOrderBean();
					bean.setOrdersKey(rs.getInt("ordersKey"));
					bean.setProductKey(rs.getInt("productKey"));
					bean.setOptionValue(rs.getString("optionValue"));
					bean.setpDate(rs.getString("pDate"));
					bean.setNonMemOrderKey(rs.getString("nonMemOrderKey"));
					bean.setProductPrice(rs.getInt("productPrice"));
					bean.setoCount(rs.getInt("oCount"));
					bean.setReviewYn(rs.getString("reviewYn"));
					bean.setProductName(rs.getString("productName"));
					bean.setProductImg(rs.getString("productImg"));
			
					vlist.add(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
		
		


	

	}
