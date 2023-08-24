<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="cMgr" class="cart.CartMgr" />
<%@page import="cart.CartBean"%>
<!DOCTYPE html>
<html>
<head>	
	<%
		request.setCharacterEncoding("UTF-8");
	
		CartBean bean = new CartBean();
	%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>		
	<%cMgr.cartDeleteAll(bean);%>	
</body>
</html>
<script>
	alert("장바구니가 비었습니다.");
	location.href="./cartEmpty.jsp";
</script>