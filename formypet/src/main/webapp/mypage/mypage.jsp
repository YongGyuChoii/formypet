<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/mypage.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <a href="index.html" class="logo">
            <h1>For My Pet</h1>
        </a>
            <div id="navi1">
            <ul class="nav justify-content-end">
                <li class="nav-item">
                  <a class="nav-link active text-primary" aria-current="page" href="#">장바구니</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-primary" href="#">고객센터</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-primary" href="#">로그아웃</a>
                </li>
            </ul>
            </div>

            <div id="navi2">
            <div class="p-3 mb-2 bg-primary text-white">
            <nav class="nav">
                <a class="nav-link text-white" aria-current="page" href="#">메인페이지</a>
                <a class="nav-link text-white" href="#">상품목록</a>
                <a class="nav-link text-white" href="#">고객센터</a>
              </nav>
            </div>
            </div>
      </header>

    <!--main 시작-->
    <div class="container">
      <section>
       <div class="container">    
              <section>
              <div class="summaryContainer">
              <div class="item">
                  <div class="number">0</div>
                  <div>입금결제</div>
                </div>
                <div class="item">
                  <div class="number">0</div>
                  <div>배송중 픽업 대기</div>
                </div>
                <div class="item">
                  <div class="number">0</div>
                  <div>배송완료 픽업완료</div>
                </div>
                </div>  
                <div class="shippingStatusContainer">
                <div class="title">  
                </div>
                <div class="status"> 
                <div class="item">
                <div>
            <a href="#"><i class="material-icons">paid</i></a>
                <div class="text1">적립금</div>
                <div class="text2">7,060</div>
                </div>
                <div class="icon">  </div>
                </div>     
                <div class="item">
                  <div>
                    <a href="#"><i class="material-icons"> local_parking</i></a>
                    <div class="text1">포인트</div>
                    <div class="text2">1,600</div>
                  </div>
                  <div class="icon">  </div>
                </div>     
                <div class="item">
                  <div>
                    <a href="#"><i class="material-icons">copyright</i></a>
                    <div class="text1">쿠폰</div>
                    <div class="text2">180</div>
                  </div>
                  <div class="icon">  </div>
                </div>     
                <div class="item">
                  <div>
                    <a href="${pageContext.request.contextPath}/mypage/myreview.jsp#"><i class="material-icons">menu_book</i></a>
                    <div class="text1">후기</div>
                    <div class="text2">0</div>
                  </div>
                </div>     
                
              </div>
              
            </div>  
            <div class="listContainer">
              <a href="${pageContext.request.contextPath}/mypage/mypageorder.jsp" class="item">
                  <div class="icon">ii</div>
                  <div class="text">주문/배송/픽업 조회<span class="circle"></span></div>
                  <div class="right"> > </div>
              </a>
              <a href="#" class="item">
                  <div class="icon">ii</div>
                  <div class="text">취소/교환/환불 내역</div>
                  <div class="right"> > </div>
              </a>
             
              </a>
              <a href="${pageContext.request.contextPath}/mypage/mypageproduct.jsp""   class="item">
                  <div class="icon">ii</div>
                  <div class="text">최근본상품</div>
                  <div class="right"> > </div>
              </a>
              <a href="#" class="item">
                  <div class="icon">ii</div>
                  <div class="text">찜한상품</div>
                  <div class="right"> > </div>
              </a>
            </div>
            <div class="listContainer">
              <a href="${pageContext.request.contextPath}/mypage/mypageship.jsp" class="item">
                  <div class="icon">ii</div>
                  <div class="text">
                    <span>배송지 관리</span>
                    <span class="smallLight"></span>    
                  </div>                
                  <div class="right">
                    <span class="blct"></span>
                    > </div>
              </a>
             
                 
          </div>
          </div>
    </div>
      </section>
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
</body>
</html>
    