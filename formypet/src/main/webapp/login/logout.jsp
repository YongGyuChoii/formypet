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
		//로그아웃 시 에는 invalidate() 메서드를 이용해서 session을 삭제 합니다.
		session.invalidate(); %>
	<script>
	    alert("로그아웃 되었습니다.");
		location.href="../index.jsp";
	</script>
</body>
</html>