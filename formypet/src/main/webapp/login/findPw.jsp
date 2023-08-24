<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <form name="findPwFrm" method="get" action="findPwProc.jsp">
            <h2 style="margin: 30px;">비밀번호 찾기</h2>
                <input type="text" name="memId" id="uid" placeholder="아이디" class="in" required>
                <input type="text" name="memName" id="uid" placeholder="성함" class="in" required>
                <input name="memResident1" type="text" id="resident" class="resident" placeholder="주민번호 앞 6자리" maxlength="6" required>&nbsp;-&nbsp;<input name="memResident2" type="password" id="resident" class="resident" placeholder="주민번호 뒷자리" maxlength="7" required>
                <input type="submit" class="subButton" value="비밀번호 찾기">
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
$(document).on("click",".subButton",function(){
	
	var memId = $(this).parent().parent().parent().parent().parent().parent().find("input[name='memId']").val();
	var memName = $(this).parent().parent().parent().parent().parent().parent().find("input[name='memName']").val();
	var memResident1 = $(this).parent().parent().parent().parent().parent().parent().find("input[name='memResident1']").val();
	var memResident2 = $(this).parent().parent().parent().parent().parent().parent().find("input[name='memResident2']").val();
	
	if(memId == "") {
		alert("아이디를 입력해 주세요.");
		memId.focus();
		return;
	}
	
	if(memName == "") {
		alert("이름을 입력해 주세요.");
		memName.focus();
		return;
	}
	if(memResident1 == "") {
		alert("주민번호를 입력해 주세요.");
		memResident1.focus();
		return;
	}
	if(memResident2 == "") {
		alert("주민번호를 입력해 주세요.");
		memResident2.focus();
		return;
	}
	
	
	document.loginFrm.submit();
	
	
	
	
});
</script>