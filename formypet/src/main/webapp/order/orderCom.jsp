<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberBean" %>
<%@ page import = "admin.ExpendsManagementBean" %>
<jsp:useBean id="omgr" class="order.OrderMgr" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/orderCom1.css">
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
<%

	//Integer memKey = (Integer)session.getAttribute("idKey");
	MemberBean mb = (MemberBean)session.getAttribute("mb");
	Integer ordersKey = Integer.parseInt(request.getParameter("ordersKey"));
	ExpendsManagementBean bean = new ExpendsManagementBean();
	//bean = omgr.getoList(ordersKey);//게시물 가져오기
	//int ordersKey = ob.getOrdersKey();
	//String memOrderKey = 
	//int memKey1 = ob.getMemKey();
	//String pDate = ob.getpDate();
%>
    <!--main 시작-->
    <div class="container">
     <section class = "shopping1">
      	<img src = ../images/order/구매페이지1-removebg-preview.png>
		<p><%=mb.getMemName()%>님, 주문이 완료되었습니다.</p>
    	<p>주문번호</p>
    	<p>주문</p>

    <br/>
   	<button class="btn" onClick="javascript:location.href='../index.jsp'" ><span>메인화면으로 돌아가기</span></button>
   	<button class="btn"><span>쇼핑 더하기</span></button>
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
