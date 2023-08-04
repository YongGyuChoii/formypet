package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/boardReply")
public class BoardReplyServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		//BoardMgr 클래스, BoardBean 클래스 객체 생성
		BoardMgr bMgr = new BoardMgr();
		
		BoardBean reBean = new BoardBean();
		
		//이동한 파라미터 받아서, BoardBean 객체 이용하여 setter로 입력
		reBean.setName(request.getParameter("name"));
		reBean.setSubject(request.getParameter("subject"));
		reBean.setContent(request.getParameter("content"));
		reBean.setRef(Integer.parseInt(request.getParameter("ref"))); 
		reBean.setPos(Integer.parseInt(request.getParameter("pos"))); 
		reBean.setDepth(Integer.parseInt(request.getParameter("depth"))); 
		reBean.setMemKey(Integer.parseInt(request.getParameter("memKey"))); 
		reBean.setPass(request.getParameter("pass"));
		
		
		//ref : 답변 글 일 경우 소속된 부모 글을 가리키는 번호를 저장하는 컬럼
		//pos : 게시물의 상대적인 위치 값을 저장하여 화면에 순서대로 뿌려주는 역할을 담당하는 컬럼
		//depth : 답변 글 일 경우 답변의 깊이를 저장하는 컬럼
		
		//BoardMgr클래스 replyUpBoard 메서드 호출
		bMgr.replyUpBoard(reBean.getRef(), reBean.getPos());
		
		//BoardMgr클래스 replyBoard 메서드 호출
		bMgr.replyBoard(reBean);
		
		String nowPage = request.getParameter("nowPage");
		
		response.sendRedirect("list.jsp?nowPage="+nowPage);
		
	}
}