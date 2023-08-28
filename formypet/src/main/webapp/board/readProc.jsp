<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
   
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file = "/base/icon.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style>
    	h2 {
        font-weight: bold;
    	color: #2b2b2b;
  		font-size: 50px;
    	}    
    </style>
   <%
	request.setCharacterEncoding("UTF-8");
	
	//이동된 파라미터 nowPage 와 num 을 받아서 각 변수에 대입.
		String nowPage = request.getParameter("nowPage");
	
		int num = Integer.parseInt(request.getParameter("num"));
							
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
      <div align="center">
       <br/><br/>
       <br/><br/><br/><br/><br/>
       <table width="600" cellpadding="3" >
		<div>
		<h2>INQUIRY</h2>
		</div>
		<br/><br/><br/>       
        <tr>
         <td height="21" align="center">
          <p>이 글은 비밀글입니다.</p> 
		  <p><b>비밀번호를 입력하여 주세요.</b></p>
        </tr>
	   </table>
		<form name="readFrm" method="post" action="boardProc">	
		 <table width="600" cellpadding="2">
		  <tr>
		  	<td align="center">
		  		<table>
		  		 <tr>
		  		 	<td align="center">
		  		 	 <input type="password" name="pass" size="17" maxlength="15">
		  		 	</td>
		  		 </tr>
		  		 <tr>
		  		 	<td><hr size="1" color="eeeeee"/></td>
		  		 </tr>
		  		 <tr>
		  		 	<td align="center">
		  		 	 <input type="submit" value="확 인" class="btn btn-outline-primary">
		  			 <input type="button" value="뒤로" class="btn btn-outline-primary" onClick="history.go(-1)">
		  			</td>
		  		</tr>
		  		</table>
		  	</td>
		  </tr>	  
		<br>
		  <input type="hidden" name="num" value="<%=num%>"> 
		  <input type="hidden" name="nowPage" value="<%=nowPage%>">
		 </table>
		</form>	
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