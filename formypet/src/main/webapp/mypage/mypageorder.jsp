<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@page import="order.OrderBean"%>

<%@page import="java.util.Vector"%>
 <jsp:useBean id="orderMgr" class="order.myOrderMgr" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>�ֹ����� ��ȸ - ���������� | </title>
<link rel="stylesheet" type="text/css" href="../css/mypageorder.css">

</head>
<body>
	<h1>�ֹ� ���� ��ȸ</h1>
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
					<th scope="col">��ǰ����</th>
					<th scope="col">�ֹ�����</th>
					<th scope="col">�ֹ���ȣ</th>
					<th scope="col">�ֹ��ݾ�(����)</th>
					<th scope="col" colspan="2">�ֹ� ����</th>
				</tr>
				</thead>
				<tbody>
		<% 
	Vector<OrderBean> vlist = null;

	vlist = orderMgr.getOrderList();
	
	for(int i=0; i<vlist.size(); i++) {
		
		OrderBean bean = vlist.get(i);
		
		              
		
		int product = bean.getProductKey();		//��ǰ				
		String optionValue = bean.getOptionValue(); //�ɼ�
		String pDate = bean.getpDate(); //��¥
		String memOrder=bean.getMemOrderKey(); //�ֹ� ��ȣ
		int productPrice = bean.getProductPrice();		// ����	
		int oCount = bean.getoCount();  //����
		
		
	%>												
						
		<td>
			<div class="n-prd-row">
			<a href="#" class="img-block">
			<img src="../images/mypage/mypageorder1.jpg" alt="Texture Henly neck Knit (Black)">
			</a>
				<ul class="info">
			<span class="exg-prd"></span>
			<li class="name"><span>��ǰ��:</span><a href="#"><%=product%></a></li>
			<li class="option">�ɼ� :<%=optionValue%></li>
			</ul> 
			</div>	
			</td>
				<td><%=pDate%></td>
			<td>
				<a href="#"><%=memOrder%></a>
			</td>
			
				<td><%=productPrice%>��<br><span class="txt-default"> <%=oCount%></span></td>
			
		<td >
		<div class="btn-set tooltip">
			<button type="button" class="n-link state"
			onclick="deliveryStepShow(205635815)">���� Ȯ��</button><br>
		<button type="button" class="n-btn btn-sm btn-default" onclick="#">�����ȸ</button>
	</div>
				
	</td>
	<td>
	<%if(bean.getReviewYn().equals("N")){ %>
	<button type="button" class="n-btn btn-sm btn-accent" onclick="location.href='${pageContext.request.contextPath}/review/review.jsp?ordersKey=<%=bean.getOrdersKey()%>'">�ı��ۼ�</button> <!-- test code -->	
		<%} %>		<tr > </tr>
			</td>
			
	 <% } %>
				
				

	
	
	
	


</body>
</html>