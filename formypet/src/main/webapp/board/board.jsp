<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	int totalPage = 0;
	int totalBlock = 0;
	
	int nowPage = 1;
	int nowBlock = 1;
	
	int start = 0;
	int end = 0;
	
	int listSize = 0;
	
	String keyWord = "", keyField = "";
	
	

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/board.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
        <div id="container">
          <img id="back" src="../images/board/cs_center.jpg" alt="" width="100%">
          <div class="box1"><h1>Hello, Customer</h1>
          <br>
          <p>We are making every effort for the happiness of you and your companion animals.</p>
          <p>If you have any questions about our products, shipping, exchange/return etc., please make use of the</p> 
          <p>Customer Service Center.</p>
          <br>
          <p>반려인과 반려동물의 행복을 위해 최선을 다하고 있습니다.</p>
          <p>제품, 배송, 교환/반품 문의 등의 궁금한 점은 여기 고객센터를 이용해 주시기 바랍니다.</p>
  </div>
  <div class="list_wrap">
      <div class="paging2">
          <a href="#" class="bt">FAQ</a>
          <a href="board.jsp" class="bt">BOARD</a>
          <a href="post.jsp" class="bt2">글쓰기</a>
      </div>
	  <br/>
      <table class="board_list">
          <caption>게시판 목록</caption>
          <thead>
              <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>글쓴이</th>
                  <th>작성일</th>
                  <th>조회</th>
              </tr>
          </thead>
          <tbody>
              <tr>
                  <td>10</td>
                  <td class="tit">
                  <a href="#">자주 묻는 질문 답변</a>
                  </td>
                  <td>관리자</td>
                  <td>2023-04-20</td>
                  <td>555</td>
              </tr>
              <tr>
                  <td>9</td>
                  <td class="tit">
                  <a href="#"><b>필독!! 상품 구매방법 및 배송안내</b></a>    
                  </td>
                  <td>관리자</td>
                  <td>2023-04-20</td>
                  <td>555</td>
              </tr>
              <tr>
                  <td>8</td>
                  <td class="tit">
                  <a href="#">두부 모래, 스마일 패드 제품군 가격 인상 안내</a>    
                  </td>
                  <td>관리자</td>
                  <td>2023-04-20</td>
                  <td>555</td>
              </tr>
              <tr>
                  <td>7</td>
                  <td class="tit">
                  <a href="#">지금 구매하지 마세요! 곧 5주년 생일 이벤트가 시작됩니다</a>
                  </td>
                  <td>관리자</td>
                  <td>2023-04-20</td>
                  <td>555</td>
              </tr>
              <tr>
                  <td>6</td>
                  <td class="tit">
                  <a href="#">5월 연휴 배송 안내</a>    
                  </td>
                  <td>관리자</td>
                  <td>2023-04-20</td>
                  <td>555</td>
              </tr>
              <tr>
                  <td>5</td>
                  <td class="tit">
                  <a href="#"><b>당일 출고 마감 시간 및 취소 가능 시간 변경 공지</b></a>
                  </td>
                  <td>관리자</td>
                  <td>2023-04-20</td>
                  <td>555</td>
              </tr>
              <tr>
                  <td>4</td>
                  <td class="tit">
                  <a href="#">RELAX SHOWER 리뉴얼 관련 안내</a>
                  </td>
                  <td>관리자</td>
                  <td>2023-04-20</td>
                  <td>555</td>
              </tr>
              <tr>
                  <td>3</td>
                  <td class="tit">
                  <a href="#">A/S 규정 안내</a>
                  </td>
                  <td>관리자</td>
                  <td>2023-04-20</td>
                  <td>555</td>
              </tr>
              <tr>
                  <td>2</td>
                  <td class="tit">
                  <a href="#">포토리뷰 우수 후기 이벤트 변경 안내</a>
                  </td>
                  <td>관리자</td>
                  <td>2023-04-20</td>
                  <td>555</td>
              </tr>
              <tr>
                  <td>1</td>
                  <td class="tit">
                  <a href="#"><b>2023년 4월 고객센터 운영 시간 및 출고 안내</b></a>
                  </td>
                  <td>관리자</td>
                  <td>2023-04-20</td>
                  <td>555</td>
              </tr>
          </tbody>
      </table>
      <div class="paging">
          <a href="#" class="bt">이전 페이지</a>
          <a href="#" class="num on">1</a>
          <a href="#" class="num">2</a>
          <a href="#" class="num">3</a>
          <a href="#" class="bt">다음 페이지</a>
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
    