<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%

	request.setCharacterEncoding("UTF-8");

	String cartKey[] = request.getParameterValues("cartKey");  

	System.out.println(cartKey);
%>
</head>
<body>

</body>
</html>