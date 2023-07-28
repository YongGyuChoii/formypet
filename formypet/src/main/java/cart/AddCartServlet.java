package cart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet("/cart/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
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
		
		//프로덕트키, 멤키를 ajax에서 받아온다.
		int productKey = Integer.parseInt(request.getParameter("productKey"));
		int memKey = Integer.parseInt(request.getParameter("memKey"));
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
		
		CartMgr cMgr = new CartMgr();
		
		boolean flag = cMgr.insertCart(memKey, productKey, cartCount, optionText);
		
		response.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = response.getWriter();
	
		out.print(flag);  //데이터 넘기기
	}

}
