<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="product.ProductBean"%>
<%@page import="product.ProductFileBean"%>
<%@page import="product.ProductOptionBean"%>
<%@page import="java.util.*"%>
<jsp:useBean id="bMgr" class="product.ProductDetailMgr" />
<jsp:useBean id="pMgr" class="product.ProductMgr" />
<%
	request.setCharacterEncoding("UTF-8");

	int productKey = Integer.parseInt(request.getParameter("productKey"));
	int categoryKey = Integer.parseInt(request.getParameter("categoryKey"));
	
	//상품 옵션담기
	ArrayList<ProductOptionBean> pbof = pMgr.getOption(productKey);
	
	//상품1개 정보 담기
	ProductBean pb = bMgr.getProduct(productKey);
	
	//상품사진 파일들
	ArrayList<ProductFileBean> pbf = bMgr.getProductFile(productKey);
	
	//카테고리별 이미지 폴더 src 설정
	String src = null;
	if(categoryKey == 1){
		src = "../images/bathProduct/";
	} else if(categoryKey == 2) {
		src = "../images/hygieneProduct/";
	} else if(categoryKey == 3) {
		src = "../images/beautyProduct/";
	} else if(categoryKey == 4) {
		src = "../images/livingProduct/";
	} else if(categoryKey == 5) {
		src = "../images/walkProduct/";
	} else if(categoryKey == 6) {
		src = "../images/snackProduct/";
	} else if(categoryKey == 7) {
		src = "../images/clothesProduct/";
	}
	
	//할인율 계산 ((정가-할인가) / 정가) * 100
	String salePercent;
	float salePer = (((float)pb.getProductPrice()-pb.getProductSalePrice()) / pb.getProductPrice()) * 100;
	salePercent = String.format("%.0f", salePer); //반올림
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/productDetail.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/productDetail.js"></script>
    <script>
    //jsp 에서 js로 변수값 전달
		var oc1 = new Array();
		var oc2 = new Array();
		var oc3 = new Array();
		var oc4 = new Array();
		var oc5 = new Array();
		<%for(int i=0; i<pbof.size(); i++) {%>
			oc1.push('<%=pbof.get(i).getOc1()%>')
			oc2.push('<%=pbof.get(i).getOc2()%>')
			oc3.push('<%=pbof.get(i).getOc3()%>')
			oc4.push('<%=pbof.get(i).getOc4()%>')
			oc5.push('<%=pbof.get(i).getOc5()%>')			
		<%}%>
	</script>
