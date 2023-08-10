<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="board.BoardBean" scope="session"/>
<%
	  String nowPage = request.getParameter("nowPage");
	  String subject = bean.getSubject();
	  String content = bean.getContent();
	  
	  String memId = (String)session.getAttribute("idkey2");   
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
	<br><br>
	 <table width="600" cellpadding="3">
	  <tr>
	   <td bgcolor="#CCCC00" height="21" align="center">답변하기</td>
	  </tr>
	</table>
	<!-- boardReply 로 url맵핑 된 BoardReplyServlet 으로 파라미터 이동. -->
	<form method="post" action="boardReply">
	<table width="600" cellpadding="7">
	 <tr>
	  <td>
	   <table>
	    <tr>
	     <td>제 목</td>
	     <td>
		  <input name="subject" size="50" value="&#8627;답변 : <%=subject%>" maxlength="50"></td> 
	    </tr>
		<tr>
	     <td>내 용</td>
	     <td>
		  <textarea name="content" rows="12" cols="50">
	      	<%=content %>
	      	========답변 글을 쓰세요.=======
	      </textarea>
	     </td>
	    </tr>
	    <tr>
	     <td>비밀 번호</td> 
	     <td>
		  <input type="password" name="pass" size="15" maxlength="15"></td> 
	    </tr>
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
	     <td colspan="2" height="5"><hr/></td>
	    </tr>
		<tr> 
	     <td colspan="2">
		  <input type="submit" value="답변등록" >
	      <input type="reset" value="다시쓰기">
	      <input type="button" value="뒤로" onClick="history.back()"></td>
	    </tr> 
	   </table>
	  </td>
	 </tr>
	</table>
	 <input type="hidden" name="nowPage" value="<%=nowPage%>">
	 <input type="hidden" name="ref" value="<%=bean.getRef()%>">
	 <input type="hidden" name="pos" value="<%=bean.getPos()%>">
	 <input type="hidden" name="depth" value="<%=bean.getDepth()%>">
	 <input type="hidden" name="memKey" value="<%=memKey%>">
     <input type="hidden" name="name" value="<%=memId%>">
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
    