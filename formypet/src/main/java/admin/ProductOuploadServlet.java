package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/oupload")
public class ProductOuploadServlet extends HttpServlet {

	//servlet 을 이용하여 이용할 클래스 의 객체를 생성하고, 메서드를 호출 한다.
	//기존의 jsp 페이지 에서 자바 빈즈 로 usebean 이용하여 이용할 클래스 선언하고, 
	//스크립트릿 태그로 했던 작업을 servlet 클래스로 처리 한다.

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		System.out.println("productOuploadServlet 서블릿 접근 완료.");
	
		request.setCharacterEncoding("UTF-8"); 
		
		//productManagementMgr 클래스 객체 생성
		ProductManagementMgr prmMgr = new ProductManagementMgr();
		
		//productManagementMgr 클래스에 정의된 uplpro() 메서드를 호출한다.
		//매개변수를 request(요청) 객체 로 하여, uplpro() 메서드 안에서 파라미터 를 처리 할 수 있다.
		prmMgr.upoc(request);
		response.sendRedirect("../admin/productManagement3.jsp");
		
	}
}
