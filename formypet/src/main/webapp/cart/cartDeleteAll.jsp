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
	alert("��ٱ��ϰ� ������ϴ�.");
	location.href="./cartEmpty.jsp";
</script>