<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "member.MemberMgr" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="member" class="member.MemberBean" scope="page"></jsp:useBean>
<jsp:setProperty name="member" property="*"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    String user = request.getParameter("memId");
    String userpw = request.getParameter("memPw");
    String userName = request.getParameter("memName");
    String userEmail1 = request.getParameter("memEmail1");
    String userEmail2 = request.getParameter("memEmail2");
    String userAddr = request.getParameter("memAddress");
    int userPhone1 = Integer.parseInt(request.getParameter("memPhone1"));
    int userPhone2 = Integer.parseInt(request.getParameter("memPhone2"));
    int userResident1 = Integer.parseInt(request.getParameter("memResident1"));
    int userResident2 = Integer.parseInt(request.getParameter("memResident2"));

    
    System.out.println(user);
    System.out.println(userpw);
    System.out.println(userName);
    System.out.println(userEmail1);
    System.out.println(userEmail2);
    System.out.println(userAddr);
    System.out.println(userPhone1);
    System.out.println(userPhone2);
    System.out.println(userResident1);
    System.out.println(userResident2);
    

    		MemberMgr memberMgr = new MemberMgr();
            int result = memberMgr.join(member);
            if (result == -1){ // 회원가입 실패시
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 아이디입니다.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
            }else{ // 회원가입 성공시
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'index.jsp'");    // 메인 페이지로 이동
                script.println("</script>");
            }
    	
    %>


</body>
</html>