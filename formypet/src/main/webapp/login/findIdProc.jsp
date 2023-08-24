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
	
		  String memName = request.getParameter("memName");
		  int memResident1 = Integer.parseInt(request.getParameter("memResident1"));
		  int memResident2 = Integer.parseInt(request.getParameter("memResident2"));
		  
		  String url = "./findId.jsp";
		  String msg = "가입하신 아이디가 존재하지 않습니다.";
		  				  
		  MemberBean db = mMgr.findId(memName, memResident1, memResident2);
		  
		  if(memResident1==db.getMemResident1()) {
			  
			msg = memName + " " +"회원님의 아이디는" + " " + db.getMemId() + "입니다.";
			url = "./login.jsp";		
		   
		  }
	%>
</body>
</html>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>