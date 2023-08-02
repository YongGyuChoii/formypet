<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="product.ProductBean"%>
<%@page import="java.util.*"%>
<jsp:useBean id="pMgr" class="product.ProductListMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String productKind = request.getParameter("productKind");
	String productKind2 = request.getParameter("productKind2");
	ArrayList<ProductBean> pAll = pMgr.getKindList(productKind, productKind2); //kind별 상품
	
	int count = 0; //모달을 위한 변수
%>
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
	<script src="${pageContext.request.contextPath}/js/productList.js"></script>
</head>
<body>
  <div id="wrap">
    <!-- header 시작-->
    <header>
      <%@include file="/base/header.jsp"%>
    </header>
  <!--header 끝-->

    <div class="productImg1">
        <img class="productImg2" src="../images/walkProduct/walkMain.jpg" alt="카테고리사진">
        <p class="fs-3 fw-bold productImgContent">ALL PRODUCTS</p>
    </div>

    <!-- 메인시작 -->
    <div class="container">
        <!-- 섹션네브 -->
		<div class="section sectionNav mt-4">
			<ul class="nav justify-content-around">
                <li class="nav-item">
                  <a class="nav-link" href="productList.jsp">전체상품</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="productListCate.jsp?categoryKey=1">목욕</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="productListCate.jsp?categoryKey=2">배변/위생</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="productListCate.jsp?categoryKey=3">미용/케어</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="productListCate.jsp?categoryKey=4">홈/리빙</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="productListCate.jsp?categoryKey=5">산책/놀이</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="productListCate.jsp?categoryKey=6">간식/영양제</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="productListCate.jsp?categoryKey=7">의류/악세사리</a>
                </li>
            </ul>
		</div>

        <!-- 상품진열 -->
        <div class="section mt-5">
            <div class="row row-cols-1 row-cols-md-3 g-4">
            <%for(ProductBean pb : pAll){ %>
                <div class="col">
                  <div class="card h-100 productCard">
                  	<input type="hidden" name="productKey" value="<%=pb.getProductKey() %>" />
	              	<input type="hidden" name="memKey" value="<%=memKey %>" />
	              	<input type="hidden" name="productName" value="<%=pb.getProductName() %>" />
	              	
                    <a href="productDetail.jsp?productKey=<%=pb.getProductKey() %>&categoryKey=<%=pb.getCategoryKey()%>">
                    <%if(pb.getCategoryKey() == 1){ %>
                    <img src="../images/bathProduct/<%=pb.getProductImg() %>" class="card-img-top" alt="상품메인"></a>
                    <%} else if(pb.getCategoryKey() == 2){%>
                    <img src="../images/hygieneProduct/<%=pb.getProductImg() %>" class="card-img-top" alt="상품메인"></a>
                    <%} else if(pb.getCategoryKey() == 3){%>
                    <img src="../images/beautyProduct/<%=pb.getProductImg() %>" class="card-img-top" alt="상품메인"></a>
                    <%} else if(pb.getCategoryKey() == 4){%>
                    <img src="../images/livingProduct/<%=pb.getProductImg() %>" class="card-img-top" alt="상품메인"></a>
                    <%} else if(pb.getCategoryKey() == 5){%>
                    <img src="../images/walkProduct/<%=pb.getProductImg() %>" class="card-img-top" alt="상품메인"></a>
                    <%} else if(pb.getCategoryKey() == 6){%>
                    <img src="../images/snackProduct/<%=pb.getProductImg() %>" class="card-img-top" alt="상품메인"></a>
                    <%} else if(pb.getCategoryKey() == 7){%>
                    <img src="../images/clothesProduct/<%=pb.getProductImg() %>" class="card-img-top" alt="상품메인"></a>
                    <%} %>
                    <div class="card-body">
                      <a href="productDetail.jsp?productKey=<%=pb.getProductKey() %>&categoryKey=<%=pb.getCategoryKey()%>"><h5 class="card-title fw-bold"><%=pb.getProductName() %></h5></a>
                      <p class="card-text cardText fw-bold"><%=pb.getProductComment() %></p>
                      <p class="fs-5 fw-bold mt-3">
                      <span class="fs-6 text-decoration-line-through fw-light me-1"><fmt:formatNumber value="<%=pb.getProductPrice() %>" pattern="#,###"/>원</span>
                      <fmt:formatNumber value="<%=pb.getProductSalePrice() %>" pattern="#,###"/>원
                      <%//할인율 계산 ((정가-할인가) / 정가) * 100 
					  String salePercent;
					  float salePer = (((float)pb.getProductPrice()-pb.getProductSalePrice()) / pb.getProductPrice()) * 100;
					  salePercent = String.format("%.0f", salePer); //반올림
					  %>
                      <span class="sale text-end ms-5"><%=salePercent%>%</span></p>
                      
                      <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal<%=count%>" class="btnIcon"><span class="material-symbols-outlined">
		                shopping_bag
	             	  </span></a>
	             	  
	             	  <!-- Modal -->
						<div class="modal fade" id="exampleModal<%=count%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel">옵션 선택</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <p class="fw-bold">
						        	<%=pb.getProductName() %>
						        </p>
						        <input type="hidden" name="productSalePrice" value="<%=pb.getProductSalePrice() %>" />
						        <hr />
						        <div class="row">
						        	<div class="col-3">
						        		<%if(pb.getCategoryKey() == 1){ %>
						        		<img src="../images/bathProduct/<%=pb.getProductImg() %>" alt="상품메인사진" />
						        		<%} else if(pb.getCategoryKey() == 2){%>
						        		<img src="../images/hygieneProduct/<%=pb.getProductImg() %>" alt="상품메인사진" />
						        		<%} else if(pb.getCategoryKey() == 3){%>
						        		<img src="../images/beautyProduct/<%=pb.getProductImg() %>" alt="상품메인사진" />
						        		<%} else if(pb.getCategoryKey() == 4){%>
						        		<img src="../images/livingProduct/<%=pb.getProductImg() %>" alt="상품메인사진" />
						        		<%} else if(pb.getCategoryKey() == 5){%>
						        		<img src="../images/walkProduct/<%=pb.getProductImg() %>" alt="상품메인사진" />
						        		<%} else if(pb.getCategoryKey() == 6){%>
						        		<img src="../images/snackProduct/<%=pb.getProductImg() %>" alt="상품메인사진" />
						        		<%} else if(pb.getCategoryKey() == 7){%>
						        		<img src="../images/clothesProduct/<%=pb.getProductImg() %>" alt="상품메인사진" />
						        		<%} %>
						        	</div>
						        	<div class="col-3">옵션 선택</div>
						        	<div class="col-6">
										<select name="optionSelect0" class="form-select form-select-sm d-none" aria-label=".form-select-sm example">
										  <option value="" selected>-[필수] 옵션을 선택해 주세요-</option>
										</select>
										<select name="optionSelect1" class="form-select form-select-sm d-none" aria-label=".form-select-sm example">
										  <option value="" selected>-[필수] 옵션을 선택해 주세요-</option>
										</select>
										<select name="optionSelect2" class="form-select form-select-sm d-none" aria-label=".form-select-sm example">
										  <option value="" selected>-[필수] 옵션을 선택해 주세요-</option>
										</select>
						        	</div>
						        </div>
						        
						        <div class="text-danger ms-3 mt-3 fw-bold fst-italic textDanger">
									<span class="material-icons" style="font-size:12px;">
										report_problem
									</span>
									위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.
								</div>
								<hr />
								
								<input type="hidden" name="productCount" value="<%=pb.getProductCount() %>" />
								<div class="optionChoose">
								</div>
								
								<div class="mt-5">
									<span class="fw-bold fs-6">총 상품금액</span>(수량) :
									<span class="fw-bold text-primary fs-3 totalPrice">0</span>원
									(<span class="fs-6 totalCount">0</span>개)
								</div>
									
						      </div>
						      
						      <div class="modal-footer">
						        <div class="btn-group mt-4 groupBtn" role="group" aria-label="Basic mixed styles example">
								  <%if(memKey != null){ %>
								  <button type="button" class="btn btn-light text-dark fw-bold addCart">ADD TO CART</button>
								  <button type="button" class="btn btn-primary fw-bold buyNow">BUY NOW</button>
								  <%} else {%>
								  <button type="button" class="btn btn-light text-dark fw-bold addNoMemCart">ADD TO CART</button>
								  <button type="button" class="btn btn-primary fw-bold buyNoMemNow">BUY NOW</button>
								  <%} %>
								</div>
						      </div>
						      
						    </div>
						  </div>
						</div>
						<!-- Modal -->
                      
                      <a><span class="material-symbols-outlined">
                        chat_bubble
                      </span></a>
                      <%int reviewCount = pMgr.getReviewCount(pb.getProductKey()); %>
                      <span class="number"><fmt:formatNumber value="<%=reviewCount %>" pattern="#,###"/></span>
                      <%if(pb.getProductOrderCount() >= 500) { %>
                      <span class="Best">BEST</span>
                      <%} %>
                    </div>
                  </div>
                </div>
                <%count++;%>
            <%} %>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>