package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/rupdate")

public class BuyFileupdateServletY extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("BuyFileupdateServletY 진입.");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		BuyManagementMgr rmmgr = new BuyManagementMgr();
		
		
		BuyManagementBean bean = (BuyManagementBean)session.getAttribute("bean");
		
		String nowPage = request.getParameter("nowPage");
		BuyManagementBean puBean = new BuyManagementBean(); 
		
		//System.out.println("productKey = " + request.getParameter("productKey"));
		//puBean.setProductKey(Integer.parseInt(request.getParameter("productKey")));
		System.out.println("brKey = " + request.getParameter("brKey"));
		puBean.setBrKey(Integer.parseInt(request.getParameter("brKey")));
		//System.out.println("memKey = " + request.getParameter("memKey"));
		//puBean.setMemKey(Integer.parseInt(request.getParameter("memKey")));
		//System.out.println("memOrderKey = " + request.getParameter("memOrderKey"));
		//puBean.setMemOrderKey(request.getParameter("memOrderKey"));
		//System.out.println("nonMemOrderKey = " + request.getParameter("nonMemOrderKey"));
		//puBean.setNonMemOrderKey(request.getParameter("nonMemOrderKey"));
		//System.out.println("ordersKey = " + request.getParameter("ordersKey"));
		//puBean.setOrdersKey(Integer.parseInt(request.getParameter("ordersKey")));
		
		puBean.setrYn(request.getParameter("rYn"));
		
		//BuyManagementMgr ryn 메소드 호출
		rmmgr.ryn(puBean);
		System.out.println("ok");
		String url = "../admin/buyManagement.jsp";
	response.sendRedirect(url);
		
	}
		
}
