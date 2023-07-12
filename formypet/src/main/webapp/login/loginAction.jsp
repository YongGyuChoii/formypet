<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "member.MemberMgr" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="member" class="member.MemberBean"></jsp:useBean>
<jsp:setProperty name="member" property="id"/>
<jsp:setProperty name="member" property="pw"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	    <%
	    
	    String memId = request.getParameter("memId");
	    String memPwd = request.getParameter("memPwd");
	    	    
        MemberMgr memberMgr = new MemberMgr();
	    
        int result = memberMgr.login(memId, memPwd);
        if (result ==1){
    		session.setAttribute("idKey", memId);
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = '../index.jsp'");
            script.println("alert('로그인에 성공 하였습니다.')");
            script.println("</script>");
        }
        else if (result == 0){
        	
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else if (result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()"); 
            script.println("</script>");
        }
        else if (result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('DB 오류가 발생했습니다.')");
            script.println("history.back()"); 
            script.println("</script>");
        }
    %>


</body>
</html>