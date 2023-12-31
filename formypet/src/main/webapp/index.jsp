<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="product.ProductBean"%>
<%@page import="java.util.*"%>
<jsp:useBean id="pMgr" class="product.ProductMgr" />
<%
	request.setCharacterEncoding("UTF-8");

	ArrayList<ProductBean> blist = pMgr.getBathList(); //목욕
	ArrayList<ProductBean> slist = pMgr.getSnackList(); //음식
	ArrayList<ProductBean> llist = pMgr.getLivingList(); //리빙
	ArrayList<ProductBean> clist = pMgr.getClothesList(); //드레스
	ArrayList<ProductBean> wlist = pMgr.getWalkList(); //플레이룸
	
	int count = 0; //모달을 위한 변수
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet"  href="css/base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
	 <%@include file = "/base/icon.jsp" %>
</head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
      <%@include file="/base/header.jsp"%>
    </header>
    <!--header 끝-->
    
    <!-- 메인시작 -->
  <div class="container">
		<div class="section" id="RF">
			<img class="mainImg" src="images/main/main.jpg" alt="메인강아지">
		</div>
    <!-- 메인 5층 -->
		<div class="section" id="5F">
			<img class="mainImg" src="images/main/bathroom.jpg" alt="목욕">
            <div class="mainImgTitle rounded-pill">5F Bathroom</div>
            <div class="mainContent">
              <div class="mainContent1 mainContent2">
                <p class="fs-3 fw-bold">Bathroom</p>
                <p class="mainText">PETHROOM aims to create a happy bathroom lifestyle.
                  We respect and value healthy companionship between pets and
                  people and we continuously strive to sustain
                  this value through sincere communication.</p>
                <p class="mainText">즐거운 욕실 라이프스타일을 지향합니다.
                  또한 이 가치가 지속 가능하도록 건강한 반려생활을
                  중시하고 배려하며,  
                  반려 동물 및 반려인들과 진정성 있는 소통을 합니다.</p>
              </div>
              
              <%for(ProductBean b : blist){ %>
              	<div class="mainContent1">
	              	<input type="hidden" name="productKey" value="<%=b.getProductKey() %>" />
	              	<input type="hidden" name="memKey" value="<%=memKey %>" />
	              	<input type="hidden" name="productName" value="<%=b.getProductName() %>" />
	                <a href="product/productDetail.jsp?productKey=<%=b.getProductKey()%>&categoryKey=<%=b.getCategoryKey()%>"><img src="images/bathProduct/<%=b.getProductImg() %>" alt="상품메인사진"></a>
	                <a href="product/productDetail.jsp?productKey=<%=b.getProductKey()%>&categoryKey=<%=b.getCategoryKey()%>"><p class="fs-5 fw-bold mt-3"><%=b.getProductName() %></p></a>
	                <p class="fs-5 fw-bold mt-3">
	                
	                	<span class="fs-6 text-decoration-line-through fw-light me-1 text-secondary">
		                <fmt:formatNumber value="<%=b.getProductPrice() %>" pattern="#,###"/>원</span>
		                <fmt:formatNumber value="<%=b.getProductSalePrice() %>" pattern="#,###"/>원
		                
						<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal<%=count%>" class="btnIcon"><span class="material-symbols-outlined">
		                shopping_bag
		             	</span></a>
	             		
					</p>
					
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
					        	<%=b.getProductName() %>
					        </p>
					        <input type="hidden" name="productSalePrice" value="<%=b.getProductSalePrice() %>" />
					        <hr />
					        <div class="row">
					        	<div class="col-3">
					        		<img src="images/bathProduct/<%=b.getProductImg() %>" alt="상품메인사진" />
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
							
							<input type="hidden" name="productCount" value="<%=b.getProductCount() %>" />
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
						
	                <span class="Best">BEST</span>
              	</div>
              	<%count++;%>
              <%} %>
            </div>
		</div>
    <!-- 메인 5층 끝 -->
		
    <!-- 메인 4층 -->
    <div class="section" id="4F">
			<img class="mainImg" src="images/main/food.jpg" alt="음식">
            <div class="mainImgTitle rounded-pill">4F Food Restaurant</div>
            <div class="mainContent">
              <div class="mainContent1 mainContent2">
                <p class="fs-3 fw-bold">Food Restaurant</p>
                <p class="mainText">Tasty, high in nutrition custom-made
                  pet food to assist keeping your pets healthy
                </p>
                <p class="mainText">아이들의 건강 관리에 도움이 되는 맛있는
                  고영양 기능 맞춤형 펫푸드</p>
              </div>
              
              <%for(ProductBean s : slist){ %>
              	<div class="mainContent1">
              		<input type="hidden" name="productKey" value="<%=s.getProductKey() %>" />
              		<input type="hidden" name="memKey" value="<%=memKey %>" />
              		<input type="hidden" name="productName" value="<%=s.getProductName() %>" />
                	<a href="product/productDetail.jsp?productKey=<%=s.getProductKey()%>&categoryKey=<%=s.getCategoryKey()%>"><img src="images/snackProduct/<%=s.getProductImg() %>" alt="상품메인사진"></a>
                	<a href="product/productDetail.jsp?productKey=<%=s.getProductKey()%>&categoryKey=<%=s.getCategoryKey()%>"><p class="fs-5 fw-bold mt-3"><%=s.getProductName() %></p></a>
                	<p class="fs-5 fw-bold mt-3">
                
	                	<span class="fs-6 text-decoration-line-through fw-light me-1 text-secondary">
	                	<fmt:formatNumber value="<%=s.getProductPrice() %>" pattern="#,###"/>원</span>
	                	<fmt:formatNumber value="<%=s.getProductSalePrice() %>" pattern="#,###"/>원
                	
	                	<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal<%=count%>" class="btnIcon"><span class="material-symbols-outlined">
		                	shopping_bag
	             		</span></a>
                
                	</p>
                
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
				        	<%=s.getProductName() %>
				        </p>
				        <input type="hidden" name="productSalePrice" value="<%=s.getProductSalePrice() %>" />
				        <hr />
				        <div class="row">
				        	<div class="col-3">
				        		<img src="images/snackProduct/<%=s.getProductImg() %>" alt="상품메인사진" />
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
						
						<input type="hidden" name="productCount" value="<%=s.getProductCount() %>" />
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
                
                <span class="Best">BEST</span>
              	</div>
              	<%count++;%>
              <%} %>
            </div>
		</div>
    <!-- 메인 4층 끝 -->

    <!-- 메인 3층 -->
    <div class="section" id="3F">
			<img class="mainImg" src="images/main/living.jpg" alt="청소도구">
            <div class="mainImgTitle rounded-pill">3F Living Room</div>
            <div class="mainContent">
              <div class="mainContent1 mainContent2">
                <p class="fs-3 fw-bold">Living Room</p>
                <p class="mainText">The brand color of PETHROOM is set for our children who have 'red-green color blindness', and adds vibrant colors to make the living space of your companion colorful.
                </p>
                <p class="mainText">페스룸의 브랜드 컬러는 '적록 색맹'을 갖고 있는
                  우리 아이들을 위해 정해졌으며
                  톡톡 튀는 컬러를 더해 반려인의 생활공간을
                  다채롭게 만들어냅니다.</p>
              </div>
              
              <%for(ProductBean l : llist){ %>
              	<div class="mainContent1">
              	<input type="hidden" name="productKey" value="<%=l.getProductKey() %>" />
           		<input type="hidden" name="memKey" value="<%=memKey %>" />
          		<input type="hidden" name="productName" value="<%=l.getProductName() %>" />
                <a href="product/productDetail.jsp?productKey=<%=l.getProductKey()%>&categoryKey=<%=l.getCategoryKey()%>"><img src="images/livingProduct/<%=l.getProductImg() %>" alt="상품메인사진"></a>
                <a href="product/productDetail.jsp?productKey=<%=l.getProductKey()%>&categoryKey=<%=l.getCategoryKey()%>"><p class="fs-5 fw-bold mt-3"><%=l.getProductName() %></p></a>
                <p class="fs-5 fw-bold mt-3">
                
                	<span class="fs-6 text-decoration-line-through fw-light me-1 text-secondary">
	                <fmt:formatNumber value="<%=l.getProductPrice() %>" pattern="#,###"/>원</span>
	                <fmt:formatNumber value="<%=l.getProductSalePrice() %>" pattern="#,###"/>원
	                
	                <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal<%=count%>" class="btnIcon"><span class="material-symbols-outlined">
	                shopping_bag
	             	</span></a>
                
                </p>
                
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
					        	<%=l.getProductName() %>
					        </p>
					        <input type="hidden" name="productSalePrice" value="<%=l.getProductSalePrice() %>" />
					        <hr />
					        <div class="row">
					        	<div class="col-3">
					        		<img src="images/livingProduct/<%=l.getProductImg() %>" alt="상품메인사진" />
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
							
							<input type="hidden" name="productCount" value="<%=l.getProductCount() %>" />
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
                
                <span class="Best">BEST</span>
              	</div>
              	<%count++;%>
              <%} %>
            </div>
		</div>
    <!-- 메인 3층 끝 -->

    <!-- 메인 2층 -->
    <div class="section" id="2F">
			<img class="mainImg" src="images/main/dress.jpg" alt="드레스룸">
            <div class="mainImgTitle rounded-pill">2F Dress Room</div>
            <div class="mainContent">
              <div class="mainContent1 mainContent2">
                <p class="fs-3 fw-bold">Dress Room</p>
                <p class="mainText">Customized pet fashion brand that satisfies various tastes of pets and people with the five character lineups of the PETHROOM.
                </p>
                <p class="mainText">페스룸만의 5가지 캐릭터 라인업으로 반려인과 반려 동물의 다양한 취향을 만족시키는 맞춤형 펫패션 브랜드</p>
              </div>
              
              <%for(ProductBean c : clist){ %>
              	<div class="mainContent1">
              	<input type="hidden" name="productKey" value="<%=c.getProductKey() %>" />
           		<input type="hidden" name="memKey" value="<%=memKey %>" />
           		<input type="hidden" name="productName" value="<%=c.getProductName() %>" />
                <a href="product/productDetail.jsp?productKey=<%=c.getProductKey()%>&categoryKey=<%=c.getCategoryKey()%>"><img src="images/clothesProduct/<%=c.getProductImg() %>" alt="상품메인사진"></a>
                <a href="product/productDetail.jsp?productKey=<%=c.getProductKey()%>&categoryKey=<%=c.getCategoryKey()%>"><p class="fs-5 fw-bold mt-3"><%=c.getProductName() %></p></a>
                <p class="fs-5 fw-bold mt-3">
                
	                <span class="fs-6 text-decoration-line-through fw-light me-1 text-secondary">
	                <fmt:formatNumber value="<%=c.getProductPrice() %>" pattern="#,###"/>원</span>
	                <fmt:formatNumber value="<%=c.getProductSalePrice() %>" pattern="#,###"/>원
	                
	                <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal<%=count%>" class="btnIcon"><span class="material-symbols-outlined">
		                shopping_bag
	             	</span></a>
                
                </p>
                
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
					        	<%=c.getProductName() %>
					        </p>
					        <input type="hidden" name="productSalePrice" value="<%=c.getProductSalePrice() %>" />
					        <hr />
					        <div class="row">
					        	<div class="col-3">
					        		<img src="images/clothesProduct/<%=c.getProductImg() %>" alt="상품메인사진" />
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
							
							<input type="hidden" name="productCount" value="<%=c.getProductCount() %>" />
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
                
                <span class="Best">BEST</span>
              	</div>
              	<%count++;%>
              <%} %>
            </div>
		</div>
    <!-- 메인 2층 끝 -->

    <!-- 메인 1층 -->
    <div class="section" id="1F">
			<img class="mainImg" src="images/main/play.jpg" alt="플레이룸">
            <div class="mainImgTitle rounded-pill">1F Play Room</div>
            <div class="mainContent">
              <div class="mainContent1 mainContent2">
                <p class="fs-3 fw-bold">Play Room</p>
                <p class="mainText">Through various collaborations,
                  PETHROOM provides great products
                  and services to our customers.
                </p>
                <p class="mainText">페스룸은 다양한 협업을 통해 고객님들께
                  멋진 제품과 서비스를 선보입니다</p>
              </div>
              
              <%for(ProductBean w : wlist){ %>
              	<div class="mainContent1">
              	<input type="hidden" name="productKey" value="<%=w.getProductKey() %>" />
           		<input type="hidden" name="memKey" value="<%=memKey %>" />
           		<input type="hidden" name="productName" value="<%=w.getProductName() %>" />
                <a href="product/productDetail.jsp?productKey=<%=w.getProductKey()%>&categoryKey=<%=w.getCategoryKey()%>"><img src="images/walkProduct/<%=w.getProductImg() %>" alt="상품메인사진"></a>
                <a href="product/productDetail.jsp?productKey=<%=w.getProductKey()%>&categoryKey=<%=w.getCategoryKey()%>"><p class="fs-5 fw-bold mt-3"><%=w.getProductName() %></p></a>
                <p class="fs-5 fw-bold mt-3">
                
                	<span class="fs-6 text-decoration-line-through fw-light me-1 text-secondary">
	                <fmt:formatNumber value="<%=w.getProductPrice() %>" pattern="#,###"/>원</span>
	                <fmt:formatNumber value="<%=w.getProductSalePrice() %>" pattern="#,###"/>원
	                
	                <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal<%=count%>" class="btnIcon"><span class="material-symbols-outlined">
		                shopping_bag
	             	</span></a>
                
                </p>
                
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
					        	<%=w.getProductName() %>
					        </p>
					        <input type="hidden" name="productSalePrice" value="<%=w.getProductSalePrice() %>" />
					        <hr />
					        <div class="row">
					        	<div class="col-3">
					        		<img src="images/walkProduct/<%=w.getProductImg() %>" alt="상품메인사진" />
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
							
							<input type="hidden" name="productCount" value="<%=w.getProductCount() %>" />
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
                
                <span class="Best">BEST</span>
              	</div>
              	<%count++;%>
              <%} %>
            </div>
		</div>
    <!-- 메인 1층 끝 -->
	</div>
    <!-- 메인끝 -->

    <!-- 오른쪽 사이드바    -->
    <div class="rightAside rounded-pill">
        <div class="rightNumber rounded-circle"><a href="#RF">R</a></div>
        <div class="rightNumber rounded-circle"><a href="#5F">5F</a></div>
        <div class="rightNumber rounded-circle"><a href="#4F">4F</a></div>
        <div class="rightNumber rounded-circle"><a href="#3F">3F</a></div>
        <div class="rightNumber rounded-circle"><a href="#2F">2F</a></div>
        <div class="rightNumber rounded-circle"><a href="#1F">1F</a></div>
    </div>
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