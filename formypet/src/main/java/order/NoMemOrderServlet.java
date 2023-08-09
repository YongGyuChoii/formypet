package order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberBean;
import member.MemberMgr;
import product.ProductBean;
import product.ProductMgr;

/**
 * Servlet implementation class NoMemOrderServlet
 */
@WebServlet("/order/NoMemOrderServlet")
public class NoMemOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoMemOrderServlet() {
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
		
		//프로덕트키, 상품수량, 옵션값을 ajax에서 받아온다.
		int productKey[] = null;
		String productKey1[] = request.getParameterValues("productKey");
		int cartCount[] = null;
		String cartCount1[] = request.getParameterValues("cartCount");
		String optionText[] = request.getParameterValues("optionText");
		//cartCount 인트형으로 일일이 다변환
		if(cartCount1!=null){
			cartCount = new int[cartCount1.length];
			for(int i=0;i<cartCount1.length;i++){
				cartCount[i] = Integer.parseInt(cartCount1[i]);
			}
		}
		//productKey 인트형으로 일일이 다 변환
		if(productKey1!=null){
			productKey = new int[productKey1.length];
			for(int i=0;i<productKey1.length;i++){
				productKey[i] = Integer.parseInt(productKey1[i]);
			}
		}
		
		HttpSession session = request.getSession();
		
		//상품 정보 pb에 담기
		ProductMgr pMgr = new ProductMgr();
		ArrayList<ProductBean> pb = new ArrayList<>();
		pb = pMgr.buyForProduct(productKey);
		session.setAttribute("pb", pb);
		
		//상품수량, 옵션값 담기
		session.setAttribute("cartCount", cartCount);
		session.setAttribute("optionText", optionText);
		
		response.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = response.getWriter();
	
		out.print(flag);  //데이터 넘기기
	}

}
