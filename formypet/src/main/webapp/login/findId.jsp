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
        <form name="nologinFrm" method="get" action="findIdProc.jsp">
            <h2 style="margin: 30px;">아이디 찾기</h2>
                <input type="text" name="memName" id="uid" placeholder="성함" class="in" required>
                <input name="memResident1" type="text" id="resident1" class="resident" placeholder="주민번호 앞 6자리" maxlength="6" required>&nbsp;-&nbsp;<input name="memResident2" type="password" id="resident2" class="resident" placeholder="주민번호 뒷자리" maxlength="7" required>
                <input type="submit" value="아이디 찾기" class="submit" id="sub">
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
var memName = document.getElementById("uid");
var memResident1 = document.getElementById("resident1");
var memResident2 = document.getElementById("resident2");

document.getElementById("sub").onclick = function() {
	
// 정규식
// 이름
var regName = /^[가-힣a-zA-Z]{2,15}$/;
//주민번호
var regResi1 = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))/;
var regResi2 = /^[1-4][0-9]{6}$/

//이름
if(memName.value==""){
	alert("이름을 입력해 주세요.");
	memName.focus();
	return;
}
else if(!regName.test(memName.value)){
    alert("이름의 형식이 올바르지 않습니다.");
    memName.value = "";
    memName.focus();
    return;
}

//주민등록번호
if(memResident1.value==""){
	alert("주민번호 앞자리를 입력하세요.");
	memResident1.focus();
	return;
}	
else if(!regResi1.test(memResident1.value)){
    alert("주민번호 형식이 올바르지 않습니다.");
    memResident1.value = "";
    memResident1.focus();
    return;
}

if(memResident2.value==""){
	alert("주민번호 뒷자리를 입력하세요.");
	memResident2.focus();
	return;
}	
else if(!regResi2.test(memResident2.value)){
    alert("주민번호 형식이 올바르지 않습니다.");
    memResident2.value = "";
    memResident2.focus();
    return;
}

document.nologinFrm.submit();
}
</script>