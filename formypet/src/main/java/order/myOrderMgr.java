package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;
import java.util.Vector;

import util.DBConnectionMgr;

public class myOrderMgr {
	
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	
	
	public myOrderMgr() {
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
	
	
		// 게시판 리스트
		public Vector<OrderBean> getOrderList() {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			
			Vector<OrderBean> vlist = new Vector<OrderBean>();
			
			try {
				con = pool.getConnection();
				//keyField 와 keyWord 값이 있는 경우 게시물 조회
				sql = "SELECT orders.productKey, orders.optionValue, orders.memOrderKey, orders.oCount, mem_order.pDate, mem_order.productPrice FROM orders JOIN mem_order ON orders.memOrderKey = mem_order.memOrderKey";
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					OrderBean bean = new OrderBean();
					bean.setProductKey(rs.getInt("productKey"));
					bean.setOptionValue(rs.getString("optionValue"));
					bean.setpDate(rs.getString("pDate"));
					bean.setMemOrderKey(rs.getString("memOrderkey"));
					bean.setProductPrice(rs.getInt("productPrice"));
					bean.setoCount(rs.getInt("oCount"));
					vlist.add(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
		//총 게시물수
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
					sql = "select count(num) from board";
					pstmt = con.prepareStatement(sql);
				} else { //keyField, keyWord 값이 있는 경우 총 게시물 가져오기
					sql = "select count(num) from  board where " + keyField + " like ? ";
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


	

	}
