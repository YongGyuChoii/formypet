<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="review.ReviewBean"%>
<%@page import="java.util.Vector"%>
    <jsp:useBean id="rvMgr" class="review.ReviewMgr" />
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
      <h2>내 후기</h2>
        <div class="xans-element- xans-myshop xans-myshop-boardpackage "><div class="xans-element- xans-myshop xans-myshop-boardlisthead "><p>분류 선택 <select id="board_sort" name="board_sort" fw-filter="" fw-label="" fw-msg="" onchange="BOARD.change_sort('boardSearchForm', this);">
<option value="D">작성 일자별</option>
<option value="C">분류별</option>
</select></p>
</div>
<div class="xans-element- xans-myshop xans-myshop-boardlist ec-base-table typeList gBorder gBlank10"><!--
            $count = 10
            $relation_post = yes
        -->
<table border="1" summary="">
<caption>게시물 관리 목록</caption>
        <colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 "><col style="width:70px;">
<col style="width:135px;">
<col style="width:auto;">
<col style="width:84px;">
<col style="width:80px;">
<col style="width:55px;">
</colgroup>
<thead><tr>
				<th scope="col">회원</th>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">내용</th>
                <th scope="col">리뷰점수</th>
            </tr></thead>
<tbody class=" center">
<tr class="xans-record-">
<% 
	Vector<ReviewBean> vlist = null;

	vlist = rvMgr.getReviewList();
	
	for(int i=0; i<vlist.size(); i++) {
		
		ReviewBean bean = vlist.get(i);
		
		int num = bean.getRvKey();
		String rvTitle = bean.getRvTitle();
		String rvContents = bean.getRvContents();
		int rvScore = bean.getRvScore();
		int memKey1 = bean.getMemKey(); 
		
	%>
                <td><a><%=memKey1%></a></td>
                <td><a><%=num%></a></td>
                <td class="left subject"> <a href="#"><%=rvTitle %></a> </td>
                <td><%=rvContents%></td>
                
                <td><span class="txtNum"><%=rvScore%></span></td>
            </tr> 
          <% } %>
</tbody>
</table>
<p class="message displaynone">게시물이 없습니다.</p>
</div>
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
    