<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 		<a href="${pageContext.request.contextPath}/index.jsp" class="logo">
			<h1>For my Pet</h1>
		</a>
            <div id="navi1">
				<ul class="nav justify-content-end me-4">
				     <li class="nav-item">
				      <a class="nav-link text-primary" href="../admin/admin.jsp">관리자 페이지</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link active text-primary" aria-current="page" href="${pageContext.request.contextPath}/login/logout.jsp">로그아웃</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link text-primary" href="../mypage/mypage.jsp">마이페이지</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link text-primary" href="${pageContext.request.contextPath}/cart/cart.jsp">장바구니</a>
				    </li>
				</ul>
			</div>

            <div id="navi2">
				<ul class="menu">
				  <li>
				    <a class="nav-link text-white" href="../admin/csManagement.jsp">회원 관리</a>
				  </li>
				   <li>
				    <a class="nav-link text-white" href="../admin/categoryManagement.jsp">게시물 관리</a>
				  </li>
				   <li>
				    <a class="nav-link text-white" href="../admin/expendsManagement.jsp">매출 관리</a>
				  </li>
				   <li>
				    <a class="nav-link text-white" href="../admin/productManagement.jsp">상품 관리</a>
				  </li>
				   <li>
				    <a class="nav-link text-white" href="../admin/csCenterManagement.jsp">고객센터 관리</a>
				  </li>
				   <li>
				    <a class="nav-link text-white" href="../admin/buyManagement.jsp">구매 및 환불 관리</a>
				  </li>
				  
				</ul>
			</div>