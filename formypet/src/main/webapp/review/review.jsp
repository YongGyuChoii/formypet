<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dog and Cat</title>
    <link rel="stylesheet"  href="../css/review.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<title>프로토타입으로 별점 댓글 기능 구현하기</title>
    <script type="text/javascript" src="../js/review.js"></script>
    
</head>
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
                  <a class="nav-link active text-primary" aria-current="page" href="#">로그인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-primary" href="#">마이페이지</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-primary" href="#">장바구니</a>
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
    <!--header 끝-->
   
   
   <!--main 시작-->
 
 <div class="wrap">
        <h1>후기</h1>
        <form name="reviewform" class="reviewform" method="post" action="/save">
            <input type="hidden" name="rate" id="rate" value="0"/>
            <p class="title_star">별점과 이용경험을 남겨주세요.</p>
     
            <div class="review_rating rating_point">
                <div class="warning_msg">별점을 선택해 주세요.</div>
                <div class="rating">
                    <div class="ratefill"></div>
                    <!-- [D] 해당 별점이 선택될 때 그 점수 이하의 input엘리먼트에 checked 클래스 추가 -->
                    <input type="checkbox" name="rating" id="rating11" value="1" class="rate_radio" title="1점">
                    <label for="rating11"></label>
                    <input type="checkbox" name="rating" id="rating12" value="2" class="rate_radio" title="2점">
                    <label for="rating12"></label>
                    <input type="checkbox" name="rating" id="rating13" value="3" class="rate_radio" title="3점" >
                    <label for="rating13"></label>
                    <input type="checkbox" name="rating" id="rating14" value="4" class="rate_radio" title="4점">
                    <label for="rating14"></label>
                    <input type="checkbox" name="rating" id="rating15" value="5" class="rate_radio" title="5점">
                    <label for="rating15"></label>
                </div>
            </div>
            
                <div class="review_contents">
                <div class="warning_msg">5자 이상의 리뷰 내용을 작성해 주세요.</div>
                <textarea rows="10" class="review_textarea"></textarea>
            </div>   
            <div class="cmd">
                <input type="button" name="save" id="save" value="등록">
            </div>
        </form>
    </div>
  
    <!--main 끝-->

    <!-- 오른쪽 맨위 맨아래 화살표 -->
    <div class="rightAside2 rounded-pill">
      <div class="rounded-circle"><a href="#wrap"><span class="material-icons">
        expand_less
        </span></a></div>
      <div class="rounded-circle"><a href="#footer"><span class="material-icons">
        expand_more
        </span></a></div>
    </div>
    <!-- 오른쪽 맨위 맨아래 화살표 끝 -->
    
    <!-- footer 시작-->
    <footer id="footer">
      <nav>
            <p>Dog And Cat</p>
            <p>tel : 1234-5678 / Email : path@naver.com</p>
            <p>Business License No : 394-81-01000[사업자정보확인]</p>
            <p>전주시 완산구 팔달로 184 2층</p>
            <br>
            <p>CEO : Joenseo </p>
      </nav>
    </footer>
    <!-- footer 끝.-->
    </div>
</body>
</html>
    