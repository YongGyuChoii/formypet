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
        	  <a href="faq.jsp" class="cate">기타</a>
        	  <a href="faq2.jsp" class="cate">배송</a>
        	  <a href="faq3.jsp" class="cate">기타</a>
        	  <a href="faq4.jsp" class="cate">기타</a>
        	 </ul>
        	 </div>
            <div class="faq-one">
                <!-- faq question -->
                <h3 class="faq-page" id="first"><b>[기타문의]&nbsp&nbsp</b> <span>Q.</span> 오프라인 매장은 없나요?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 현재 FORMYPET 에서는 공식적으로 운영되는 오프라인 매장은 없음을 안내 드립니다.<br/>
						  도매 형식으로 일반 반려동물 용품점 또는 동물병원 등에서 개별적으로 판매되고 있으며,<br/>
						  입점 매장 및 연락처 문의는 070-0000-0000 혹은 070-0000-0001로 문의주시면 확인 후 안내 도움드리도록 하겠습니다. </p>
                </div>
            </div>
            <hr class="hr-line">
            <div class="faq-two">
                <!-- faq question -->
                <h3 class="faq-page"><b>[기타문의]&nbsp&nbsp</b> <span>Q.</span> 상품 불량, 오배송은 어떻게 하나요 ?</h3>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>A. 상품 불량과 오배송의 경우 FORMYPET 에서 택배비를 부담합니다. 단, 상품 불량을 증명할 수 있는 사진 등의 자료를 요청 드릴 수 있습니다.<br/>
						  FORMYPET 고객센터(☎1644-0000), 카카오 상담 또는 Q&A게시판으로 문의 주시면 보다 자세한 안내 도와드리겠습니다.</p>
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