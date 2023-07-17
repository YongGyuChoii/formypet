<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
			String id = "admin";
			String pwd = "1q2w3e";
			
	//cookie 예제와 마찬가지로 RegisterMgr 클래스의 loginRegister() 메서드를 호출 합니다.
	if(id.equals(request.getParameter("memId"))&&pwd.equals(request.getParameter("memPw"))) {
		//loginRegister() 메서드 호출 결과 true이면
		//session 을 생성해서 id값을 담습니다.
		session.setAttribute("idKey",id);
%> 
	<script> 
	  alert("환영합니다 관리자님");
      location.href="../admin/admin.jsp";
	</script>
<%	}else{ //loginRegister()메서드 호출 결과가 false이면 아래 내용을 실행 합니다.%>
	<script>
	  alert("로그인 되지 않았습니다.");
      location.href="sessionLogin.jsp";
	</script>
<%}%>
</body>
</html>