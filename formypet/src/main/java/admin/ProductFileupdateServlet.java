package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/ptfupdate")
//product db용 update 서블릿
public class ProductFileupdateServlet extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		ProductManagementMgr pmmgr = new ProductManagementMgr();
		
		//ProductManagementBean 클래스 객체인 pmbean에 session에 저장된 게시물 pmbean 데이터를 대입한다.
		ProductManagementBean bean = (ProductManagementBean) session.getAttribute("bean");
		
		String nowPage = request.getParameter("nowPage");
		//String productKey = request.getParameter("productKey");
		//System.out.println("서블릿productKey = " + productKey);
		ProductManagementBean puBean = new ProductManagementBean(); //ProductManagementBean 클래스 객체 puBean 생성
		
		//ProductManagementBean 클래스 객체 puBean을 생성하고, 게시물 관련 파라미터를 setter 메서드를 이용해 담는다.
		puBean.setProductName(request.getParameter("productName"));
		puBean.setProductComment(request.getParameter("productComment"));
		puBean.setProductInfo(request.getParameter("productInfo"));
		puBean.setProductDetail(request.getParameter("productDetail"));
		puBean.setProductCaution(request.getParameter("productCaution"));
		puBean.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
		puBean.setProductSalePrice(Integer.parseInt(request.getParameter("productSalePrice")));
		puBean.setProductCount(Integer.parseInt(request.getParameter("productCount")));
		puBean.setProductKind(request.getParameter("productKind"));
		puBean.setProductImg(request.getParameter("productImg"));
		puBean.setCategoryKey(Integer.parseInt(request.getParameter("categoryKey")));
		puBean.setProductKey(Integer.parseInt(request.getParameter("productKey")));
		
		//수정할 내용이 담긴 데이터는 puBean 객체에 있고, (jsp 화면에서 이동해온 게시글 데이터)
		//수정 전 내용이 담긴 데이터는 pmbean 객체에 있다. (수정 전 session 에 저장한 게시글 데이터)
		
		//ProductManagementMgr updateproduct() 메서드 호출
		pmmgr.udfile(puBean);
		String url = "../admin/read.jsp?nowPage = " + nowPage + "&productKey=" + puBean.getProductKey();
		response.sendRedirect(url);
	}
}
