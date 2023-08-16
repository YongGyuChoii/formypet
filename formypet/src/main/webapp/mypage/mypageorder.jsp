<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="order.OrderBean"%>

<%@page import="java.util.Vector"%>
 <jsp:useBean id="orderMgr" class="order.myOrderMgr" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>주문내역 조회 - 마이페이지 | </title>
<link rel="stylesheet" type="text/css" href="../css/mypageorder.css">

</head>
<body>
	<h1>주문 내역 조회</h1>
			<table class="n-table table-col n-order-view">
				<colgroup>
					<col style="width:*">
					<col style="width:14.2%">
					<col style="width:14.2%">
					<col style="width:14.2%">
					<col style="width:10.2%">
					<col style="width:11%">
				</colgroup>
				<thead>
				<tr>
					<th scope="col">상품정보</th>
					<th scope="col">주문일자</th>
					<th scope="col">주문번호</th>
					<th scope="col">주문금액(수량)</th>
					<th scope="col" colspan="2">주문 상태</th>
				</tr>
				</thead>
				<tbody>
		<% 
	Vector<OrderBean> vlist = null;

	vlist = orderMgr.getOrderList();
	
	for(int i=0; i<vlist.size(); i++) {
		
		OrderBean bean = vlist.get(i);
		
		              
		
		int product = bean.getProductKey();		//상품				
		String optionValue = bean.getOptionValue(); //옵션
		String pDate = bean.getpDate(); //날짜
		String memOrder=bean.getMemOrderKey(); //주문 번호
		int productPrice = bean.getProductPrice();		// 가격	
		int oCount = bean.getoCount();  //수량
		
		
	%>												
						
		<td>
			<div class="n-prd-row">
			<a href="#" class="img-block">
			<img src="../images/mypage/mypageorder1.jpg" >
			</a>
				<ul class="info">
			<span class="exg-prd"></span>
			<li class="name"><span>상품명:</span><a href="#"><%=product%></a></li>
			<li class="option">옵션 :<%=optionValue%></li>
			</ul> 
			</div>	
			</td>
				<td><%=pDate%></td>
			<td>
				<a href="#"><%=memOrder%></a>
			</td>
			
				<td><%=productPrice%>원<br><span class="txt-default"> <%=oCount%></span></td>
			
		<td >
		<div class="btn-set tooltip">
			<button type="button" class="n-link state"
			onclick="deliveryStepShow(205635815)">구매 확정</button><br>
		<button type="button" class="n-btn btn-sm btn-default" onclick="#">배송조회</button>
	</div>
				
	</td>
	<td>
	<%if(bean.getReviewYn().equals("N")){ %>
	<button type="button" class="n-btn btn-sm btn-accent" onclick="location.href='${pageContext.request.contextPath}/review/review.jsp?ordersKey=<%=bean.getOrdersKey()%>'">후기작성</button> <!-- test code -->	
		<%} %>		<tr > </tr>
			</td>
			
	 <% } %>
				
				

	
	
	
	


</body>
</html>