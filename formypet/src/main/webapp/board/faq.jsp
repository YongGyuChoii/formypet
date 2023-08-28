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
        	  <a href="faq.jsp" class="cate">주문/결제</a>
        	  <a href="faq2.jsp" class="cate">배송</a>
        	  <a href="faq3.jsp" class="cate">변경/환불</a>
        	  <a href="faq4.jsp" class="cate">기타</a>
        	 </ul>
        	 </div>
            <div class="faq-one">
                <!-- faq question -->
                <h3 class="faq-page" id="first"><b>[주문/결제]&nbsp&nbsp</b> <span>Q.</span> 주문 내역은 어디서 확인 하나요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 웹사이트 상단 마이 페이지 > 주문내역 > 주문 번호를 선택하시면 상세 주문내역 확인이 가능합니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-two">
                <!-- faq question -->
                <h3 class="faq-page"><b>[주문/결제]&nbsp&nbsp</b> <span>Q.</span> 꼭 회원가입을 해야만 주문이 가능한가요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 비회원으로도 주문이 가능합니다. 주문해주실 때 '비회원 구매' 버튼을 눌러 주문을 해주시기 바랍니다.
						  회원을 위한 다양한 할인 및 혜택이 준비되어 있으니 회원가입을 해주시는 것을 권장 드립니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[주문/결제]&nbsp&nbsp</b> <span>Q.</span> 꼭 회원가입을 해야만 주문이 가능한가요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 죄송하게도 시스템 상 유선으로 주문 및 결제가 불가하여 전화 주문은 도움드리기 어려운 점 양해 부탁드립니다.
						비회원 구매도 가능하며, 성함과 연락처, 주소지 등 간단한 정보만으로도 주문이 가능하오니 번거로우시겠지만 홈페이지를 통해 주문해주시기 바랍니다.
						홈페이지 주문을 진행하시면서 궁금하시거나 어려우신 부분이 있으실 경우, 고객센터[1644-0000] 으로 문의주시면 보다 상세히 안내 도와드리겠습니다.</p>
                </div>
            </div>           
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[주문/결제]&nbsp&nbsp</b> <span>Q.</span> 주문 후 며칠 이내에 입금해야 하나요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 가상 계좌 입금으로 주문해주신 경우 주문일을 기준으로 7일 이내에 입금을 해 주셔야 합니다.
						  단, 결제 예정 금액과 동일한 금액을 입금 해주셔야지만 입금 처리가 되므로 ATM 기기에서 동전 입금이 불가할 경우에는
						  은행 창구 혹은 계좌 이체를 이용해주시기 바랍니다. 입금 기한이 지난 가상 계좌 주문 건은 자동 취소 처리 됩니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[주문/결제]&nbsp&nbsp</b> <span>Q.</span> 주문을 했는데 아무런 연락이 없어요.</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. FORMYPET 은 시스템 상 '휴대전화' 칸에 기재 해주시는 번호로 정보성 메시지를 발송 해드리고 있습니다.
						  메시지를 받아보지 못하신 경우에는 주문 정보에 휴대전화번호가 정확하게 입력 되었는지 확인 부탁드립니다.
						  '일반전화' 칸에 기재 해주시는 휴대폰 번호로는 메시지가 발송되지 않으니 참고 부탁드립니다.
						  일반 유선 전화번호가 있다면 '일반전화' 칸에 기재 해주시고, 없다면 휴대폰 번호와 동일하게 기재 해 주셔도 무방합니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[주문/결제]&nbsp&nbsp</b> <span>Q.</span> 상품을 여러 개 주문했는데 상품마다 배송비가 붙어요.</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 무료 배송비 혜택은 주문건 당 총 결제금액이 50,000원 이상일 경우 적용되며, 출고는 주문번호를 기준으로 이루어집니다.
						  주문을 나누어 진행해주셔서 각 상품마다 주문번호가 다를 경우, 각각 출고되어 개별로 배송비가 발송되는 점 참고 부탁드립니다.
						  상품을 두 가지 이상 주문하게 되실 경우, 장바구니에 담으신 뒤 한번에 결제 해주시기 바랍니다.</p>
                </div>
            </div>        
            <div>
          	<nav aria-label="Page navigation example" class="mt-5 mb-5">
		  		<ul class="pagination justify-content-center">
		    		<li class="page-item">
		      		<a class="page-link text-dark" href="#">Previous</a>
		    		</li>
		    			<li class="page-item"><a class="page-link active text-dark" href="#">1</a></li>
		   			    <li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
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
    