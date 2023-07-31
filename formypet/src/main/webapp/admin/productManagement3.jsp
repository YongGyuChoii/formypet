<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*,admin.*" %>
<%@page import = "admin.ProductManagementBean" %>
<jsp:useBean id = "pMMgr" class = "admin.ProductManagementMgr" scope = "page" />
<%	
	  request.setCharacterEncoding("UTF-8");
	  
      int totalRecord=0; //전체레코드수
	  int numPerPage=10; // 페이지당 레코드 수 
	  int pagePerBlock=20; //블럭당 페이지수 
	  
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
	  
	//ProductManagementBean 클래스를 참조한 return 타입으로 vector배열 vlist 선언
	Vector<ProductManagementBean> vlist3 = null; //option_code db
	
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
	
	//ProductManagementMgr 클래스 getTotalCount 메서드 호출하여 총 게시물 수 가져오기.
	totalRecord = pMMgr.getTotalCount3(keyField, keyWord);
	
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
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/adminStyle.css">
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div align="center" id = "wrap">
<!-- header 시작-->
    <header>
        <%@include file="../admin/adminHeader.jsp"%>
      </header>
    <!--header 끝-->
	
		<br/>
		<h2>상품옵션 목록</h2>
		<br/>
		<table align="center" width="600">
				<tr>
					<td>Total : <%=totalRecord%>개(<font color="red">
					<%=nowPage%>/<%=totalPage%>Pages</font>)</td>
				</tr>
		</table>
		
		<!-- 게시판 본문 시작 -->
		
		<table height = "600">
			<tr>
				<td align="center" colspan="2">
				<%
					//ProductManagementMgr 클래스 getpmList() 메서드 호출 
					  vlist3 = pMMgr.getpmList3(keyField, keyWord, start, end); //product db
					  
					  listSize = vlist3.size();//브라우저 화면에 보여질 게시물갯수 product db
					  
					  if (vlist3.isEmpty()) {
						out.println("등록된 상품이 없습니다.");
						
					  } else {
				%>
					  <table>
						<tr>
							<td>상품옵션 번호</td>
							<td>상품 번호</td>
							<td>옵션 1</td>
							<td>옵션 2</td>
							<td>옵션 3</td>
							<td>옵션 4</td>
							<td>옵션 5</td>
						</tr>
						<%
							  for (int i = 0; i < numPerPage; i++) {
								if (i == listSize) break;
								
								ProductManagementBean bean3 = vlist3.get(i);
								
								int productKey = bean3.getProductKey();
								int ocKey = bean3.getOcKey();
								String oc1 = bean3.getOc1();
								String oc2 = bean3.getOc2();
								String oc3 = bean3.getOc3();
								String oc4 = bean3.getOc4();
								String oc5 = bean3.getOc5();
								
					
								
						%>
						<tr>
							
							<td align="center"><a href="javascript:read('<%=ocKey%>')"><%=ocKey%></a></td>
							<td align="center"><%=productKey%></td>
							<td align="center"><%=oc1%></td>
							<td align="center"><%=oc2%></td>
							<td align="center"><%=oc3%></td>
							<td align="center"><%=oc4%></td>
							<td align="center"><%=oc5%></td>
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
				<%
	   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; //하단 페이지 시작번호
	   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
	   				  //하단 페이지 끝번호
	   				  if(totalPage !=0){
	    			  	if (nowBlock > 1) {%>
	    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%>&nbsp; 
	    			  		<%for ( ; pageStart < pageEnd; pageStart++){%>
	     			     	<a href="javascript:pageing('<%=pageStart %>')"> 
	     					<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
	     					[<%=pageStart %>] 
	     					<%if(pageStart==nowPage) {%></font> <%}%></a> 
	    					<%}//for%>&nbsp; 
	    					<%if (totalBlock > nowBlock ) {%>
	    					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
	    			<%}%>&nbsp;  
	   			<%}%>
	 			<!-- 페이징 및 블럭 처리 End-->
				</td>
				<td align="right">
					<a href="productOupload.jsp">[상품옵션 등록]</a> 
					<a href="javascript:productManagement()">[처음으로]</a>
				</td>
			</tr>
		</table>
		<!-- 게시판 본문 끝. -->
			
		<!-- 검색 폼 시작 -->
		<hr width="600"/>
		<form  name="searchFrm"  method="get" action="../admin/productManagement3.jsp">
		<table width="600" cellpadding="4" cellspacing="0">
	 		<tr>
	  			<td align="center" valign="bottom">
	   				<select name="keyField" size="1" >
	    				<option value="productKey">상품 번호</option>
	    				<option value="ocKey">상품옵션 번호</option>
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
			<input type="hidden" name="ocKey"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="keyField" value="<%=keyField%>"> 
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		</form>
	
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
	function productManagement() {
		document.listFrm.action = "../admin/productManagement3.jsp";
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
	
	function read(ocKey){
		document.readFrm.ocKey.value=ocKey;
		document.readFrm.action="../admin/read3.jsp";
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