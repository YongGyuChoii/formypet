<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
     <link rel="stylesheet"  href="../css/review.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="../js/review.js"></script>
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
      <section>

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
            
             <label for="title">제목:</label>
          <input type="text" id="title" name="title" required><br>
           <label for="contents">내용:</label><br>
                <div class="review_contents">
                <div class="warning_msg">5자 이상의 리뷰 내용을 작성해 주세요.</div>
                <textarea rows="10" class="review_textarea"></textarea>
            </div>   
            <div class="cmd">
                <label for="image">이미지 업로드:</label>
                <input type="file" id="image" name="image"><br>
            
                <input type="button" name="save" id="save" value="등록">
            </div>
        </form>
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
    