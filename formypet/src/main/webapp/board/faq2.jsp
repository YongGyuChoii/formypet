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
                <h3 class="faq-page" id="first"><b>[배송문의]&nbsp&nbsp</b> <span>Q.</span> 주문한 상품을 받지 못했는데 배송완료로 확인돼요.</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 고객님께서 직접 물건을 받지 못하신 경우라면, 우선적으로 경비실 등 평소 고객님이 배송 물품을 맡겨 달라고 하셨던 곳을 먼저 확인 부탁드립니다.
						  이후에도 확인이 어려우신 경우 운송장 번호에 따른 배송 내용을 확인하신 뒤 담당 기사님과 소통 부탁 드립니다.
						  배송 문의의 경우, 고객님의 소중한 개인정보로서, 저희가 대신 문의 드리지 못하고 고객님께서 직접 문의해 주셔야 함을 양해 부탁 드립니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-two">
                <!-- faq question -->
                <h3 class="faq-page"><b>[배송문의]&nbsp&nbsp</b> <span>Q.</span> 여러 개의 상품을 같이 주문했는데 일부가 안 왔어요.</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 일부 부피가 크고 무게가 많이 나가는 제품들은 제품 특성상 안전한 배송을 위해 단독 포장으로 별도 배송 되며,
						  시스템상 운송장번호가 하나만 등록 가능하여 나머지 운송장 번호에 대해서는 카카오톡 메시지 남겨드리고 있습니다. 
						  출고는 동시에 이루어 지지만 택배사 물류량이 많은 경우 일부 제품은 이동이 지연되어 수령일은 달라질 수 있는 점 참고 부탁드립니다. </p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[배송문의]&nbsp&nbsp</b> <span>Q.</span> 운송장번호로 화물추적을 해보니 조회되는 내역이 없어요.</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 출고 예정 상품의 운송장번호는 물류 센터 작업 직후 생성 되오나, 고객님께서 실제 조회 가능하신 시점은
						  CJ 대한통운에서 배송 정보를 입력한 시점부터 배송 추적이 가능하게 됩니다.
						  송장 번호 안내 문자를 받아 보신 당일 늦은 오후(7시 전후) 또는 다음날 오전 중부터 조회가 가능하오니 조금만 여유를 갖고 기다려 주시면 감사드리겠습니다.
						  이후에도 조회가 어려우신 경우 FORMYPET 고객센터(☎1644-0000) 로 문의 주시면 안내 도와드리겠습니다.</p>
                </div>
            </div>           
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[배송문의]&nbsp&nbsp</b> <span>Q.</span> 배송이 보통 얼마나 걸리나요 ?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 제품 출고일을 기준으로 평균적으로 영업일 기준 1~3일 정도 소요됩니다. 단, 택배사 물류량이 많을 경우에는 배송이 지연될 수 있으며
					 	  도서 산간지역은 조금 더 지연될 수 있습니다.<br/> 
					 	  * 출고일을 기준으로 일주일 이내에 물품을 수취하시지 못하신다면 택배 배송사고일 경우가 있으니 고객센터(☎1644-0000) 로 문의주시기 바랍니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[배송문의]&nbsp&nbsp</b> <span>Q.</span> 각각 주문한 주문 건 합배송이 가능한가요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 대단히 죄송합니다만, 저희 FORMYPET 은 주문 번호 당 운송장 번호가 하나씩 부여됩니다.
                    	  따라서 주문 번호가 다를 경우 합배송은 불가하오며 배송비는 각각 부과되니 참고 부탁드립니다.
						  합배송을 원하시는 경우 기존 주문 건 취소 후 원하시는 상품으로 다시 주문 해주시면 됩니다.</p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-three">
                <!-- faq question -->
                <h3 class="faq-page"><b>[배송문의]&nbsp&nbsp</b> <span>Q.</span> 어떤 택배사를 이용하나요 ?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 고객님의 물품은 CJ대한통운을 통해 배송되고 있으며, 벤토나이트 제품군의 경우, 롯데택배 통해 배송됩니다.</p>
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
    