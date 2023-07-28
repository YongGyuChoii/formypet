<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cart.CartBean"%>
<%@page import="java.util.*"%>
<jsp:useBean id="cMgr" class="cart.CartMgr" /> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<CartBean> pAll = cMgr.getCartAll(); 	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/cart.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
    <style>     
      a {
        color: black;
        text-decoration: none;
      }
      p {
        margin-top: 1rem;
      }
    </style>
</head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="/base/header.jsp"%>
    </header>
    <!--header 끝-->

    <div class="container">
    <section class="cart">
      <div class="cart_title">
        <h1><strong>CART</strong></h1>
      </div>
      <table class="cart_table">
        <form>
          <colgroup>
            <col style="width: 27px;">
            <col style="width: 100px;">
          </colgroup>
          <thead>
            <tr>
              <td style="text-align: left;">
              	<input id="ProductItem" class="agreechkAll" type="checkbox" checked="checked"/>
       		  	<label for="ProductItem"></label>
              </td>
              <td colspan="3">상품정보</td>
              <td>판매가</td>
              <td>수량</td>
              <td>배송비</td>
              <td>합계</td>
            </tr>
          </thead>

          <tbody>
          	<%for(int i=0; i<pAll.size(); i++) { %>
            <tr class="cart_table_detail">
            <%
         	 	int productViewPrice;
              	if(pAll.get(i).getProductSalePrice() == 0) {
              		productViewPrice = pAll.get(i).getProductPrice();
              	} else {
              		productViewPrice = pAll.get(i).getProductSalePrice();
              	}
              	
              	int calPrice;
              	int deliveryFee;
              	int totalViewPrice;
              	
              	calPrice = productViewPrice * pAll.get(i).getCartCount(); 
              	
              	if(calPrice>=50000) {
              		deliveryFee = 0;
              	} else {
              		deliveryFee = 3000;
              	}
              	             	
              	if(deliveryFee == 0) {
              		totalViewPrice = productViewPrice * pAll.get(i).getCartCount();
              	} else {
              		totalViewPrice = productViewPrice * pAll.get(i).getCartCount() + deliveryFee;
              	}              	
          %>
              <td>
              		<input id="chack1" class="chack" type="checkbox" checked="checked">
        			<label for="chack1" class="chack_ele"></label>
              </td>
              <td><a href="#"><img src="../images/bathProduct/<%=pAll.get(i).getProductImg()%>" alt=""></a></td>
              <td colspan="2"><a href="#"><%=pAll.get(i).getProductName()%></a></td>
              <td class="cart_table_button">
        	  	<%if(pAll.get(i).getProductSalePrice() == 0) {%>
        	  	<strong><fmt:formatNumber value="<%=pAll.get(i).getProductPrice()%>" pattern="#,###"/>원</strong>
        	  	<%} else {%>
        	  	<strong style="opacity: 0.5"><del><fmt:formatNumber value="<%=pAll.get(i).getProductPrice()%>" pattern="#,###"/>원</del></strong>
        	  	<br>
        	  	<strong><fmt:formatNumber value="<%=pAll.get(i).getProductSalePrice()%>" pattern="#,###"/>원</strong>
        	  	<%}%>
              </td>                        
              <td>
                <button name="countBtn" class="downBtn">-</button>
                <input id="countInput" class="countInput" type="text" value="<%=pAll.get(i).getCartCount()%>" style="width: 30px;">                
                <button name="countBtn" class="upBtn">+</button>
              </td>
              </from>
              <% if(i == 0) {%>
              <td rowspan=100%>
              	<strong><p>배송비 3,000원<br><a style="font-size:10px">(50,000원 이상 구매시 무료!)</a></p></strong>   
              </td>
			  <% } else { %>
			  <% } %>
              <td><strong><fmt:formatNumber value="<%=calPrice%>" pattern="#,###"/>원</strong></td>          
            </tr>
          <% } %>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="3"> <button class="cart_table_button2" Onclick="location='cartDelete';">선택상품 삭제</button>
              <button class="cart_table_button2" type="button" id="deleteAll" onclick="location='test.jsp;'">전체상품 삭제</button>
              </td>
              <td></td>
              <td></td>
              <td colspan="3" style="text-align: right;"><strong>상품구매 금액  + 배송비 3,000원 = 합계 45,800원</strong></td>
            </tr>
          </tfoot>
        </form>
      </table>
      <div class="cart_bottom_button">
        <button class="cart_big_button left"><a href="../index.html">쇼핑 계속하기</a></button>
        <button class="cart_big_button right">주문하기</button>
      </div>
  
      <table class="table_bottom">
        <colgroup>
          <col style="width: 17%;">
          <col style="width: 17%;">
          <col style="width: 19%;">
          <col style="width: 17%;">
          <col style="width: auto;">
        </colgroup>
        <thead>
          <tr style="text-align: center;">
            <th>총 상품금액</th>
            <th>배송비</th>
            <th colspan="4">결재 예정금액</th>
          </tr>
        </thead>
        <tbody class="tbody_center">
          <tr>
            <td><strong>42,800원</strong></td>
            <td><strong>+3,000원</strong></td>
            <td colspan="4" style="color: blue;"><strong>=45,800원</strong></td>
          </tr>
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