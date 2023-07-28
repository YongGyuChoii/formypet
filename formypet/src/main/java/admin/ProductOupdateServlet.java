package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/oupdate")
//product db용 update 서블릿
public class ProductOupdateServlet extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		ProductManagementMgr pmmgr = new ProductManagementMgr();
		
		//ProductManagementBean 클래스 객체인 pmbean에 session에 저장된 게시물 pmbean 데이터를 대입한다.
		ProductManagementBean bean3 = (ProductManagementBean) session.getAttribute("bean3");
		
		String nowPage = request.getParameter("nowPage");

		ProductManagementBean puBean = new ProductManagementBean(); //ProductManagementBean 클래스 객체 puBean 생성
		
		//ProductManagementBean 클래스 객체 puBean을 생성하고, 게시물 관련 파라미터를 setter 메서드를 이용해 담는다.
		puBean.setOc1(request.getParameter("oc1"));
		puBean.setOc2(request.getParameter("oc2"));
		puBean.setOc3(request.getParameter("oc3"));
		puBean.setOc4(request.getParameter("oc4"));
		puBean.setOc5(request.getParameter("oc5"));
		puBean.setOcKey(Integer.parseInt(request.getParameter("ocKey")));
		puBean.setProductKey(Integer.parseInt(request.getParameter("productKey")));
		
		//수정할 내용이 담긴 데이터는 puBean 객체에 있고, (jsp 화면에서 이동해온 게시글 데이터)
		//수정 전 내용이 담긴 데이터는 pmbean 객체에 있다. (수정 전 session 에 저장한 게시글 데이터)
		
		//ProductManagementMgr updateoc() 메서드 호출
		pmmgr.updateoc(puBean);
		String url = "../admin/read3.jsp?nowPage = " + nowPage + "&ocKey=" + puBean.getOcKey();
		response.sendRedirect(url);
	}
}
