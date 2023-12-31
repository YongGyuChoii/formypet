package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Vector;
import board.BoardBean;

@WebServlet("/board/boardProc")
public class BoardProcServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		BoardMgr bMgr = new BoardMgr();
		int num = Integer.parseInt(request.getParameter("num"));
		
		//BoardBean 클래스 객체인 bean에 session에 저장된 게시물 bean 데이터를 대입한다.
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		
		String nowPage = request.getParameter("nowPage");
	
		BoardBean upBean = new BoardBean(); //BoardBean 클래스 객체 upBean 생성

		//BoardBean 클래스 객체 upBean을 생성하고, 게시물 관련 파라미터를 setter 메서드를 이용해 담는다.
						
		BoardBean vlist = null;
		vlist = bMgr.getBoard2(num);
		upBean.setPass(request.getParameter("pass"));

		//수정할 내용이 담긴 데이터는 upBean 객체에 있고, (jsp 화면에서 이동해온 게시글 데이터)
		//수정 전 내용이 담긴 데이터는 bean 객체에 있다. (수정 전 session 에 저장한 게시글 데이터)
		
		//upBean 객체 의 패스워드 와 받아온 vlist 패스워드 를 각 각 변수에 저장.
		String upPass = upBean.getPass();
		String inPass = vlist.getPass();

		//패스워드 가 일치 하는지 세션에 저장된 패스워드 와 파라미터로 저장한 패스워드를 비교한다. 
		if (upPass.equals(inPass)) { //패스워드가 일치 한다면
			
			String url = "read.jsp?nowPage=" + nowPage + "&num=" + num;
			
			response.sendRedirect(url);
		} else {
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 아닙니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}
