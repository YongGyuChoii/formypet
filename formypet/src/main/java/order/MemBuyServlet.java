package order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemBuyServlet
 */
@WebServlet("/order/MemBuyServlet")
public class MemBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemBuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		boolean flag = true;
		
		String rName = request.getParameter("delName2"); //받는사람
		String rAddress1 = request.getParameter("delZipcode1");
		String rAddress2 = request.getParameter("delZipcode2");
		String rAddress3 = request.getParameter("delZipcode3");
		String rAddress = rAddress1 + "/" + rAddress2 + "/" + rAddress3; //받는주소
		String rPhone1 = request.getParameter("delPhone2");
		String rPhone2 = request.getParameter("delPhone3");
		String rPhone = "010-"+rPhone1+"-"+rPhone2; //받는폰
		String requestPro = request.getParameter("delMessage"); //배송메시지
		int pointPrice = Integer.parseInt(request.getParameter("inputMilage"));//사용한적립금
		int productPrice = Integer.parseInt(request.getParameter("totalView"));//총가격
		int memKey = Integer.parseInt(request.getParameter("memKey"));//멤버키값
		
		//멤버, 주문 테이블에 추가
		OrderMgr oMgr = new OrderMgr();
		flag = oMgr.insertMemOrder(rName, rAddress, rPhone, requestPro, pointPrice, productPrice, memKey);
		
		response.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = response.getWriter();
	
		out.print(flag);  //데이터 넘기기
	}

}
