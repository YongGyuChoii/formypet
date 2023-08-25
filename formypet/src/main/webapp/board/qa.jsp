<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .qaImg {
    position: relative;
    background-image: url('../images/board/qa_main2.jpg');
	background-position: center center;
	background-size: 100%;
	background-repeat: no-repeat;
    }    
    .container {
    	min-height: 70vh;
    }    
   .category_box .category .cate {
   width: 33%;
   display: inline-block;
   text-align: center;
   border: 1px solid #eee;
   margin-bottom: 20px;   
   padding: 20px 0;
   font-size: 18px;
   background-color: rgb(0,34,102);
   text-decoration: none;
   	border-radius: 15px;
   	color: yellow;

   }
   
	.main_box {
	margin: auto;
	width: 1000px;
	height: 320px;
	background-color: #EEEFF1;
	border-radius: 5px;
	text-align: center;	
	border-radius: 15px;
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
   <div class="qaImg">   
    <div class="container">
      <section>
      		<br><br><br><br><br><br><br><br><br><br><br><br><br>
      	   <div class="main_box">
			<br/>
      	    <h2><b>Don't hesitate to ask!</b></h2>
            <br/>
            <p>궁금한 점이 있으시다면 문의를 남겨주세요.</p>
            <p>문의 내역 및 답변은 마이페이지에서 확인하실 수 있습니다!</p> 
            <br/>
        	<div class="category_box" align="center">
        	 <ul class="category">
        	  <a class="cate" onclick="service()">1:1 문의하기&nbsp; ></a>&nbsp;&nbsp;
        	  <a class="cate" onclick="service2()">문의 게시판 바로가기&nbsp; ></a>
        	 </ul>
        	 </div>
        	</div> 
      </section>
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

function service() {
	let memKey = "${idKey}"				
	if(memKey == "") {
		alert("회원 에게만 글쓰기 권한이 있습니다.");
		location.href="${pageContext.request.contextPath}/board/qa.jsp"
	} else {
		location.href="${pageContext.request.contextPath}/board/post.jsp"
	}
}

function service2() {
	let memKey = "${idKey}"				
	if(memKey == "") {
		alert("회원 에게만 게시판 사용 권한이 있습니다.");
		location.href="${pageContext.request.contextPath}/board/qa.jsp"
	} else {
		location.href="${pageContext.request.contextPath}/board/list.jsp"
	}
}
</script>
    