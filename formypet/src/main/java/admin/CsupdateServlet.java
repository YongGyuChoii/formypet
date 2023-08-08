package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/cupdate")
//product db용 update 서블릿
public class CsupdateServlet extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		CsManagementMgr cmmgr = new CsManagementMgr();
		
		//CsManagementBean 클래스 객체인 bean에 session에 저장된 게시물 bean 데이터를 대입한다.
		CsManagementBean bean = (CsManagementBean) session.getAttribute("bean");
		
		String nowPage = request.getParameter("nowPage");

		CsManagementBean puBean = new CsManagementBean(); //ProductManagementBean 클래스 객체 puBean 생성
		
		//CsManagementBean 클래스 객체 puBean을 생성하고, 게시물 관련 파라미터를 setter 메서드를 이용해 담는다.
		puBean.setMemKey(Integer.parseInt(request.getParameter("memKey")));
		puBean.setMemId(request.getParameter("memId"));
		puBean.setMemPw(request.getParameter("memPw"));
		puBean.setMemPhone1(Integer.parseInt(request.getParameter("memPhone1")));
		puBean.setMemPhone2(Integer.parseInt(request.getParameter("memPhone2")));
		puBean.setMemEmail1(request.getParameter("memEmail1"));
		puBean.setMemEmail2(request.getParameter("memEmail2"));
		puBean.setMemAddress(request.getParameter("memAddress"));
		puBean.setMemAddress2(request.getParameter("memAddress2"));
		puBean.setMemName(request.getParameter("memName"));
		puBean.setMemResident1(Integer.parseInt(request.getParameter("memResident1")));
		puBean.setMemResident2(Integer.parseInt(request.getParameter("memResident2")));
		puBean.setDelYn(request.getParameter("delYn"));
		puBean.setMemPoint(Integer.parseInt(request.getParameter("memPoint")));
		
		//수정할 내용이 담긴 데이터는 puBean 객체에 있고, (jsp 화면에서 이동해온 게시글 데이터)
		//수정 전 내용이 담긴 데이터는 bean 객체에 있다. (수정 전 session 에 저장한 게시글 데이터)
		
		//CsManagementMgr mup() 메서드 호출
		cmmgr.mup(puBean);
		String url = "../admin/read7.jsp?nowPage = " + nowPage + "&memKey=" + puBean.getMemKey();
		response.sendRedirect(url);
	}
}
