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
<link rel="stylesheet"  href="../css/myreview.css">
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
   
        <div class="xans-element- xans-myshop xans-myshop-boardpackage ">

</select>
</div>
<div class="xans-element- xans-myshop xans-myshop-boardlist ec-base-table typeList gBorder gBlank10"><!--
            $count = 10
            $relation_post = yes
        -->
<table border="1" summary="">

        <colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 "><col style="width:70px;">

<col style="width:auto;">
<col style="width:1500px;">
<col style="width:80px;">
<col style="width:80px;">
</colgroup>
<div class="board_list_wrap">
   <div class="board_title">
            <strong>내 후기</strong>
           
        </div>
            <div class="board_list">
                <div class="top">
                <div class="date">번호</div>
                    <div class="count">상품명</div>
                    <div class="num">제목</div>
                    <div class="title">내용</div>
                    <div class="writer">별점</div>
                  
                </div>
                  </div>
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
		String product = bean.getProductName();		//상품	
		
		
	%>
	
              
            
            <div class="board_list">
            
         
                <div>
                 <div class="count"><%=num%>번</div>
                   <div class="num"><%=product %></div>
                    <div class="num"><%=rvTitle %></div>
                    <div class="title"><a><%=rvContents%></a></div>
                    <div class="date"><%=rvScore%>점</div>
          
                </div>
            </div>
            
           
          <% } %>
          
           <div class="bt_wrap">
                <a href="${pageContext.request.contextPath}/mypage/mypage.jsp" class="on">마이페이지 이동</a>
                <!--<a href="#">수정</a>-->
            </div>
</tbody>
</table>

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
    