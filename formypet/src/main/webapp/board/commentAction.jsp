<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comment" class="comment.Comment" scope="page" />
<jsp:setProperty name="comment" property="commentText" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%
	 	String userID = null;
	 	if(session.getAttribute("idKey") != null){
	 		userID = (String) session.getAttribute("idKey");
	 	}
	
	 	if(userID == null){
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
	 		script.println("location.href = '../login/login.jsp'");
	 		script.println("</script>");
	 	} 
	 	else{
		 	int bbsID = 0; 
		 	if (request.getParameter("bbsID") != null){
		 		bbsID = Integer.parseInt(request.getParameter("bbsID"));
		 	}
		 	
		 	if (bbsID == 0){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('유효하지 않은 글입니다.')");
		 		script.println("location.href = '../login/login.jsp'");
		 		script.println("</script>");
		 	}
	 		if (comment.getCommentText() == null){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('입력이 안된 사항이 있습니다.')");
		 		script.println("history.back()");
		 		script.println("</script>");
		 	} else {
		 		CommentDAO commentDAO = new CommentDAO();
		 		int commentID = commentDAO.write(bbsID, userID, comment.getCommentText());
		 		if (commentID == -1){
			 		PrintWriter script = response.getWriter();
			 		script.println("<script>");
			 		script.println("alert('댓글 쓰기에 실패했습니다.')");
			 		script.println("history.back()");
			 		script.println("</script>");
              
		 		}else{ // 글쓰기 성공시
                	PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href = 'list.jsp'");    // 메인 페이지로 이동
                    script.println("</script>");   
			 	}
		 		
		 	}
		 }
	 %>
</body>
</html>