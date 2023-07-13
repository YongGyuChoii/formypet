<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/signup.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script type="text/javascript" src="./script/script.js"></script>
    <style>
    	h2 {
    		padding: 20px;
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
    <div class="container">
    <div class="signup">
      <form method="post" name="regFrm" action="memberProc.jsp">
          <h2>회원정보 입력</h2>
              <input name="memId" type="text" id="uid" placeholder="아이디 (영문 소문자/숫자4~16자)" class="in"required>
              <input name="memPw" type="password" placeholder="비밀번호 (영문 대소문자/숫자/특수문자 조합 8~12자)" class="in" required>
              <input type="password" placeholder="비밀번호 확인" class="in" required>
              <input name="memName" type="text" placeholder="성명" class="in" required>
              <input name="memEmail1" type="text" placeholder="이메일" class="mail" required>@<input name="memEmail2" type="text" class="maildomain" required>
              <select class="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;">
   	 		  	<option value="">-선택-</option>
    			<option value="naver.com">naver.com</option>
    			<option value="gmail.com">gmail.com</option>
    			<option value="hanmail.net">hanmail.net</option>
    			<option value="hotmail.com">hotmail.com</option>
    			<option value="korea.com">korea.com</option>
    			<option value="nate.com">nate.com</option>
    			<option value="yahoo.com">yahoo.com</option>
    			<option value="직접입력">직접입력</option>
			  </select>
			  <input name="memAddress" type="text" id="uid" placeholder="배송주소" class="in" required>
              <input type="text" value="010" class="call">&nbsp;-&nbsp;
              <input name="memPhone1" type="tel" placeholder="전화번호" class="call" maxlength="4" required>&nbsp;-&nbsp;
              <input name="memPhone2" type="tel" placeholder="전화번호" class="call"  maxlength="4" required>
              <input name="memResident1" type="text" id="resident" class="resident" placeholder="주민번호 앞 6자리" maxlength="6" required>&nbsp;-&nbsp;<input name="memResident2" type="text" id="resident" class="resident" placeholder="주민번호 뒷자리" maxlength="7" required>
              <input type="reset" id="btn" value="취소">
              <input type="submit" id="btn" value="회원가입">
      </form>
    </div>
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
  