<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	//id 파라미터 받아서 변수에 저장
	String memId = request.getParameter("memId");
	
	//MemberMgr 클래스의 checkId() 메서드 호출 하여 결과값을 boolean 타입 변수 result에 대입.
	boolean result = mMgr.checkId(memId);  
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ID 중복체크</title>
	<link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
			<br/><b><%= memId%></b>
			<%
				if (result) { //result 변수에 저장된 결과값이 true 이면
					out.println("는 이미 존재하는 ID입니다.<p/>"); 
			%>	
					<a href="#" onClick="self.close()">닫기</a>					
			<% 
				} else { //result 변수에 저장된 결과값이 false 이면
					out.println("는 사용 가능 합니다.<p/>");
			%>
					<a href="#" onClick="self.close()">닫기</a>	
			<% } %>	
			
			
	</div>
</body>
</html>
