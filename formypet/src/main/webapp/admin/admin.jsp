<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/adminStyle.css">
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <a href="${pageContext.request.contextPath}/index.jsp" class="logo">
	<h1>For my Pet</h1>
</a>

<div id="navi1">
<ul class="nav justify-content-end me-4">
     <li class="nav-item">
      <a class="nav-link text-primary" href="../admin/admin.jsp">관리자 페이지</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active text-primary" aria-current="page" href="${pageContext.request.contextPath}/login/login.jsp">로그아웃</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-primary" href="#">마이페이지</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-primary" href="${pageContext.request.contextPath}/cart/cart.jsp">장바구니</a>
    </li>
</ul>
</div>

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
    <a class="nav-link text-white" href="#">고객센터</a>
  </li>
</ul>
</div>
      </header>
    <!--header 끝-->
    <!--main 시작-->
    <div class="container">
    <div id="section">
        <h2>관리자님 환영합니다!</h2>
        <br>
            <p><a href="../admin/csManagement.jsp">회원 관리</a></p>
            <p><a href="../admin/categoryManagement.jsp">게시물 관리</a></p>
            <p><a href="../admin/expendsManagement.jsp">매출 관리</a></p>
            <p><a href="../admin/productManagement.jsp">상품 관리</a></p>
            <p><a href="../admin/csCenterManagement.jsp">고객 센터 관리</a></p>
            <p><a href="../admin/buyManagement.jsp">구매 및 환불 관리</a></p>
        </div>
      </div>
    <!--main 끝-->
    <!-- 오른쪽 맨위 맨아래 화살표 -->
    <%@include file="/base/rightAside.jsp"%>
    <!-- 오른쪽 맨위 맨아래 화살표 끝 -->
    
    <!-- footer 시작-->
    <footer id="footer">
      <%@include file="/base/footer.jsp"%>
    </footer>   
    <!-- footer 끝.-->
    </div>
    </body>
</html>