</head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="/base/header.jsp"%>
    </header>
    <!--header 끝-->

    <!--main 시작-->
    <div class="container">
      
      <div class="row mt-5 mb-5">
      
        <div class="section col">
            <img src="<%=src %><%=pb.getProductImg() %>" class="mainImg" alt="상품메인사진">
        </div>

        <div class="section col ms-5 mt-5">
        	<%if(pb.getProductOrderCount() >= 500) { %>
            <p class="best fw-bold">BEST</p>
            <%} %>
            <p class="fw-bold fs-3"><%=pb.getProductName() %></p>
            <input type="hidden" name="productName" value="<%=pb.getProductName() %>"/>
            <div class="row mb-3">
            	<div class="col showInfo">
            		INFORMATION
            	</div>
            	<div class="col showSize">
            		SIZE GUIDE
            	</div>
            	<div class="col showCaution">
            		CAUTION
            	</div>
            </div>
           	
			<div class="showImg1">
			  <img alt="상품정보" src="<%=src %><%=pb.getProductInfo() %>" class="imgInfo">
			</div>
			<div class="showImg2">
			  <img alt="상품정보" src="<%=src %><%=pb.getProductDetail() %>" class="imgInfo">
			</div>
			<div class="showImg3">
			  <img alt="상품정보" src="<%=src %><%=pb.getProductCaution() %>" class="imgInfo">
			</div>
			
			<p class="fw-bold fs-4 mt-5"><fmt:formatNumber value="<%=pb.getProductSalePrice() %>" pattern="#,###"/>원 
			<span class="text-secondary text-decoration-line-through ms-3"><fmt:formatNumber value="<%=pb.getProductPrice() %>" pattern="#,###"/>원</span> 
			<span class="text-danger sale"><%=salePercent %>%</span></p>
			<input type="hidden" name="productSalePrice" value="<%=pb.getProductSalePrice() %>" />
			
			<hr/>
			
			<div class="row">
				<div class="col-4">
					옵션 선택
				</div>
				<div class="col-8">
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
			
			<div class="mt-5 priceAll">
				<span class="fw-bold">총 상품금액</span>(수량) : <span class="fw-bold fs-4 totalPrice">0</span>원
				(<span class="totalCount">0</span>개)
			</div>
			
			<div class="btn-group mt-4 groupBtn" role="group" aria-label="Basic mixed styles example">
			  <button type="button" class="btn btn-light text-dark fw-bold">ADD TO CART</button>
			  <button type="button" class="btn btn-primary fw-bold">BUY NOW</button>
			</div>
        </div>
        
      </div>
      
      <hr/>
      
      <div class="mt-5 section2">
      	<%for(ProductFileBean pbfList : pbf){ %>
      		<img src="<%=src %><%=pbfList.getFileSaveName() %>" alt="상품상세사진" />
      	<%} %>
      </div>
      
      <div class="mt-5">
      	<div class="fw-bold showDelivery">
      		<span class="fs-4">DELIVERY</span>
      		<span class="material-icons addIcon1" style="font-size:25px;">add</span>
      	</div>
      	<hr />
      	<div class="delivery">
      		<p class="pt-5 ps-4">배송 방법 : 택배</p>
      		<p class="ps-4">배송 지역 : 전국지역</p>
      		<p class="ps-4">배송 비용 : 3,000원</p>
      		<p class="ps-4">배송 기간 : 3일~7일</p>
      		<p class="ps-4">배송 안내 : </p>
      		<p class="ps-4">※<span class="fw-bold">배송기간</span> : 평일 오전 9시 30분 이전 결제 완료된 주문건은 오전 당일 출고를 원칙으로 하며,</p>
      		<p class="ps-4">평일 오전 9시 30분 이후~ 오후 2시 이전 결제 완료된 주문건은 오후 당일 출고를 원칙으로 도와드리고 있습니다.</p>
      		<p class="ps-4">오후 2시 이후 주문건의 경우, 익영업일 순차적으로 출고 진행되오니 참고 부탁드립니다. 아울러 배송은 평균 1~3일 정도 소요되며,</p>
      		<p class="ps-4 pb-5">제주도 및 도서산간 지역의 경우 배송이 다소 지연될 수 있는 점 양해 부탁드립니다.</p>
      	</div>
      	
      	<div class="fw-bold showExchange">
      		<span class="fs-4">EXCHANGE & RETURN</span>
      		<span class="material-icons addIcon2" style="font-size:25px;">add</span>
      	</div>
      	<hr />
      	<div class="exchange">
      		<p class="pt-5 ps-4 fw-bold">교환 및 반품이 가능한 경우</p>
      		<p class="ps-4">- 상품을 인도받은 날로부터 7일 이내에 한해 계약에 관한 청약철회가 가능합니다.</p>
      		<p class="ps-4">- 공급받으신 상품 및 용역의 내용이 표시. 광고 내용과 다르거나 다르게 이행된 경우에는 공급받은 날로부터 3개월 이내, 그 사실을 알게 된 날로부터 30일 이내</p>
      		<p class="ps-4 fw-bold">교환 및 반품이 불가능한 경우</p>
      		<p class="ps-4">- 덴탈클린칫솔(XS), 덴탈클린칫솔(M), 딥포인트칫솔, 퍼펙트 덴탈 케어 세트의 경우 단상자(패키지) 개봉 시 반품이 불가능합니다.</p>
      		<p class="ps-4">- 고객님의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외</p>
      		<p class="ps-4">- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우</p>
      		<p class="ps-5">(예:'개봉 시 교환/환불 불가 스티커' 를 훼손한 경우, 제품 단 상자가 훼손되어 상품가치가 상실된 경우)</p>
      		<p class="ps-4">- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을 제공한 경우에 한 합니다.</p>
      		<p class="ps-4">- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</p>
      		<p class="ps-5">(자세한 내용은 CS센터의 Q&A게시판을 이용해 주시기 바랍니다.)</p>
      		<p class="ps-4 pb-5 pt-5">※ 단순변심으로 인한 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다. (색상 및 사이즈 교환 등 포함)</p>
      	</div>
      </div>
      
      <div class="mt-5">
      	<span class="fs-4">REVIEW</span> (<span class="fs-4 fw-bold">13,256</span>)
      	<hr />
      </div>
      
      <div class="row">
      	<div class="col-8 oneLine">
	      	<span class="fw-bold text-warning">★★★★★</span><span class="fw-bold ms-2">아주 좋아요</span>
	      	<p class="mt-3">
	      		치카치카 꾸준히 하고 잇어요 헤드가 작아서 인지 거부감도 별루 없구요 ㅎ 
	      		양치 잘하는 저희애들 ㅎㅎ 꾸준히 구매해서 양치하고 잇어요 ㅎㅎ 
	      		양치가 중요한 부분이다 보니 빼먹지않고 꾸준하게 ㅎㅎ
	      	</p>
	      	<img src="../images/solution.jpg" class="img-thumbnail" alt="리뷰사진">
      	</div>
      	<div class="col-4">
      		<p class="ps-5 mt-4 fw-bold">-_-*님의 리뷰입니다.</p>
      		<p class="ps-5 mt-4 text-muted">치약 선택 고구마향</p>
   		</div>
   	  </div>
   	  <hr />
   	  <div class="row">
      	<div class="col-8 oneLine">
	      	<span class="fw-bold text-warning">★★★★★</span><span class="fw-bold ms-2">아주 좋아요</span>
	      	<p class="mt-3">
	      		치카치카 꾸준히 하고 잇어요 헤드가 작아서 인지 거부감도 별루 없구요 ㅎ 
	      		양치 잘하는 저희애들 ㅎㅎ 꾸준히 구매해서 양치하고 잇어요 ㅎㅎ 
	      		양치가 중요한 부분이다 보니 빼먹지않고 꾸준하게 ㅎㅎ
	      	</p>
	      	<img src="../images/solution.jpg" class="img-thumbnail" alt="리뷰사진">
      	</div>
      	<div class="col-4">
      		<p class="ps-5 mt-4 fw-bold">-_-*님의 리뷰입니다.</p>
      		<p class="ps-5 mt-4 text-muted">치약 선택 고구마향</p>
   		</div>
   	  </div>
   	  <hr />
   	  
   	  <nav aria-label="Page navigation example" class="mt-5 mb-5">
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a class="page-link text-dark" href="#">Previous</a>
		    </li>
		    <li class="page-item"><a class="page-link active text-dark" href="#">1</a></li>
		    <li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
		    <li class="page-item"><a class="page-link text-dark" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link text-dark" href="#">Next</a>
		    </li>
		  </ul>
	  </nav>
      
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
    