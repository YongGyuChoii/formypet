<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/productList.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  </head>
<body>
  <div id="wrap">
    <!-- header 시작-->
    <header>
      <%@include file="/base/header.jsp"%>
    </header>
  <!--header 끝-->

    <div class="productImg1">
        <img class="productImg2" src="../images/walkProduct/walkMain.jpg" alt="">
        <p class="fs-3 fw-bold productImgContent">ALL PRODUCTS</p>
    </div>

    <!-- 메인시작 -->
    <div class="container">
        <!-- 섹션네브 -->
		<div class="section sectionNav mt-4">
			<ul class="nav justify-content-around">
                <li class="nav-item">
                  <a class="nav-link" href="#">전체상품</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">목욕</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">배변/위생</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">미용/케어</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">홈/리빙</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">산책/놀이</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">간식/영양제</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">의류/악세사리</a>
                </li>
            </ul>
		</div>

        <!-- 상품진열 -->
        <div class="section mt-5">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                  <div class="card h-100 productCard">
                    <a href="productDetail.jsp"><img src="../images/solution.jpg" class="card-img-top" alt="..."></a>
                    <div class="card-body">
                      <a href="productDetail.jsp"><h5 class="card-title fw-bold">덴탈 솔류션 세트 XS</h5></a>
                      <p class="card-text cardText fw-bold">체온 조절이 힘든 반려동물을 위한 안전한 쿨젤매트</p>
                      <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원 <span class="sale text-end ms-5">30%</span></p>
                      <a href="#"><span class="material-symbols-outlined">
                        shopping_bag
                      </span></a>
                      <a href="#"><span class="material-symbols-outlined">
                        chat_bubble
                      </span></a>
                      <span class="number">1,722</span>
                      <span class="Best">BEST</span>
                    </div>
                  </div>
                </div>
                <div class="col">
                    <div class="card h-100 productCard">
                      <img src="../images/solution.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title fw-bold">덴탈 솔류션 세트 XS</h5>
                        <p class="card-text cardText fw-bold">체온 조절이 힘든 반려동물을 위한 안전한 쿨젤매트</p>
                        <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원 <span class="sale text-end ms-5">30%</span></p>
                        <a href="#"><span class="material-symbols-outlined">
                          shopping_bag
                        </span></a>
                        <a href="#"><span class="material-symbols-outlined">
                          chat_bubble
                        </span></a>
                        <span class="number">1,722</span>
                        <span class="Best">BEST</span>
                      </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 productCard">
                      <img src="../images/solution.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title fw-bold">덴탈 솔류션 세트 XS</h5>
                        <p class="card-text cardText fw-bold">체온 조절이 힘든 반려동물을 위한 안전한 쿨젤매트</p>
                        <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원 <span class="sale text-end ms-5">30%</span></p>
                        <a href="#"><span class="material-symbols-outlined">
                          shopping_bag
                        </span></a>
                        <a href="#"><span class="material-symbols-outlined">
                          chat_bubble
                        </span></a>
                        <span class="number">1,722</span>
                        <span class="Best">BEST</span>
                      </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 productCard">
                      <img src="../images/solution.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title fw-bold">덴탈 솔류션 세트 XS</h5>
                        <p class="card-text cardText fw-bold">체온 조절이 힘든 반려동물을 위한 안전한 쿨젤매트</p>
                        <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원 <span class="sale text-end ms-5">30%</span></p>
                        <a href="#"><span class="material-symbols-outlined">
                          shopping_bag
                        </span></a>
                        <a href="#"><span class="material-symbols-outlined">
                          chat_bubble
                        </span></a>
                        <span class="number">1,722</span>
                        <span class="Best">BEST</span>
                      </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 productCard">
                      <img src="../images/solution.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title fw-bold">덴탈 솔류션 세트 XS</h5>
                        <p class="card-text cardText fw-bold">체온 조절이 힘든 반려동물을 위한 안전한 쿨젤매트</p>
                        <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원 <span class="sale text-end ms-5">30%</span></p>
                        <a href="#"><span class="material-symbols-outlined">
                          shopping_bag
                        </span></a>
                        <a href="#"><span class="material-symbols-outlined">
                          chat_bubble
                        </span></a>
                        <span class="number">1,722</span>
                        <span class="Best">BEST</span>
                      </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 productCard">
                      <img src="../images/solution.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title fw-bold">덴탈 솔류션 세트 XS</h5>
                        <p class="card-text cardText fw-bold">체온 조절이 힘든 반려동물을 위한 안전한 쿨젤매트</p>
                        <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원 <span class="sale text-end ms-5">30%</span></p>
                        <a href="#"><span class="material-symbols-outlined">
                          shopping_bag
                        </span></a>
                        <a href="#"><span class="material-symbols-outlined">
                          chat_bubble
                        </span></a>
                        <span class="number">1,722</span>
                        <span class="Best">BEST</span>
                      </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
  <!-- 메인끝 -->

    <!-- 오른쪽 맨위 맨아래 화살표 -->
    <%@include file="/base/rightAside.jsp"%>

    <!-- footer 시작-->
    <footer id="footer">
      <%@include file="/base/footer.jsp"%>
    </footer>
    <!-- footer 끝.-->
  </div>
</body>
</html>