<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/login.css">
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
      <div class="login">
          <h1>Welcom<br/> Login!</h1>
          <form name="loginFrm" method="get" action="loginProc.jsp">
              <input type="text" name="memId" placeholder="아이디" class="in">
              <input type="password" name="memPw" placeholder="비밀번호" class="in">
              <input type="submit" id="btn" value="로그인" onclick="loginCheck()"><br>
              <input type="button" id="btn" value="비회원 주문조회" onclick="location.href='nonMember.jsp'">
              <input type="button" id="btn" value="관리자 로그인" onclick="location.href='adminLogin.jsp'">
          </form>
          <a href="signup.jsp">회원가입 |</a>
          <a href="#none">비밀번호를 잊어버리셨나요?</a>
          <p><a href="#">비회원 이신가요?</a></p>
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
<script>
	function loginCheck() {
		
		if(document.loginFrm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.id.focus();
			return;
		}
		if(document.loginFrm.pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
    