<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/base/icon.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/nonMember.css">
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
    <div class="non-member">
        <form name="nologinFrm" method="get" action="../mypage/nonMemberOrder.jsp">
            <h2 style="margin: 30px;">비회원 주문조회</h2>
                <input type="text" id="uid1" name="rName" placeholder="주문자명" class="in" required>
                <input type="password" id="uid2" name="orderPassword" placeholder="비밀번호" class="in" required>
                <input type="submit" value="비회원 주문조회" class="submit" id="sub">
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
<script>
var orderPassword = document.getElementById("uid2");
var rName = document.getElementById("uid1");

document.getElementById("sub").onclick = function() {
	
// 정규식
// 이름
var regName = /^[가-힣a-zA-Z]{2,15}$/;
//pw
var regexPw = /^[A-Za-z0-9`~!@#\$%\^&\*\(\)\{\}\[\]\-_=\+\\|;:'"<>,\./\?]{8,20}$/; //주문조회 비번 유효성

//이름
if(rName.value==""){
	alert("이름을 입력해 주세요.");
	rName.focus();
	return;
}
else if(!regName.test(rName.value)){
    alert("이름의 형식이 올바르지 않습니다.");
    rName.value = "";
    rName.focus();
    return;
}

//비밀번호
if(orderPassword.value==""){
	alert("비밀번호를 입력해 주세요.");
	orderPassword.focus();
	return;
}
else if(!regexPw.test(orderPassword.value)){
    alert("8~20자 영문 대소문자, 숫자, 특수문자를 사용하세요");
    orderPassword.value = "";
    orderPassword.focus();
    return;
}

document.nologinFrm.submit();
}
</script>