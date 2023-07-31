<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/list.css">
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
	<div class="container" align="center">
	<br/><br/>
	<table width="800" cellpadding="3">
		<tr>
			<td bgcolor="84F399" height="25" align="center">글쓰기</td>
		</tr>
	</table>
	<br/>
	<!-- form 태그의 action 이 BoardPostSevlet 클래스의 url 맵핑 을 찾아서 이동한다. -->
	<form name="postFrm" method="post" action="boardPost" enctype="multipart/form-data">
	<table width="800" cellpadding="3" align="center">
		<tr>
			<td align=center>
			<table align="center">
				<tr>
					<td width="10%">성 명</td>
					<td width="90%">
					<input name="name" size="10" maxlength="8"></td>
				</tr>
				<tr>
					<td>제 목</td>
					<td>
					<input name="subject" size="50" maxlength="30"></td>
				</tr>
				<tr>
					<td>내 용</td>
					<td><textarea name="content" rows="10" cols="50"></textarea></td>
				</tr>
				<tr>
					<td>비밀 번호</td>
					<td><input type="password" name="pass" size="15" maxlength="15"></td>
				</tr>
				<tr>
				 <tr>
	     			<td>파일찾기</td> 
	     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
	    		</tr>
	 			<tr>
	 				<td>내용타입</td>
	 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
	  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
	  			 	</td>
	 			</tr>
				<tr>
					<td colspan="2"><hr/></td>
				</tr>
				<tr>
					<td colspan="2">
						 <input type="submit" value="등록">
						 <input type="reset" value="다시쓰기">
						 <input type="button" value="리스트" onClick="javascript:location.href='list.jsp'">
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	<input type="hidden" name="memKey" value="<%=memKey%>">
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
    