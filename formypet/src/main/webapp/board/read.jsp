<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
	  request.setCharacterEncoding("UTF-8");

	  int num = Integer.parseInt(request.getParameter("num"));
	  
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  
	  //read.jsp 페이지 가 호출되면 해당 게시물의 조회수를 증가 시킨다.
	  //BoardMgr 클래스 upCount() 메서드 호출, 매개변수는 게시물의 num 으로 한다.
	  bMgr.upCount(num);//조회수 증가 
	  
	  //BoardMgr 클래스의 getBoard() 메서드 호출하여 게시물을 가져온다. 매개변수는 게시물의 num으로 함.
	  //BoardBean 클래스 타입의 객체 bean 을 생성하고, 게시물 조회 결과를 대입한다.
	  BoardBean bean = bMgr.getBoard(num);//게시물 가져오기
	  
	  //bean 객체 에서 getter 메서드를 이용하여 파라미터를 가져와서 화면에 출력하기 위해 각 변수에 대입한다.
	  String name = bean.getName();
	  String subject = bean.getSubject();
      String regdate = bean.getRegdate();
	  String content = bean.getContent();
	  String filename = bean.getFilename(); 
	  int filesize = bean.getFilesize();
	  int count = bean.getCount();
	  	  
	  session.setAttribute("bean", bean);//게시물을 세션에 저장
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
    	<script type="text/javascript">
		function list(){
		    document.listFrm.submit();
		 } 
		
		function down(filename){
			 document.downFrm.filename.value=filename;
			 document.downFrm.submit();
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
    <div class="container" align="center">
      <section>
	<br/><br/>
	<table align="center" width="800" cellspacing="3">
	 <tr>
	  <td bgcolor="#9CA2EE" height="25" align="center">글읽기</td>
	 </tr>
	 <tr>
	  <td colspan="2">
	   <table cellpadding="3" cellspacing="0" width="100%"> 
	    <tr> 
	  <td align="center" bgcolor="#DDDDDD" width="10%"> 이 름 </td>
	  <td bgcolor="#FFFFE8">&nbsp;&nbsp;<%=name%></td>
	  <td align="center" bgcolor="#DDDDDD" width="10%"> 등록날짜 </td>
	  <td bgcolor="#FFFFE8">&nbsp;&nbsp;<%=regdate%></td>
	 </tr>
	 <tr> 
	    <td align="center" bgcolor="#DDDDDD"> 제 목</td>
	    <td bgcolor="#FFFFE8" colspan="3">&nbsp;&nbsp;<%=subject%></td>
	   </tr>
	   <tr> 
	     <td align="center" bgcolor="#DDDDDD">첨부파일</td>
	     <td bgcolor="#FFFFE8" colspan="3">
	     <% if( filename !=null && !filename.equals("")) {%>
	  		<a href="javascript:down('<%=filename%>')">&nbsp;&nbsp;<%=filename%></a>
	  		 &nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>  
	  		 <%} else{%>&nbsp;&nbsp;등록된 파일이 없습니다.<%}%>
	     </td>
	   </tr>
	   <tr> 
	    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
	   </tr>
	   <tr>
	    <td colspan="4" align="right">조회수 <%=count%></td>
	   </tr>
	   </table>
	  </td>
	 </tr>
	 <tr>
	  <td align="center" colspan="2"> 
	 <hr/>
	 <div class="btn-group" role="group" aria-label="Basic outlined example">
	 <a href="javascript:list()" class="btn btn-outline-primary" >리스트</a> 
	 <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" class="btn btn-outline-primary" >수 정</a>
	 <a href="reply.jsp?nowPage=<%=nowPage%>" class="btn btn-outline-primary" >답 변</a>
	 <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>" class="btn btn-outline-primary">삭 제</a>
	 </div>
	  </td>
	 </tr>
	</table>
	
	<form name="downFrm" action="download.jsp" method="post">
		<input type="hidden" name="filename">
	</form>
	
	<form name="listFrm" method="post" action="list.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<%if(!(keyWord==null || keyWord.equals(""))){ %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%}%>
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
    