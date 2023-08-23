<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.servlet.*"%>    
<%@page import="cart.CartBean"%>
<%@page import="product.ProductBean"%>
<%@page import="product.ProductFileBean"%>
<%@page import="java.util.*"%>
<jsp:useBean id="cMgr" class="cart.CartMgr" />
<%@page import="product.ProductBean"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<CartBean> pAll = cMgr.getCartAll();
	//쿠키 사용을 위한 비회원 장바구니
		String[] value = null;
		int[] productKey = null;
		int[] cartCount = null;
		String[] optionText = null;
	
	Cookie[] cookies = request.getCookies(); //쿠키 전체 불러옴
	if(cookies != null) { // 쿠키가 비어있지 않으면
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("noMemCart")){ //쿠키에서 찾아옴
				//찾은 value ,단위로 끊어줌
				value = URLDecoder.decode(cookies[i].getValue(),"UTF-8").split(",");
				productKey = new int[value.length];
				cartCount = new int[value.length];
				optionText = new String[value.length];
			    for(int k=0; k<value.length; k++){ //-단위로 상품키, 수량, 옵션 배열 저장
					cartCount[k] = Integer.parseInt(value[k].split("-")[0]);
					productKey[k] = Integer.parseInt(value[k].split("-")[1]);
					optionText[k] = value[k].split("-")[2];
					cookies[k].setPath("/");
					response.addCookie(cookies[k]);
				}  
			}
		}

	} else {
	}
	
	ArrayList<ProductBean> pb = new ArrayList<>();
	if(productKey != null) {
		pb = cMgr.insertNoMemCart(productKey);	
	}
	%>
<script>
	location.href="./cart.jsp";
</script>
</body>
</html>