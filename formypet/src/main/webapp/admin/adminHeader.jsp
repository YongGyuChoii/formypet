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

				</ul>
			</div>

            <div id="navi2">
				<ul class="menu">
				  <li>
				    <a class="nav-link text-white" href="${pageContext.request.contextPath}/admin/csManagement.jsp">회원 관리</a>
				  </li>
				   
				   <li>
				    <a class="nav-link text-white" href="${pageContext.request.contextPath}/admin/expendsManagement.jsp">매출 관리</a>
				  </li>
				   <li>
				    <a class="nav-link text-white" href="${pageContext.request.contextPath}/admin/productManagement.jsp">상품 관리</a>
				        <ul class="depth_1">
					      <li><a href="${pageContext.request.contextPath}/admin/productManagement.jsp">상품 관리</a></li>
					      <li><a href="${pageContext.request.contextPath}/admin/productManagement2.jsp">상품 사진 관리</a></li>
					      <li><a href="${pageContext.request.contextPath}/admin/productManagement3.jsp">상품 옵션 관리</a></li>
					    </ul>
				  </li>
				   <li>
				    <a class="nav-link text-white" href="${pageContext.request.contextPath}/admin/csCenterManagement.jsp">고객센터 관리</a>
				  </li>
				   <li>
				    <a class="nav-link text-white" href="${pageContext.request.contextPath}/admin/buyManagement.jsp">구매 및 환불 관리</a>
				  </li>
				  <li>
				    <a class="nav-link text-white" href="${pageContext.request.contextPath}/admin/reviewManagement.jsp">리뷰 관리</a>
				  </li>
				</ul>
			</div>