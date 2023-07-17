<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<a href="${pageContext.request.contextPath}/index.jsp" class="logo">
	<h1>For my Pet</h1>
</a>
<% 
	String id = (String)session.getAttribute("idKey");  
 	if(id!=null && id!=""){
%>
<div id="navi1">
<ul class="nav justify-content-end me-4">
    <li class="nav-item">
      <a class="nav-link active text-primary" aria-current="page" href="${pageContext.request.contextPath}/login/logout.jsp">로그아웃</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-primary" href="${pageContext.request.contextPath}/mypage/mypage.jsp">마이페이지</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-primary" href="${pageContext.request.contextPath}/cart/cart.jsp">장바구니</a>
    </li>
</ul>
</div>
<%} else { %>
<div id="navi1">
<ul class="nav justify-content-end me-4">
    <li class="nav-item">
      <a class="nav-link active text-primary" aria-current="page" href="${pageContext.request.contextPath}/login/login.jsp">로그인</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-primary" href="${pageContext.request.contextPath}/login/signup.jsp">회원가입</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-primary" href="${pageContext.request.contextPath}/cart/cart.jsp">장바구니</a>
    </li>
</ul>
</div>
<% } %>

<div id="navi2">
<ul class="menu">
  <li>
    <a class="nav-link text-white" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">메인페이지</a>
  </li>
  <li>
    <a class="nav-link text-white" href="${pageContext.request.contextPath}/product/productList.jsp">상품목록</a>
    <ul class="depth_1">
      <li><a href="#">ALL</a></li>
      <li><a href="#">BEST</a></li>
      <li class="child-li">ㅡㅡㅡㅡㅡㅡㅡ</li>
      <li><a href="#">목욕</a></li>
      <li><a href="#">배변/위생</a></li>
      <li><a href="#">미용/케어</a></li>
      <li><a href="#">홈/리빙</a></li>
      <li><a href="#">산책/놀이</a></li>
      <li><a href="#">간식/영양제</a></li>
      <li><a href="#">의류/악세사리</a></li>
      <li class="child-li">ㅡㅡㅡㅡㅡㅡㅡ</li>
      <li><a href="#">FOR DOGS</a></li>
      <li><a href="#">FOR CATS</a></li>
    </ul>
  </li>
  <li>
    <a class="nav-link text-white" href="${pageContext.request.contextPath}/board/list.jsp">고객센터</a>
  </li>
</ul>
</div>