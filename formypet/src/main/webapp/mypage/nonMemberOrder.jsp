<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="order.OrderBean"%>
  <%@page import="order.NoMemOrderBean"%>
<%@page import="product.ProductBean"%>
<%@page import="product.ProductFileBean"%>
<%@page import="product.ProductOptionBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.*"%>

<jsp:useBean id="orderMgr" class="order.NoMemOrderMgr" />
<jsp:useBean id="pMgr" class="product.ProductMgr" />
<jsp:useBean id="bMgr" class="product.ProductDetailMgr" />


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/mypageorder.css">
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
  	<div class="container" style="margin-top: 150px; max-width: 1500px">
 		<section>    
        	<h1>비회원 주문 내역 조회</h1>
				<table class="n-table table-col n-order-view">
					<colgroup>
						<col style="width:*">
						<col style="width:13.2%">
						<col style="width:14.2%">
						<col style="width:14.2%">
						<col style="width:11.2%">
						<col style="width:11%">
					</colgroup>
				<thead>
					<tr class="title">
						<th scope="col">상품정보</th>
						<th scope="col">주문일자</th>
						<th scope="col">주문번호</th>
						<th scope="col">주문금액(수량)</th>
						<th scope="col">주문 상태</th>
						<th scope="col">배송지</th>
					</tr>
				</thead>
				<tbody>
				<% 		
					String rName = request.getParameter("rName");
					String orderPassword = request.getParameter("orderPassword");
		
					Vector<NoMemOrderBean> vlist = null;

					vlist = orderMgr.getOrderList(rName, orderPassword);
	
					for(int i=0; i<vlist.size(); i++) {
		
						NoMemOrderBean bean = vlist.get(i);
		
		              	String img1 = bean.getProductImg(); 
						String product1 = bean.getProductName();//상품				
						String optionValue1 = bean.getOptionValue();//옵션
						String pDate1 = bean.getpDate(); //날짜
						String memOrder1=bean.getNonMemOrderKey();//주문 번호
						String address1=bean.getAddress();
						String [] add = address1.split("/");
						int productPrice1 = bean.getProductPrice();// 가격	
						int oCount1 = bean.getoCount();//수량
						
					
						System.out.println("mypageorder.jsp 이미지 변수 값" + img1);
				%>												
					<td>
						<div class="n-prd-row">
							<a href="#" class="img-block">
								<img src=../images/myorder/<%=img1%>>
							<!-- ../images/bathProduct/image1 -->
							</a>
							<ul class="info">
								<span class="exg-prd"></span>
								<li class="name"><span>상품명 : </span><a href="#"><%=product1%></a></li>
								<%if(optionValue1 != null) {%>
								<li class="option">옵션 : <%=optionValue1%></li>
								<% } else {} %>
							</ul> 
						</div>	
					</td>
					<td><%=pDate1%></td>
					<td>
						<a href="#"><%=memOrder1%></a>
					</td>
					<td><%=productPrice1%>원<br><span class="txt-default"> <%=oCount1%>개</span></td>
					<td>
						<strong>배송중</strong>
					</td>
					<td>
						<a><%=add[0]%></a>
						<br>
						<a><%=add[1]%></a>
					</td>
				<% } %>
	 			</tbody>
	 		</table>
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
    