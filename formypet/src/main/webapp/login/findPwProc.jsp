<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberBean"%>    
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
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
	<%
	request.setCharacterEncoding("UTF-8");
    
	String memId = request.getParameter("memId");
	String memName = request.getParameter("memName");
	int memResident1 = Integer.parseInt(request.getParameter("memResident1"));
	int memResident2 = Integer.parseInt(request.getParameter("memResident2"));
		  
	MemberBean db = mMgr.findPw(memId, memName, memResident1, memResident2);
	%>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="/base/header.jsp"%>
    </header>
    <!--header 끝-->

    <!--main 시작-->

    <div class="container">
    <div class="non-member">
        <form name="nologinFrm" method="get" action="changePw.jsp">
            <h2 style="margin: 30px;">새로운 비밀번호 변경</h2>
            	<input type="hidden" name="memId" value="<%=memId%>">
            	<input type="hidden" name="memName" value="<%=memName%>">
            	<input type="hidden" name="memResident1" value="<%=memResident1%>">
            	<input type="hidden" name="memResident2" value="<%=memResident2%>">
                <input type="password" name="memPw" id="uid" placeholder="새로운 비밀번호" class="in" required>
                <input type="password" name="memPw2" id="uid" placeholder="새로운 비밀번호 확인" class="in" required>
                <input type="submit" class="subButton" value="비밀번호 찾기" onClick="submit()">
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