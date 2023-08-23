<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberBean"%>    
<jsp:useBean id="mMgr" class="member.MemberMgr"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		  request.setCharacterEncoding("UTF-8");
	
		  String memId = request.getParameter("memId");
		  String memPw = request.getParameter("memPw");
		  	
		  
		  String url = "login.jsp";
		  String msg = "로그인에 실패 하였습니다.";
		  				  
		  MemberBean mb = mMgr.loginMember(memId, memPw);

		  if(memPw.equals(mb.getMemPw()) && mb.getMemGrade() == 1){
		    session.setAttribute("idKey",mb.getMemKey());
		    session.setAttribute("idkey2",mb.getMemId());
			  //session에 memKey, memId 저장.
		    msg = "로그인에 성공 하였습니다.";
		    url = "../index.jsp";
		  }
		  if(memPw.equals(mb.getMemPw()) && mb.getMemGrade() == 2){
			session.setAttribute("idKey",mb.getMemKey());
			session.setAttribute("idkey2",mb.getMemId());
			  //session에 memKey, memId 저장.
			msg = "환영합니다. 관리자님!";
			url = "../admin/admin.jsp";
		  }
	%>
</body>
</html>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>