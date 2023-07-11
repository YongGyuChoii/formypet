<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/cart.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style>     
      a {
        color: black;
        text-decoration: none;
      }

      p {
        margin-top: 1rem;
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

    <div class="container">
    <section class="cart">
      <div class="cart_title">
        <h1><strong>CART</strong></h1>
      </div>
      <table class="cart_table">
        <form>
          <colgroup>
            <col style="width: 27px;">
            <col style="width: 100px;">
          </colgroup>
          <thead>
            <tr>
              <td style="text-align: left;"><input type="checkbox"></td>
              <td colspan="3">상품정보</td>
              <td>판매가</td>
              <td>수량</td>
              <td>배송비</td>
              <td>합계</td>
            </tr>
          </thead>
          <tbody>
            <tr class="cart_table_detail">
              <td><input type="checkbox"></td>
              <td><a href="#"><img src="../images/cart/cart.jpg" alt=""></a></td>
              <td colspan="2"><a href="#">캣 스크래쳐 위글 베어</a></td>
              <td class="cart_table_button">
                <strong>42,800원</strong>
              </td>
              <td>
                <button>-</button>
                <input type="text" value="1" style="width: 30px;">
                <button>+</button>
              </td>
              <td><p><strong>기본 3,000원</strong></p></td>
              <td><strong>45,800원</strong></td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="3"> <button class="cart_table_button2">선택상품 삭제</button>
              <button class="cart_table_button2" type="button" onclick="location='cart_empty.jsp';">전체상품 삭제</button>
              </td>
              <td></td>
              <td></td>
              <td colspan="3" style="text-align: right;"><strong>상품구매 금액 42,800 + 배송비 3,000원 = 합계 45,800원</strong></td>
  
            </tr>
          </tfoot>
        </form>
      </table>
      <div class="cart_bottom_button">
        <button class="cart_big_button left"><a href="../index.html">쇼핑 계속하기</a></button>
        <button class="cart_big_button right">주문하기</button>
      </div>
  
      <table class="table_bottom">
        <colgroup>
          <col style="width: 17%;">
          <col style="width: 17%;">
          <col style="width: 19%;">
          <col style="width: 17%;">
          <col style="width: auto;">
        </colgroup>
        <thead>
          <tr style="text-align: center;">
            <th>총 상품금액</th>
            <th>배송비</th>
            <th colspan="4">결재 예정금액</th>
          </tr>
        </thead>
        <tbody class="tbody_center">
          <tr>
            <td><strong>42,800원</strong></td>
            <td><strong>+3,000원</strong></td>
            <td colspan="4" style="color: blue;"><strong>=45,800원</strong></td>
          </tr>
        </tbody>
      </table>
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