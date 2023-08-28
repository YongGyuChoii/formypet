<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file = "/base/icon.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/faq.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style>
    .main {
    position: relative;
    background-image: url('../images/board/faq_main.jpg');
    background-size: 100% 1000px;
    }
    .content {
    background-color: white;
    }
    
    .faq-page {
    /* background-color: #eee; */
    color: #444;
    cursor: pointer;
    padding: 30px 20px;
    width: 60%;
    border: none;
    outline: none;
    transition: 0.4s;
    margin: auto;
	font-size: 20px;
	
	}
    
    .faq-body{
   margin: auto;
    /* text-align: left; */
   width: 50%; 
   padding: 10px;
   font-size: 15px;  
   }
   
   .category_box .category .cate {
   width: 10.3%;
   display: inline-block;
   text-align: center;
   border: 1px solid #eee;
   margin-bottom: 20px;   
   padding: 20px 0;
   font-size: 15px;
   color: #999;
   text-decoration: none;
   }
   #first {
   border-top: 2px solid navy 
   }
   
      span {
   color: blue;
   font-weight: bolder;
   font-size: 23px;
   }
    </style>
</head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="/base/header.jsp"%>
    </header>
    <!--header 끝-->

    <!--main 시작-->
    <div class="main">
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
      	<div class="content">
      	<br/><br/><br/>
        <h1 class="faq-heading" align="center">FAQ(자주 묻는 질문)</h1>
        <section class="faq-container">
        	<div class="category_box" align="center">
        	 <ul class="category">
        	  <a href="faq.jsp" class="cate">변경/환불</a>
        	  <a href="faq2.jsp" class="cate">배송</a>
        	  <a href="faq3.jsp" class="cate">변경/환불</a>
        	  <a href="faq4.jsp" class="cate">기타</a>
        	 </ul>
        	 </div>
            <div class="faq-one">
                <!-- faq question -->
                <h3 class="faq-page" id="first"><b>[변경/환불]&nbsp&nbsp</b> <span>Q.</span> 주문 내역을 변경하고 싶어요.</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 죄송하게도 주문 시스템 및 결제 과정 상 제품 추가 또는 수량 변경 등을 도움 드리기 어려워
						  최초 주문건 전체를 취소 요청 해 주신 뒤, 재주문 부탁드립니다.<br/><br/>

						  * 자사 홈페이지 주문건 기준<br/><br/>

						  전일 오후 1시 30분 이후 ~ 평일 오전 9시 30분 이전 결제 완료 건 : 오전 9시 30분까지 주문 취소 가능<br/>
						  평일 오전 9시 30분 이후 ~ 평일 오후 1시 30분 이전 결제 완료 건 : 오후 1시 30분까지 주문 취소 가능<br/><br/>

						  ex) 19일 오후 18시 주문 건을 20일 오전 11시에 취소 요청 시, 취소 처리 불가<br/><br/>

						  1. 구매내역을 통해 직접 주문 취소 요청<br/>
						  2. 고객센터(☎1644-0000)를 통해 주문 취소 요청<br/><br/>

						  상기 방법으로 접수가 가능하오니 참고 부탁드립니다.<br/><br/>

						  단, 주문상태가 '배송준비중'으로 확인되어도 이미 출고 과정에 있을 수 있습니다.<br/>
						  이 경우 주문 변경이 어려우니, 최초 주문 당시에 신중히 주문해 주시기 바랍니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-two">
                <!-- faq question -->
                <h3 class="faq-page"><b>[변경/환불]&nbsp&nbsp</b> <span>Q.</span> 주문 취소하고 싶어요.</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 주문은 입금전, 상품준비중 단계에서만 취소가 가능합니다.<br/><br/>

						  * 자사 홈페이지 주문건 기준<br/><br/>

							전일 오후 1시 30분 이후 ~ 평일 오전 9시 30분 이전 결제 완료 건 : 오전 9시 30분까지 주문 취소 가능<br/>
							평일 오전 9시 30분 이후 ~ 평일 오후 1시 30분 이전 결제 완료 건 : 오후 1시 30분까지 주문 취소 가능<br/><br/>

							ex) 19일 오후 18시 주문 건을 20일 오전 11시에 취소 요청 시, 취소 처리 불가<br/><br/>

							1. 구매내역을 통해 직접 주문 취소 요청<br/>
							2. 고객센터(☎1644-0000)를 통해 주문 취소 요청<br/><br/>

							상기 방법으로 접수가 가능하오니 참고 부탁드립니다.<br/><br/>

							출고 이후에는 취소 처리가 불가한 점 양해 부탁드립니다.<br/>
							위 내용 참고하시어 최초 주문 당시에 신중히 주문해 주시길 부탁드립니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[변경/환불]&nbsp&nbsp</b> <span>Q.</span> 제품을 반품하고 싶어요.</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 상품을 인도받은 날로부터 7일 이내에 한해 계약에 관한 청약철회가 가능합니다.<br/>
						  FORMYPET 고객센터(☎1644-0000) 또는 홈페이지를 통해 반품접수를 해주시면 수거 접수를 도와드리고 있습니다.<br/>
						  반품 상품이 도착 후 자체 검수가 완료되면 환불처리를 해드립니다.<br/><br/>

						  단순변심으로 인하여 반품을 하시는 경우에는 상품 등의 반환에 필요한 비용을 고객님이 부담하셔야 합니다.<br/><br/>

   						  * 단, 제품은 개봉하시지 않은 새상품 상태일 경우에만 반품이 가능하오며 사용하신 제품은 단순변심, 사용감 불만족으로 인한 반품이 불가합니다.</p>
                </div>
            </div>           
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[변경/환불]&nbsp&nbsp</b> <span>Q.</span> 교환 반품 처리 기간은 얼마나 소요 되나요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 최초 접수부터 처리 완료까지 일반적으로 4~5일 소요 됩니다.(주말,공휴일 제외)<br/>
				  		  일시적으로 교환&반품 입고량이 많은 경우, 다소 처리가 지연될 수 있으니 양해 부탁드립니다.<br/>

						  교환 상품도 새로운 주문 상품과 같이 교환 승인, 회수 완료 이후 배송 준비 기간이 소요됩니다.<br/>
						  반품 처리는 반품 승인 후 고객 정보가 일치하는 건에 대해서는 반품 상품 입고 후 1~2일 내에 환불이 완료되지만,<br/>
						  환불 정보가 정확하지 않거나, 미기재 된 경우 고객님께 유선 연락 후 연결이 안되실 경우 문자로 안내해드립니다.<br/>
						  (연락이 안될시 환불보류 상태로 고객님의 연락을 기다리게 됩니다.)<br/><br/>
						
						  ※ 환불 완료가 4~5일내로 이뤄지지 않을 경우 고객센터로 문의 바랍니다.</p>
                </div>
            </div>
       
            <div>
          	<nav aria-label="Page navigation example" class="mt-5 mb-5">
		  		<ul class="pagination justify-content-center">
		    		<li class="page-item">
		      		<a class="page-link text-dark" href="#">Previous</a>
		    		</li>
		    			<li class="page-item"><a class="page-link active text-dark" href="#">1</a></li>
		     			<li class="page-item">
		     		    <a class="page-link text-dark" href="#">Next</a>
		    		</li>
		  		</ul>
	  		</nav>
            </div>                                                                                   
        </section>
       </div>
     </div>
    </div>
    <br/><br/>
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
    <script src="${pageContext.request.contextPath}/js/faq.js"></script>
</body>
</html>
    