<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
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
    .faq-body{
   margin: auto;
    /* text-align: left; */
   width: 50%; 
   padding: auto;
   font-size: 20px;
   
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
        <h1 class="faq-heading" align="center">FAQ(자주 묻는 질문)</h1>
        <section class="faq-container">
            <div class="faq-one">
                <!-- faq question -->
                <h3 class="faq-page"><b>[주문/결제]</b> Q. 주문 내역은 어디서 확인 하나요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 웹사이트 상단 마이 페이지 > 주문내역 > 주문 번호를 선택하시면 상세 주문내역 확인이 가능합니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-two">
                <!-- faq question -->
                <h3 class="faq-page"><b>[주문/결제]</b> Q. 꼭 회원가입을 해야만 주문이 가능한가요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 비회원으로도 주문이 가능합니다. 주문해주실 때 '비회원 구매' 버튼을 눌러 주문을 해주시기 바랍니다.
						  회원을 위한 다양한 할인 및 혜택이 준비되어 있으니 회원가입을 해주시는 것을 권장 드립니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[배송]</b> Q. 제품 배송은 얼마나 걸리나요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 주문하신 상품은 주문일로부터 2~3일 내에 출고로 안내를 드리고 있지만, 대부분 평일 오전 11시 결제 완료된 건은 가급적 당일 출고 처리하고 있습니다.
						수령까지는 출고일 다음날로부터 1~3일 가량 소요됩니다. 공휴일 혹은 주말 주문의 경우, 순차 출고로 인해 배송에 시간이 좀 더 소요될 수 있습니다.</p>
                </div>
            </div>           
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[기타문의]</b> Q. 오프라인 매장은 없나요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 현재 F.M.P 에서는 공식적으로 운영되는 오프라인 매장은 없음을 안내 드립니다.
							도매 형식으로 일반 반려동물 용품점 또는 동물병원 등에서 개별적으로 판매되고 있으며,
							입점 매장 및 연락처 문의는 070-0000-0000 혹은 070-0000-0001로 문의주시면 
							확인 후 안내 도움드리도록 하겠습니다. </p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page">Q. 제품 배송은 얼마나 걸리나요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>주문하신 상품은 주문일로부터 2~3일 내에 출고로 안내를 드리고 있지만, 대부분 평일 오전 11시 결제 완료된 건은 가급적 당일 출고 처리하고 있습니다.
						수령까지는 출고일 다음날로부터 1~3일 가량 소요됩니다. 공휴일 혹은 주말 주문의 경우, 순차 출고로 인해 배송에 시간이 좀 더 소요될 수 있습니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page">Q. 제품 배송은 얼마나 걸리나요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>주문하신 상품은 주문일로부터 2~3일 내에 출고로 안내를 드리고 있지만, 대부분 평일 오전 11시 결제 완료된 건은 가급적 당일 출고 처리하고 있습니다.
						수령까지는 출고일 다음날로부터 1~3일 가량 소요됩니다. 공휴일 혹은 주말 주문의 경우, 순차 출고로 인해 배송에 시간이 좀 더 소요될 수 있습니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page">Q. 제품 배송은 얼마나 걸리나요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>주문하신 상품은 주문일로부터 2~3일 내에 출고로 안내를 드리고 있지만, 대부분 평일 오전 11시 결제 완료된 건은 가급적 당일 출고 처리하고 있습니다.
						수령까지는 출고일 다음날로부터 1~3일 가량 소요됩니다. 공휴일 혹은 주말 주문의 경우, 순차 출고로 인해 배송에 시간이 좀 더 소요될 수 있습니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page">Q. 제품 배송은 얼마나 걸리나요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>주문하신 상품은 주문일로부터 2~3일 내에 출고로 안내를 드리고 있지만, 대부분 평일 오전 11시 결제 완료된 건은 가급적 당일 출고 처리하고 있습니다.
						수령까지는 출고일 다음날로부터 1~3일 가량 소요됩니다. 공휴일 혹은 주말 주문의 경우, 순차 출고로 인해 배송에 시간이 좀 더 소요될 수 있습니다.</p>
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
		   			    <li class="page-item"><a class="page-link text-dark" href="#">3</a></li>
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
    