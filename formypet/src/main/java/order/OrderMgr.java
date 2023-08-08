package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

import util.DBConnectionMgr;

public class OrderMgr {
	
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public OrderMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원구매
	public boolean insertMemOrder(String rName, String rAddress, String rPhone, String requestPro, int pointPrice, int productPrice, int memKey) {
		boolean flag = true;
	    
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
	    		
		try {
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
		return flag;
	}
	
}
