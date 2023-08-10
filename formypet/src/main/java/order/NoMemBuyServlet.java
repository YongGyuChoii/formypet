package order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoMemBuyServlet
 */
@WebServlet("/order/NoMemBuyServlet")
public class NoMemBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoMemBuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		boolean flag = true;
		
		//non_mem_order 테이블 파라미터
		String oName = request.getParameter("orderName"); //주문하는 사람
		String oPhone1 = request.getParameter("orderPhone2"); //주문하는 핸드폰
		String oPhone2 = request.getParameter("orderPhone3"); //주문하는 핸드폰
		String oPhone = "010-"+oPhone1+"-"+oPhone2; //주문하는 핸드폰
		String oEmail1 = request.getParameter("orderEmail1"); //주문하는 이메일
		String oEmail2 = request.getParameter("orderEmail2"); //주문하는 이메일
		String oEmail = oEmail1+"@"+oEmail2; //주문하는 이메일
		String orderPassword = request.getParameter("orderPw1"); //주문하는 비번
		String rName = request.getParameter("delName2"); //받는사람
		String rAddress1 = request.getParameter("delZipcode1");
		String rAddress2 = request.getParameter("delZipcode2");
		String rAddress3 = request.getParameter("delZipcode3");
		String address = rAddress1 + "/" + rAddress2 + "/" + rAddress3; //받는주소
		String rPhone1 = request.getParameter("delPhone2");
		String rPhone2 = request.getParameter("delPhone3");
		String rPhone = "010-"+rPhone1+"-"+rPhone2; //받는폰
		String requestPro = request.getParameter("delMessage"); //배송메시지
		int productPrice = Integer.parseInt(request.getParameter("totalView"));//총가격
		
		//orders 테이블 파라미터
		int productKey[] = null; //상품키
		String productKey1[] = request.getParameterValues("productKey");
		//productKey 인트형으로 일일이 다 변환
		if(productKey1!=null){
			productKey = new int[productKey1.length];
			for(int i=0;i<productKey1.length;i++){
				productKey[i] = Integer.parseInt(productKey1[i]);
			}
		}
		int oCount[] = null; //상품수량
		String oCount1[] = request.getParameterValues("oCount");
		//productKey 인트형으로 일일이 다 변환
		if(oCount1!=null){
			oCount = new int[oCount1.length];
			for(int i=0;i<oCount1.length;i++){
				oCount[i] = Integer.parseInt(oCount1[i]);
			}
		}
		int oPrice[] = null; //상품가격
		String oPrice1[] = request.getParameterValues("oPrice");
		//productKey 인트형으로 일일이 다 변환
		if(oPrice1!=null){
			oPrice = new int[oPrice1.length];
			for(int i=0;i<oPrice1.length;i++){
				oPrice[i] = Integer.parseInt(oPrice1[i]);
			}
		}
		
		String optionValue[] = request.getParameterValues("optionValue"); //상품옵션
		
		//비회원주문 테이블에 추가
		OrderMgr oMgr = new OrderMgr();
		flag = oMgr.insertNonMemOrder(oName, oPhone, oEmail, orderPassword, rName, address, rPhone, requestPro, productPrice, productKey, oCount, oPrice, optionValue);
		
		oMgr.productCount(productKey, oCount);
		
		response.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = response.getWriter();
	
		out.print(flag);  //데이터 넘기기
	
	}

}
