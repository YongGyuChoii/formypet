<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean"%>

<% 
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  
	  BoardBean bean = (BoardBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getName(); 
	  String content = bean.getContent(); 
%>
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
    <script>
		//패스워드 가 입력 되었는지 확인하는 check() 함수
		function check() {
		   if (document.updateFrm.pass.value == "") {
			 alert("수정을 위해 패스워드를 입력하세요.");
			 document.updateFrm.pass.focus();
			 return false;
			 }
		   document.updateFrm.submit();
		}
	</script>
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
	<div align="center"><br/><br/>
	<table width="600" cellpadding="3">
	  <tr>
	   <td bgcolor="#FF9018"  height="21" align="center">수정하기</td>
	  </tr>
	</table>
	<!-- boardUpdate 로 url맵핑된 서블릿으로 이동한다. -->
	<form name="updateFrm" method="post" action="boardUpdate">
	<table width="600" cellpadding="7">
	 <tr>
	  <td>
	   <table>
	    <tr>
	     <td width="20%">성 명</td>
	     <td width="80%">
		  <input name="name" value="<%=name%>" size="30" maxlength="20">
		 </td>
		</tr>
		<tr>
	     <td>제 목</td>
	     <td>
		  <input name="subject" size="50" value="<%=subject%>" maxlength="50">
		 </td>
	    <tr>
	     <td>내 용</td>
	     <td>
		  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
		 </td>
	    </tr>
		<tr>
	     <td>비밀 번호</td> 
	     <td><input type="password" name="pass" size="15" maxlength="15">
	      수정 시에는 비밀번호가 필요합니다.</td>
	    </tr>
		<tr>
	     <td colspan="2" height="5"><hr/></td>
	    </tr>
		<tr>
	     <td colspan="2">
		  <input type="button" value="수정완료" onClick="check()">
	      <input type="reset" value="다시수정"> 
	      <input type="button" value="뒤로" onClick="history.go(-1)">
		 </td>
	    </tr> 
	   </table>
	  </td>
	 </tr>
	</table>
	 <input type="hidden" name="nowPage" value="<%=nowPage %>">
	 <input type='hidden' name="num" value="<%=num%>">
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
    