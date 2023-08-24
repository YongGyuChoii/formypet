<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
   
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
   <%
	request.setCharacterEncoding("UTF-8");
	
	//이동된 파라미터 nowPage 와 num 을 받아서 각 변수에 대입.
		String nowPage = request.getParameter("nowPage");
	
		int num = Integer.parseInt(request.getParameter("num"));
							
		//session에 저장된 bean 객체를 가져옴.
		BoardBean bean = bMgr.getBoard(num);
		
	%>
	
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
		<p>해당 페이지는 비밀번호 입력으로 이용가능합니다.</p>
		<form name="readFrm" method="post" action="boardProc">
		<p style="margin-bottom:20;"> 비밀번호입력
		<input type="password" name="pass"  size="12">
		<input type="submit" value="확 인" style="font-weight:bolder; font-size:4mm;">
		<br>
		<input type="hidden" name="num" value="<%=num%>"> 
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		</form>
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