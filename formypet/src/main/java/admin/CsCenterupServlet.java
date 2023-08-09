package admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import board.BoardBean;
import board.BoardMgr;

@WebServlet("/admin/boardUpdate")
public class CsCenterupServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		BoardMgr bMgr = new BoardMgr();
		
		//BoardBean 클래스 객체인 bean에 session에 저장된 게시물 bean 데이터를 대입한다.
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		
		String nowPage = request.getParameter("nowPage");
		
		BoardBean upBean = new BoardBean(); //BoardBean 클래스 객체 upBean 생성
		
		//BoardBean 클래스 객체 upBean을 생성하고, 게시물 관련 파라미터를 setter 메서드를 이용해 담는다.
		upBean.setNum(Integer.parseInt(request.getParameter("num")));
		upBean.setName(request.getParameter("name"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		//upBean.setMemKey(Integer.parseInt(request.getParameter("memKey")));
		//upBean.setPass(request.getParameter("pass"));
		
		//수정할 내용이 담긴 데이터는 upBean 객체에 있고, (jsp 화면에서 이동해온 게시글 데이터)
		//수정 전 내용이 담긴 데이터는 bean 객체에 있다. (수정 전 session 에 저장한 게시글 데이터)
		//BoardMgr 클래스 updateBoard() 메서드를 호출
		bMgr.updateBoard(upBean);
			
		String url = "csCenterManagement.jsp?nowPage=" + nowPage + "&num=" + upBean.getNum();
			
		response.sendRedirect(url);
}
}
