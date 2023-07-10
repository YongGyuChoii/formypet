<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
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
 <div>
          <br>
          <h1>ORDER</h1>
        <form name="memOrder" method="post" action="orderProc.jsp">
  
            <table>
              <tr>
                <td colspan="2"><p>주문정보</p></td>
              </tr>
              <tr>
                <th>주문 하시는분</th>
                <td><input type="text" name="user_name" id="user_name" required  autofocus> </td>
              </tr>
              <tr>
                <th>휴대전화</th>
                <td><input type="tel" name="user_tel" id="user_tel1" required></td>
              </tr>
              <tr>
                <th>이메일</th>
                <td><input type="email" name="user_email" id="user_email">@<input type="email" name="user_email" id="user_email2">
                <select id="user_email" fw-filter="user_email2" fw-label="user_email2" fw-alone="N" fw-msg="">
                  <option value="">- 이메일 선택 -</option>
                  <option value="naver.com" selected="selected">naver.com</option>
                  <option value="daum.net">daum.net</option>
                  <option value="nate.com">nate.com</option>
                  <option value="hotmail.com">hotmail.com</option>
                  <option value="yahoo.com">yahoo.com</option>
                  <option value="empas.com">empas.com</option>
                  <option value="korea.com">korea.com</option>
                  <option value="dreamwiz.com">dreamwiz.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="etc">직접입력</option>
                  </select>
                </td>
              </tr>
              
                <tr>
                  <td colspan="2"><p>배송정보</p></td>
                </tr>
                <tr>
                  <th>배송지 선택</th>
                  <td><input></td>
                </tr>
                <tr>
                  <th>받으시는 분</th>
                  <td><input type="text" name="end_name" id="end_name" required></td>
                </tr>
                <tr>
                  <th>주소</th>
                  <td><input type="text" name="addr" id="addr" required> <input type="text" name="addr" id="addr"></td>
                </tr>
                <tr>
                  <th>휴대전화</th>
                  <td><input type="tel" name="end_tel" id="end_tel" required ></td>
                </tr>
                <tr>
                  <th>배송 메세지</th>
                  <td><textarea name="memo" id="memo" cols="100" rows="10"></textarea></td>
                </tr>
            </table>
        
        </div>
        <br>
        <h4>결제수단</h4>
        <div class="payArea">
          
          <input id="addr_paymethod0" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="card" type="radio" checked="checked" autocomplete="off">
          <label for="addr_paymethod0">카드 결제</label>
          <input id="addr_paymethod1" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="tcash" type="radio" autocomplete="off">
          <label for="addr_paymethod1">실시간 계좌이체</label>
          <input id="addr_paymethod2" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="icash" type="radio" autocomplete="off">
          <label for="addr_paymethod2">가상계좌</label>
          <input id="addr_paymethod3" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="cell" type="radio" autocomplete="off">
          <label for="addr_paymethod3">휴대폰 결제</label>
            
        </div>
        <button type="submit">결제하기</button>
      </form>
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