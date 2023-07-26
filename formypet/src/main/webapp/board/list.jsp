<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />

<%	
	  request.setCharacterEncoding("UTF-8");
	  
      int totalRecord=0; //전체레코드수
	  int numPerPage=10; // 페이지당 레코드 수 
	  int pagePerBlock=5; //블럭당 페이지수 
	  
	  int totalPage=0; //전체 페이지 수
	  int totalBlock=0;  //전체 블럭수 

	  int nowPage=1; // 현재페이지
	  int nowBlock=1;  //현재블럭
	  
	  //데이터베이스 에서 select문 으로 게시물 조회시 limit절 을 통해 한 페이지에 필요한 만큼의 게시물을 가져오기 위해서
	  //start 와 end 변수 선언. start=0 , end=10 이므로 게시판 한 페이지에 총 10개의 게시물을 출력 한다.
	  int start=0; //디비의 select 시작번호
	  int end=10; //시작번호로 부터 가져올 select 갯수
	  
	  int listSize=0; //현재 읽어온 게시물의 수

	String keyWord = "", keyField = ""; 
	 //keyField : 이름,제목,내용 검색종류 를 저장하는 변수
	 //keyWord : 검색 키워드 저장하는 변수
	  
	//BoardBean 클래스를 참조한 return 타입으로 vector배열 vlist 선언
	Vector<BoardBean> vlist = null;
	
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	
	//BoardMgr 클래스 getTotalCount 메서드 호출하여 총 게시물 수 가져오기.
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	
	//전체 페이지수 계산, 122개의 레코드(게시물)가 있다면 122/10 을 연산하여, Math클래스의 ceil() 메서드로  
	//결과값의 소숫점을 반올림 하여 페이지를 구성.
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //전체페이지수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //현재블럭 계산
	
	//전체 블록 계산, 방법은 전체 페이지수 계산법과 동일.
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체블럭계산
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet" type="text/css" href="../css/board.css">
    <link rel="stylesheet"  href="../css/base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <style>
      table {
        width: 100%;
        min-width: 600px;
      }
    </style>
<script>
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value){
		 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		 document.readFrm.submit();
	} 
	
	function read(num){
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
	}
	
	function check() {
	     if (document.searchFrm.keyWord.value == "") {
	   alert("검색어를 입력하세요.");
	   document.searchFrm.keyWord.focus();
	   return;
	     }
	  document.searchFrm.submit();
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
		<br/>
		<div class="mainImg" style="text-align : center;">
			<img src="../images/board/cs_center.jpg" alt="게시판" width="1200" height="500">
		</div>

    <!--main 시작-->
 <%
	  String userID = null;
      if (session.getAttribute("idKey") != null){
          userID = (String) session.getAttribute("idKey");
      }
 %>

	<div class="container" align="center" style="border:2px solid white; background-color: white;">
		<br/>
		<table align="center" width="1200">
				<tr>
					<td>Total : <%=totalRecord%>Articles(<font color="red">
					<%=nowPage%>/<%=totalPage%>Pages</font>)</td>
				</tr>
		</table>
		
		<!-- 게시판 본문 시작 -->
		
		<table align="center" width="1200" cellpadding="3">
			<tr>
				<td align="center" colspan="2">
				<%
					//BoardMgr 클래스 getBoardList() 메서드 호출 
					  vlist = bMgr.getBoardList(keyField, keyWord, start, end);
				
					  listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
					  
					  if (vlist.isEmpty()) {
						out.println("등록된 게시물이 없습니다.");
						
					  } else {
				%>
					  <table class="board_list">
						<tr>
							<td width="70px">번 호</td>
							<td width="300px">제 목</td>
							<td width="120px">이 름</td>
							<td	width="100px">날 짜</td>
							<td width="70px">조회수</td>
						</tr>
						<%
							  for (int i = 0;i<numPerPage; i++) {
								if (i == listSize) break;
								BoardBean bean = vlist.get(i);
								int num = bean.getNum();
								String name = bean.getName();
								String subject = bean.getSubject();
								String regdate = bean.getRegdate();
								int depth = bean.getDepth();
								int count = bean.getCount();
						%>
						<tr>
							<td align="center">
								<%=totalRecord-((nowPage-1)*numPerPage)-i%>
							</td>
							<td>
							<%
								  if(depth>0){
									for(int j=0;j<depth;j++){
										out.println("&nbsp;&nbsp;");
										}
									}
							%>
							  <a href="javascript:read('<%=num%>')"><%=subject%></a>
							</td>
							<td align="center"><%=name%></td>
							<td align="center"><%=regdate%></td>
							<td align="center"><%=count%></td>
							</tr>
						<%}//for%>
					</table> <%
	 			}//if
	 		%>
				</td>
			</tr>
			<tr>
				<td colspan="2"><br /><br /></td>
			</tr>
			<tr>
				<td>
				<!-- 페이징 및 블럭 처리 Start--> 
				<a href="javascript:list()" class="btn btn-outline-secondary btn-sm" >첫 페이지</a>
				<%
	   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; //하단 페이지 시작번호
	   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
	   				  //하단 페이지 끝번호
	   				  if(totalPage !=0){
	    			  	if (nowBlock > 1) {%>
	    			  		<a href="javascript:block('<%=nowBlock-1%>')" class="btn btn-outline-secondary btn-sm" >prev</a><%}%> 
	    			  		<%for ( ; pageStart < pageEnd; pageStart++){%>
	     			     	<a href="javascript:pageing('<%=pageStart %>')" class="btn btn-outline-secondary btn-sm"> 
	     					<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
	     					<%=pageStart %> 
	     					<%if(pageStart==nowPage) {%></font> <%}%></a> 
	    					<%}//for%>
	    					<%if (totalBlock > nowBlock ) {%>
	    					<a href="javascript:block('<%=nowBlock+1%>')" class="btn btn-outline-secondary btn-sm" >next</a>
	    			<%}%>
	   			<%}%>
	 			<!-- 페이징 및 블럭 처리 End-->
				</td>
				<td align="right">
					<a href="post.jsp" class="btn btn-dark" >글쓰기</a></td>
			</tr>
		</table>
		<!-- 게시판 본문 끝. -->
			
		<!-- 검색 폼 시작 -->
		<hr width="1300"/>
		<form  name="searchFrm"  method="get" action="list.jsp">
		<table width="600" cellpadding="4" cellspacing="0">
	 		<tr>
	  			<td align="center" valign="bottom">
	   				<select name="keyField" size="1" >
	    				<option value="name"> 이 름</option>
	    				<option value="subject"> 제 목</option>
	    				<option value="content"> 내 용</option>
	   				</select>
	   				<input size="16" name="keyWord">
	   				<input type="button"  value="찾기" onClick="javascript:check()">
	   				<input type="hidden" name="nowPage" value="1">
	  			</td>
	 		</tr>
		</table>
		</form>
		<!-- 검색 폼 끝. -->
		
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> 
			<input type="hidden" name="nowPage" value="1">
		</form>
		<form name="readFrm" method="get">
			<input type="hidden" name="num"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="keyField" value="<%=keyField%>"> 
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		</form>
	</div>
    <!-- footer 시작-->
    <footer id="footer">
      	<%@include file="/base/footer.jsp"%>
    </footer>
    <!-- footer 끝.-->
    </div>
</body>
</html>
    