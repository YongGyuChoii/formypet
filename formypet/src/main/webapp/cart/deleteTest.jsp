<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%
	String test[] = request.getParameterValues("cartKey");
	System.out.println(test);
%>
</head>
<body>

</body>
</html>